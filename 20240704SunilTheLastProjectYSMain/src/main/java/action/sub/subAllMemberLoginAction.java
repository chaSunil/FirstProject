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

import dao.MemberDao;
import dao.subPhotoDao;
import db.vo.MemberVo;
import db.vo.subPhotoVo;

/**
 * Servlet implementation class MemberLoginAction
 */
@WebServlet("/member/subAllLogin.do")
public class subAllMemberLoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String mem_id = request.getParameter("mem_id");
		String mem_pwd = request.getParameter("mem_pwd");
		
		MemberVo user = MemberDao.getInstance().selectOne(mem_id);
		
		if(user==null) { // 해당하는 아이디가 없기에 false를 반환한다.
			response.sendRedirect("login_form.do?reason=fail_id");
			return;
		}
		// 해당하는 비밀번호가 없기에 false를 반환한다.
		if(user.getMem_pwd().equals(mem_pwd)==false) {
			response.sendRedirect("login_form.do?reason=fail_pwd&mem_id=" + mem_id);
			return;
		}
		
		List<subPhotoVo> list = subPhotoDao.getInstance().selectList();
		
		request.setAttribute("list", list);
		
		HttpSession session = request.getSession();
		session.setAttribute("user", user);


		String forward_page = "../photo/allGame.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}