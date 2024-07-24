package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.ItemsDao;
import util.MyCommon;
import util.Paging;
import vo.ItemsVo;

@Controller
public class ItemsController {
	// @RequestMapping에 의해서 Method 호출시 DS가 자동으로 Injection(주입) 시켜준다.
	@Autowired
	HttpServletRequest request;

	@Autowired
	ItemsDao items_dao;

	public ItemsController(ItemsDao items_dao) {
		super();
		this.items_dao = items_dao;
	}

	// paging 처리 안된 거래 데이터가 전체보이는 페이지
	@RequestMapping("/items/list2.do")
	public String list(Model model) {

		List<ItemsVo> list = items_dao.selectList();

		model.addAttribute("list", list);

		return "items/items_list"; // /WEB-INF/views/ + items/items_list + .jsp
	}

	
	 @RequestMapping(value="/items/getlist2.do",produces = "application/json;charset=utf-8")
	 @ResponseBody 
	 public String search_list() {
		 
	 List<ItemsVo> list = items_dao.selectListOption();
	 
	 StringBuilder sb = new StringBuilder("[");
	 
	 for(ItemsVo vo : list) {
		 sb.append("\""); sb.append(vo.getOption_name1()); sb.append("\",");
	 }
	 
	 int index = sb.lastIndexOf(",");
	 
	 String result = sb.toString().substring(0,index)+ "]";
	 
	 //{"result": "%s"}
	 String json = String.format("{\"result\": %s }", result);
	  
	 return json;
	 
	 }
	 

	// /items/category.do?category=방어력
	@RequestMapping("/items/category.do")
	public String category(@RequestParam Map<String, Object> map, Model model) {
		
		System.out.println(map);
		// Category에 해당하는 아이템을 가져온다. 
		List<ItemsVo> list = items_dao.selectList2(map);
		 
		model.addAttribute("list",list);
		 
		return "items/items_list";
	}
	
	
	@RequestMapping("/items/list.do")
	public String list2(@RequestParam(name="page",defaultValue = "1")int page,
			Model model) {
		
		int start = (page-1) * MyCommon.Items.BLOCK_LIST + 1;
		int end = start + MyCommon.Items.BLOCK_LIST -1;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		List<ItemsVo> list = items_dao.selectList(map);
		
		// 전체 게시물 수
		int rowTotal = items_dao.selectRowTotal();
		
		// pageMenu 만들기
		String pageMenu = Paging.getPaging("list.do",
											page,
											rowTotal,
											MyCommon.Items.BLOCK_LIST,
											MyCommon.Items.BLOCK_PAGE);
		
		// request binding
		model.addAttribute("list",list);
		model.addAttribute("pageMenu",pageMenu);
		model.addAttribute("rowTotal",rowTotal);
		
		return "items/items_list";
	}
	
	
	 @RequestMapping(value="/items/getlist.do",produces = "application/json;charset=utf-8")
	 @ResponseBody 
	 public String search_list2() {
		 
	  List<ItemsVo> list = items_dao.selectListOption2();
	 
	 StringBuilder sb = new StringBuilder("[");
	 
	 for(ItemsVo vo : list) {
		 sb.append("\""); sb.append(vo.getItem_name()); sb.append("\",");
	 }
	 
	 int index = sb.lastIndexOf(",");
	 
	 String result = sb.toString().substring(0,index)+ "]";
	 
	 //{"result": "%s"}
	 String json = String.format("{\"result\": %s }", result);
	  
	 return json; 
		/*
		 * List<ItemsVo> list = items_dao.selectListOption2();
		 * 
		 * StringBuilder sb = new StringBuilder("[");
		 * 
		 * for(ItemsVo vo : list) { sb.append("{");
		 * sb.append("\"label\":\"").append(vo.getItem_name()).append("\",");
		 * sb.append("\"value\":\"").append(vo.getItem_name()).append("\",");
		 * sb.append("\"imageUrl\":\"").append(vo.getItem_image()).append("\"");
		 * sb.append("},"); }
		 * 
		 * if(sb.length() > 1) { sb.setLength(sb.length()-1); }
		 * 
		 * sb.append("]");
		 * 
		 * String json = String.format("{\"result\": %s }", sb.toString());
		 * 
		 * return json;
		 */
	 }
	 
	 
		
		
		@RequestMapping("/items/list3.do")
		public String list3(@RequestParam(name="page",defaultValue = "1")int page,
				Model model) {
			
			int start = (page-1) * MyCommon.Items.BLOCK_LIST + 1;
			int end = start + MyCommon.Items.BLOCK_LIST -1;
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			
			List<ItemsVo> list = items_dao.selectList(map);
			
			// 전체 게시물 수
			int rowTotal = items_dao.selectRowTotal();
			
			// pageMenu 만들기
			String pageMenu = Paging.getPaging("list.do",
												page,
												rowTotal,
												MyCommon.Items.BLOCK_LIST,
												MyCommon.Items.BLOCK_PAGE);
			
			// request binding
			model.addAttribute("list",list);
			model.addAttribute("pageMenu",pageMenu);
			model.addAttribute("rowTotal",rowTotal);
			
			return "items/items_list";
		}
	 
	 
	 @RequestMapping("/items/search.do")
	 public String search_list3(String item_name,Model model) {
		 
		 List<ItemsVo> list = items_dao.selectSearch(item_name);
		 
		 model.addAttribute("list",list);
		 
		 return "items/items_list";
	 }
	
	
}
