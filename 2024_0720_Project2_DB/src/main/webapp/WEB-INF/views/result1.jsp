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


어서오라구~
<c:forEach var="items" items="${ requestScope.list }">
<div id="item-box">
			<div id="item-image-box">
			<img src="${ items.item_image }">
			</div>
			<div id="item-box2">
				<span>거래번호 : ${ items.item_idx }</span><br>
				<span>타입 : ${ items.item_type }</span><br>
				<span>아이템이름 : ${ items.item_name }</span><br>
				<span>${ items.item_grade }</span>
				<span>${ items.item_rarity }</span><br>
				<span>${ items.item_im }</span><br>
				<span>${ items.item_shot }</span><br>
			</div>
			<div id="item-box3">
				<div id="gibon_option">
				<span>${ items.gibon_option1_name } ${ items.gibon_option1_val }</span><br>
				<span>${ items.gibon_option2_name } ${ items.gibon_option2_val }</span><br>
				<span>${ items.gibon_option3_name } ${ items.gibon_option3_val }</span><br>
				<span>${ items.gibon_option4_name } ${ items.gibon_option4_val }</span><br>
				<span>${ items.gibon_option5_name} ${ items.gibon_option5_val }</span><br>
				<span>${ items.gibon_option6_name } ${ items.gibon_option6_val }</span><br>
				<span>${ items.gibon_option7_name } ${ items.gibon_option7_val }</span><br>
				</div>
			<br>
				<span>${ items.option_name1 } ${ items.item_o1_val }</span><br>
				<span>${ items.option_name2 } ${ items.item_o2_val }</span><br>
				<span>${ items.option_name3 } ${ items.item_o3_val }</span><br>
				<span>${ items.option_name4 } ${ items.item_o4_val }</span><br>
				<span>${ items.option_name5 } ${ items.item_o5_val }</span><br>
				<span>${ items.option_name6 } ${ items.item_o6_val }</span><br>
				<span>${ items.option_name7 } ${ items.item_o7_val }</span><br>
			</div>
</div>
</c:forEach>
</body>
</html>