package action.sub;
import java.io.IOException;
import java.util.List;

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
@WebServlet("/member/sub_logout.do")
public class SubAllMemberLogoutAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<subPhotoVo> list = subPhotoDao.getInstance().selectList();
		
		request.setAttribute("list", list);

		// Dispatcher형식으로 호출
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		// 로그아웃이 완료되면 parameter를 넘겨준다.
		response.sendRedirect("../photo/allGame.do?logout=true");
	}

}