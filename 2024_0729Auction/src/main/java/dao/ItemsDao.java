package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.AuctionVo;
import vo.ItemsVo;

public class ItemsDao {

	SqlSession sqlSession;
	
	public ItemsDao(SqlSession sqlSession) {
		
		super();
		this.sqlSession = sqlSession;
	}
	
	
	public List<ItemsVo> selectList() {
		
		return sqlSession.selectList("items.items_list");
	}
	
	public List<ItemsVo> selectList2(Map<String, Object> map) {
		
		return sqlSession.selectList("items.items_list2",map);
	}
	
	public List<ItemsVo> selectListOption() {
		
		return sqlSession.selectList("items.items_list_option");
	}
	
	public int selectRowTotal() {
		
		return sqlSession.selectOne("items.items_row_total");
	}
	
	public int selectRowTotalSearch(String item_name) {
		
		return sqlSession.selectOne("items.items_row_total_item_name",item_name);
	}
	
	public List<ItemsVo> selectList(Map<String, Object> map) {
		
		return sqlSession.selectList("items.items_list_page",map);
	}
	
	public List<ItemsVo> selectListOption2() {
		
		return sqlSession.selectList("items.items_list_option2");
	}
	
	
	public List<ItemsVo> selectSearch(String item_name) {
		
		return sqlSession.selectList("items.items_list_search",item_name);
	}
	
	
	// 판매 아이템 등록시 사용
	public ItemsVo selectOne() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("items.items_selectOne");
	}
	
	
	
	// 검색한 정보 하나만 가져오기
	public ItemsVo selectOneSellSearch(String item_name) {
		
		return sqlSession.selectOne("items.search_sell_search",item_name);
	}

	// 판매등록하기
	public int sell_insert(ItemsVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("items.sell_insert",vo);
	}


	public ItemsVo selectOne_gumae(int item_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("items.select_gumae", item_idx);
	}
	
	public ItemsVo selectOne_gumae_info(int a_idx) {
		
		return sqlSession.selectOne("items.select_gumae_info", a_idx);
	}
	
	public int updateGumae(int item_idx) {
		
		return sqlSession.update("items.update_gumae", item_idx);
	}
	
	
	public ItemsVo selectOne(int item_idx) {
		
		return sqlSession.selectOne("items.selectone_item_idx", item_idx);
	}
	
	public int update_auction_end(int a_idx) {
		
		return sqlSession.update("items.update_auction_end", a_idx);
	}


	public ItemsVo selectOne_auction_end(int a_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("items.selectOne_auction_end", a_idx);
	}
	
	
	public int update_expired_auctions() {
		
		return sqlSession.update("items.update_expired_auctions");
	}
	
	
	
	
	// AuctionService 객체 매순간 5초씩 경매 시간이 종료되었는지 확인해주는 로직
	public List<ItemsVo> findActiveAuction() {
		
		return sqlSession.selectList("items.findActiveAuction");
	}
	
	// 현재시간이 마감시간을 넘어선 객체를 거래종료 시켜준다.
	public int update_auction_service_end(int a_idx) {
		
		return sqlSession.update("items.update_auction_service_end", a_idx);
	}
	
	// 구매현황 확인
	public List<ItemsVo> my_buy_list(String mem_name) {
		
		return sqlSession.selectList("items.my_buy_list",mem_name);
	}
	
	

	
}