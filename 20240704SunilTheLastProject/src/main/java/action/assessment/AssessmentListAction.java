package action.assessment;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AssessmentDao;
import db.vo.AssessmentVo;

/**
 * Servlet implementation class AssessmentListAction
 */
@WebServlet("/assessment/list.do")
public class AssessmentListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// list.do?sub_p_title=스플렌더
		
		request.setCharacterEncoding("utf-8");
		String a_cate = request.getParameter("a_cate"); 
		
		// 회원목록 가져오기
		List<AssessmentVo> list = AssessmentDao.getInstance().selectOne(a_cate);
		
		// request 바인딩
		request.setAttribute("list", list);

		// Dispatcher형식으로 호출
		String forward_page = "../detail/de-"+a_cate+".jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}
