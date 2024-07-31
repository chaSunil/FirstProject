package dao;

import java.util.List;
import java.util.Map;

import vo.BidVo;

public interface BidDao {
	
	List<BidVo> selectList();

	int sell_insert(BidVo vo2);

	List<BidVo> updateIncBiddingPoint(int bidding_point);
	
	int insert(Map<String, Object> map_insert);
	
	int update_auction_member(Map<String, Object> map);
}
