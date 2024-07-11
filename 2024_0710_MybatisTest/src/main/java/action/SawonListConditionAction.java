package action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
@WebServlet("/sawon/list_condition.do")
public class SawonListConditionAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// parameter가 들어올 수도 있고, 들어오지 않을 수도 있다.
		// /sawon/list_condition.do
		// /sawon/list_condition.do?deptno=0&sajob=all
		// /sawon/list_condition.do?deptno=0&sajob=부장
		// /sawon/list_condition.do?deptno=10&sajob=사원
		
		// 0. 수신인코딩
		request.setCharacterEncoding("utf-8");
		
		
		// 여기서부터 지정해주는것은 list_condition.do로 parameter 값을 안치고 그대로 쳤을경우에 조건식 지정
		int deptno = 0;
		
		try {
			deptno = Integer.parseInt(request.getParameter("deptno"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		String sajob = request.getParameter("sajob");
		if(sajob==null) {
			sajob = "all";
		}
		
		String sasex = request.getParameter("sasex");
		if(sasex==null) {
			sasex = "all";
		}
		
		String hire_year_10 = request.getParameter("hire_year_10");
		if(hire_year_10==null) {
			hire_year_10 = "0";
		}
		
		// 검색할 조건을 전달할 Map
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(deptno!=0) { // 전체가 아니면
			map.put("deptno", deptno);
		}
		
		if(!sajob.equals("all")) { // 전체가 아니면
			map.put("sajob",sajob);
		}
		
		if(!sasex.equals("all")) { // 전체가 아니면
			map.put("sasex",sasex);
		}
		
		if(!hire_year_10.equals("0")) {
			map.put("hire_year_10",hire_year_10);
		}
		
		// list 가져오기 (사원목록)
		List<SawonVo> list = SawonDao.getInstance().selectList(map);
		
		
		
		// Request Binding(객체 값을 지정해서 넘기기)
		request.setAttribute("list", list);
		
		// Dispatcher형식으로 호출
		String forward_page = "sawon_list.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}
