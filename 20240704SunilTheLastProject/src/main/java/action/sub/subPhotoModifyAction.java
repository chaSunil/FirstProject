package action.sub;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.subPhotoDao;
import db.vo.subPhotoVo;

/**
 * Servlet implementation class subPhotoModifyAction
 */
@WebServlet("/photo/modify.do")
public class subPhotoModifyAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		
		int sub_p_idx			= Integer.parseInt(request.getParameter("sub_p_idx"));
		String sub_p_title 		= request.getParameter("sub_p_title");
        String sub_p_category 	= request.getParameter("sub_p_category");
        int sub_p_min_player	= Integer.parseInt(request.getParameter("sub_p_min_player"));
        int sub_p_max_player	= Integer.parseInt(request.getParameter("sub_p_max_player"));
        int sub_p_playtime 		= Integer.parseInt(request.getParameter("sub_p_playtime"));
        int sub_p_age 			= Integer.parseInt(request.getParameter("sub_p_age"));
        int sub_p_year 			= Integer.parseInt(request.getParameter("sub_p_year"));
        String sub_p_publisher	= request.getParameter("sub_p_publisher");
        
        subPhotoVo vo = new subPhotoVo(sub_p_idx, sub_p_title, sub_p_category, sub_p_min_player, sub_p_max_player, sub_p_playtime,
                sub_p_age, sub_p_year, sub_p_publisher);
        
        int res = subPhotoDao.getInstance().update(vo);

        response.sendRedirect("list.do");

	}

}