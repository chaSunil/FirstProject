<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/item.css">
<style type="text/css">
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}

* {
	font-family: "Pretendard-Regular";
	margin: 0px;
	padding: 0px;
}

#item-box {
	width : 1500px;
	height : 350px;
	background-color: skyblue;
	margin: auto;
	border: 1px solid black;
}

#item-image-box {
	width: 300px;
	height : 350px;
	display: inline-block;
	float: left;
	padding-left: 50px;
	padding-top: 35px;
}

#item-box2 {
	width: 300px;
	height : 350px;
	display: inline-block;
	float: left;
	padding-top: 100px;
}

#item-box3 {
	width: 400px;
	height : 350px;
	display: inline-block;
}

#item-box4 {
	width: 500px;
	height : 350px;
	display: inline-block;
}
</style>

</head>
<body>
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
				<span>${ items.gibon_option1_name } ${ items.gibon_option1_val }</span><br>
				<span>${ items.gibon_option2_name } ${ items.gibon_option2_val }</span><br>
				<span>${ items.gibon_option3_name } ${ items.gibon_option3_val }</span><br>
				<span>${ items.gibon_option4_name } ${ items.gibon_option4_val }</span><br>
				<span>${ items.gibon_option5_name} ${ items.gibon_option5_val }</span><br>
				<span>${ items.gibon_option6_name } ${ items.gibon_option6_val }</span><br>
				<span>${ items.gibon_option7_name } ${ items.gibon_option7_val }</span><br>
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
		</form>
		</c:forEach>

</body>
</html>