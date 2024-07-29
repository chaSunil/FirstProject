package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.AuctionDao;
import vo.AuctionVo;

@Controller
public class AuctionController {
	
	@Autowired
	AuctionDao auction_dao;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	// 나의 판매 현황
	@RequestMapping("/items/list4.do")
	public String list(Model model) {
		List<AuctionVo> list = auction_dao.selectList();
		
		model.addAttribute("list", list);
		
		return "items/items_list";
	}
	
	
}
