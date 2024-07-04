package action.photo;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.Game1Dao;
import db.vo.Game1Vo;

/**
 * Servlet implementation class subPhotoUploadAction
 */
@WebServlet("/main/photo_upload.do")
public class ModalPhotoUploadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		//파일업로드 처리
		String	webPath = "/images/"; // 웹(URL)경로(상대경로)
		
		//현재 웹어플리케이션의 전역관리객체(상대경로를 통해서 절대경로 구하기)
		ServletContext application = request.getServletContext();
		//				  웹(상대)경로 -> 절대경로 구하기
		String	saveDir= application.getRealPath(webPath);
		int		maxSize	= 1024 * 1024 * 100;	//최대업로드크기(100MB)
		//FileUpload객체 => MultipartRequest
		MultipartRequest mr = new MultipartRequest(
												request,			// request 위임 
												saveDir,			// 저장위치
												maxSize,			// 최대업로드크기 
												"utf-8",			// 수신인코딩
												//파일이름이 동일할 경우 다른 이름으로 변경
												new DefaultFileRenamePolicy()
												);
		
		//업로드파일명을 얻어온다
		String img_filename = "no_file";
		//mr에 의해서 업로드된 파일정보 얻어온다
		File f = mr.getFile("photo"); //getParameter로 받으면 null
		
		if(f!=null) { //업로드 파일이 존재하면
			
			img_filename = f.getName();
		}
		
		int game_idx = Integer.parseInt(mr.getParameter("game_idx"));
		
		//p_idx에 저장된 이전 파일 삭제
		Game1Vo vo = Game1Dao.getInstance().selectOne(game_idx);
		File delFile = new File(saveDir, vo.getImg_filename());
		
		//update된 파일 이름 수정
		vo.setImg_filename(img_filename);
		int res = Game1Dao.getInstance().modal_update_filename(vo);
		
		
		//응답처리
		response.setContentType("application/json; charset=utf-8;");
		
		//{"p_filename":"%s"}
		String json = String.format("{\"sub_p_filename\":\"%s\"}", img_filename);
		
		response.getWriter().print(json);

	}

}