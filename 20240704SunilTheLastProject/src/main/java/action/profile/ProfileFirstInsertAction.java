package action.profile;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProfileDao;
import db.vo.ProfileVo;

/**
 * Servlet implementation class ProfileFirstInsertAction
 */

// 계정을 만들긴 했는데, 프로필을 한 번도 만들지 않은 경우
@WebServlet("/profile/first_insert.do")
public class ProfileFirstInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 현재 로그인 된 유저의 정보(객체값)를 받아온다.
		request.setCharacterEncoding("utf-8");
		int mem_idx = Integer.parseInt(request.getParameter("mem_idx"));
		
		ProfileVo vo = new ProfileVo(mem_idx);
		int res = ProfileDao.getInstance().insert(vo);
		System.out.println(res);
		boolean bResult = (res!=0);
		
		response.setContentType("application/json; charset=utf-8;");
		
		PrintWriter out = response.getWriter();
		
		String json = String.format("{\"result\": %b}", bResult);
		out.print(json);

	}

}