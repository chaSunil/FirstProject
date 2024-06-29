package action;

import java.io.IOException;

import dao.MemberDao;
import db.vo.MemberVo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class MemberModifyAction
 */
@WebServlet("/member/modify.do")
public class MemberModifyAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		int mem_idx = Integer.parseInt(request.getParameter("mem_idx"));
		String mem_name = request.getParameter("mem_name");
		String mem_id = request.getParameter("mem_id");
		String mem_pwd = request.getParameter("mem_pwd");
		String mem_nickname = request.getParameter("mem_nickname");
		String mem_zipcode = request.getParameter("mem_zipcode");
		String mem_addr = request.getParameter("mem_addr");
		String mem_grade = request.getParameter("mem_grade");
		
		MemberVo vo = new MemberVo(mem_name, mem_id, mem_pwd, mem_nickname, mem_zipcode, mem_addr, mem_grade, mem_idx);
		
		int res = MemberDao.getInstance().update(vo);
		
		HttpSession session = request.getSession();
		MemberVo loginUser = (MemberVo) session.getAttribute("user");
		
		if(loginUser.getMem_idx()==mem_idx) {
			MemberVo user = MemberDao.getInstance().selectOne(mem_idx);
			
			session.setAttribute("user", user);
		}
		
		response.sendRedirect("../main/main.jsp");
		
	}

}