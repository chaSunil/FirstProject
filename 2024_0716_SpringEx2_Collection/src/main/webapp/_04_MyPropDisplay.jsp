<%@page import="java.util.Properties"%>
<%@page import="myutil.MyProp"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(application);
	
	MyProp myProp = wac.getBean("myPropBean", MyProp.class);
	
	Properties dbProp = myProp.getDbProp();
	
	pageContext.setAttribute("dbProp", dbProp);
%>

<hr>
	Properties 클래스
<hr>
<ul>
	<c:forEach var="prop" items="${ dbProp }">
		<li>${ prop }</li>
	</c:forEach>
</ul>