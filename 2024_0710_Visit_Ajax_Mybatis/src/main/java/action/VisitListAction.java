package action;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.VisitDao;
import db.vo.VisitVo;

/**
 * Servlet implementation class VisitListAction
 */
@WebServlet("/visit/list.do")
public class VisitListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// /visit/list.do
		// /visit/list.do??search=all&search_text=
		// /visit/list.do??search=name&search_text=길동
		// /visit/list.do??search=content&search_text=내용
		// /visit/list.do??search=name_content&search_text=길동(이름이나 내용이 길동)
		
		// 0. 수신인코딩 설정
		request.setCharacterEncoding("utf-8");
		
		// 1. parameter 받기
		String search		=		request.getParameter("search");
		String search_text	=		request.getParameter("search_text");
		
		// search 값이 안들어왔을때 그냥 default로 전체보기로 보여주겠다.(안넣어주면 nullPointException)
		if(search==null) {
			search="all";
		}
		
		// 검색조건을 담을 맵
		Map<String, String> map = new HashMap<String, String>();
		
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
		
		// request binding
		request.setAttribute("list", list);
		
		// Dispatcher형식으로 호출
		String forward_page = "visit_list.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}