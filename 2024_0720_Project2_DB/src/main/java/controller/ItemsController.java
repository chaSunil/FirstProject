package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.ItemsDao;
import vo.ItemsVo;


@Controller
public class ItemsController {
	
	ItemsDao items_dao;
	
	public ItemsController(ItemsDao items_dao) {
		super();
		this.items_dao = items_dao;
	}
	
	@RequestMapping("/items/list.do")
	public String list(Model model) {
		
		List<ItemsVo> list = items_dao.selectList();
		
		model.addAttribute("list",list);
		
		return "items/items_list"; // /WEB-INF/views/ + items/items_list + .jsp
	}

}
