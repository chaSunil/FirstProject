package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import db.vo.VisitVo;
import service.MyBatisConnector;

public class VisitDao {

	// Mybatis 객체
	SqlSessionFactory factory;
	// single-ton pattern : 객체 1개만 생성해서 사용하자
	static VisitDao single = null;

	public static VisitDao getInstance() {
		// 없으면 생성해라
		if (single == null) {
			single = new VisitDao();
		}
		return single;
	}
	// 외부에서 객체생성하지 말아라...
	private VisitDao() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	
	// 테이블 목록 조회
	public List<VisitVo> selectList() {
		List<VisitVo> list = null;
		
		// 1. SqlSession 얻어오기
		SqlSession sqlSession = factory.openSession(); // Connection 획득
		
		// 2. 작업수행                namespace
		list = sqlSession.selectList("visit.visit_list");
		
		// 3. 닫기 : conn.close()과정 포함
		sqlSession.close();

		return list;
	}
	
	public int insert(VisitVo vo) {
		// TODO Auto-generated method stub

		int res = 0;

		String sql = "insert into visit values(seq_visit_idx.nextVal,?,?,?,?,sysdate)";
		
		// 1. SqlSession 얻어오기
		SqlSession sqlSession = factory.openSession(); // Connection 획득
		
		// 2. 작업수행                namespace
		res = sqlSession.insert("visit.visit_insert", vo);
		
		if(res==1)
			sqlSession.commit();
		else
			sqlSession.rollback();
		
		// 3. 닫기 : conn.close()과정 포함
		sqlSession.close();
		
		return res;

	}// end:insert()
	
	public int delete(int idx) {
		// TODO Auto-generated method stub

		int res = 0;
		
		// 1. SqlSession 얻어오기                   true<- auto commit
		SqlSession sqlSession = factory.openSession(true); // Connection 획득
		
		// 2. 작업수행                namespace
		res = sqlSession.delete("visit.visit_delete", idx);
		
		// 3. 닫기 : conn.close()과정 포함
		sqlSession.close();

		return res;

	}// end:delete()
	
	// 하나의 정보만 가져올 때 (where 사용해서 ex)deptno=10)
	public VisitVo selectOne(int idx) {
		VisitVo vo = null;

		// 1. SqlSession 얻어오기
		SqlSession sqlSession = factory.openSession(); // Connection 획득
		
		// 2. 작업수행                namespace
		vo = sqlSession.selectOne("visit.visit_one", idx);
		
		// 3. 닫기 : conn.close()과정 포함
		sqlSession.close();

		return vo;
	}// end:selectOne()
	
	public int update(VisitVo vo) {
		// TODO Auto-generated method stub

		int res = 0;
		// String sql = "update visit set name =?, content =?, pwd =?, ip =?, regdate = sysdate where idx=? ";
		// 1. SqlSession 얻어오기
		SqlSession sqlSession = factory.openSession(true); // Connection 획득
		
		// 2. 작업수행                namespace
		res = sqlSession.update("visit.visit_update", vo);
		
		// 3. 닫기 : conn.close()과정 포함
		sqlSession.close();

		return res;

	}// end:update()
	
}
