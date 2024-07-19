package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import action.util.MyCommon;
import action.util.Paging;
import dao.VisitDao;
import vo.VisitVo;

@Controller
public class VisitController {

	// @RequestMapping에 의해서 Method 호출시 DS가 자동으로 Injection(주입)시켜준다.
	// 해당컨트롤러가 Auto-Detecting으로 생성시에만 넣어준다.
	// @Controller로 자동생성 되어있어서 무조건 생성 됨.
	// 수동생성시에는 생성전에 <context:annotation-config/> 등록해야 한다.
	@Autowired
	HttpServletRequest request;
	
	public VisitController() {
		System.out.println("--VisitController()--");
	}
	
	
	// 자동엮기(자동으로 injection)
	@Autowired
	VisitDao visit_dao;
	// (전체+필터)조회
	// /visit/list.do
	// /visit/list.do?page=2&search=name_content&search_text=현진
	@RequestMapping("/visit/list.do")
	public String list(@RequestParam(name="search", defaultValue = "all") String search, 
					   String search_text,
					   @RequestParam(name="page", defaultValue = "1") int nowPage,
					   Model model) {
		
		// 기존에는 Method 인자를 던져주고 Spring이 request parameter를 받아줬던 것이다.
		// 1. parameter 받기
		// String search		=		request.getParameter("search");
		//  search_text	=		request.getParameter("search_text");
		
		// search 값이 안들어왔을때 그냥 default로 전체보기로 보여주겠다.(안넣어주면 nullPointException)
		/*
		   if(search==null) { search="all"; }
		 */
		
		/*
		 * int nowPage = 1; try { nowPage =
		 * Integer.parseInt(request.getParameter("page")); } catch (Exception e) { //
		 * TODO: handle exception }
		 */
		
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
		List<VisitVo> list = visit_dao.selectList(map);
		
		// 전체 게시물수
		int rowTotal = visit_dao.selectRowTotal(map);
		
		// 검색정보 filter : search_filter = "search=name&search_text=길동"0000
		String search_filter = String.format("search=%s&search_text=%s", search, search_text);
		
		// pageMenu 만들기
		String pageMenu = Paging.getPaging("list.do",   // pageURL
											search_filter,
											nowPage,    // 현재페이지
											rowTotal,   // 전체페이지
											MyCommon.Visit.BLOCK_LIST,  // 한화면에 보여질 게시물 수
											MyCommon.Visit.BLOCK_PAGE); // 한화면에 보여질 페이지 수
		
		// request binding
		// request.setAttribute("list", list);
		// request.setAttribute("pageMenu", pageMenu);
		
		model.addAttribute("list", list);
		model.addAttribute("pageMenu", pageMenu);
		

		return "visit/visit_list"; // /WEB-INF/views/ + visit/visit_list + .jsp
	}// end:list()
	
	
	
	
	
	
	// 입력폼 띄우기
	@RequestMapping("/visit/insert_form.do")
	public String insert_form() {
		
		return "visit/visit_insert_form"; // viewName
	}// end:insert_form()
	
	
	
	// 입력(등록)하기
	// /visit/insert.do?name=홍길동&content=내용&pwd=1234
	@RequestMapping("/visit/insert.do")
	public String insert(VisitVo vo) {
	
		// Method인자 : DispatcherServlert에 대한 요구사항
		// 나 호출할 때 (invokation) parameter 들어올 텐데, 그걸 vo로 포장해서 줘
		
		// 1. parameter(전달인자) 받기
		/*
		String name = request.getParameter("name");
		String content = request.getParameter("content").replaceAll("\n", "<br>");
		String pwd = request.getParameter("pwd");
		*/
		
		String content = vo.getContent().replaceAll("\n", "<br>");
		vo.setContent(content);
		
		// 2. ip 정보 받기
		String ip = request.getRemoteAddr();
		vo.setIp(ip);
		
		// 3. VisitVo 포장
		// vo에서 오버로드 된 생성자 새로 추가
		// VisitVo vo = new VisitVo(name, content, pwd, ip);
		
		// 4. DBinsert
		int res = visit_dao.insert(vo);
		
		
		// 내가 원하는것은 Redirect이다.
		// return "visit_list.jsp"; (기존 Dispatcher 형식)
		return "redirect:list.do";
		// FrontController(현재:DispatcherServlet)에게 반환
		// redirect : 접두어 확인 후 response.sendRedirect("list.do") 처리
	}// end:insert
	
	
	
	
	
	
	
