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
@WebServlet("/sawon/list.do")
public class SawonListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// parameter가 들어올 수도 있고, 들어오지 않을 수도 있다.
		// /sawon/list.do
		// /sawon/list.do?deptno=0;
		// /sawon/list.do?deptno=10;
		
		int deptno = 0;
		
		try {
			deptno = Integer.parseInt(request.getParameter("deptno"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		// list 가져오기 (사원목록)
		List<SawonVo> list = null;
		
		if(deptno==0) { // 전체조회
			list = SawonDao.getInstance().selectList();
		} else { // 부서별 조회
			list = SawonDao.getInstance().selectListFromDeptno(deptno);
		}
		
		// Request Binding(객체 값을 지정해서 넘기기)
		request.setAttribute("list", list);
		
		// Dispatcher형식으로 호출
		String forward_page = "sawon_list.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}
