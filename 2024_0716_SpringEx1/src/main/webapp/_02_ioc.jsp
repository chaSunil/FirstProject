<%@page import="vo.PersonVo"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// Spring이 사용하고 있는 bean의 저장소를 관리하는 객체정보 얻어온다
	WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(application);
	// Java의 모든 객체를 return 할 수 있는 getBean은 Object 타입이다.
			
	// Spring이 생성한 Bean 정보를 얻어오기
	
	// 형식 1
	PersonVo p1 = (PersonVo)wac.getBean("p1");
	
	// 형식 2
	PersonVo p2 = wac.getBean("p2", PersonVo.class);
	

	// EL로 값을 표현하려고 pageScope에 넣어줬다.
	pageContext.setAttribute("p1", p1);
	pageContext.setAttribute("p2", p2);
	
%>

<hr>
	IoC : p1's info
<hr>
이름: ${ p1.name } <br>
나이: ${ p1.age } <br>
주소: ${ p1.addr } <br>

<hr>
	IoC : p2's info
<hr>
이름: ${ p2.name } <br>
나이: ${ p2.age } <br>
주소: ${ p2.addr } <br>