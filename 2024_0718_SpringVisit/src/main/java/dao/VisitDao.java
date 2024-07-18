package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import vo.VisitVo;

public class VisitDao {

	@Autowired
	SqlSession sqlSession; // SqlSessionTemplate
	
	// 테이블 목록 조회
	public List<VisitVo> selectList() {
		// 값을 바로 넘겨주기 떄문에, 저장장소가 필요없다 list 같이

		return sqlSession.selectList("visit.visit_list");
	}
	
	public List<VisitVo> selectList(Map<String, Object> map) {
		
		return sqlSession.selectList("visit.visit_list_condition", map);
	}
	
	public int insert(VisitVo vo) {
		
		return sqlSession.insert("visit.visit_insert", vo);

	}// end:insert()
	
	public int delete(int idx) {
		// TODO Auto-generated method stub
		
		return sqlSession.delete("visit.visit_delete", idx);

	}// end:delete()
	
	// 하나의 정보만 가져올 때 (where 사용해서 ex)deptno=10)
	public VisitVo selectOne(int idx) {

		return sqlSession.selectOne("visit.visit_one", idx);
	}// end:selectOne()
	
	public int update(VisitVo vo) {
		// TODO Auto-generated method stub

		return sqlSession.update("visit.visit_update", vo);

	}// end:update()
	
	public int selectRowTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub

		return sqlSession.selectOne("visit.visit_row_total", map);
	}
	
}
