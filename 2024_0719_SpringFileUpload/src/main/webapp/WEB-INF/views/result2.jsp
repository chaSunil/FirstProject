<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<hr>
제목 : ${ requestScope.vo.title }
<hr>
<img alt="" src="resources/images/${ vo.filename }" width="200">
</body>
</html>