package action.assessment;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.AssessmentDao;
import db.vo.AssessmentVo;
/**
 * Servlet implementation class AssessmentModifyAction
 */
@WebServlet("/assessment/modify.do")
public class AssessmentModifyAction extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
     */
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        
        int a_idx = Integer.parseInt(request.getParameter("a_idx"));
        String a_no = request.getParameter("a_no");
        String a_content = request.getParameter("a_content").replaceAll("\n", "<br>");
        String a_cate = request.getParameter("a_cate");
        System.out.println("a_cate=[" + a_cate + "]");
        
        String a_ip = request.getRemoteAddr();
       
        
        AssessmentVo vo = new AssessmentVo(a_idx, a_ip, a_content, a_cate);
        
        
        int res = AssessmentDao.getInstance().update(vo);
        
        response.sendRedirect("list.do?a_cate="+a_cate);
    }
}
