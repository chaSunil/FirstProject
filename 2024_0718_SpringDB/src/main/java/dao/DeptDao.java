package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.DeptVo;

public class DeptDao {
	
	// SqlSessionTemplate interface를 Constructor Injection으로 연결
	SqlSession sqlSession;

	// Constructor Injection
	public DeptDao(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}
	
	public List<DeptVo> selectList() {
		
		// 1. SqlSession sqlSession = factory.opesSession();
		
		// 2. list = sqlSession.selectList("dept.dept_list");
		
		// 3. sqlSession.close();
		
		return sqlSession.selectList("dept.dept_list");
	}

}