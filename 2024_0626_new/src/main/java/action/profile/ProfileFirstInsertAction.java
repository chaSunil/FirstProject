package action.profile;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProfileDao;
import db.vo.MemberVo;
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
		HttpSession session = request.getSession();
		
		MemberVo loginUser = (MemberVo) session.getAttribute("user");
		
		int mem_idx = loginUser.getMem_idx();
		String mem_name = loginUser.getMem_name();
		String mem_nickname = loginUser.getMem_nickname();
		String p_ip = request.getRemoteAddr();
		
		ProfileVo vo = new ProfileVo(p_ip, mem_idx, mem_name, mem_nickname);
		int res = ProfileDao.getInstance().insert(vo);
		

		response.sendRedirect("../main/main.jsp");

	}

}