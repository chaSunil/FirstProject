package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.DeptDao;
import vo.DeptVo;

@Controller
public class DeptController {
	
	DeptDao dept_dao;
	// 어차피 DeptController는 프로그램 시작시 Singleton이 기본이기에, 기본 생성자 필요없음
	public DeptController(DeptDao dept_dao) {
		super();
		this.dept_dao = dept_dao;
	}
	
	@RequestMapping("/dept/list.do")
	public String list(Model model) {
		
		List<DeptVo> list = dept_dao.selectList();
		
		model.addAttribute("list",list);
		
		return "dept/dept_list"; // /WEB-INF/views/ + dept_list + .jsp
	}
}