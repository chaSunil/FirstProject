package dao;

import java.util.List;

import vo.BidVo;

public interface BidDao {
	
	List<BidVo> selectList();

	int sell_insert(BidVo vo2);

	List<BidVo> updateIncBiddingPoint(int bidding_point);
}
