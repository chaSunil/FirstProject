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
	부서별 사원목록
<hr>
<ul>
	<!-- for(DeptVo dept : list) -->
	<c:forEach var="dept" items="${ requestScope.list }">
		<li>
			${ dept.deptno } : ${ dept.dname }
			<ul>
				<!-- for(SawonVo sawon : dept.sa_list) -->
				<c:forEach var="sawon" items="${ dept.sa_list }">
					<li>${ sawon.sabun } : ${ sawon.deptno } : ${ sawon.saname }</li>
				</c:forEach>
			</ul>
		</li>
	</c:forEach>
</ul>

</body>
</html>