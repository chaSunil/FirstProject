<%@page import="java.util.Set"%>
<%@page import="myutil.MySet"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(application);

	MySet mySet = wac.getBean("mySetBean", MySet.class);
	
	Set fruit_set = mySet.getFruit_set();
	
	pageContext.setAttribute("fruit_set", fruit_set);
%>

<hr>
	과일목록
<hr>
<ul>
	<c:forEach var="fruit" items="${ fruit_set }">
		<li>${ fruit }</li>
	</c:forEach>
</ul>