package action.assessment;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.AssessmentDao;
import db.vo.AssessmentVo;
/**
 * Servlet implementation class AssessmentModifyFormAction
 */
@WebServlet("/assessment/modify_form.do")
public class AssessmentModifyFormAction extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
     */
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. 수정할 게시물 번호
        int a_idx = Integer.parseInt(request.getParameter("a_idx"));
        
        // 2. a_idx -> AssessmentVo 얻기
        AssessmentVo vo = AssessmentDao.getInstance().selectOne(a_idx);
        
        // 3. <br> -> \n
        String a_content = vo.getA_content().replaceAll("<br>", "\n");
        vo.setA_content(a_content);
        
        // request binding
        request.setAttribute("vo", vo);
        // Dispatcher형식으로 호출
        String forward_page = "assessment_modify_form.jsp";
        RequestDispatcher disp = request.getRequestDispatcher(forward_page);
        disp.forward(request, response);
    }
}
