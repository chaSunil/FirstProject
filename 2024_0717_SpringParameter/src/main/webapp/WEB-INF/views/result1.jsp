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
낱개로 받기 결과
<hr>
이름 : ${ requestScope.name }<br>
나이 : ${ requestScope.age }<br>
전화 : ${ param.tel }<br>
국적 : ${ nation }<br>
전달 : ${ ip }<br>
<a href="input.html">다시하기</a>
</body>
</html>