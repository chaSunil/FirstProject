package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class TestController {

	public TestController() {
		System.out.println("--TestController()--");
	}
	
	// view 넘겨주기
	@RequestMapping("/test.do")
	public String test() {
		
		return "test"; // viewName : /WEB-INF/views/ + test + .jsp
	}
	
	// response Data 넘겨주기
	@RequestMapping(value="/hello.do", produces="text/html;charset=utf-8;")
	@ResponseBody // return값이 응답데이터
	public String hello() {
		
		return "hello: 안녕하십니까 ㅋㅋ";
	}
	
	// requestData 넘겨주기
	@RequestMapping("/hi.do")
	public String hi(Model model) {
		
		String msg = "Hi~Everyone!!!";
		
		// model을 통해서 전달된 DispatcherServlet에게 전달
		// DS는 request binding or parameter 사용
		// return값이 뷰면     : request binding
		// return값이 redirect : parameter로 사용(5.0이전 지원)
		model.addAttribute("msg",msg);
		
		return "hi";
	}
	
	// requestData + view 넘겨주기
	@RequestMapping("/bye.do")
	public ModelAndView bye() {
		
		String msg = "GoodBye!!";
		
		// Data + View
		ModelAndView mv = new ModelAndView();
		
		// DS는 전달된 데이터를 request.binding
		mv.addObject("msg", msg);
		
		// DS는 전달된 view정보를 완성시키기 위해서 ViewResolver에게 작업지시
		mv.setViewName("bye"); // /WEB-INF/views/ + bye + .jsp
		
		return mv;
	}
	
	// Redirect하여 parameter값 넘겨주기
	@RequestMapping("/hi2.do")
	public String hi2(RedirectAttributes ra) {
		
		String name = "Tom";
		ra.addAttribute("name",name);
		
		return "redirect:test.do";
	}
	
	
	
	
	
}