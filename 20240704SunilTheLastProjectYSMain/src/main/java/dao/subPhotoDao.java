package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.vo.subPhotoVo;
import service.DBService;

public class subPhotoDao {
	
	// single-ton pattern : 객체 1개만 생성해서 이용하자
	static subPhotoDao single = null;

	public static subPhotoDao getInstance() {

		// 없으면 생성해라
		if (single == null)
			single = new subPhotoDao();

		return single;
	}

	// 외부에서 객체 생성하지 말아라 -> 다른 클래스에서 Connection conn = new DBService().getConnection(); 적기만 해도 에러
	private subPhotoDao() {

	}

	public List<subPhotoVo> selectList() {

		List<subPhotoVo> list = new ArrayList<subPhotoVo>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from sub_photo";

		try {
			//1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatement
			pstmt = conn.prepareStatement(sql);

			//3.ResultSet 얻어온다
			rs = pstmt.executeQuery();

			while (rs.next()) {

				// 1.rs가 가리키는 레코드의 값을 읽어온다

				// 2.저장객체 생성 -> 레코드에서 읽은 값을 넣는다
				subPhotoVo vo = new subPhotoVo();

				// rs가 가리키는 레코드값을 vo에 넣는다
				vo.setSub_p_idx(rs.getInt("sub_p_idx"));
				vo.setSub_p_title(rs.getString("sub_p_title"));
				vo.setSub_p_category(rs.getString("sub_p_category"));
				vo.setSub_p_filename(rs.getString("sub_p_filename"));
				vo.setSub_p_min_player(rs.getInt("sub_p_min_player"));
				vo.setSub_p_max_player(rs.getInt("sub_p_max_player"));
				vo.setSub_p_playtime(rs.getInt("sub_p_playtime"));
				vo.setSub_p_age(rs.getInt("sub_p_age"));
				vo.setSub_p_year(rs.getInt("sub_p_year"));
				vo.setSub_p_publisher(rs.getString("sub_p_publisher"));
				vo.setSub_p_detail_loc(rs.getString("sub_p_detail_loc"));

				//ArrayList에 추가
				list.add(vo);
			} //end:while

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//마무리작업(열린 역순으로 닫기)
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;
	}

	public subPhotoVo selectOne(int sub_p_idx) {

		subPhotoVo vo = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from sub_photo where sub_p_idx=?";

		try {
			//1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatement
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter index 채우기
			pstmt.setInt(1, sub_p_idx);

			//4.ResultSet 얻어온다
			rs = pstmt.executeQuery();

			if (rs.next()) {

				// 1.rs가 가리키는 레코드의 값을 읽어온다

				// 2.저장객체 생성 -> 레코드에서 읽은 값을 넣는다
				vo = new subPhotoVo();

				// rs가 가리키는 레코드값을 vo에 넣는다
				vo.setSub_p_idx(rs.getInt("sub_p_idx"));
				vo.setSub_p_title(rs.getString("sub_p_title"));
				vo.setSub_p_category(rs.getString("sub_p_category"));
				vo.setSub_p_filename(rs.getString("sub_p_filename"));
				vo.setSub_p_min_player(rs.getInt("sub_p_min_player"));
				vo.setSub_p_max_player(rs.getInt("sub_p_max_player"));
				vo.setSub_p_playtime(rs.getInt("sub_p_playtime"));
				vo.setSub_p_age(rs.getInt("sub_p_age"));
				vo.setSub_p_year(rs.getInt("sub_p_year"));
				vo.setSub_p_publisher(rs.getString("sub_p_publisher"));
				vo.setSub_p_detail_loc(rs.getString("sub_p_detail_loc"));

			} //end:if

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//마무리작업(열린 역순으로 닫기)
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return vo;
	}
	
	
	public int insert(subPhotoVo vo) {

		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into sub_photo values(seq_sub_photo_idx.nextVal, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			//1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatement
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter index 채우기
			pstmt.setString(1, vo.getSub_p_title());
			pstmt.setString(2, vo.getSub_p_category());
			pstmt.setInt(3, vo.getSub_p_min_player());
			pstmt.setInt(4, vo.getSub_p_max_player());
			pstmt.setInt(5, vo.getSub_p_playtime());
			pstmt.setInt(6, vo.getSub_p_age());
			pstmt.setInt(7, vo.getSub_p_year());
			pstmt.setString(8, vo.getSub_p_publisher());
			pstmt.setString(9, vo.getSub_p_filename());
			pstmt.setString(10, vo.getSub_p_detail_loc());

			//4.DB insert
			res = pstmt.executeUpdate(); //select문 이외는 무조건 update 성공시 1 증가

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//마무리작업(열린 역순으로 닫기)
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
	}//end:insert()
	
	public List<subPhotoVo> selectSort(String sub_p_category, String sub_p_sort) {

		List<subPhotoVo> list = new ArrayList<subPhotoVo>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
					  
		String sql = "select * from sub_photo where sub_p_category=? order by " + sub_p_sort;

		try {
			//1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatement
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, sub_p_category);

			//3.ResultSet 얻어온다
			rs = pstmt.executeQuery();

			while (rs.next()) {

				// 1.rs가 가리키는 레코드의 값을 읽어온다

				// 2.저장객체 생성 -> 레코드에서 읽은 값을 넣는다
				subPhotoVo vo = new subPhotoVo();

				// rs가 가리키는 레코드값을 vo에 넣는다
				vo.setSub_p_idx(rs.getInt("sub_p_idx"));
				vo.setSub_p_title(rs.getString("sub_p_title"));
				vo.setSub_p_category(rs.getString("sub_p_category"));
				vo.setSub_p_filename(rs.getString("sub_p_filename"));
				vo.setSub_p_min_player(rs.getInt("sub_p_min_player"));
				vo.setSub_p_max_player(rs.getInt("sub_p_max_player"));
				vo.setSub_p_playtime(rs.getInt("sub_p_playtime"));
				vo.setSub_p_age(rs.getInt("sub_p_age"));
				vo.setSub_p_year(rs.getInt("sub_p_year"));
				vo.setSub_p_publisher(rs.getString("sub_p_publisher"));
				vo.setSub_p_detail_loc(rs.getString("sub_p_detail_loc"));

				//ArrayList에 추가
				list.add(vo);
			} //end:while

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//마무리작업(열린 역순으로 닫기)
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;
	}


	public int update_filename(subPhotoVo vo) {

		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "update sub_photo set sub_p_filename=? where sub_p_idx=?";

		try {
			//1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatement
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter index 채우기
			pstmt.setString(1, vo.getSub_p_filename());
			pstmt.setInt(2, vo.getSub_p_idx());

			//4.DB update
			res = pstmt.executeUpdate(); //select문 이외는 무조건 update 성공시 1 증가

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//마무리작업(열린 역순으로 닫기)
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

	public int update(subPhotoVo vo) {

		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "update sub_photo set sub_p_title=?, sub_p_category=?, sub_p_min_player=?, sub_p_max_player=?, sub_p_playtime=?, sub_p_age=?, sub_p_year=?, sub_p_publisher=? where sub_p_idx=?";

		try {
			//1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatement
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter index 채우기
			pstmt.setString(1, vo.getSub_p_title());
			pstmt.setString(2, vo.getSub_p_category());
			pstmt.setInt(3, vo.getSub_p_min_player());
			pstmt.setInt(4, vo.getSub_p_max_player());
			pstmt.setInt(5, vo.getSub_p_playtime());
			pstmt.setInt(6, vo.getSub_p_age());
			pstmt.setInt(7, vo.getSub_p_year());
			pstmt.setString(8, vo.getSub_p_publisher());
			pstmt.setInt(9, vo.getSub_p_idx());

			//4.DB update
			res = pstmt.executeUpdate(); //select문 이외는 무조건 update 성공시 1 증가

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//마무리작업(열린 역순으로 닫기)
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

	public int delete(int sub_p_idx) {

		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "delete from sub_photo where sub_p_idx=?";

		try {
			//1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatement
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter index 채우기
			pstmt.setInt(1, sub_p_idx);

			//4.DB delete
			res = pstmt.executeUpdate(); //select문 이외는 무조건 update 성공시 1 증가

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//마무리작업(열린 역순으로 닫기)
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
	}//end:delete()

	public List<subPhotoVo> selectListCategory(String sub_p_category) {

		List<subPhotoVo> list = new ArrayList<subPhotoVo>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from sub_photo where sub_p_category=?";

		try {
			//1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatement
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, sub_p_category);

			//3.ResultSet 얻어온다
			rs = pstmt.executeQuery();

			while (rs.next()) {

				// 1.rs가 가리키는 레코드의 값을 읽어온다

				// 2.저장객체 생성 -> 레코드에서 읽은 값을 넣는다
				subPhotoVo vo = new subPhotoVo();

				// rs가 가리키는 레코드값을 vo에 넣는다
				vo.setSub_p_idx(rs.getInt("sub_p_idx"));
				vo.setSub_p_title(rs.getString("sub_p_title"));
				vo.setSub_p_category(rs.getString("sub_p_category"));
				vo.setSub_p_filename(rs.getString("sub_p_filename"));
				vo.setSub_p_min_player(rs.getInt("sub_p_min_player"));
				vo.setSub_p_max_player(rs.getInt("sub_p_max_player"));
				vo.setSub_p_playtime(rs.getInt("sub_p_playtime"));
				vo.setSub_p_age(rs.getInt("sub_p_age"));
				vo.setSub_p_year(rs.getInt("sub_p_year"));
				vo.setSub_p_publisher(rs.getString("sub_p_publisher"));
				vo.setSub_p_detail_loc(rs.getString("sub_p_detail_loc"));

				//ArrayList에 추가
				list.add(vo);
			} //end:while

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//마무리작업(열린 역순으로 닫기)
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;
	}

	public List<subPhotoVo> selectSortAll(String sub_p_sort) {

		List<subPhotoVo> list = new ArrayList<subPhotoVo>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from sub_photo order by " + sub_p_sort;

		try {
			//1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatement
			pstmt = conn.prepareStatement(sql);

			//3.ResultSet 얻어온다
			rs = pstmt.executeQuery();

			while (rs.next()) {

				// 1.rs가 가리키는 레코드의 값을 읽어온다

				// 2.저장객체 생성 -> 레코드에서 읽은 값을 넣는다
				subPhotoVo vo = new subPhotoVo();

				// rs가 가리키는 레코드값을 vo에 넣는다
				vo.setSub_p_idx(rs.getInt("sub_p_idx"));
				vo.setSub_p_title(rs.getString("sub_p_title"));
				vo.setSub_p_category(rs.getString("sub_p_category"));
				vo.setSub_p_filename(rs.getString("sub_p_filename"));
				vo.setSub_p_min_player(rs.getInt("sub_p_min_player"));
				vo.setSub_p_max_player(rs.getInt("sub_p_max_player"));
				vo.setSub_p_playtime(rs.getInt("sub_p_playtime"));
				vo.setSub_p_age(rs.getInt("sub_p_age"));
				vo.setSub_p_year(rs.getInt("sub_p_year"));
				vo.setSub_p_publisher(rs.getString("sub_p_publisher"));
				vo.setSub_p_detail_loc(rs.getString("sub_p_detail_loc"));

				//ArrayList에 추가
				list.add(vo);
			} //end:while

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//마무리작업(열린 역순으로 닫기)
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;
	}



}
