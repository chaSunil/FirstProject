package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.vo.AssessmentVo;
import service.DBService;

public class AssessmentDao {

	// single-ton pattern : 객체 1개만 생성해서 이용하자
	static AssessmentDao single = null;

	public static AssessmentDao getInstance() {

		//없으면 생성해라
		if (single == null)
			single = new AssessmentDao();

		return single;
	}

	// 외부에서 객체생성하지 말아라...
	private AssessmentDao() {

	}
	
	public List<AssessmentVo> selectList() {

		List<AssessmentVo> list = new ArrayList<AssessmentVo>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from assessment_view";

		try {
			//1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatement
			pstmt = conn.prepareStatement(sql);

			//3.ResultSet 얻어온다
			rs = pstmt.executeQuery();

			while (rs.next()) {

				//저장객체 생성->레코드에서 읽은 값을 넣는다
				AssessmentVo vo = new AssessmentVo();

				//rs가 가리키는 레코드값을 vo에 넣는다
				vo.setA_no(rs.getInt("a_no"));
				vo.setA_idx(rs.getInt("a_idx"));
				vo.setA_regdate(rs.getString("a_regdate"));
				vo.setA_ip(rs.getString("a_ip"));
				vo.setA_content(rs.getString("a_content"));
				vo.setMem_idx(rs.getInt("mem_idx"));				
				vo.setMem_nickname(rs.getString("mem_nickname"));
				vo.setA_cate(rs.getString("a_cate"));

				//ArrayList에 추가
				list.add(vo);

			} //end:while

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		} finally {

			//마무리 작업(열린역순으로 닫기)
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
	
	public List<AssessmentVo> selectOne(String a_cate) {

		List<AssessmentVo> list = new ArrayList<AssessmentVo>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from assessment_view where a_cate=?";

		try {
			//1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatement
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, a_cate);

			//3.ResultSet 얻어온다
			rs = pstmt.executeQuery();

			while (rs.next()) {

				//저장객체 생성->레코드에서 읽은 값을 넣는다
				AssessmentVo vo = new AssessmentVo();

				//rs가 가리키는 레코드값을 vo에 넣는다
				vo.setA_no(rs.getInt("a_no"));
				vo.setA_idx(rs.getInt("a_idx"));
				vo.setA_regdate(rs.getString("a_regdate"));
				vo.setA_ip(rs.getString("a_ip"));
				vo.setA_content(rs.getString("a_content"));
				vo.setMem_idx(rs.getInt("mem_idx"));				
				vo.setMem_nickname(rs.getString("mem_nickname"));
				vo.setA_cate(rs.getString("a_cate"));

				//ArrayList에 추가
				list.add(vo);

			} //end:while

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		} finally {

			//마무리 작업(열린역순으로 닫기)
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
	
	// 일부만 조회
	public AssessmentVo selectOne(int a_idx) {

		AssessmentVo vo = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from assessment_view where a_idx=?";

		try {
			//1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatement
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter index채우기
			pstmt.setInt(1, a_idx);

			//4.ResultSet 얻어온다
			rs = pstmt.executeQuery();

			if (rs.next()) {

				//저장객체 생성->레코드에서 읽은 값을 넣는다
				vo = new AssessmentVo();

				//rs가 가리키는 레코드값을 vo에 넣는다(selectList()꺼 복사)
				vo.setA_no(rs.getInt("a_no"));
				vo.setA_idx(rs.getInt("a_idx"));
				vo.setA_regdate(rs.getString("a_regdate"));
				vo.setA_ip(rs.getString("a_ip"));
				vo.setA_content(rs.getString("a_content"));
				vo.setMem_idx(rs.getInt("mem_idx"));				
				vo.setMem_nickname(rs.getString("mem_nickname"));
				vo.setA_cate(rs.getString("a_cate"));
				
			} //end:if

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		} finally {

			//마무리 작업(열린역순으로 닫기)
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

	public int insert(AssessmentVo vo) {
		// TODO Auto-generated method stub

		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into assessment values(seq_assessment_idx.nextVal,sysdate,?,?,?,?,?)";

		try {
			//1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatement
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter index 채우기
			pstmt.setString(1, vo.getA_ip());
			pstmt.setString(2, vo.getA_content());
			pstmt.setInt(3, vo.getMem_idx());
			pstmt.setString(4, vo.getMem_nickname());
			pstmt.setString(5, vo.getA_cate());

			//4.DB insert
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		} finally {

			//마무리 작업(열린역순으로 닫기)
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

	}//end:insert()

	public int delete(int a_idx) {
		// TODO Auto-generated method stub

		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "delete from assessment where a_idx=?";

		try {
			//1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatement
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter index 채우기
			pstmt.setInt(1, a_idx);

			//4.DB delete
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		} finally {

			//마무리 작업(열린역순으로 닫기)
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

	}//end:delete()

	public int update(AssessmentVo vo) {
		// TODO Auto-generated method stub

		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "update assessment set a_ip=?, a_content=? where a_idx=?";

		try {
			//1.Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2.PreparedStatement
			pstmt = conn.prepareStatement(sql);

			//3.pstmt parameter index 채우기
			pstmt.setString(1, vo.getA_ip());
			pstmt.setString(2, vo.getA_content());
			pstmt.setInt(3, vo.getA_idx());

			//4.DB update
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		} finally {

			//마무리 작업(열린역순으로 닫기)
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

	}//end:update()
}