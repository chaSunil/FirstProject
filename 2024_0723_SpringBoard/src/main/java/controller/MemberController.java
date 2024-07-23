package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.MemberDao;
import vo.MemberVo;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	// 자동연결
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	// 처음에 1회 연결
	@Autowired
	MemberDao member_dao;

	public MemberController() {
		// TODO Auto-generated constructor stub
		System.out.println("--MemberController()--");
		
	}
	
	// class RequestMapping + method RequestMapping => /member/login_form.do
	@RequestMapping("login_form.do")
	public String login_form() {
		
		return "member/member_login_form";
	}
	
	// /member/login.do?mem_id=one&mem_pwd=1234
	@RequestMapping("login.do")
	public String login(String mem_id, String mem_pwd, RedirectAttributes ra) {
		
		MemberVo user = member_dao.selectOne(mem_id);
		
		// 로그인한 유저 정보가 없으면,
		if(user==null) {
			
			// RedirectAttributes에 redirect할 때 넘어가야할 정보를 알려주면
			// parameter로 이용된다.
			ra.addFlashAttribute("reason","fail_id");
			
			// return "redirect:login_from.do?reason=fail_id";
			return "redirect:login_from.do";
		}
		
		// 비밀번호가 틀린 경우
		if(user.getMem_pwd().equals(mem_pwd)==false) {
			//response.sendRedirect("login_form.do?reason=fail_pwd&mem_id=" + mem_id);
			ra.addAttribute("reason","fail_pwd");
			ra.addAttribute("mem_id",mem_id);
			
			return "redirect:login_form.do";
		}
		
		// 로그인 처리: 현재 로그인 객체(user)정보를 session 저장
		session.setAttribute("user", user);
		
		return "redirect:../photo/list.do";
	}
	
	
	// 로그아웃
	@RequestMapping("logout.do")
	public String logout() {
		
		session.removeAttribute("user");
		
		return "redirect:../photo/list.do";
	}
	
	@RequestMapping("modify_form.do")
	public String modify_form(int mem_idx, Model model) {
		
		MemberVo vo = member_dao.selectOne(mem_idx);
		
		model.addAttribute("vo", vo);
		
		return "member/member_modify_form";
	}
	
	@RequestMapping("modify.do")
	public String modify(int mem_idx, String mem_name, String mem_id, String mem_pwd, String mem_zipcode,
			String mem_addr, String mem_grade) {
		
		MemberVo vo = new  MemberVo(mem_idx, mem_name, mem_id, mem_pwd, mem_zipcode, mem_addr, mem_grade);
		
		member_dao.update(vo);
		
		String mem_ip = request.getRemoteAddr();
		
		vo.setMem_ip(mem_ip);
		
		session = request.getSession();
		MemberVo loginUser = (MemberVo) session.getAttribute("user");
		
		if(loginUser.getMem_idx()==mem_idx) {
			
			// 로그인상태정보
			MemberVo user = member_dao.selectOne(mem_idx);
			
			// session.removeAttribute("user"); 불필요한 작업
			// scope내에 저장방식 Map형식: key / value
			//						  동일한 key로 저장하면 수정처리된다
			session.setAttribute("user", user);
		}
		
		return "redirect:list.do";
	}
	
	@RequestMapping("insert_form.do")
	public String insert_form() {
		
		return "member/member_insert_form";
	}
	
	@RequestMapping("insert.do")
	public String insert(String mem_name, String mem_id, String mem_pwd, String mem_zipcode,
			String mem_addr) {
		
		String mem_ip = request.getRemoteAddr();
		
		MemberVo vo = new MemberVo(mem_name, mem_id, mem_pwd, mem_zipcode, mem_addr, mem_ip);
		
		member_dao.insert(vo);
		
		return "redirect:../photo/list.do";
	}
	
	@RequestMapping(value="check_id.do",produces = "application/json;charset=utf-8;")
	@ResponseBody
	public String check_id(String mem_id, MemberVo vo) {
		
		vo = member_dao.selectOne(mem_id);
		
		boolean bResult = (vo==null);
		
		String json = String.format("{\"result\":%b}", bResult);
		
		return json.toString();
	}
	
	@RequestMapping("list.do")
	public String list(Model model) {
		
		List<MemberVo> list = member_dao.selectList();
		
		model.addAttribute("list",list);
		
		return "member/member_list";
	}
	
	
	
	
	
}