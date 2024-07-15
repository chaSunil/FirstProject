package action.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import action.util.MyCommon;
import action.util.Paging;
import annotation.RequestMapping;
import annotation.ResponseBody;
import dao.VisitDao;
import db.vo.VisitVo;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class VisitController {

	// 전체조회
	@RequestMapping("/visit/list.do")
	public String list(HttpServletRequest request, HttpServletResponse response) {
		
		// 1. parameter 받기
		String search		=		request.getParameter("search");
		String search_text	=		request.getParameter("search_text");
		
		// search 값이 안들어왔을때 그냥 default로 전체보기로 보여주겠다.(안넣어주면 nullPointException)
		if(search==null) {
			search="all";
		}
		
		
		
		int nowPage = 1;
		try {
			nowPage = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		// start/end
		int BLOCK_LIST = 2;
		int start = (nowPage-1) * BLOCK_LIST + 1;
		int end = start + BLOCK_LIST - 1;
		
		// 검색조건을 담을 맵
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("start",start);
		map.put("end",end);
		
		
		// 이름 + 내용
		if(search.equals("name_content")) {
			map.put("name", search_text); // 데이터를 찾아오는 값에 이름에다가두 넣구우
			map.put("content", search_text); // 내용에다가두 넣구우
		} else if(search.equals("name")) { // 문자열 비교는 무조건 equals //search=="name"(X)
		// 이름
			map.put("name", search_text);
		} else if(search.equals("content")) {
		// 내용
			map.put("content", search_text);
		}
		
		// 방명록 데이터 가져오기
		List<VisitVo> list = VisitDao.getInstance().selectList(map);
		
		// 전체 게시물수
		int rowTotal = VisitDao.getInstance().selectRowTotal(map);
		
		// 검색정보 filter : search_filter = "search=name&search_text=길동"
		String search_filter = String.format("search=%s&search_text=%s", search, search_text);
		
		// pageMenu 만들기
		String pageMenu = Paging.getPaging("list.do",   // pageURL
											search_filter,
											nowPage,    // 현재페이지
											rowTotal,   // 전체페이지
											MyCommon.Visit.BLOCK_LIST,  // 한화면에 보여질 게시물 수
											MyCommon.Visit.BLOCK_PAGE); // 한화면에 보여질 페이지 수
		
		// request binding
		request.setAttribute("list", list);
		request.setAttribute("pageMenu", pageMenu);
		

		return "visit_list.jsp";
	}// end:list()
	
	
	
	
	
	
	// 입력폼 띄우기
	@RequestMapping("/visit/insert_form.do")
	public String insert_form(HttpServletRequest request, HttpServletResponse response) {
		
		return "visit_insert_form.jsp";
	}// end:insert_form()
	
	
	
	// 입력(등록)하기
	@RequestMapping("/visit/insert.do")
	public String insert(HttpServletRequest request, HttpServletResponse response) {
	
		// 1. parameter(전달인자) 받기
		String name = request.getParameter("name");
		String content = request.getParameter("content").replaceAll("\n", "<br>");
		String pwd = request.getParameter("pwd");
		
		// 2. ip 정보 받기
		String ip = request.getRemoteAddr();
		
		// 3. VisitVo 포장
		// vo에서 오버로드 된 생성자 새로 추가
		VisitVo vo = new VisitVo(name, content, pwd, ip);
		
		// 4. DBinsert
		int res = VisitDao.getInstance().insert(vo);
		
		
		// 내가 원하는것은 Redirect이다.
		// return "visit_list.jsp"; (기존 Dispatcher 형식)
		return "redirect:list.do";
		// FrontController에게 반환
	}// end:insert
	
	
	
	// 입력(등록)하기
	@RequestMapping(value="/visit/check_pwd.do",produces="application/json:charset=utf-8")
	@ResponseBody
	public String check_pwd(HttpServletRequest request, HttpServletResponse response) {
		
		// parameter 받기
		int idx = Integer.parseInt(request.getParameter("idx"));
		String c_pwd = request.getParameter("c_pwd");
		
		// idx에 해당되는 게시물 1건을 얻어온다
		VisitVo vo = VisitDao.getInstance().selectOne(idx);
		
		// 비밀번호 비교
		boolean bResult = vo.getPwd().equals(c_pwd);
		
		// JSON Data 생성 전송 : {"result":true}
		String json = String.format("{\"result\":%b}", bResult);
		
		return json; // 이렇게 사용할시 forward 되어버린다 jsp가 아니기 때문에 505 error
	}// end:check_pwd
	
	// 삭제하기
	@RequestMapping("/visit/delete.do")
	public String delete(HttpServletRequest request, HttpServletResponse response) {
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		String no = request.getParameter("no"); // 삭제할 글의 순서
		
		// DB 삭제
		int res = VisitDao.getInstance().delete(idx);
		
		return "redirect:list.do";
	}// end:delete
	
	// 수정폼으로 연결
	@RequestMapping("/visit/modify_form.do")
	public String modify_form(HttpServletRequest request, HttpServletResponse response) {
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		// idx에 해당되는 게시물 1건 얻어오기
		VisitVo vo = VisitDao.getInstance().selectOne(idx);
		
		// textarer \n기능처리 : content <br> -> \n 변환
		String content = vo.getContent().replaceAll("<br>", "\n");
		vo.setContent(content);

		// request binding(JSP에게 vo의 데이터를 넘겨줘야 하기 때문에 setAttribute 한다)
		request.setAttribute("vo", vo);
		
		return "visit_modify_form.do";
	}// end:modify_form
	
	// 수정하기
	@RequestMapping("/visit/modify.do")
	public String modify(HttpServletRequest request, HttpServletResponse response) {
		
		// parameter 받기
		int idx = Integer.parseInt(request.getParameter("idx"));
		// String no = request.getParameter("no");
		String name = request.getParameter("name");
		String content = request.getParameter("content").replaceAll("\n", "<br>");
		String pwd = request.getParameter("pwd");
		
		
		String page = request.getParameter("page");
		String search = request.getParameter("search");
		String search_text = request.getParameter("search_text");
		
		// ip주소 얻어온다
		String ip = request.getRemoteAddr();
		
		// VisitVo 포장
		VisitVo vo = new VisitVo(idx, name, content, pwd, ip);
		
		// DB 수정하기
		int res = VisitDao.getInstance().update(vo);
		
		return "redirect:list.do";
	}// end:modify
	
	
}