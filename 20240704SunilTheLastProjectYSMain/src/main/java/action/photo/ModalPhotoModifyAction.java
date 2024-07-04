package action.photo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Game1Dao;
import db.vo.Game1Vo;

/**
 * Servlet implementation class PhotoModifyAction
 */

@WebServlet("/main/modify.do")
public class ModalPhotoModifyAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// /photo/modify.do?p_idx=9&p_title=노트북&p_content=복사본
		
		//0.수신인코딩
		request.setCharacterEncoding("utf-8");
		
		//1.parameter
		int    game_idx 	= Integer.parseInt(request.getParameter("game_idx"));
		String name 		= request.getParameter("name");
		String category 	= request.getParameter("category");
		int    min_player 	= Integer.parseInt(request.getParameter("min_player"));
		int    max_player 	= Integer.parseInt(request.getParameter("max_player"));
		int    playtime 	= Integer.parseInt(request.getParameter("playtime"));
		int    age 			= Integer.parseInt(request.getParameter("age"));
		int    year 		= Integer.parseInt(request.getParameter("year"));
		String publisher 	= request.getParameter("publisher");
		String img_filename = request.getParameter("img_filename");
		
		//3.PhotoVo포장
		Game1Vo vo = new Game1Vo();
		
		vo.setGame_idx(game_idx);
		vo.setName(name);
		vo.setCategory(category);
		vo.setMin_player(min_player);
		vo.setMax_player(max_player);
		vo.setPlaytime(playtime);
		vo.setAge(age);
		vo.setYear(year);
		vo.setPublisher(publisher);
		vo.setImg_filename(img_filename);
		
		//4.DB update
		int res = Game1Dao.getInstance().modal_update(vo);
		
		//5.메인화면
		response.sendRedirect("list.do");
		
		
		
	}

}