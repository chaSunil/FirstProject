package controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vo.PersonVo;

@Controller
public class ParamTestController {
	
	// RequestMapping이 일어날 때 마다 여기에 request 값에 넣어줘
	// DS에게 RequestMapping에 따른 메소드 호출(invoke)시 request정보를 넣어줘라
	// ParamTestController가 auto-dectecting(자동생성)시에만 Autowire실행된다
	// 단 수동생성시에는 수동생성코드 윗쪽에 아래코드 작성
	// <context:annotation-config/>
	@Autowired // 자동엮기
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ServletContext application;
	
	public ParamTestController() {
		// TODO Auto-generated constructor stub
		System.out.println("--ParamTestController()--");
	}
	
	// /insert1.do?name=홍길동&age=20&tel=010-1234-1234
	@RequestMapping("/insert1.do")
	// parameter명과 수신될 변수명이 틀릴경우
	// 생략(parameter명과 동일한 변수명에 값을 넣어준다)
	public String insert1(@RequestParam(name="name") String irum,
			int age,
			String tel,
			@RequestParam(name="nation", required = false, defaultValue = "한국") String nation,
			Model model) {
		
		// 메소드의 인자 : DispatcherServlet에 대한 요구사항
		
		String ip = request.getRemoteAddr();
		
		// model통한 request binding
		model.addAttribute("name",irum);
		model.addAttribute("age",age);
		model.addAttribute("tel",tel);
		model.addAttribute("nation",nation);
		model.addAttribute("ip",ip);
		
		
		return "result1";
	}
	
	// /insert2.do?name=홍길동&age=20&tel=010-1234-1234
	@RequestMapping("/insert2.do")
	public String insert2(PersonVo vo, Model model) {
		// 각 parameter를 받기 -> Vo생성후 값을 넣어주고->전달
		// 메소드 인자 : DispatcherServlet에 대한 요구사항
		
		// request.binding
		model.addAttribute("vo",vo);
		
		return "result2";
	}
	
	// /insert3.do?name=홍길동&age=20&tel=010-1234-1234
	@RequestMapping("/insert3.do")
	public String insert3(@RequestParam Map map, Model model, HttpServletRequest request) {
		
		String ip = request.getRemoteAddr();
		
		model.addAttribute("map",map);
		model.addAttribute("ip",ip);
		
		return "result3";
	}
	
	
	

}