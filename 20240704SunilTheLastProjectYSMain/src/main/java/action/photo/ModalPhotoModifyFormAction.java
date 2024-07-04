package action.photo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Game1Dao;
import db.vo.Game1Vo;

/**
 * Servlet implementation class PhotoModifyFormAction
 */
@WebServlet("/main/modify_form.do")
public class ModalPhotoModifyFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// parameter 받기
		int game_idx = Integer.parseInt(request.getParameter("game_idx"));
		
		// Game_idx -> Game1Vo 얻기
		Game1Vo vo = Game1Dao.getInstance().selectOne(game_idx);
		
		// <br> -> "\n"
		/*
		 * String p_content = vo.getP_content().replaceAll("<br>", "\n");
		 * vo.setP_content(p_content);
		 */
		
		// request binding
		request.setAttribute("vo", vo);
		
				
		// Dispatcher 형식으로 호출
		String forward_page = "photo_modify_form.jsp";		// photo_modify_form.jsp 열어라 -> 만들어줘야 함
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}
