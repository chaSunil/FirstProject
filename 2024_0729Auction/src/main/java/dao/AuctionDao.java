package dao;

import java.util.List;
import java.util.Map;

import vo.AuctionVo;
import vo.ItemsVo;

public interface AuctionDao {
	
	List<AuctionVo> selectList();

	int sell_insert(AuctionVo vo2);
	
	int updateGumae(int item_idx);
	
	int updatePrice(Map<String, Object> map2);

	int updateEndTime(int a_idx);
	
}
