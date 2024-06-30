package action.profile;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;

import dao.ProfileDao;
import db.vo.ProfileVo;

/**
 * Servlet implementation class ProfileSelectOneAction
 */
@WebServlet("/profile/select.do")
public class ProfileSelectOneAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		/*
		 * HttpSession session = request.getSession(); Object user =
		 * session.getAttribute("user");
		 */
		
		int mem_idx = Integer.parseInt(request.getParameter("mem_idx"));
		
		ProfileVo profile = ProfileDao.getInstance().selectOne(mem_idx);

		// Dispatcher형식으로 호출
		String forward_page = "../main/main.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}