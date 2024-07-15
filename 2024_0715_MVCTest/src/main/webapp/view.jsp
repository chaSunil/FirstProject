<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<hr>
	<h3>${ requestScope.book }에 대한 정보를 알려드리겠습니다.</h3>
<hr>
${ description }
<br>
<a href="list.do">다시해보기</a>
</body>
</html>