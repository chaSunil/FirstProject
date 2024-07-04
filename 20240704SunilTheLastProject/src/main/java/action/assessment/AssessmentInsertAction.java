package action.assessment;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.AssessmentDao;
import db.vo.AssessmentVo;
import db.vo.MemberVo;
/**
 * Servlet implementation class AssessmentInsertAction
 */
@WebServlet("/assessment/insert.do")
public class AssessmentInsertAction extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
     */
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
        // 로그인 상태 체크
        HttpSession session = request.getSession();
        // 유저 정보 얻어오기
        MemberVo user = (MemberVo) session.getAttribute("user");
        
        // session timeout
        if(user==null) {
            
            response.sendRedirect("../../member/login_form.do?reason=session_timeout");
            
            return;
        }
        
        // 유저 정보 얻어오기
        int mem_idx = user.getMem_idx();
        String mem_nickname = user.getMem_nickname();   
        
        // parameter 받기
        String a_cate = request.getParameter("a_cate");
        String a_content = request.getParameter("a_content").replaceAll("\n", "<br>");        
        
        // ip 받기
        String a_ip = request.getRemoteAddr();
        
        // Vo 포장
        AssessmentVo vo = new AssessmentVo(a_ip, a_content, mem_idx, mem_nickname, a_cate);
        
        // DB Insert
        int res = AssessmentDao.getInstance().insert(vo);
        
        // 메인화면 이동
        response.sendRedirect("list.do?a_cate="+a_cate);
    }
}