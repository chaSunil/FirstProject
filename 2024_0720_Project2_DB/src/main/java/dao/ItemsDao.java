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
	
	public int selectRowTotal() {
		
		return sqlSession.selectOne("items.items_row_total");
	}
	
	public List<ItemsVo> selectList(Map<String, Object> map) {
		
		return sqlSession.selectList("items.items_list_page",map);
	}
	
	public List<ItemsVo> selectListOption2() {
		
		return sqlSession.selectList("items.items_list_option2");
	}
	
	public List<ItemsVo> selectSearch(String item_name) {
		
		return sqlSession.selectList("items.items_list_search",item_name);
	}
	
}
