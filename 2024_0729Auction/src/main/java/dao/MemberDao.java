package dao;

import java.util.List;
import java.util.Map;

import vo.MemberVo;

public interface MemberDao {

	// 전체조회
	List<MemberVo> selectList();
	
	// mem_idx에 해당되는 1건의 정보 얻어오기
	public MemberVo selectOne(int mem_idx);
	
	// mem_id에 해당되는 1건의 정보 얻어오기
	public MemberVo selectOne(String mem_id);

	public int insert(MemberVo vo);

	public int delete(int mem_idx);

	public int update(MemberVo vo);
	
	public int update_point_minus(Map<String, Object> map);
	
	public int update_point_plus(Map<String, Object> map2);
	
	public int update_point_minus_auction(Map<String, Object> map3);
	
	public int update_point_plus_auction(Map<String, Object> map3);
	
	public int update_point_minus_auction_final(Map<String, Object> map);

	int update_point_plus_final(Map<String, Object> map5);
	
}
