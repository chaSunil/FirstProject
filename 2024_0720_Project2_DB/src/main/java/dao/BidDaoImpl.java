package dao;

import java.util.List;

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

}
