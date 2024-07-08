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

	// single-ton pattern : 객체 1개만 생성해서 사용하자
	static subPhotoDao single = null;

	public static subPhotoDao getInstance() {
		// 없으면 생성해라
		if (single == null) {
			single = new subPhotoDao();
		}
		return single;
	}

	private subPhotoDao() {

	}
	
	public List<subPhotoVo> selectList() {
		List<subPhotoVo> list = new ArrayList<subPhotoVo>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from sub_photo";

		try {
			// 1. Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			// 2. PreparedStatement
			pstmt = conn.prepareStatement(sql);

			// 3. ResultSet 얻어오기(킵해놨던 sql문 출력하기)
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// 1. rs가 가리키는 레코드의 값을 읽어온다

				// 2. 저장객체 생성 -> 레코드에서 읽은 값을 넣는다.
				subPhotoVo vo = new subPhotoVo();

				// rs가 가리키는 레코드값을 VO에 넣는다.
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
	
	public int insert(subPhotoVo vo) {
		// TODO Auto-generated method stub

		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into sub_photo values(seq_sub_photo_idx.nextVal, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			// 1. Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			// 2. PreparedStatement
			pstmt = conn.prepareStatement(sql);

			// 3. pstmt parameter index 채우기
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

			// 4. DB insert
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			// 예외 처리에서 무조건 실행되는 부분
			// 마무리 작업(열린역순으로 닫기)
			// 한 번에 잡아서 try catch 하기 : alt + shift + s
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return res;

	}// end:insert()
	
}
