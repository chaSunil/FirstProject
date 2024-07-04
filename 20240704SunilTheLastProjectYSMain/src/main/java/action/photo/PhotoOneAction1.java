package action.photo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import dao.Game1Dao;
import db.vo.Game1Vo;




/**
 * Servlet implementation class PhotoOneAction
 */
@WebServlet("/main/photo_one1.do")
public class PhotoOneAction1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		// 1. parameter 받기 -> 파일업로드 아니므로 request.getParameter 사용
				int game_idx = Integer.parseInt(request.getParameter("game_idx"));
				
				// 2. game_idx에 해당되는 PhotoVo 정보 얻어온다
				Game1Vo vo = Game1Dao.getInstance().selectOne(game_idx);
				
				// 응답처리
				response.setContentType("application/json; charset=utf-8;");
				
				// vo -> JSON 객체 생성  vo에 있는 정보를 json으로 재포장
				JSONObject json = new JSONObject();
				json.put("game_idx", vo.getGame_idx());
				json.put("name", vo.getName());
				json.put("category", vo.getCategory());
				json.put("min_player", vo.getMin_player());
				json.put("max_player", vo.getMax_player());
				json.put("playtime", vo.getPlaytime());
				json.put("age", vo.getAge());
				json.put("year", vo.getYear());
				json.put("publisher", vo.getPublisher());
				json.put("img_filename", vo.getImg_filename());
				
				response.getWriter().print(json.toString());

	}

}
