package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.vo.GameVo;
import service.DBService;

public class GameDao {
	
	// single-ton pattern : 객체 한 개만 생성하여 이용하자
	static GameDao single = null;

	public static GameDao getInstance() {

		// 객체 없을 시 생성해라
		if (single == null)
			single = new GameDao();
		return single;
	}

	// private : 외부에서 객체 생성 하지 마라
	private GameDao() {

	}
	
	// selectList : 전체조회
	public List<GameVo> selectList() {

		List<GameVo> list = new ArrayList<GameVo>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from games ";

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
				GameVo vo = new GameVo();

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
	
	// selectOne -> game_idx
	public GameVo selectOne(int idx) {
		// 변수 선언(전역변수)
		GameVo vo = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from games where game_idx=?";

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
				vo = new GameVo();

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


}
