package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import vo.BidVo;

public class BidDaoImpl implements BidDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<BidVo> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bid.bid_list");
	}

	@Override
	public int sell_insert(BidVo vo2) {
		// TODO Auto-generated method stub
		return sqlSession.insert("bid.bid_insert", vo2);
	}

	@Override
	public List<BidVo> updateIncBiddingPoint(int bidding_point) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bid.bidding_point", bidding_point);
	}
	
	
	// 처음 판매 할 당시에 입찰 까지 추가 하는 기능
	@Override
	public int insert(Map<String, Object> map_insert) {
		
		return sqlSession.insert("bid.auction_insert", map_insert);
		
	}
	
	
	// 처음 입찰자 정보를 넣는 기능
	@Override
	public int update_auction_member(Map<String, Object> map) {
		
		return sqlSession.update("bid.update_auction_member", map);
	}

}
