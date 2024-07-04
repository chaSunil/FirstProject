package action.sub;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.subPhotoDao;
import db.vo.subPhotoVo;

/**
 * Servlet implementation class subPhotoCategoryAction
 */
@WebServlet("/member/category.do")
public class subPhotoCategoryAction2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String sub_p_category = request.getParameter("sub_p_category");
		String sub_p_page = request.getParameter("sub_p_page");
		
		List<subPhotoVo> list = subPhotoDao.getInstance().selectListCategory(sub_p_category);
		
		request.setAttribute("list", list);

		//Dispatcher형식으로 호출
		String forward_page = "../photo/sub" + sub_p_page + ".jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}