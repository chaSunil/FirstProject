<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">

/* 게임 제목 */
.mycommon1{
/* 	width: 80%;
	margin: auto; */
	font-size : 25px;
	font-weight : bold;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
	/*border: 1px solid gray;
	padding: 5px;
	
	box-shadow: 1px 1px 1px black; */
}
/* 게임 정보 박스 */
/* .mycommon2{
    width: 70%;
	margin: auto;  
	font-size : 15px;
	font-weight : bold;
	text-align: center;
	margin-bottom: 20px;
 	border: 1px solid gray;
	padding: 5px;
	
	box-shadow: 1px 1px 1px black; 
} 
/* 게임 정보 개별 */
.mycommon3{
    width: 70%;
	margin: auto;  
	font-size : 15px;
	font-weight : bold;
	text-align: center;
	margin-bottom: 20px;
 	border: 2px solid gray;
 	border-radius: 5px;
	padding: 10px;
	
	box-shadow: 1px 1px 1px gray;
}
#pop_image{
	width: 300px;
	height: 300px;
	border: 2px solid gray;
	outline: 2px solid black;
}
#pop_image2{
	width: 300px;
	height: 300px;
	border: 2px solid gray;
	outline: 2px solid black;
}
#pop_image3{
	width: 300px;
	height: 300px;
	border: 2px solid gray;
	outline: 2px solid black;
}
#pop_content{
	min-height: 80px;
}
</style>

<script type="text/javascript">

	//전역변수
	var g_p_filename;
	var g_p_idx;

	//수정
	function modify_photo(){
		location.href="modify_form.do?game_idx=" + g_p_idx;		// PhotoModifyFormAction 만들기
}


</script>

</head>
<body>

<!-- 이미지 팝업 -->

  <!-- Modal1 -->
  <div class="modal fade" id="photoModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <!-- <h4 class="modal-title" id="pop_mem_name">올린이 : 홍길동</h4> 올린 사람 표시 할 필요없음-->
        </div>
        
        <!-- 본문 -->
        <div class="modal-body">
          	<div style="text-align: center; height: 310px;">
          		<img id="pop_image">
          	</div>
          	
          	<div class="mycommon1" id="pop_name">게임이름</div>
          	<div class="mycommon2">
	          	<div class="mycommon3" id="pop_category">게임장르</div>
	          	<div class="mycommon3" id="pop_min_player">최소인원</div>
	          	<div class="mycommon3" id="pop_max_player">최대인원</div>
	          	<div class="mycommon3" id="pop_playtime">플레이타임</div>
	          	<div class="mycommon3" id="pop_age">연령</div>
	          	<div class="mycommon3" id="pop_year">출판년도</div>
	          	<div class="mycommon3" id="pop_publisher">출판사</div>
          	</div>
          	
          	
          	
          	<!-- 버튼  -->
          	<div id="pop_job" style="text-align: right;">
          		<input class="btn btn-warning" type="button" id="btn_pop_update" 
        			   value="수정" onclick="modify_photo();"> 
          		<button class="btn btn-primary" type="button" class="btn btn-basic" data-dismiss="modal">닫기</button>
          		<!-- <input class="btn btn-info"   type="button" value="상세정보"> -->
          		
          		<!-- <input class="btn btn-warning" type="button" value="수정"> --> <!-- 관리자만 style="display: none;" -->
          		<!-- <input style="display: none;" class="btn btn-info" type="button" id="btn_pop_download"
        			   value="상세정보" onclick=""> -->
          	</div>
          	
        </div>
        
       <!--  <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div> -->
      </div>
      
    </div>
  </div>
  
  <!-- 모달2 -->
  <div class="modal fade" id="photoModal2" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <!-- <h4 class="modal-title" id="pop_mem_name">올린이 : 홍길동</h4> 올린 사람 표시 할 필요없음-->
        </div>
        
        <!-- 본문 -->
        <div class="modal-body">
          	<div style="text-align: center; height: 310px;">
          		<img id="pop_image2">
          	</div>
          	<div class="mycommon" id="pop_name2">게임이름</div>
          	<div class="mycommon" id="pop_category2">게임장르</div>
          	<div class="mycommon" id="pop_min_player2">최소인원</div>
          	<div class="mycommon" id="pop_max_player2">최대인원</div>
          	<div class="mycommon" id="pop_playtime2">플레이타임</div>
          	<div class="mycommon" id="pop_age2">연령</div>
          	<div class="mycommon" id="pop_year2">출판년도</div>
          	<div class="mycommon" id="pop_publisher2">출판사</div>
          	
          	<!-- 버튼  -->
          	<div id="pop_job" style="text-align: right;">
          		<input style="display: none;" class="btn btn-warning" type="button" value="수정"> <!-- 관리자만 -->
          		<input style="display: none;" class="btn btn-danger"  type="button" value="삭제"> <!-- 관리자만 -->
          		<input style="display: none;" class="btn btn-info"    type="button" value="더 알아보기">
          		<button type="button" class="btn btn-basic" data-dismiss="modal">닫기</button>
          	</div>
          	
        </div>
        
       <!--  <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div> -->
      </div>
      
    </div>
  </div>
  
  <!-- 모달3 -->
  <div class="modal fade" id="photoModal3" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <!-- <h4 class="modal-title" id="pop_mem_name">올린이 : 홍길동</h4> 올린 사람 표시 할 필요없음-->
        </div>
        
        <!-- 본문 -->
        <div class="modal-body">
          	<div style="text-align: center; height: 310px;">
          		<img id="pop_image3">
          	</div>
          	<div class="mycommon" id="pop_name3">게임이름</div>
          	<div class="mycommon" id="pop_category3">게임장르</div>
          	<div class="mycommon" id="pop_min_player3">최소인원</div>
          	<div class="mycommon" id="pop_max_player3">최대인원</div>
          	<div class="mycommon" id="pop_playtime3">플레이타임</div>
          	<div class="mycommon" id="pop_age3">연령</div>
          	<div class="mycommon" id="pop_year3">출판년도</div>
          	<div class="mycommon" id="pop_publisher3">출판사</div>
          	
          	<!-- 버튼  -->
          	<div id="pop_job" style="text-align: right;">
          		<input style="display: none;" class="btn btn-warning" type="button" value="수정"> <!-- 관리자만 -->
          		<input style="display: none;" class="btn btn-danger"  type="button" value="삭제"> <!-- 관리자만 -->
          		<input style="display: none;" class="btn btn-info"    type="button" value="더 알아보기">
          		<button type="button" class="btn btn-basic" data-dismiss="modal">닫기</button>
          	</div>
          	
        </div>
        
       <!--  <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div> -->
      </div>
      
    </div>
  </div>

</body>
</html>