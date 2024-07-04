package action.profile;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProfileDao;
import db.vo.ProfileVo;

/**
 * Servlet implementation class ProfileCheckAction
 */
@WebServlet("/profile/check.do")
public class ProfileCheckAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		int mem_idx = Integer.parseInt(request.getParameter("mem_idx"));
		ProfileVo vo = ProfileDao.getInstance().selectOne(mem_idx);
		// vo값이 null이 아니면, true null이면 false
		Boolean bResult = (vo!=null);
		
		response.setContentType("application,json; charset=utf-8");
		
		String json = String.format("{\"result\": %b}", bResult);
		System.out.println(json);
		response.getWriter().print(json);
		
	}

}