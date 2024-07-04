package action.search;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SearchDao;
import db.vo.SearchVo;

/**
 * Servlet implementation class SearchGetListAction
 */
@WebServlet("/search/getlist.do")
public class SearchGetListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		List<SearchVo> list = SearchDao.getInstance().selectList();
		
		StringBuilder sb = new StringBuilder("[");
		for(SearchVo vo : list) {
			sb.append("\"");
			sb.append(vo.getName());
			sb.append("\",");
		}
		
		int index = sb.lastIndexOf(",");
		
		String  result = sb.toString().substring(0,index)+ "]";
		
		//  {"result": "%s"}
		String json = String.format("{\"result\": %s }", result);
		
		
		response.setContentType("application/json;charset=utf-8;");
		response.getWriter().print(json);
		
		
	}

}