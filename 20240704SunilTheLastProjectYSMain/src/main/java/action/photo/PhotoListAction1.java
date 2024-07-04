package action.photo;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Game1Dao;
import db.vo.Game1Vo;

/**
 * Servlet implementation class PhotoListAction
 */
@WebServlet("/main/list.do")
public class PhotoListAction1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Game1Vo> list = Game1Dao.getInstance().selectList();
		
		//request binding
		request.setAttribute("list", list);
		
		// Dispatcher 형식으로 호출
		String forward_page = "main.jsp";		
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}
