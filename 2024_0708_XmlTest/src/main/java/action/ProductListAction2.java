package action;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.MySearchUtil2;
import xml.vo.ProductVo;

/**
 * Servlet implementation class ProductListAction2
 */
@WebServlet("/product/list2.do")
public class ProductListAction2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// parameter 인코딩 설정
		request.setCharacterEncoding("utf-8");
		// 검색어 설정
		String p_name = request.getParameter("p_name");
		// 기본값 설정
		int start = 1;
		int display = 10;
		try {
			start = Integer.parseInt(request.getParameter("start"));
			display = Integer.parseInt(request.getParameter("display"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		// Naver Open API를 이용해서 상품검색한다.
		List<ProductVo> p_list = MySearchUtil2.search_shop2(p_name, start, display);
		
		// request Binding (변수 값을 저장해서 전달)
		request.setAttribute("p_list", p_list);
		
		
		// Dispatcher형식으로 호출
		String forward_page = "product_list2.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}