	// /visit/check_pwd.do?idx=5&c_pwd=1234
	// 입력(등록)하기
	@RequestMapping(value="/visit/check_pwd.do",produces="application/json;charset=utf-8")
	// view가 아니라 응답데이터로 넘겨줄께
	@ResponseBody
	public String check_pwd(int idx,String c_pwd) {
		
		// parameter 받기
		// int idx = Integer.parseInt(request.getParameter("idx"));
		// String c_pwd = request.getParameter("c_pwd");
		
		// idx에 해당되는 게시물 1건을 얻어온다
		VisitVo vo = visit_dao.selectOne(idx);
		
		// 비밀번호 비교
		boolean bResult = vo.getPwd().equals(c_pwd);
		
		// JSON Data 생성 전송 : {"result":true}
		String json = String.format("{\"result\":%b}", bResult);
		
		// @ResponseBody
		// 반환 값을 DispatcherServlet이 직접 전송
		
		// contentType은 @RequestMappong에 produces 값을 사용한다.
		/*
		 	response.setContentType("application/json;charset=utf-8");
		 	response.getWriter().print();
		 */
		
		return json; // 이렇게 사용할시 forward 되어버린다 jsp가 아니기 때문에 505 error
	}// end:check_pwd
	
	// 삭제하기
	@RequestMapping("/visit/delete.do")
	public String delete(int idx) {
		
		// int idx = Integer.parseInt(request.getParameter("idx"));
		
		// DB 삭제
		int res = visit_dao.delete(idx);
		
		return "redirect:list.do";
	}// end:delete
	
	// 수정폼으로 연결
	// /visit/modify_form.do?idx=5
	@RequestMapping("/visit/modify_form.do")
	public String modify_form(int idx, Model model) {
		
		// int idx = Integer.parseInt(request.getParameter("idx"));
		
		// idx에 해당되는 게시물 1건 얻어오기
		VisitVo vo = visit_dao.selectOne(idx);
		
		// textarer \n기능처리 : content <br> -> \n 변환
		String content = vo.getContent().replaceAll("<br>", "\n");
		vo.setContent(content);

		// request binding(JSP에게 vo의 데이터를 넘겨줘야 하기 때문에 setAttribute 한다)
		model.addAttribute("vo", vo);
		
		return "visit/visit_modify_form";
	}// end:modify_form
	
	
	
	
	
	// 수정하기
	@RequestMapping("/visit/modify.do")
	public String modify(VisitVo vo,
						@RequestParam(name="page",defaultValue = "1") int page,
						@RequestParam(name="search",defaultValue="all") String search,
						String search_text,
						RedirectAttributes ra
			) {
		
		// parameter 받기
		// int idx = Integer.parseInt(request.getParameter("idx"));
		// String no = request.getParameter("no");
		// String name = request.getParameter("name");
		// String content = request.getParameter("content").replaceAll("\n", "<br>");
		// String pwd = request.getParameter("pwd");

		
		String content = vo.getContent().replaceAll("\n", "<br>");
		vo.setContent(content);
		
		
		// String page = request.getParameter("page");
		// String search = request.getParameter("search");
		// String search_text = request.getParameter("search_text");
		
		
		// ip주소 얻어온다
		String ip = request.getRemoteAddr();
		vo.setIp(ip);
		
		// VisitVo 포장
		// VisitVo vo = new VisitVo(idx, name, content, pwd, ip);
		
		// DB 수정하기
		int res = visit_dao.update(vo);
		
		// RedirectAttributes : redirect parameter 정보담는객체
		ra.addAttribute("page", page);
		ra.addAttribute("search",search);
		ra.addAttribute("search_text",search_text);
		
		
		// DispatcherServlet이 response.sendRedirect("page=%s&search=name&search_text=길동");
		
		
		return "redirect:list.do";
	}// end:modify
	
	
}