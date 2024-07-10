package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.SawonVo;

public class SawonDao {
	
	// Mybatis 객체 얻어오기
	SqlSessionFactory factory;
	
	// single-ton pattern : 객체 1개만 생성해서 사용하자
	static SawonDao single = null;

	public static SawonDao getInstance() {
		// 없으면 생성해라
		if (single == null) {
			single = new SawonDao();
		}
		return single;
	}

	private SawonDao() {
		// Mybatis 기능 사용을 위해서 factory 정보를 가져온다.
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	public List<SawonVo> selectList() {
		List<SawonVo> list = null;
		
		// 1. SqlSession 얻어오기(Mybatis 수행객체)
		SqlSession sqlSession = factory.openSession();
		
		// 2. 작업수행                namespace.mapperId
		list = sqlSession.selectList("sawon.sawon_list");
		
		// 3. 작업완료 후 닫기작업
		sqlSession.close();

		return list;
	}

	public List<SawonVo> selectListFromDeptno(int deptno) {
		List<SawonVo> list = null;
		
		// 1. SqlSession 얻어오기(Mybatis 수행객체)
		SqlSession sqlSession = factory.openSession();
		
		// 2. 작업수행                namespace.mapperId        parameter
		list = sqlSession.selectList("sawon.sawon_list_deptno", deptno);
		
		// 3. 작업완료 후 닫기작업
		sqlSession.close();

		return list;
	}
	
	
	
	

}
