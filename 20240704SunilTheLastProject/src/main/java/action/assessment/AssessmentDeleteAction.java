package action.assessment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AssessmentDao;
import db.vo.MemberVo;

/**
 * Servlet implementation class AssessmentDeleteAction
 */
@WebServlet("/assessment/delete.do")
public class AssessmentDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service
			(HttpServletRequest request, 
			HttpServletResponse response)
			throws ServletException, IOException {

		// /assessment/delete.do?a_idx=5
		
		// 1. 삭제할 글 번호 수신
		int a_idx = Integer.parseInt(request.getParameter("a_idx"));
		String a_no = request.getParameter("a_no");
		String a_cate = request.getParameter("a_cate");
		
		
		// 3. DB delete : delete from assessment where a_idx=?		
		int res = AssessmentDao.getInstance().delete(a_idx);
		
		// 3. 목록 보기
		response.sendRedirect("list.do?a_cate="+a_cate);

	}

}
