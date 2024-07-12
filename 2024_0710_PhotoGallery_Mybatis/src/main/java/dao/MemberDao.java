package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import db.vo.MemberVo;
import service.DBService;
import service.MyBatisConnector;

public class MemberDao {
	
	// Mybatis 객체
	SqlSessionFactory factory;

	// single-ton pattern : 객체 1개만 생성해서 이용하자
	static MemberDao single = null;

	public static MemberDao getInstance() {

		//없으면 생성해라
		if (single == null)
			single = new MemberDao();

		return single;
	}

	// 외부에서 객체생성하지 말아라...
	private MemberDao() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	//전체조희
	public List<MemberVo> selectList() {

		List<MemberVo> list = null;

		// 1. SqlSession 얻어오기
		SqlSession sqlSession = factory.openSession(); // Connection 획득
		
		// 2. 작업수행                namespace
		list = sqlSession.selectList("member.member_list");
		
		// 3. 닫기 : conn.close()과정 포함
		sqlSession.close();


		return list;
	}
	
	// mem_idx에 해당되는 1건의 정보 얻어온다
	// 일부만 조회
	public MemberVo selectOne(int mem_idx) {

		MemberVo vo = null;

		// 1. SqlSession 얻어오기
		SqlSession sqlSession = factory.openSession();
		
		// 2. 작업수행
		vo = sqlSession.selectOne("member.member_one",mem_idx);
		
		// 3. 닫기 : conn.close() 과정 포함
		sqlSession.close();

		return vo;
	}
	
	// mem_id에 해당되는 1건의 정보 얻어온다
	public MemberVo selectOne(String mem_id) {
		
		MemberVo vo = null;
		
		// String sql = "select * from member where mem_id=?";
		
		// 1. SqlSession 얻어오기
		SqlSession sqlSession = factory.openSession(); // Connection 획득
		
		// 2. 작업수행                namespace
		vo = sqlSession.selectOne("member.member_id_one", mem_id);
		
		// 3. 닫기 : conn.close()과정 포함
		sqlSession.close();
		
		return vo;
	}

	public int insert(MemberVo vo) {
		// TODO Auto-generated method stub

		int res = 0;
		// String sql = "insert into member values(seq_member_idx.nextVal,?,?,?,?,?,?,default,default)";

		// 1. SqlSession 얻어오기
		SqlSession sqlSession = factory.openSession(true); // Connection 획득
		
		// 2. 작업수행                namespace
		res = sqlSession.insert("member.member_insert", vo);
		
		// 3. 닫기 : conn.close()과정 포함
		sqlSession.close();

		return res;

	}//end:insert()

	public int delete(int mem_idx) {
		// TODO Auto-generated method stub

		int res = 0;

		// String sql = "delete from member where mem_idx=?";
		
		// 1. SqlSession 얻어오기
		SqlSession sqlSession = factory.openSession(true); // Connection 획득
		
		// 2. 작업수행                namespace
		res = sqlSession.delete("member.member_delete", mem_idx);
		
		// 3. 닫기 : conn.close()과정 포함
		sqlSession.close();

		return res;

	}//end:delete()

	public int update(MemberVo vo) {
		// TODO Auto-generated method stub

		int res = 0;

		// String sql = "update member set mem_name=?, mem_id=?, mem_pwd=?, mem_zipcode=?, mem_addr=?, mem_grade=? where mem_idx=? ";
		
		// 1. SqlSession 얻어오기
		SqlSession sqlSession = factory.openSession(true); // Connection 획득
		
		// 2. 작업수행                namespace
		res = sqlSession.update("member.member_delete", vo);
		
		// 3. 닫기 : conn.close()과정 포함
		sqlSession.close();

		return res;

	}//end:update()
}
