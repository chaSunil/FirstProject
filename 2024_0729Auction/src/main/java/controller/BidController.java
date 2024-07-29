package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.BidDao;
import vo.BidVo;

@Controller
public class BidController {
	
	@Autowired
	BidDao bid_dao;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	// 입찰 등록하기
	@RequestMapping("/items/bid_reg_data.do")
	public String bid_reg_data(int bidding_point, Model model) {
		
		List<BidVo> list = bid_dao.updateIncBiddingPoint(bidding_point);
		
		//request binding
		model.addAttribute("list", list);
		

		return "redirect:bid_reg_form.do";
	}
	
}
