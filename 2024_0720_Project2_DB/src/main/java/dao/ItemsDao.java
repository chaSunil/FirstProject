package dao;

import java.util.List;
import java.util.Map;

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
	
	public List<ItemsVo> selectList2(Map<String, Object> map) {
		
		return sqlSession.selectList("items.items_list2",map);
	}
	
	public List<ItemsVo> selectListOption() {
		
		return sqlSession.selectList("items.items_list_option");
	}
	
}
