package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import db.vo.MemberVo;

/**
 * Servlet implementation class MemberInsertAction
 */
@WebServlet("/member/insert.do")
public class MemberInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		// /member/insert.do?mem_name=차선일&mem_id=차선일&mem_pwd=5555&mem_nickname=차선일&mem_zipcode=06097&mem_addr=서울+강남구+봉은사로+403
		// /member/insert_form.do?mem_name=vadvadv&mem_id=vadvadv&mem_pwd=vadvadv&mem_nickname=ffas&mem_zipcode=vadvadv&mem_addr=vadvadv
		String mem_name = request.getParameter("mem_name");
		String mem_id = request.getParameter("mem_id");
		String mem_pwd = request.getParameter("mem_pwd");
		String mem_nickname = request.getParameter("mem_nickname");
		String mem_zipcode = request.getParameter("mem_zipcode");
		String mem_addr = request.getParameter("mem_addr");
		String mem_ip = request.getRemoteAddr();

		MemberVo vo = new MemberVo(mem_name, mem_id, mem_pwd, mem_nickname, mem_zipcode, mem_addr, mem_ip);
		int res = MemberDao.getInstance().insert(vo);
		// vo의 값이 있다면, 정상적으로 가입한 것이 되기 때문에, true를 반환한다.
		Boolean bResult = (res!=0);
		/* response.sendRedirect("list.do"); */
		response.setContentType("application/json; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		String json = String.format("{\"result\": %b}", bResult);
		out.print(json);
		

		/*
		 * // Vo -> json 객체 생성해주기 JSONObject json = new JSONObject();
		 * 
		 * JSONObject json = new JSONObject(); json.put("mem_name", vo.getMem_name());
		 * json.put("mem_id", vo.getMem_id()); json.put("mem_pwd", vo.getMem_pwd());
		 * json.put("mem_nickname", vo.getMem_nickname()); json.put("mem_zipcode",
		 * vo.getMem_zipcode()); json.put("mem_addr", vo.getMem_addr());
		 * json.put("mem_ip", vo.getMem_ip());
		 * 
		 * response.getWriter().print(json.toString());
		 */

	}

}
