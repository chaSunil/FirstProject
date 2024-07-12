package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import db.vo.PhotoVo;
import service.DBService;
import service.MyBatisConnector;

public class PhotoDao {
	
	// Mybatis 객체
	SqlSessionFactory factory;
	// single-ton pattern : 객체 1개만 생성해서 이용하자
	static PhotoDao single = null;

	public static PhotoDao getInstance() {

		//없으면 생성해라
		if (single == null)
			single = new PhotoDao();

		return single;
	}

	// 외부에서 객체생성하지 말아라...
	private PhotoDao() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	public List<PhotoVo> selectList() {

		List<PhotoVo> list = new ArrayList<PhotoVo>();

		// String sql = "select * from photo order by p_idx desc";
		
		// 1. SqlSession 얻어오기
		SqlSession sqlSession = factory.openSession(); // Connection 획득
		
		// 2. 작업수행                namespace
		list = sqlSession.selectList("photo.photo_list");
		
		// 3. 닫기 : conn.close()과정 포함
		sqlSession.close();

		return list;
	}
	
	public List<PhotoVo> selectList(Map<String, Object> map) {
		
		List<PhotoVo> list = new ArrayList<PhotoVo>();

		// 1. SqlSession 얻어오기
		SqlSession sqlSession = factory.openSession(); // Connection 획득
		
		// 2. 작업수행                namespace
		list = sqlSession.selectList("photo.photo_list_page", map);
		
		// 3. 닫기 : conn.close()과정 포함
		sqlSession.close();

		return list;
	}
	
	
	// p_idx에 대한 1건의 정보
	// 일부만 조회
	public PhotoVo selectOne(int p_idx) {

		PhotoVo vo = null;

		// String sql = "select * from photo where p_idx=?";
		
		// 1. SqlSession 얻어오기
		SqlSession sqlSession = factory.openSession(); // Connection 획득
		
		// 2. 작업수행                namespace
		vo = sqlSession.selectOne("photo.photo_one", p_idx);
		
		// 3. 닫기 : conn.close()과정 포함
		sqlSession.close();

		return vo;
	}

	public int insert(PhotoVo vo) {
		// TODO Auto-generated method stub

		int res = 0;
		//														     1 2 3 4         5 6
		// String sql = "insert into photo values(seq_photo_idx.nextVal,?,?,?,?,sysdate,?,?)";
		
		// 1. SqlSession 얻어오기
		SqlSession sqlSession = factory.openSession(true); // Connection 획득
		
		// 2. 작업수행                namespace
		res = sqlSession.insert("photo.photo_insert", vo);
		
		// 3. 닫기 : conn.close()과정 포함
		sqlSession.close();


		return res;

	}//end:insert()

	public int delete(int p_idx) {
		// TODO Auto-generated method stub

		int res = 0;
		
		// String sql = "delete from photo where p_idx=?";

		// 1. SqlSession 얻어오기
		SqlSession sqlSession = factory.openSession(true); // Connection 획득
		
		// 2. 작업수행                namespace
		res = sqlSession.delete("photo.photo_delete", p_idx);
		
		// 3. 닫기 : conn.close()과정 포함
		sqlSession.close();

		return res;

	}//end:delete()

	public int update_filename(PhotoVo vo) {
		// TODO Auto-generated method stub

		int res = 0;
		//										  1             2
		// String sql = "update photo set p_filename=? where p_idx=?";

		// 1. SqlSession 얻어오기
		SqlSession sqlSession = factory.openSession(true); // Connection 획득
		
		// 2. 작업수행                namespace
		res = sqlSession.update("photo.photo_update_filename", vo);
		
		// 3. 닫기 : conn.close()과정 포함
		sqlSession.close();

		return res;

	}//end:update()

	public int update(PhotoVo vo) {
		// TODO Auto-generated method stub

		int res = 0;

		// String sql = "update photo set p_title=?, p_content=? where p_idx=?";

		// 1. SqlSession 얻어오기
		SqlSession sqlSession = factory.openSession(true); // Connection 획득
		
		// 2. 작업수행                namespace
		res = sqlSession.update("photo.photo_update", vo);
		
		// 3. 닫기 : conn.close()과정 포함
		sqlSession.close();

		return res;

	}//end:update()

	public int selectRowTotal() {

		int total = 0;
		
		// 1. SqlSession 얻어오기
		SqlSession sqlSession = factory.openSession();

		// 2. 작업수행
		total = sqlSession.selectOne("photo.photo_row_total");

		// 3. 닫기 : conn.close() 과정 포함
		sqlSession.close();

		return total;
	}

}
