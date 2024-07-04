package action.sub;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.subPhotoDao;
import db.vo.subPhotoVo;

/**
 * Servlet implementation class subPhotoModifyFormAction
 */
@WebServlet("/photo/modify_form.do")
public class subPhotoModifyFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int sub_p_idx = Integer.parseInt(request.getParameter("sub_p_idx"));
		
		subPhotoVo vo = subPhotoDao.getInstance().selectOne(sub_p_idx);
		
		request.setAttribute("vo", vo);

		//Dispatcher형식으로 호출
		String forward_page = "sub_photo_modify_form.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}