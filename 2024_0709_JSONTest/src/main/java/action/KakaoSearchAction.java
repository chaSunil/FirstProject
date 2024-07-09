package action;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import json.vo.KakaoLocalVo;
import util.KakaoSearchUtils;

import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class KakaoSearchAction
 */
@WebServlet("/search.do")
public class KakaoSearchAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// https://dapi.kakao.com/v2/local/search/keyword.json?query=학원&y=37.4809615&x=126.9521689&radius=1000&sort=distance&size=3&page=2
		
		// 0.수신인코딩
		request.setCharacterEncoding("utf-8");
		
		// 1. parameter 받기
		String query = request.getParameter("query");
		
		int page = 1;
		int size = 5;
		int radius = 1000;
		
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		try {
			size = Integer.parseInt(request.getParameter("size"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		try {
			radius = Integer.parseInt(request.getParameter("radius"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		String y = request.getParameter("latitude");
		String x = request.getParameter("longitude");
		
		// Kakao 검색
		List<KakaoLocalVo> list = KakaoSearchUtils.searchJson(query, y, x, page, size, radius);
		
		request.setAttribute("list", list);

		// Dispatcher형식으로 호출
		String forward_page = "search_list.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}