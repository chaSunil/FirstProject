package action.sub;

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

import dao.subPhotoDao;
import db.vo.subPhotoVo;

/**
 * Servlet implementation class subPhotoInsertAction
 */
@WebServlet("/photo/insert.do")
public class subPhotoInsertAction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
     */
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub

        // 파일 업로드 처리
        String webPath = "/image/"; // 웹(URL)경로(상대경로)

        // 현재 웹어플리케이션의 전역관리객체(상대경로를 통해서 절대경로 구하기)
        ServletContext application = request.getServletContext();
        // 웹(상대)경로 -> 절대경로 구하기
        String savePath = application.getRealPath(webPath);
        int maxSize = 1024 * 1024 * 100; // 최대업로드크기(100MB)

        // 파일 저장 경로 확인 및 생성
        File uploadDir = new File(savePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // FileUpload객체 => MultipartRequest
        MultipartRequest mr = new MultipartRequest(
                request, // request 위임
                savePath, // 저장위치
                maxSize, // 최대업로드크기
                "utf-8", // 수신인코딩
                // 파일이름이 동일할 경우 다른 이름으로 변경
                new DefaultFileRenamePolicy()
        );

        // 업로드파일명을 얻어온다
        String sub_p_filename = "no_file";
        // mr에 의해서 업로드된 파일정보 얻어온다
        File f = mr.getFile("photo"); // getParameter로 받으면 null

        if (f != null) { // 업로드 파일이 존재하면
        	sub_p_filename = f.getName();
        }

        // 업로드파일 외에 다른 파라메터는 mr로 수신해야 된다
        String sub_p_title 			= mr.getParameter("sub_p_title");
        String sub_p_category 		= mr.getParameter("sub_p_category");
        String sub_p_min_player_str = mr.getParameter("sub_p_min_player");
        String sub_p_max_player_str = mr.getParameter("sub_p_max_player");
        String sub_p_playtime_str 	= mr.getParameter("sub_p_playtime");
        String sub_p_age_str 		= mr.getParameter("sub_p_age");
        String sub_p_year_str 		= mr.getParameter("sub_p_year");
        String sub_p_publisher		= mr.getParameter("sub_p_publisher");
        String sub_p_detail_loc		= mr.getParameter("sub_p_detail_loc");
        
        // String을 int로 변환 시키기
        int sub_p_min_player = 0;
        int sub_p_max_player = 0;
        int sub_p_playtime = 0;
        int sub_p_age = 0;
        int sub_p_year = 0;

        if (sub_p_min_player_str != null && !sub_p_min_player_str.isEmpty()) {
            try {
                sub_p_min_player = Integer.parseInt(sub_p_min_player_str); // String을 int로 변환
            } catch (NumberFormatException e) {
                e.printStackTrace(); // 변환 실패 시 예외 처리
            }
        }

        if (sub_p_max_player_str != null && !sub_p_max_player_str.isEmpty()) {
            try {
                sub_p_max_player = Integer.parseInt(sub_p_max_player_str); // String을 int로 변환
            } catch (NumberFormatException e) {
                e.printStackTrace(); // 변환 실패 시 예외 처리
            }
        }
        if (sub_p_playtime_str != null && !sub_p_playtime_str.isEmpty()) {
            try {
                sub_p_playtime = Integer.parseInt(sub_p_playtime_str); // String을 int로 변환
            } catch (NumberFormatException e) {
                e.printStackTrace(); // 변환 실패 시 예외 처리
            }
        }
        if (sub_p_age_str != null && !sub_p_age_str.isEmpty()) {
            try {
                sub_p_age = Integer.parseInt(sub_p_age_str); // String을 int로 변환
            } catch (NumberFormatException e) {
                e.printStackTrace(); // 변환 실패 시 예외 처리
            }
        }
        if (sub_p_year_str != null && !sub_p_year_str.isEmpty()) {
            try {
                sub_p_year = Integer.parseInt(sub_p_year_str); // String을 int로 변환
            } catch (NumberFormatException e) {
                e.printStackTrace(); // 변환 실패 시 예외 처리
            }
        }

        // parameter 외의 정보처리시에는 request 사용
        String p_ip = request.getRemoteAddr();

        // PhotoVo포장
        subPhotoVo vo = new subPhotoVo(sub_p_title, sub_p_category, sub_p_min_player, sub_p_max_player, sub_p_playtime,
                sub_p_age, sub_p_year, sub_p_publisher, sub_p_filename, sub_p_detail_loc);

        // DB Insert
        int res = subPhotoDao.getInstance().insert(vo);

        // 메인화면으로 이동
        response.sendRedirect("list.do");
    }
}
