package action.profile;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import db.vo.MemberVo;

/**
 * Servlet implementation class ProfileInsertAction
 */
@WebServlet("/profile/insert.do")
public class ProfileInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// photo/insert.do?p_title=제목&p_content=내용&photo=notebook.png
		// 30분이 지나면 글못올리게 만들어야함
		// 로그인 상태 체크
		
		HttpSession session = request.getSession();
		
		MemberVo user = (MemberVo) session.getAttribute("user");
		
		if(user==null) {
			response.sendRedirect("../member/login_form.do?reqson=session_timeout");
			return;
		}
		
		// 현재 로그인 되어있는 유저정보 가져오기
		int mem_idx = user.getMem_idx();
		String mem_name = user.getMem_name();
		String mem_nickname = user.getMem_nickname();
		
		// 파일업로드 처리
		String webPath = "/images/";
		
		ServletContext application = request.getServletContext();
		
		// 				  웹(상대경로)->절대경로
		String saveDir = application.getRealPath(webPath);
		System.out.println(saveDir);
		int maxSize = 1024 * 1024 * 100;	// 최대업로드크기(100MB)
		//FileUpload 객체 => MultipartRequest
		MultipartRequest mr = new MultipartRequest(
											request,		// request 위임
											saveDir,		// 저장위치
											maxSize,		// 최대업로드크기
											"utf-8",		// 수신인코딩
											// 파일이름이 동일할 경우 다른이름으로 변경
											new DefaultFileRenamePolicy()
											);
		// 업로드 파일명을 얻어온다.
		String filename = "no_file";
		// mr에 의해서 업로드된 파일정보 얻어온다.
		File f = mr.getFile("photo");
		
		

	}

}