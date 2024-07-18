package controller;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import annotation.RequestMapping;
import annotation.ResponseBody;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontController
 */
//@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//Object ob = null;
	List<Method> method_list = new ArrayList<Method>();
	List<Object> object_list = new ArrayList<Object>();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		
		
		// xml param-name의 action을 읽어온다.
		String action = config.getInitParameter("action").trim();
		
		// 여러개의 param-value를 넣을 수 있으니 ","를 기준으로 값을 가져온다.
		String [] action_array = action.split(",");
		
		// 여러개의 param-value가 있을 수 있으니, 그것을 배열로 가져온다.
		for(String action_name : action_array) {
			try {
				
				// 엔터 없애기, 공백 없애기 순수한 param-value를 가져온다.
				action_name = action_name.replaceAll("\r", "").replaceAll("\n", "").trim();
				// System.out.println(action_name);
				
				// Java Reflection : 클래스명이 변수일 때는 객체를 생성하는 방법으로 reflection
				// action_name = "action.controller.TestAction"
				Class c = Class.forName(action_name);
				Object ob = c.newInstance(); // new action.controller.TestAction()
				// 위에 있는 것을 사용하는 이유는 new "action.controller.TestAction" 이라는게 안되기 때문이다.
				
				
				// 해당 클래스 내에 메소드 목록을 수집한다. public String list(..) {}
				Method [] method_array = c.getDeclaredMethods();
				
				for(Method method : method_array) {
					method_list.add(method); // TestAction TestAction TestAction2
					object_list.add(ob);	 // list       view       hello
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// /list.do
		
		// URI Pattern
		// uri = "/2024_0717_MVCFFramwork/list.do"
		String uri = request.getRequestURI();
		
		String forward_page="";
		boolean bResponseBody=false;
		String contentType="";
		
		
		// method 목록을 반목문을 돌린다 (method_list -> list, view, hello)
		for(Method method : method_list) {	
		
			// 이 메소드에 Annotation이 붙어있는데 RequestMapping이 붙어있니?? @RequestMapping("/view.do")
			if(method.isAnnotationPresent(RequestMapping.class)) {
				// Annotation은 프로그램에 표시를 해놓은것 (기계가 찾아갈 수 있도록)
				// RequestMapping은 annotation package에 임의로 만들어놓은 것임.
				
				RequestMapping annotation = method.getAnnotation(RequestMapping.class);
				// Annotation의 value 값은 value="/list.do"
				// 이 value 값이 uri에 있는 값과 contains 동일한게 있니? (/list.do는 uri에 포함된다)
				if(uri.contains(((RequestMapping)annotation).value())){
					
					try {
						
						// contains로 포함이 되어있으면, 이 아래에 값들을 호출한다.
						// 배열중에 해당 method가 몇번째 인덱스인가? [0]
						int index = method_list.indexOf(method);
						// [0]번의 객체 정보를 가져온다.
						Object ob = object_list.get(index);
						// [0]번의 method를 invoke 호출한다.
						// invoke는 메소드를 직접적으로 호출한다. (ob_객체, request_param1, response_param2)
						forward_page = (String) method.invoke(ob, request, response);						
						
						
						// Annotation에서 ResponseBody가 있는지 체크
						if(method.isAnnotationPresent(ResponseBody.class)) {
							
							// contentType = produces="application/json:charset=utf-8"
							// RequestMapping에 있는 produces의 값을 contentType에 넣는다.
							contentType = ((RequestMapping)annotation).produces();
							// 응답할 수 있게 true로 변환한다.
							bResponseBody = true;
						}
						// 이상없이 list.do가 들어오면 여기서 멈춘다.
						break;
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			
			
		}// end:for
		
		
		// response로 ResponseBody라는 Annotation을 사용하고 있으면, 바로 response로 받아온다.
		// forward or redirect
		if(forward_page.isEmpty())return;
		
		// ResponseBody 데이터 처리
		if(bResponseBody) {
			// contentType : produces="application/json:charset=utf-8"
			response.setContentType(contentType);
			// JSON Data 생성 전송 : {"result":true}
			response.getWriter().print(forward_page);
			
			return;
		}
		
		// redirect:이 forward_page에 포함되어 있냐?
		// if(foward_page.startsWith("redirect:") ==
		if(forward_page.contains("redirect:")) {
			
			// redirect: 제거하고 순수한 경로만 추출한다
			String redirect_page = forward_page.replaceAll("redirect:", "");
			response.sendRedirect(redirect_page);
		
		// redirect: 라는게 없으면, forward로 Dispatcher 방식으로 처리한다.
		}else {
			//forward
			RequestDispatcher disp = request.getRequestDispatcher(forward_page);
			disp.forward(request, response);
		}
				
	}
		
}