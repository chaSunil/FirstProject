package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.AuctionDao;
import dao.BidDao;
import dao.ItemsDao;
import dao.MemberDao;
import util.MyCommon;
import util.Paging;
import vo.AuctionVo;
import vo.ItemsVo;
import vo.MemberVo;

@Controller
public class ItemsController {
	// @RequestMapping에 의해서 Method 호출시 DS가 자동으로 Injection(주입) 시켜준다.
	@Autowired
	HttpServletRequest request;

	@Autowired
	ItemsDao items_dao;
	
	@Autowired
	HttpSession sesion;
	
	@Autowired
	AuctionDao auction_dao;
	
	@Autowired
	BidDao bid_dao;
	
	@Autowired
	MemberDao member_dao;
	
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
		
		//System.out.println(map);
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
	
	
	 /* @RequestMapping(value="/items/getlist2.do",produces = "application/json;charset=utf-8")
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
	 
	 } */
	
	
	 @RequestMapping(value="/items/getlist.do",produces = "application/json;charset=utf-8")
	 @ResponseBody 
	 public String search_list2() {
		 
	  List<ItemsVo> list = items_dao.selectListOption2();
	 
		/*
		 JSONObject json = new JSONObject();
		 
		 for(ItemsVo vo : list) {
			 json.put("item_name", vo.getItem_name());
			 //json.put("item_image", vo.getItem_image()); 
		 }
		 
		 return json.toString(); */
		 
		
		  //List<ItemsVo> list = items_dao.selectListOption2();
		  
		 
		  StringBuilder sb = new StringBuilder("[");
		  
		  for(ItemsVo vo : list) { sb.append("{");
		  sb.append("\"label\":\"").append(vo.getItem_name()).append("\",");
		  sb.append("\"value\":\"").append(vo.getItem_name()).append("\",");
		  sb.append("\"icon\":\"").append(vo.getItem_image()).append("\",");
		  sb.append("\"type\":\"").append(vo.getItem_type()).append("\"");
		  sb.append("},"); }
		  
		  if(sb.length() > 1) { sb.setLength(sb.length()-1); }
		  
		  sb.append("]");
		  
		  String json = String.format("{\"result\": %s }", sb.toString());
		  
		  //System.out.println(json);
		  
		  return json;
		 
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
		 
		 int rowTotal = items_dao.selectRowTotalSearch(item_name);
		 
		 model.addAttribute("list",list);
		 model.addAttribute("rowTotal",rowTotal);
		 
		 return "items/items_list";
	 }
	 
	 
	 
	// 판매 form
	@RequestMapping("/items/sell_reg.do")
	public String sell_form(String mem_id) {
		
		//MemberVo user = member_dao.selectOne(mem_id);
		
		if(mem_id == "") {
			
			return "items/items_list";
		}

		return "sell/sell_reg"; // /WEB-INF/views/ + items/items_list + .jsp
	}
	
	
	// 판매 아이템 검색 자동완성
	 @RequestMapping(value="/items/get_item.do",produces = "application/json;charset=utf-8")
	 @ResponseBody 
	 public String sell_search_list() {
		 
	  List<ItemsVo> list = items_dao.selectListOption2();
		  
		  StringBuilder sb = new StringBuilder("[");
		  
		  for(ItemsVo vo : list) { sb.append("{");
		  sb.append("\"label\":\"").append(vo.getItem_name()).append("\",");
		  sb.append("\"value\":\"").append(vo.getItem_name()).append("\",");
		  sb.append("\"icon\":\"").append(vo.getItem_image()).append("\",");
		  sb.append("\"type\":\"").append(vo.getItem_type()).append("\"");
		  sb.append("},"); }
		  
		  if(sb.length() > 1) { sb.setLength(sb.length()-1); }
		  
		  sb.append("]");
		  
		  String json = String.format("{\"result\": %s }", sb.toString());
		  
		  //System.out.println(json);
		  
		  return json;
		 
	 }
	 
	 // 판매 아이템 검색시 실행
	@RequestMapping("/items/sell_reg_search.do")
	public String sell_search_item(String item_name, Model model) {
		
		ItemsVo vo = items_dao.selectOneSellSearch(item_name);
		
		model.addAttribute("vo", vo);
		
		return "sell/sell_reg";
	}
	
	
	
	
	
	// 판매 등록하기
	@RequestMapping("/items/sell_reg_data.do")
	public String sell_reg_data(ItemsVo vo1, AuctionVo vo2) {
		
		int res1 = items_dao.sell_insert(vo1);
		
		ItemsVo vo3 = items_dao.selectOne();
	
		int item_idx = vo3.getItem_idx(); 
		vo2.setItem_idx(item_idx);
		  
		int res2 = auction_dao.sell_insert(vo2);
		 	
		return "redirect:list.do";
	}

	

	
	
	
	@RequestMapping("/items/reg_timer.do")
	public String reg_timer(ItemsVo vo) {
		
		
		
		return "redirect:list.do";
	}
	
	@RequestMapping("/items/dpcoin.do")
	public String dpcoin() {
		
		return "/items/dpcoin";
	}
	
	
	// 구매 화면으로 들어가기
	@RequestMapping("items/gumae.do")
	public String gumae(int item_idx, int a_idx , Model model) {
		
		// 자세히보기 -> 해당 판매 번호로 넘어가게 하기
		ItemsVo items = items_dao.selectOne_gumae(item_idx);
		
		model.addAttribute("items",items);
		
		return "/items/gumae";
	}
	
	
	@RequestMapping("items/gumae_check")
	public String gumae_check(int mem_point, int item_idx,
			int panmae_mem_idx, int gumae_mem_idx, int a_direct_price) {
		
		
		// 구매가능한 금액이 부족하다면
		if(mem_point < a_direct_price) {
			
			return "/items/gumae";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("a_direct_price", a_direct_price);
		map.put("gumae_mem_idx", gumae_mem_idx);
		
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("a_direct_price", a_direct_price);
		map2.put("panmae_mem_idx", panmae_mem_idx);
		
		
		// 구매를 성공했을때 a_sledding을 n으로 표시해줘서 구매완료했다고 표시
		int res = auction_dao.updateGumae(item_idx);
		
		// 구매 완료시 member_point 가격 그대로 차감하기
		int res3 = member_dao.update_point_minus(map);
		
		// 구매 완료시 member_point 가격 그대로 올려주기
		int res4 = member_dao.update_point_minus(map2);
		
		
		return "redirect:list.do";
	}
	
	
	
	
	
	
	
	
}