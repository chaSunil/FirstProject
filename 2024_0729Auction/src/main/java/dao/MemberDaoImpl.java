package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import vo.MemberVo;

// MemberDao를 재정의한 객체
public class MemberDaoImpl implements MemberDao{
	
	// mybatis
	@Autowired
	SqlSession sqlSession;  // SqlSessionTemplate의 interface

	// setter injection을 위한 setter 만들기
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 전체조회
	@Override
	public List<MemberVo> selectList() {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList("member.member_list");
	}

	// mem_idx에 해당되는 1건의 정보 얻어오기
	public MemberVo selectOne(int mem_idx) {

		return sqlSession.selectOne("member.member_one_idx", mem_idx);
	}
	
	
	// mem_id 에 해당되는 1건의 정보 얻어오기
	public MemberVo selectOne(String mem_id) {

		return sqlSession.selectOne("member.member_one_id", mem_id);
	}

	public int insert(MemberVo vo) {
		
		return sqlSession.insert("member.member_insert", vo);

	}//end:insert()

	public int delete(int mem_idx) {
		
		return sqlSession.delete("member.member_delete", mem_idx);

	}//end:delete()

	public int update(MemberVo vo) {
		
		return sqlSession.update("member.member_update", vo);

	}//end:update()

	
	// 상품 구매시 포인트 차감 dao
	public int update_point_minus(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		return sqlSession.update("member.member_update_point_minus", map);
	}
	
	// 상품 구매시 포인트 충전 dao
	public int update_point_plus(Map<String, Object> map2) {
		// TODO Auto-generated method stub
		
		return sqlSession.update("member.member_update_point_plus", map2);
	}
	
	// 상품 입찰시 포인트 차감
	public int update_point_minus_auction(Map<String, Object> map3) {
		
		return sqlSession.update("member.update_point_minus_auction", map3);
	}
	
	// 상품 입찰시 포인트 차감
	public int update_point_plus_auction(Map<String, Object> map4) {
		
		return sqlSession.update("member.update_point_plus_auction", map4);
	}
	
	// 경매 최종 정산(minus)
	public int update_point_minus_auction_final(Map<String, Object> map) {
		
		return sqlSession.update("member.update_point_minus_auction_final", map);
	}
	
	
	// 올려준 금액 적용해주기
	public int update_point_plus_final(Map<String, Object> map5) {
		
		return sqlSession.update("member.update_point_plus_final", map5);
	}
	


	
	

}
