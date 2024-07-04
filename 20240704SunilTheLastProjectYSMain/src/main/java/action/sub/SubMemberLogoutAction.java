package action.sub;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.subPhotoDao;
import db.vo.subPhotoVo;

/**
 * Servlet implementation class MemberLogoutAction
 */
@WebServlet("/member/sublogout.do")
public class SubMemberLogoutAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String sub_p_category = request.getParameter("sub_p_category");
		String sub_p_page = request.getParameter("sub_p_page");
		
		List<subPhotoVo> list = subPhotoDao.getInstance().selectListCategory(sub_p_category);
		
		request.setAttribute("list", list);

		// Dispatcher형식으로 호출
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		// 로그아웃이 완료되면 parameter를 넘겨준다.
		/*
		 * response.sendRedirect("../photo/category.do?sub_p_category=" + sub_p_category
		 * + "&sub_p_page=" + sub_p_page + "&logout=true");
		 */
		
		String forward_page = "../photo/sub" + sub_p_page + ".jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);
	}

}