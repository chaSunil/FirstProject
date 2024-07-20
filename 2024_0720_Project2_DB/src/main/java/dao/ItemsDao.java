package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

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
	
}
