<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
<link rel="stylesheet" href="../css/sidebar.css">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">

// 회원 전용 사이드바 작업 선일 //
$(document).ready(function(){
	
	// overlay는 웹페이지 아무곳이나 누르면 사이드바 사라지게 하는 설정 //
	$("#button").click(function() {
	    $("#side_menu").show(500);
	    $(".overlay").fadeIn();
	});
	
	$(".overlay").click(function() {
	    $("#side_menu").hide(500);
	    $(".overlay").fadeOut();
	});
});


</script>

</head>
<body>

<div id="box">
	<input id="button" type="button" value="버튼">
	
	<div id="side_menu">
		<ul>
			<li>ㅎㅇㅎㅇ</li>
			<li>ㅎㅇㅎㅇㅎ</li>
			<li>ㅇㅎㅇ</li>
		</ul>
	</div>
	<div class="overlay"></div>
</div>

</body>
</html>