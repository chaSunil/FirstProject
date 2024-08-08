package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	HttpSession session;
	
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
		
		
		// 거래 시간이 마감되면, 거래 자동 종료
		// AuctionService에서 항상 경매가 종료되었는지 check해주는 로직
		//int res = items_dao.update_expired_auctions();
		
		
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
		
		//MemberVo user = (MemberVo) session.getAttribute("user");
		
		MemberVo user = member_dao.selectOne(mem_id);
		
		if(mem_id == "") {
			
			return "items/items_list";
		}
		
		session.setAttribute("user", user);

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
	
	
	
	
	
	// 판매 등록하기(판매등록)
	@RequestMapping("/items/sell_reg_data.do")
	public String sell_reg_data(ItemsVo vo1, AuctionVo vo2,
			int mem_idx, String mem_name, int mem_point) {
		
		
		// 판매할 아이템 등록하기
		int res1 = items_dao.sell_insert(vo1);
		
		// 방금 올린 item 정보 가져오기
		ItemsVo vo3 = items_dao.selectOne();
	
		// 방금 올린 아이템 + 올린 회원 정보 기입하기
		int item_idx = vo3.getItem_idx(); 
		vo2.setItem_idx(item_idx);
		vo2.setMem_idx(mem_idx);
		vo2.setMem_name(mem_name);
		vo2.setMem_point(mem_point);
		int res2 = auction_dao.sell_insert(vo2);
		
		int a_initial_price = vo2.getA_initial_price();
		
		
		
		// 판매등록시 즉시구매와 더불어 입찰까지 새로 생성하기
		Map<String, Object> map_insert = new HashMap<String, Object>();
		map_insert.put("a_initial_price", a_initial_price);
		map_insert.put("item_idx", item_idx);
		
		int res3 = bid_dao.insert(map_insert);
		
		
		// 기준 시간에 따라서 endtime 시간 정해놓기(거래 마감 시간)
		ItemsVo vo4 = items_dao.selectOne(item_idx);
		
		int a_idx = vo4.getA_idx();
		int res4 = auction_dao.updateEndTime(a_idx);
		
		 	
		return "redirect:list.do";
	}

	

	
	
	
	@RequestMapping("/items/reg_timer.do")
	public String reg_timer(ItemsVo vo) {
		
		
		
		return "redirect:list.do";
	}
	
	@RequestMapping("/items/dpcoin.do")
	public String dpcoin(String mem_id) {
		
		MemberVo user = member_dao.selectOne(mem_id);
		
		session.setAttribute("user", user);
		
		return "/charge_page/charge_page";
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
			int panmae_mem_idx, int gumae_mem_idx, int a_direct_price, int a_idx,
			RedirectAttributes ra) {
		
		
		// 구매가능한 금액이 부족하다면
		if(mem_point < a_direct_price) {
			
			ra.addAttribute("reason", "fail_gumae");
			
			return "redirect:../items/gumae.do?item_idx=" + item_idx + "&a_idx=" + a_idx;
			
			// return "redirect:gumae.do?reason=fail_gumae
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
		int res4 = member_dao.update_point_plus(map2);
		
		
		return "redirect:list.do";
	}
	
	
	
	
	// 옥션에 참가하면 실행되는 로직
	@RequestMapping("items/auction_check.do")
	public String auction_check(int bidding_point, int a_idx, int item_idx,
			int gumae_mem_idx, int mem_point, RedirectAttributes ra,
			int a_initial_price, int auction_mem_idx, String gumae_mem_name) {
		
		if(mem_point < bidding_point) {
				
			ra.addAttribute("reason", "fail_auction");
			
			return "redirect:../items/gumae.do?item_idx=" + item_idx + "&a_idx=" + a_idx;
			
			// return "redirect:gumae.do?reason=fail_auction
		}
		
		// 입찰자가 최초인경우
		if(Integer.toString(auction_mem_idx) == null) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("item_idx", item_idx);
			map.put("gumae_mem_idx", gumae_mem_idx);
			map.put("gumae_mem_name", gumae_mem_name);
			map.put("bidding_point", bidding_point);
			
			// 해당 item_idx를 찾아와서 구매자 idx와 입찰액을 넣는다.
			int res = bid_dao.update_auction_member(map);
			// 입찰액과 판매 입찰액을 동일시 만들어준다.
			a_initial_price = bidding_point;
			
			
			// 입찰액 갱신
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("item_idx", item_idx);
			map2.put("a_initial_price", a_initial_price);
			
			int res2 = auction_dao.updatePrice(map2);
			
			
			// 입찰한 입찰자 입찰금액 마이너스
			Map<String, Object> map3 = new HashMap<String, Object>();
			map3.put("bidding_point", bidding_point);
			map3.put("gumae_mem_idx", gumae_mem_idx);
			
			int res3 = member_dao.update_point_minus_auction(map3);
			
			
			return "redirect:../items/gumae.do?item_idx=" + item_idx + "&a_idx=" + a_idx;
		} else {
			
			
			// 입찰한 입찰자 입찰금액 마이너스
			Map<String, Object> map3 = new HashMap<String, Object>();
			map3.put("bidding_point", bidding_point);
			map3.put("gumae_mem_idx", gumae_mem_idx);
			
			
			int res3 = member_dao.update_point_minus_auction(map3);
			
			
			
			// 입찰취소 금액 입금
			Map<String, Object> map4 = new HashMap<String, Object>();
			map4.put("a_initial_price", a_initial_price);
			map4.put("auction_mem_idx", auction_mem_idx);
			
			
			
			int res4 = member_dao.update_point_plus_auction(map4);
			
			
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("item_idx", item_idx);
			map.put("gumae_mem_idx", gumae_mem_idx);
			map.put("bidding_point", bidding_point);
			map.put("gumae_mem_name", gumae_mem_name);
			
			
			// 해당 item_idx를 찾아와서 구매자 idx와 입찰액을 넣는다.
			int res = bid_dao.update_auction_member(map);
			// 입찰액과 판매 입찰액을 동일시 만들어준다.
			a_initial_price = bidding_point;
			
			
			// 입찰액 갱신
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("item_idx", item_idx);
			map2.put("a_initial_price", a_initial_price);
			
			int res2 = auction_dao.updatePrice(map2);
			
			
			return "redirect:../items/gumae.do?item_idx=" + item_idx + "&a_idx=" + a_idx;
			
		}
		
	}
		
	
	
	
	
	
	
	
	
	// 경매 낙찰 완료 / 실행될 Mapping 루트 없지만, 이렇게 사용하기에 기록
	@RequestMapping("items/auction_check_check")
	public String gumae_check(int mem_point, int item_idx,
			int panmae_mem_idx, int gumae_mem_idx, int a_direct_price, int a_idx,
			RedirectAttributes ra, int a_initial_price) {
		
		
		// 경매를 어떻게 끝내게 할 것인가??
		// sysdate == a_endtime -> a_sledding을 n으로 표시
		int res5 = items_dao.update_auction_end(a_idx);
		
		ItemsVo vo = items_dao.selectOne_auction_end(a_idx);
		
		
		// 만약에 위의 과정으로 거래처리가 완료되어 있다면,
		if(vo.getB_sledding() == "n"); {
			
			
			// 구매자한테 구매금액 차감
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("a_initial_price", a_initial_price);
			map.put("gumae_mem_idx", gumae_mem_idx);
			
			
			// 판매자한테 낙찰금액 입금
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("a_initial_price", a_initial_price);
			map2.put("panmae_mem_idx", panmae_mem_idx);
			
			
			// 구매를 성공했을때 a_sledding을 n으로 표시해줘서 구매완료했다고 표시
			int res = auction_dao.updateGumae(item_idx);
			
			// 구매 완료시 member_point 가격 그대로 차감하기
			int res3 = member_dao.update_point_minus_auction_final(map);
			
			// 구매 완료시 member_point 가격 그대로 올려주기
			int res4 = member_dao.update_point_plus_final(map2);
			
			
			return "redirect:list.do";
		}
		
	
	}	
		
		
		
		
		

	
	
	
	
	
	
}