package action.sub;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.subPhotoDao;
import db.vo.subPhotoVo;

/**
 * Servlet implementation class subPhotoDeleteAction
 */
@WebServlet("/photo/delete.do")
public class subPhotoDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		int sub_p_idx = Integer.parseInt(request.getParameter("sub_p_idx"));
		
		subPhotoVo vo = subPhotoDao.getInstance().selectOne(sub_p_idx);
		
		String absPath = request.getServletContext().getRealPath("/images/");
		
		File delFile = new File(absPath, vo.getSub_p_filename());
		
		delFile.delete();
		
		int res = subPhotoDao.getInstance().delete(sub_p_idx);
		
		response.sendRedirect("list.do");

	}

}