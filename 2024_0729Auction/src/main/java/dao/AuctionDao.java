package dao;

import java.util.List;

import vo.AuctionVo;
import vo.ItemsVo;

public interface AuctionDao {
	
	List<AuctionVo> selectList();

	int sell_insert(AuctionVo vo2);
	
}
