package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import db.vo.DeptVo;
import service.MyBatisConnector;

public class DeptDao {

	// Mybatis 객체
	SqlSessionFactory factory;

	// single-ton pattern : 객체 1개만 생성해서 이용하자
	static DeptDao single = null;

	public static DeptDao getInstance() {

		//없으면 생성해라
		if (single == null)
			single = new DeptDao();

		return single;
	}

	// 외부에서 객체생성하지 말아라...
	private DeptDao() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	public List<DeptVo> selectList() {
		
		List<DeptVo> list = null;
		
		// 1. SqlSession 얻어오기
		SqlSession sqlSession = factory.openSession(); // Connection 획득

		// 2. 작업수행                namespace
		list = sqlSession.selectList("dept.dept_list");

		// 3. 닫기 : conn.close()과정 포함
		sqlSession.close();

		return list;
	}
}
