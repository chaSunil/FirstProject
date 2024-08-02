package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import vo.AuctionVo;

public class AuctionDaoImpl implements AuctionDao {
	
	@Autowired
	SqlSession sqlSession;
	
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}


	@Override
	public List<AuctionVo> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("auction.auction_list");
	}


	// 판매등록하기
	@Override
	public int sell_insert(AuctionVo vo2) {
		// TODO Auto-generated method stub
		return sqlSession.insert("auction.auction_insert",vo2);
	}


	@Override
	public int updateGumae(int item_idx) {
		
		return sqlSession.update("auction.update_gumae", item_idx);
	}
	
	public int updatePrice(Map<String, Object> map2) {
		
		return sqlSession.update("auction.update_price", map2);
	}
	
	public int updateEndTime(int a_idx) {
		
		return sqlSession.update("auction.update_endtime", a_idx);
	}
	
	
	// 경매 최종 정산(plus)
	public int update_point_plus_auction_final(Map<String, Object> map2) {
		
		return sqlSession.update("auction.update_point_plus_auction_final", map2);
	}
	

}
