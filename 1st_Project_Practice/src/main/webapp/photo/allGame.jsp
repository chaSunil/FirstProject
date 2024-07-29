<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS -->
<link rel="stylesheet" href="../css/subcss0630_2.css">
<!-- Bootstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>

<style type="text/css">
	#box {
		width: 1200px;
		margin: auto;
		margin-top: 30px;
	}
	
	#title {
		text-align: center;
		font-size: 30px;
		font-weight: bold;
		color: #9dd9ff;
		margin-bottom: 50px;
	}
	
	#photo-box{
		margin-top:20px;
		height: 2700px;
		/* border: 2px solid blue; */
		/* 상하 스크롤*/
		overflow-y: scroll; /* 전체보기에서만 */
	}
	
	.photo{
		width: 300px;
	    height: 600px;
		/* border: 1px solid orange; */
		margin: 45px;
		padding: 10px;
		float: left;
		/* box-shadow: 1px 1px 1px black; */
	}
	
	.photo > img{
		width: 280px;
	    height: 300px;
		/* border: 1px solid gray; */
		/* outline: 1px solid black; */
		margin-bottom: 5px;
	}
	.title{
		width: 280px;
		/* border: 1px solid gray; */
		/* outline: 1px solid black; */
		padding: 5px;
		text-align: center;
		
		/* ellipsis */
		text-overflow: ellipsis;
	   	overflow: hidden;
	   	white-space: nowrap;
	}
	.img_content{
		display: inline-block;
		float: right;
	}
	
	
</style>
<script type="text/javascript">

	function photo_insert(){
		location.href="sub_photo_insert_form.do";
	}
	
	function photo_delete(sub_p_idx){
		if(confirm("정말 삭제하시겠습니까?")==false) return;
		
		location.href = "delete.do?sub_p_idx=" + sub_p_idx;
	}

</script>
 
</head>
<body>

	<div>
		<div class="row">
		<div class="col-sm-12 col text-end">
			<input class="btn btn-success" type="button" value="사진올리기"
			onclick="photo_insert();">
		</div>
		</div>
	</div>

	<div id="photo-box">
		<c:forEach var="vo" items="${ list }">
			<div class="photo" onclick="showPhoto('${ vo.sub_p_idx }');">
			<div class="img-container2">
				<div class="img-wrapper">
					<img src="../images/${ vo.sub_p_filename }" class="img-in-container"
					onclick = "location.href='../photo/sub_To_Detail.do?sub_p_detail_loc=${ vo.sub_p_detail_loc }'"/>
				</div>
				
				<div class="img_content">
					<div class="title" style="font-size: 30px; font-weight: bold; text-align: center;">${ vo.sub_p_title }</div>
					<div class="title" style="font-size: 23px; text-align: center;">최소인원 : ${ vo.sub_p_min_player }명</div>
						<div class="title" style="font-size: 23px; text-align: center;">최대인원 : ${ vo.sub_p_max_player }명</div>
						<div class="title" style="font-size: 23px; text-align: center;">플레이타임 : ${ vo.sub_p_playtime }분</div>
						<div class="title" style="font-size: 23px; text-align: center; margin-bottom:15px;">연령 : ${ vo.sub_p_age }세 이상</div>
				</div>
				<div class="col text-center">
					<input class="btn btn-waring" type="button" value="수정"
					onclick="location.href='modify_form.do?sub_p_idx=${ vo.sub_p_idx }'">
					<input class="btn btn-danger" type="button" value="삭제"
					onclick="photo_delete('${ vo.sub_p_idx }');">
				</div>
			</div>
			</div>
		</c:forEach>
	
	</div>

</body>
</html>