package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.vo.Game1Vo;
import service.DBService;

public class Game1Dao {
	// single-ton pattern : 객체 한 개만 생성하여 이용하자
	static Game1Dao single = null;

	public static Game1Dao getInstance() {

		// 객체 없을 시 생성해라
		if (single == null)
			single = new Game1Dao();
		return single;
	}

	// private : 외부에서 객체 생성 하지 마라
	private Game1Dao() {

	}
	
	public List<Game1Vo> selectList() {

		List<Game1Vo> list = new ArrayList<Game1Vo>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from games1 order by game_idx asc";

		try {
			// 1. Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			// 2. PreparedStatment 얻어오기
			pstmt = conn.prepareStatement(sql);

			// 3. ResultSet 얻어오기
			rs = pstmt.executeQuery();

			// 사용 후 꼭!! 닫아주기 -> 어디서 닫아? -> finally

			while (rs.next()) {

				// 저장 객체 생성 -> 레코드에서 읽은 값을 넣는다
				Game1Vo vo = new Game1Vo();

				// rs가 가리키는 레코드 값을 vo에 넣는다
				vo.setGame_idx(rs.getInt("game_idx"));
				vo.setName(rs.getString("name"));
				vo.setCategory(rs.getString("category"));
				vo.setMin_player(rs.getInt("min_player"));
				vo.setMax_player(rs.getInt("max_player"));
				vo.setPlaytime(rs.getInt("playtime"));
				vo.setAge(rs.getInt("age"));
				vo.setYear(rs.getInt("year"));
				vo.setPublisher(rs.getString("publisher"));
				vo.setImg_filename(rs.getString("img_filename"));

				// ArrayList에 vo 내용을 추가
				list.add(vo);

			} // end : While문

		} catch (Exception e) {
			e.printStackTrace();
		} finally { // finally : 예외 발생하든 안 하든 무조건 실행되는 구문 

			// 마무리 작업 하기(열린 역순으로 닫기) 
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return list;

	} // end : selectList
	
	// selectOne - game_idx
	public Game1Vo selectOne(int idx) {
		// 변수 선언(전역변수)
		Game1Vo vo = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from games1 where game_idx=?";

		try {
			// 1. Connection 얻어오기
			conn = DBService.getInstance().getConnection();
			// 2. PreparedStatment 얻어오기
			pstmt = conn.prepareStatement(sql);
			// 3. pstmt parameter index 채우기
			pstmt.setInt(1, idx);
			// 4. ResultSet 얻어오기
			rs = pstmt.executeQuery();
			// 사용 후 꼭!! 닫아주기 -> 어디서 닫아? -> finally

			if (rs.next()) {
				// 저장 객체 생성 -> 레코드에서 읽은 값을 넣는다
				vo = new Game1Vo();

				// rs가 가리키는 레코드 값을 vo에 넣는다(vo에 포장)
				vo.setGame_idx(rs.getInt("game_idx"));
				vo.setName(rs.getString("name"));
				vo.setCategory(rs.getString("category"));
				vo.setMin_player(rs.getInt("min_player"));
				vo.setMax_player(rs.getInt("max_player"));
				vo.setPlaytime(rs.getInt("playtime"));
				vo.setAge(rs.getInt("age"));
				vo.setYear(rs.getInt("year"));
				vo.setPublisher(rs.getString("publisher"));
				vo.setImg_filename(rs.getString("img_filename"));

			} //end : if문

		} catch (Exception e) {
			e.printStackTrace();
		} finally { // finally : 예외 발생하든 안 하든 무조건 실행되는 구문 
			// 마무리 작업 하기(열린 역순으로 닫기) 
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return vo;
	} // end : selectOne

	public int modal_update(Game1Vo vo) {

		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "update games1 set  name=?,category=?,min_player=?,max_player=?,playtime=?,age=?,year=?,publisher=?,img_filename=? where game_idx=?";

		try {
			// 1. Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			// 2. PreparedStatment 얻어오기
			pstmt = conn.prepareStatement(sql);

			// 3. pstmt parameter index 채우기
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getCategory());
			pstmt.setInt(3, vo.getMin_player());
			pstmt.setInt(4, vo.getMax_player());
			pstmt.setInt(5, vo.getPlaytime());
			pstmt.setInt(6, vo.getAge());
			pstmt.setInt(7, vo.getYear());
			pstmt.setString(8, vo.getPublisher());
			pstmt.setString(9, vo.getImg_filename());
			pstmt.setInt(10, vo.getGame_idx());

			// 4. DB update
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally { // finally : 예외 발생하든 안 하든 무조건 실행되는 구문 

			// 마무리 작업 하기(열린 역순으로 닫기) 
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return res;
	}//end:update()

	// modal_update_filename(모달 수정 - 이미지 업로드)
	public int modal_update_filename(Game1Vo vo) {

		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "update games1 set img_filename=? where game_idx=?";

		try {
			// 1. Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			// 2. PreparedStatment 얻어오기
			pstmt = conn.prepareStatement(sql);

			// 3. pstmt parameter index 채우기
			pstmt.setString(1, vo.getImg_filename());
			pstmt.setInt(2, vo.getGame_idx());

			// 4. DB update
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally { // finally : 예외 발생하든 안 하든 무조건 실행되는 구문 

			// 마무리 작업 하기(열린 역순으로 닫기) 
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return res;
	}//end:modal_update_filename()
	


}
