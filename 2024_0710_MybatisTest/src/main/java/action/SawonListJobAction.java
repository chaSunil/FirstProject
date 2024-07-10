package action;

import java.io.IOException;
import java.util.List;

import dao.SawonDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.SawonVo;

/**
 * Servlet implementation class SawonListAction
 */
@WebServlet("/sawon/list_job.do")
public class SawonListJobAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// parameter가 들어올 수도 있고, 들어오지 않을 수도 있다.
		// /sawon/list_job.do				=> null
		// /sawon/list_job.do?sajob=all		=> ""
		// /sawon/list_job.do?sajob=부장
		
		// 0. 수신인코딩
		request.setCharacterEncoding("utf-8");
		
		String sajob = request.getParameter("sajob");
		
		if(sajob==null || sajob.isEmpty()) { // sajob.isEmpty() == sajob.equlas("")
			sajob = "all";
		}
		
		// list 가져오기 (사원목록)
		List<SawonVo> list = null;
		
		if(sajob.equals("all")) {
			// 전체조회
			list = SawonDao.getInstance().selectList();
		} else {
			// 직급별 조회
			list = SawonDao.getInstance().selectListFromSajob(sajob);
		}
		
		// Request Binding(객체 값을 지정해서 넘기기)
		request.setAttribute("list", list);
		
		// Dispatcher형식으로 호출
		String forward_page = "sawon_list.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}
