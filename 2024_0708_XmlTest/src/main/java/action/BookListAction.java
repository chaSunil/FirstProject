package action;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.MySearchUtil;
import util.MySearchUtilBook;
import xml.vo.BookVo;
import xml.vo.ProductVo;

/**
 * Servlet implementation class ProductListAction
 */
@WebServlet("/book/list.do")
public class BookListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// /product/list.do?p_name=노트북&start=1%display=10
		request.setCharacterEncoding("utf-8");
		
		String b_name = request.getParameter("b_name");
		
		int start = 1;
		int display = 10;
		// alt + shift + z 사용해서 try/catch 사용
		try {
			start = Integer.parseInt(request.getParameter("start"));
			display = Integer.parseInt(request.getParameter("display"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
		}
		
		// Naver Open API를 이용해서 상품검색...
		 List<BookVo> b_list = MySearchUtilBook.search_shop(b_name, start, display);
		 
		// request Binding (변수 값을 저장해서 전달)
		request.setAttribute("b_list", b_list);
		

		// Dispatcher형식으로 호출
		String forward_page = "book_list.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}