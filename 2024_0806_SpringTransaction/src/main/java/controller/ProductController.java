package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {

	
	@RequestMapping("/product/list.do")
	public String list(Model model) {
		
		return "product/product_list";
	}
	
}
