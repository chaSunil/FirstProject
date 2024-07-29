package dao;

import java.util.List;

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


	@Override
	public int sell_insert(AuctionVo vo2) {
		// TODO Auto-generated method stub
		return sqlSession.insert("auction.auction_insert",vo2);
	}

}
