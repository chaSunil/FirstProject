package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.vo.SearchVo;
import service.DBService;

public class SearchDao {
	
	// single-ton pattern : 객체 1개만 생성해서 사용하자
	static SearchDao single = null;

	public static SearchDao getInstance() {
		// 없으면 생성해라
		if (single == null) {
			single = new SearchDao();
		}
		return single;
	}

	private SearchDao() {

	}
	
	
	public List<SearchVo> selectList() {
		List<SearchVo> list = new ArrayList<SearchVo>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from games";

		try {
			// 1. Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			// 2. PreparedStatement
			pstmt = conn.prepareStatement(sql);

			// 3. ResultSet 얻어오기(킵해놨던 sql문 출력하기)
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// 2. 저장객체 생성 -> 레코드에서 읽은 값을 넣는다.
				SearchVo vo = new SearchVo();

				// rs가 가리키는 레코드값을 VO에 넣는다.
				vo.setGame_idx(rs.getInt("game_idx"));
				vo.setName(rs.getString("name"));
				vo.setLink(rs.getString("link"));
				vo.setFilename(rs.getString("filename"));

				// ArrayList에 추가
				list.add(vo);

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			// 예외 처리에서 무조건 실행되는 부분
			// 마무리 작업(열린역순으로 닫기)
			// 한 번에 잡아서 try catch 하기 : alt + shift + s
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
	}
	
	// 하나의 정보만 가져올 때 (where 사용해서 ex)deptno=10)
	public SearchVo selectOne(String name) {
		SearchVo vo = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from games where name=?";

		try {
			// 1. Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			// 2. PreparedStatement
			pstmt = conn.prepareStatement(sql);

			// 3. pstmt parameter index 채우기
			pstmt.setString(1, name);

			// 4. ResultSet 얻어오기(킵해놨던 sql문 출력하기)
			rs = pstmt.executeQuery();

			// while문을 사용해도 되지만, 공회전이 1회더 발생한다.
			if (rs.next()) {
				// 1. rs가 가리키는 레코드의 값을 읽어온다

				// 2. 저장객체 생성 -> 레코드에서 읽은 값을 넣는다.
				vo = new SearchVo();

				// rs가 가리키는 레코드값을 VO에 넣는다.
				vo.setGame_idx(rs.getInt("game_idx"));
				vo.setName(rs.getString("name"));
				vo.setLink(rs.getString("link"));
				vo.setFilename(rs.getString("filename"));

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			// 예외 처리에서 무조건 실행되는 부분
			// 마무리 작업(열린역순으로 닫기)
			// 한 번에 잡아서 try catch 하기 : alt + shift + s
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
	}

}
