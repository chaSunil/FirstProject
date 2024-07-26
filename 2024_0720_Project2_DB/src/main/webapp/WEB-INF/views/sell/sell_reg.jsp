<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디아블로2 아이템 거래소</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../resources/css/sell_reg.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<!-- 검색기능 넣기 이이이이이이이 선일작업 -->
<script type="text/javascript">


	var inputSource =[]; 
	
	
	$(function(){
	   
		// getItem_name
		$.ajax({
			url  : "../items/get_item.do",
			dataType:"json",
			success:function(res_data){
				for(let data of res_data.result){
					inputSource.push(data);
				}
			},
			error:function(err){
				alert("검색정보를 가져오지 못했습니다.");
			}
		}); // end: getItem_name
	
	});
   
	
	
	function send(f) {
		
		// 입력값 검증
		let item_name = f.item_name.value.trim();
		
		if(item_name=='') {
			alert("검색어를 입력하세요!")
			f.item_name.value = "";
			f.item_name.focus();
			return;
		}
		
		f.action = "../items/sell_reg_search.do";// 전송대상(PhotoInsertAction)
		f.submit();
	}
	
	
	
	

	
	
	
	function sell_reg_data(f) {
		
		
 		if(confirm("판매등록하시겠습니까?")==false) {
			return;
		}
		
		f.action = "../items/sell_reg_data.do";
		f.submit();
		
	}
	
	
/*  	$("#option_button1").click(funtion() {
		#("#item_o1.val").val($("#item_option1").val());
	}); */
		

		
</script>








<script>




function shot_change() {
	
	let input_item_shot = $("#input_item_shot").val().trim();
	alert("값을 넘겨받았습니다.");
	
	
	$("span#item_shot").text(input_item_shot);
	$("#item_shot").val(input_item_shot);
	
} 




function gibon_option1_change() {
	
	let input_gibon_option1_val = $("#input_gibon_option1_val").val().trim();
	alert("값을 넘겨받았습니다.");
	
	
	$("span#gibon_option1_val").text(input_gibon_option1_val);
	$("#gibon_option1_val").val(input_gibon_option1_val);
	
} 



function gibon_option2_change() {
	
	let input_gibon_option2_val = $("#input_gibon_option2_val").val().trim();
	alert("값을 넘겨받았습니다.");
	
	
	$("span#gibon_option2_val").text(input_gibon_option2_val);
	$("#gibon_option2_val").val(input_gibon_option2_val);
} 



function gibon_option3_change() {
	
	let input_gibon_option3_val = $("#input_gibon_option3_val").val().trim();
	alert("값을 넘겨받았습니다.");
	
	
	$("span#gibon_option3_val").text(input_gibon_option3_val);
	$("#gibon_option3_val").val(input_gibon_option3_val);
} 



function gibon_option4_change() {
	
	let input_gibon_option4_val = $("#input_gibon_option4_val").val().trim();
	alert("값을 넘겨받았습니다.");
	
	
	$("span#gibon_option4_val").text(input_gibon_option4_val);
	$("#gibon_option4_val").val(input_gibon_option4_val);
} 



function gibon_option5_change() {
	
	let input_gibon_option5_val = $("#input_gibon_option5_val").val().trim();
	alert("값을 넘겨받았습니다.");
	
	
	$("span#gibon_option5_val").text(input_gibon_option5_val);
	$("#gibon_option5_val").val(input_gibon_option5_val);
} 



function gibon_option6_change() {
	
	let input_gibon_option6_val = $("#input_gibon_option6_val").val().trim();
	alert("값을 넘겨받았습니다.");
	
	
	$("span#gibon_option6_val").text(input_gibon_option6_val);
	$("#gibon_option6_val").val(input_gibon_option6_val);
} 



function gibon_option7_change() {
	
	let input_gibon_option7_val = $("#input_gibon_option7_val").val().trim();
	alert("값을 넘겨받았습니다.");
	
	
	$("span#gibon_option7_val").text(input_gibon_option7_val);
	$("#gibon_option7_val").val(input_gibon_option7_val);
} 








function option1_change() {
	
	let input_item_o1_val = $("#input_item_o1_val").val().trim();
	alert("값을 넘겨받았습니다.");
	
	
	$("span#item_o1_val").text(input_item_o1_val);
	$("#item_o1_val").val(input_item_o1_val);
} 



function option2_change() {
	
	let input_item_o2_val = $("#input_item_o2_val").val().trim();
	alert("값을 넘겨받았습니다.");
	
	
	$("span#item_o2_val").text(input_item_o2_val);
	$("#item_o2_val").val(input_item_o2_val);
} 



function option3_change() {
	
	let input_item_o3_val = $("#input_item_o3_val").val().trim();
	alert("값을 넘겨받았습니다.");
	
	
	$("span#item_o3_val").text(input_item_o3_val);
	$("#item_o3_val").val(input_item_o3_val);
} 



function option4_change() {
	
	let input_item_o4_val = $("#input_item_o4_val").val().trim();
	alert("값을 넘겨받았습니다.");
	
	
	$("span#item_o4_val").text(input_item_o4_val);
	$("#item_o4_val").val(input_item_o4_val);
} 



function option5_change() {
	
	let input_item_o5_val = $("#input_item_o5_val").val().trim();
	alert("값을 넘겨받았습니다.");
	
	
	$("span#item_o5_val").text(input_item_o5_val);
	$("#item_o5_val").val(input_item_o5_val);
} 



function option6_change() {
	
	let input_item_o6_val = $("#input_item_o6_val").val().trim();
	alert("값을 넘겨받았습니다.");
	
	
	$("span#item_o6_val").text(input_item_o6_val);
	$("#item_o6_val").val(input_item_o6_val);
} 



function option7_change() {
	
	let input_item_o7_val = $("#input_item_o7_val").val().trim();
	alert("값을 넘겨받았습니다.");
	
	
	$("span#item_o7_val").text(input_item_o7_val);
	$("#item_o7_val").val(input_item_o7_val);
} 



function option8_change() {
	
	let input_item_o8_val = $("#input_item_o8_val").val().trim();
	alert("값을 넘겨받았습니다.");
	
	
	$("span#item_o8_val").text(input_item_o8_val);
	$("#item_o8_val").val(input_item_o8_val);
} 





</script>


<link href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css" rel="stylesheet"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<script type="text/javascript">

var $112 = $.noConflict(true);


	
  $112(document).ready(function() {
 	// item 설정 검색창
	/* const imagePath = '../resources/images/' + item.icon; */
	$112('#inputBox').autocomplete({
        source : inputSource, // autocomplete가 될 요소
        minLength : 0, // 0글자부터 배열안에 있는 글자를 인식한다.instance;
        select: function (event, ui) {
        	$("#itemName7").val(ui.item.value);
        	$("#inputBox").val(ui.item.value);
            return false;
        }
    });
	
    var inputBox = document.querySelector('#inputBox'); // 변수 저장
    inputBox.addEventListener("focus", downArrow); // inputBox(검색창) 커서가 올라가면 함수실행

});    
  
  
    function downArrow() {
        var event = document.createEvent("Event");
        event.initEvent("keydown", true, true); // keydown 키로 이동가능
        event.keyCode = 40 // 자동완성 딜레이시간
        document.getElementById("inputBox").dispatchEvent(event);
    };
    
</script>

    

</head>



<body>
		<!-- 아이템 검색창 -->
 	    <div id="search">
	    	<form>
          	  <input type="text" id="inputBox" name="item_name" class="form-control search" placeholder="검색창"/>
			  <input type="submit" onclick="send(this.form)" value="검색" id="search_chang">
			</form>
        </div>
        
        
        <div id="item-box-advertisement">
        	<img src="https://i.ibb.co/9WWsngp/Kakao-Talk-20240724-144334979.jpg" alt="광고">
        </div>
        
        
        <!-- item head -->
		<div id="item-box-head">
        
        <div id="item-box-head-text">
        	<div id="item-box-head-text-sub">
        	<img alt="" src="https://i.ibb.co/0YqhDTP/bullet-1.png">
        	<span><b>아이템 등록</b></span>
        	<span id="item-box-head-text-sub-font"><b>ㅣ</b></span>
        	<span id="item-box-head-text2">일반판매, 경매</span>
        	</div>
        	<img id="item-box-head-text-img" alt="" src="https://i.ibb.co/7bBf5zC/cc-category-titlepin.png">
        	<img id="item-box-head-text-img2" alt="" src="https://i.ibb.co/9hhcwxf/titleline.png">
        	<img id="item-box-head-text-img3" alt="" src="https://i.ibb.co/7bBf5zC/cc-category-titlepin.png">
        </div>
        
        
			<div class="item-box-head2">
			<span class="item-box-head2-font">Game</span><br>
			<span class="item-box-head2-font2">레저렉션 (D2R)</span>
			</div>
			<div class="item-box-head3">
			<span class="item-box-head3-font">→</span><br>
			</div>
			<div class="item-box-head2">
			<span class="item-box-head2-font">Platform</span><br>
			<span class="item-box-head2-font2">PC</span>
			</div>
			<div class="item-box-head3">
			<span class="item-box-head3-font">→</span><br>
			</div>
			<div class="item-box-head2">
			<span class="item-box-head2-font">Server(TimeZone)</span><br>
			<span class="item-box-head2-font2">아시아(Asia)</span>
			</div>
			<div class="item-box-head3">
			<span class="item-box-head3-font">→</span><br>
			</div>
			<div class="item-box-head2">
			<span class="item-box-head2-font">Game Type(TimeZone)</span><br>
			<span class="item-box-head2-font2">레더</span>
			</div>
			<div class="item-box-head3">
			<span class="item-box-head3-font">→</span><br>
			</div>
			<div class="item-box-head2">
			<span class="item-box-head2-font">Mode</span><br>
			<span class="item-box-head2-font21">소프트코어</span>
			</div>
			<div class="item-box-head4">
			<button type="button" class="btn btn-primary active">?&nbsp;&nbsp; 자주 찾는 질문</button>
			</div>
		</div>
		
		
		
		<!-- item head -->
		<div id="item-box-head">
        
        <div id="item-box-head-text">
        	<div id="item-box-head-text-sub">
        	<img alt="" src="https://i.ibb.co/0YqhDTP/bullet-1.png">
        	<span><b>아이템 필터</b></span>
        	<span id="item-box-head-text-sub-font"><b>ㅣ</b></span>
        	<span id="item-box-head-text2">아이템 등록</span>
        	</div>
        	<img id="item-box-head-text-img" alt="" src="https://i.ibb.co/7bBf5zC/cc-category-titlepin.png">
        	<img id="item-box-head-text-img2" alt="" src="https://i.ibb.co/9hhcwxf/titleline.png">
        	<img id="item-box-head-text-img3" alt="" src="https://i.ibb.co/7bBf5zC/cc-category-titlepin.png">
        </div>
        
        
			<div class="item-box-head2">
			<span class="item-box-head2-font">Game</span><br>
			<span class="item-box-head2-font2">레저렉션 (D2R)</span>
			</div>
			<div class="item-box-head3">
			<span class="item-box-head3-font">→</span><br>
			</div>
			<div class="item-box-head2">
			<span class="item-box-head2-font">Platform</span><br>
			<span class="item-box-head2-font2">PC</span>
			</div>
			<div class="item-box-head3">
			<span class="item-box-head3-font">→</span><br>
			</div>
			<div class="item-box-head2">
			<span class="item-box-head2-font">Server(TimeZone)</span><br>
			<span class="item-box-head2-font2">아시아(Asia)</span>
			</div>
			<div class="item-box-head3">
			<span class="item-box-head3-font">→</span><br>
			</div>
			<div class="item-box-head2">
			<span class="item-box-head2-font">Game Type(TimeZone)</span><br>
			<span class="item-box-head2-font2">레더</span>
			</div>
			<div class="item-box-head3">
			<span class="item-box-head3-font">→</span><br>
			</div>
			<div class="item-box-head2">
			<span class="item-box-head2-font">Mode</span><br>
			<span class="item-box-head2-font21">소프트코어</span>
			</div>
			<div class="item-box-head4">
			<button type="button" class="btn btn-primary active">?&nbsp;&nbsp; 자주 찾는 질문</button>
			</div>
		</div>
		
		
		<!-- item_trade_list -->
		
<div id="item-box">
			<div id="item-image-box">
			<img src="../resources/images/${ vo.item_image }">
			</div>
			<div id="item-box2">
				<div id="gibon_option_font">
				<div class="item_tag"><a class="btn-0">&ensp;${ vo.item_type }&ensp;</a></div>
				<div id="item_name_gongback"><span id="item_name"><b>${ vo.item_name }</b></span></div><br>
				<hr>
				<div class="item_tag"><a class="btn-0">&ensp;${ vo.item_grade }&ensp;</a>
				<a class="btn-1">&ensp;${ vo.item_rarity  }&ensp;</a></div>
				<span>${ vo.item_im }</span><br>
				
				
				
				<div id="modals" data-toggle="modal" data-target="#myModals">
					<span id="item_shot" data-value="item_shot">${ vo.item_shot }</span>소켓<br>
				</div>
				
				<!-- 모달 -->
				<div id="myModals" class="modal fade" role="dialog">
				  <div class="modal-dialog">
				
				    <!-- 모달 내부 내용 -->
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">소켓 변경</h4>
				      </div>	
				      <div class="modal-body">
				      
				      
				      	소켓
				        <input type="number" name="input_item_shot" id="input_item_shot" placeholder="${ vo.item_shot }">
				        <input type="button" id="shot_change_button1" value="적용" onclick="shot_change();">  
				        
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				
				  </div>
				</div>
				</div>
			</div>
			
			
			

		<form>
				<!-- 아이템 table 공유해서 넘겨주는 공식 (어떤 테이블이여도 가능) ---중요도★10000--- -->
			
				<!-- ★이미지 이름 넘겨주기★ -->
				<input type="hidden" name="item_name" value="${ vo.item_name }">
				<!-- ★이미지 태그 넘겨주기★ -->
				<input type="hidden" name="item_image" value="${ vo.item_image }">
				<!-- ★이미지 타입 넘겨주기★ -->
				<input type="hidden" name="item_type" value="${ vo.item_type }">
				<!-- ★이미지 등급 넘겨주기★ -->
				<input type="hidden" name="item_grade" value="${ vo.item_grade }">
				<!-- ★이미지 레어도 넘겨주기★ -->
				<input type="hidden" name="item_rarity" value="${ vo.item_rarity }">
				
				<!-- ★이미지 소켓 넘겨주기★ -->
				<input type="hidden" name="item_shot" value="${ vo.item_shot }">
				
				<!-- 아이템 기본 옵션1  -->
				<input type="hidden" id="gibon_option1" name="gibon_option1" value="${ vo.gibon_option1 }">
				<input type="hidden" id="gibon_option1_val" name="gibon_option1_val" value="${ vo.gibon_option1_val }">
				
				
				<!-- 아이템 기본 옵션2  -->
				<input type="hidden" id="gibon_option2" name="gibon_option2" value="${ vo.gibon_option2 }">
				<input type="hidden" id="gibon_option2_val" name="gibon_option2_val" value="${ vo.gibon_option2_val }">
				
				<!-- 아이템 기본 옵션3  -->
				<input type="hidden" id="gibon_option3" name="gibon_option3" value="${ vo.gibon_option3 }">
				<input type="hidden" id="gibon_option3_val" name="gibon_option3_val" value="${ vo.gibon_option3_val }">
				
				<!-- 아이템 기본 옵션4  -->
				<input type="hidden" id="gibon_option4" name="gibon_option4" value="${ vo.gibon_option4 }">
				<input type="hidden" id="gibon_option4_val" name="gibon_option4_val" value="${ vo.gibon_option4_val }">
				
				<!-- 아이템 기본 옵션5  -->
				<input type="hidden" id="gibon_option5" name="gibon_option5" value="${ vo.gibon_option5 }">
				<input type="hidden" id="gibon_option5_val" name="gibon_option5_val" value="${ vo.gibon_option5_val }">
				
				<!-- 아이템 기본 옵션6  -->
				<input type="hidden" id="gibon_option6" name="gibon_option6" value="${ vo.gibon_option6 }">
				<input type="hidden" id="gibon_option6_val" name="gibon_option6_val" value="${ vo.gibon_option6_val }">
				
				<!-- 아이템 기본 옵션7  -->
				<input type="hidden" id="gibon_option7" name="gibon_option7" value="${ vo.gibon_option7 }">
				<input type="hidden" id="gibon_option7_val" name="gibon_option7_val" value="${ vo.gibon_option7_val }">
		
		
				
				<!-- 아이템 옵션1  -->
				<input type="hidden" id="option1_idx" name="option1_idx" value="${ vo.option1_idx }">
				<input type="hidden" id="item_o1_val" name="item_o1_val" value="${ vo.item_o1_val }">
		
				
				<!-- 아이템 옵션2  -->
				<input type="hidden" id="option2_idx" name="option2_idx" value="${ vo.option2_idx }">
				<input type="hidden" id="item_o2_val" name="item_o2_val" value="${ vo.item_o2_val }">
		
				
				<!-- 아이템 옵션3  -->
				<input type="hidden" id="option3_idx" name="option3_idx" value="${ vo.option3_idx }">
				<input type="hidden" id="item_o3_val" name="item_o3_val" value="${ vo.item_o3_val }">
		
				
				<!-- 아이템 옵션4  -->
				<input type="hidden" id="option4_idx" name="option4_idx" value="${ vo.option4_idx }">
				<input type="hidden" id="item_o4_val" name="item_o4_val" value="${ vo.item_o4_val }">
		
				
				<!-- 아이템 옵션5  -->
				<input type="hidden" id="option5_idx" name="option5_idx" value="${ vo.option5_idx }">
				<input type="hidden" id="item_o5_val" name="item_o5_val" value="${ vo.item_o5_val }">
		
				
				<!-- 아이템 옵션6  -->
				<input type="hidden" id="option6_idx" name="option6_idx" value="${ vo.option6_idx }">
				<input type="hidden" id="item_o6_val" name="item_o6_val" value="${ vo.item_o6_val }">
	 
				
				<!-- 아이템 옵션7  -->
				<input type="hidden" id="option7_idx" name="option7_idx" value="${ vo.option7_idx }">
				<input type="hidden" id="item_o7_val" name="item_o7_val" value="${ vo.item_o7_val }">
		
				
				<!-- 아이템 옵션8  -->
				<input type="hidden" id="option8_idx" name="option8_idx" value="${ vo.option8_idx }">
				<input type="hidden" id="item_o8_val" name="item_o8_val" value="${ vo.item_o8_val }">
				

				
				
				
				
				<input type="button" class="btn btn-info btn-lg" value="판매등록하기" onclick="sell_reg_data(this.form);">
		</form>
		
		
				
				
				
			
			
			
			
			
			
			
			
			
			
			
			
			<div id="item-box3">
				<div id="gibon_option_font">
				
				
				<!-- 해당 값에 값이 0이거나 이름이 null이라면 출력하지 않겠다. -->
				<c:if test="${ vo.gibon_option1_name != null }">
				<!-- 기본 옵션1번 변경 모달 -->
				<!-- 모달 버튼 -->
				
				
				<div id="modal" data-toggle="modal" data-target="#myModal">
					${ vo.gibon_option1_name }
					<span id="gibon_option1_val" data-value="gibon_option1_val">${ vo.gibon_option1_val }</span><br>
				</div>
				
				
				
				<!-- 모달 -->
				<div id="myModal" class="modal fade" role="dialog">
				  <div class="modal-dialog">
				
				    <!-- 모달 내부 내용 -->
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">옵션 변경</h4>
				      </div>	
				      <div class="modal-body">
				      
				      
				      	${ vo.gibon_option1_name }
				        <input type="number" name="item_gibon_option1" id="input_gibon_option1_val" placeholder="${ vo.gibon_option1_val }">
				        <input type="button" id="gibon_option_button1" value="적용" onclick="gibon_option1_change();">  
				        
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				
				  </div>
				</div>
				</c:if>
				
				
				
				
				
				
				
				<c:if test="${ vo.gibon_option2_name != null }">
				<!-- 기본 옵션1번 변경 모달 -->
				<!-- 모달 버튼 -->
				
				
				<div id="modal2" data-toggle="modal" data-target="#myModal2">
					${ vo.gibon_option2_name }
					<span id="gibon_option2_val" data-value="gibon_option2_val">${ vo.gibon_option2_val }</span><br>
				</div>
				
				
				
				<!-- 모달 -->
				<div id="myModal2" class="modal fade" role="dialog">
				  <div class="modal-dialog">
				
				    <!-- 모달 내부 내용 -->
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">옵션 변경</h4>
				      </div>	
				      <div class="modal-body">
				      
				      
				      	${ vo.gibon_option2_name }
				        <input type="number" name="item_gibon_option2" id="input_gibon_option2_val" placeholder="${ vo.gibon_option2_val }">
				        <input type="button" id="gibon_option_button2" value="적용" onclick="gibon_option2_change();">  
				        
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				
				  </div>
				</div>
				</c:if>
				
				
				
				
				
				
				
				
				<c:if test="${ vo.gibon_option3_name != null }">
				<!-- 기본 옵션1번 변경 모달 -->
				<!-- 모달 버튼 -->
				
				
				<div id="modal3" data-toggle="modal" data-target="#myModal3">
					${ vo.gibon_option3_name }
					<span id="gibon_option3_val" data-value="gibon_option3_val">${ vo.gibon_option3_val }</span><br>
				</div>
				
				
				
				<!-- 모달 -->
				<div id="myModal3" class="modal fade" role="dialog">
				  <div class="modal-dialog">
				
				    <!-- 모달 내부 내용 -->
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">옵션 변경</h4>
				      </div>	
				      <div class="modal-body">
				      
				      
				      	${ vo.gibon_option3_name }
				        <input type="number" name="item_gibon_option3" id="input_gibon_option3_val" placeholder="${ vo.gibon_option3_val }">
				        <input type="button" id="gibon_option_button3" value="적용" onclick="gibon_option3_change();">  
				        
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				
				  </div>
				</div>
				</c:if>
				
				
				
				
				<c:if test="${ vo.gibon_option4_name != null }">
				<!-- 기본 옵션1번 변경 모달 -->
				<!-- 모달 버튼 -->
				
				
				<div id="modal4" data-toggle="modal" data-target="#myModal4">
					${ vo.gibon_option4_name }
					<span id="gibon_option4_val" data-value="gibon_option4_val">${ vo.gibon_option4_val }</span><br>
				</div>
				
				
				
				<!-- 모달 -->
				<div id="myModal4" class="modal fade" role="dialog">
				  <div class="modal-dialog">
				
				    <!-- 모달 내부 내용 -->
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">옵션 변경</h4>
				      </div>	
				      <div class="modal-body">
				      
				      
				      	${ vo.gibon_option4_name }
				        <input type="number" name="item_gibon_option4" id="input_gibon_option4_val" placeholder="${ vo.gibon_option4_val }">
				        <input type="button" id="gibon_option_button4" value="적용" onclick="gibon_option4_change();">  
				        
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				
				  </div>
				</div>
				</c:if>
				
				
				
				
				<c:if test="${ vo.gibon_option5_name != null }">
				<!-- 기본 옵션1번 변경 모달 -->
				<!-- 모달 버튼 -->
				
				
				<div id="modal5" data-toggle="modal" data-target="#myModal5">
					${ vo.gibon_option5_name }
					<span id="gibon_option5_val" data-value="gibon_option5_val">${ vo.gibon_option5_val }</span><br>
				</div>
				
				
				
				<!-- 모달 -->
				<div id="myModal5" class="modal fade" role="dialog">
				  <div class="modal-dialog">
				
				    <!-- 모달 내부 내용 -->
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">옵션 변경</h4>
				      </div>	
				      <div class="modal-body">
				      
				      
				      	${ vo.gibon_option5_name }
				        <input type="number" name="item_gibon_option5" id="input_gibon_option5_val" placeholder="${ vo.gibon_option5_val }">
				        <input type="button" id="gibon_option_button5" value="적용" onclick="gibon_option5_change();">  
				        
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				
				  </div>
				</div>
				</c:if>
				
				
				
				
				
				
				
				<c:if test="${ vo.gibon_option6_name != null }">
				<!-- 기본 옵션1번 변경 모달 -->
				<!-- 모달 버튼 -->
				
				
				<div id="modal6" data-toggle="modal" data-target="#myModal6">
					${ vo.gibon_option6_name }
					<span id="gibon_option6_val" data-value="gibon_option6_val">${ vo.gibon_option6_val }</span><br>
				</div>
				
				
				
				<!-- 모달 -->
				<div id="myModal6" class="modal fade" role="dialog">
				  <div class="modal-dialog">
				
				    <!-- 모달 내부 내용 -->
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">옵션 변경</h4>
				      </div>	
				      <div class="modal-body">
				      
				      
				      	${ vo.gibon_option6_name }
				        <input type="number" name="item_gibon_option6" id="input_gibon_option6_val" placeholder="${ vo.gibon_option6_val }">
				        <input type="button" id="gibon_option_button6" value="적용" onclick="gibon_option6_change();">  
				        
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				
				  </div>
				</div>
				</c:if>
				
				
				
				
				
				
				
				
				<c:if test="${ vo.gibon_option7_name != null }">
				<!-- 기본 옵션1번 변경 모달 -->
				<!-- 모달 버튼 -->
				
				
				<div id="modal7" data-toggle="modal" data-target="#myModal7">
					${ vo.gibon_option7_name }
					<span id="gibon_option7_val" data-value="gibon_option7_val">${ vo.gibon_option7_val }</span><br>
				</div>
				
				
				
				<!-- 모달 -->
				<div id="myModal7" class="modal fade" role="dialog">
				  <div class="modal-dialog">
				
				    <!-- 모달 내부 내용 -->
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">옵션 변경</h4>
				      </div>	
				      <div class="modal-body">
				      
				      
				      	${ vo.gibon_option7_name }
				        <input type="number" name="item_gibon_option7" id="input_gibon_option7_val" placeholder="${ vo.gibon_option7_val }">
				        <input type="button" id="gibon_option_button7" value="적용" onclick="gibon_option7_change();">  
				        
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				
				  </div>
				</div>
				</c:if>
				
				
				

				
				
				<br>
				<div id="option_font">
				
				<c:if test="${ vo.option_name1 != null }">
				<!-- 기본 옵션1번 변경 모달 -->
				<!-- 모달 버튼 -->
				
				
				<div id="modal1_1" data-toggle="modal" data-target="#myModal1_1">
					${ vo.option_name1 }
					<span id="item_o1_val" data-value=item_o1_val>${ vo.item_o1_val }</span><br>
				</div>
				
				
				
				<!-- 모달 -->
				<div id="myModal1_1" class="modal fade" role="dialog">
				  <div class="modal-dialog">
				
				    <!-- 모달 내부 내용 -->
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">옵션 변경</h4>
				      </div>	
				      <div class="modal-body">
				      
				      
				      	${ vo.option_name1 }
				        <input type="number" name="option_name1" id="input_item_o1_val" placeholder="${ vo.item_o1_val }">
				        <input type="button" id="option_button1" value="적용" onclick="option1_change();">  
				        
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				
				  </div>
				</div>
				</c:if>
				
				
				

				
				

				
				<c:if test="${ vo.option_name2 != null }">
				<!-- 기본 옵션1번 변경 모달 -->
				<!-- 모달 버튼 -->
				
				
				<div id="modal1_2" data-toggle="modal" data-target="#myModal1_2">
					${ vo.option_name2 }
					<span id="item_o2_val" data-value=item_o2_val>${ vo.item_o2_val }</span><br>
				</div>
				
				
				
				<!-- 모달 -->
				<div id="myModal1_2" class="modal fade" role="dialog">
				  <div class="modal-dialog">
				
				    <!-- 모달 내부 내용 -->
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">옵션 변경</h4>
				      </div>	
				      <div class="modal-body">
				      
				      
				      	${ vo.option_name2 }
				        <input type="number" name="option_name2" id="input_item_o2_val" placeholder="${ vo.item_o2_val }">
				        <input type="button" id="option_button2" value="적용" onclick="option2_change();">  
				        
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				
				  </div>
				</div>
				</c:if>
				
				
				

				
				

				
				<c:if test="${ vo.option_name3 != null }">
				<!-- 기본 옵션1번 변경 모달 -->
				<!-- 모달 버튼 -->
				
				
				<div id="modal1_3" data-toggle="modal" data-target="#myModal1_3">
					${ vo.option_name3 }
					<span id="item_o3_val" data-value=item_o3_val>${ vo.item_o3_val }</span><br>
				</div>
				
				
				
				<!-- 모달 -->
				<div id="myModal1_3" class="modal fade" role="dialog">
				  <div class="modal-dialog">
				
				    <!-- 모달 내부 내용 -->
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">옵션 변경</h4>
				      </div>	
				      <div class="modal-body">
				      
				      
				      	${ vo.option_name3 }
				        <input type="number" name="option_name3" id="input_item_o3_val" placeholder="${ vo.item_o3_val }">
				        <input type="button" id="option_button3" value="적용" onclick="option3_change();">  
				        
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				
				  </div>
				</div>
				</c:if>
				
				
				

				
				

				
				<c:if test="${ vo.option_name4 != null }">
				<!-- 기본 옵션1번 변경 모달 -->
				<!-- 모달 버튼 -->
				
				
				<div id="modal1_4" data-toggle="modal" data-target="#myModal1_4">
					${ vo.option_name4 }
					<span id="item_o4_val" data-value=item_o4_val>${ vo.item_o4_val }</span><br>
				</div>
				
				
				
				<!-- 모달 -->
				<div id="myModal1_4" class="modal fade" role="dialog">
				  <div class="modal-dialog">
				
				    <!-- 모달 내부 내용 -->
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">옵션 변경</h4>
				      </div>	
				      <div class="modal-body">
				      
				      
				      	${ vo.option_name4 }
				        <input type="number" name="option_name4" id="input_item_o4_val" placeholder="${ vo.item_o4_val }">
				        <input type="button" id="option_button4" value="적용" onclick="option4_change();">  
				        
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				
				  </div>
				</div>
				</c:if>
				
				
				

				
				

				
				<c:if test="${ vo.option_name5 != null }">
				<!-- 기본 옵션1번 변경 모달 -->
				<!-- 모달 버튼 -->
				
				
				<div id="modal1_5" data-toggle="modal" data-target="#myModal1_5">
					${ vo.option_name5 }
					<span id="item_o5_val" data-value=item_o5_val>${ vo.item_o5_val }</span><br>
				</div>
				
				
				
				<!-- 모달 -->
				<div id="myModal1_5" class="modal fade" role="dialog">
				  <div class="modal-dialog">
				
				    <!-- 모달 내부 내용 -->
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">옵션 변경</h4>
				      </div>	
				      <div class="modal-body">
				      
				      
				      	${ vo.option_name5 }
				        <input type="number" name="option_name5" id="input_item_o5_val" placeholder="${ vo.item_o5_val }">
				        <input type="button" id="option_button5" value="적용" onclick="option5_change();">  
				        
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				
				  </div>
				</div>
				</c:if>
				
				
				

				
				

				
				<c:if test="${ vo.option_name6 != null }">
				<!-- 기본 옵션1번 변경 모달 -->
				<!-- 모달 버튼 -->
				
				
				<div id="modal1_6" data-toggle="modal" data-target="#myModal1_6">
					${ vo.option_name6 }
					<span id="item_o6_val" data-value=item_o6_val>${ vo.item_o6_val }</span><br>
				</div>
				
				
				
				<!-- 모달 -->
				<div id="myModal1_6" class="modal fade" role="dialog">
				  <div class="modal-dialog">
				
				    <!-- 모달 내부 내용 -->
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">옵션 변경</h4>
				      </div>	
				      <div class="modal-body">
				      
				      
				      	${ vo.option_name6 }
				        <input type="number" name="option_name6" id="input_item_o6_val" placeholder="${ vo.item_o6_val }">
				        <input type="button" id="option_button6" value="적용" onclick="option6_change();">  
				        
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				
				  </div>
				</div>
				</c:if>
				
				
				

				
				

				
				<c:if test="${ vo.option_name7 != null }">
				<!-- 기본 옵션1번 변경 모달 -->
				<!-- 모달 버튼 -->
				
				
				<div id="modal1_7" data-toggle="modal" data-target="#myModal1_7">
					${ vo.option_name7 }
					<span id="item_o7_val" data-value=item_o7_val>${ vo.item_o7_val }</span><br>
				</div>
				
				
				
				<!-- 모달 -->
				<div id="myModal1_7" class="modal fade" role="dialog">
				  <div class="modal-dialog">
				
				    <!-- 모달 내부 내용 -->
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">옵션 변경</h4>
				      </div>	
				      <div class="modal-body">
				      
				      
				      	${ vo.option_name7 }
				        <input type="number" name="option_name7" id="input_item_o7_val" placeholder="${ vo.item_o7_val }">
				        <input type="button" id="option_button7" value="적용" onclick="option7_change();">  
				        
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				
				  </div>
				</div>
				</c:if>
				
				
				

				
				

				
				<c:if test="${ vo.option_name8 != null }">
				<!-- 기본 옵션1번 변경 모달 -->
				<!-- 모달 버튼 -->
				
				
				<div id="modal1_8" data-toggle="modal" data-target="#myModal1_8">
					${ vo.option_name8 }
					<span id="item_o8_val" data-value=item_o8_val>${ vo.item_o8_val }</span><br>
				</div>
				
				
				
				<!-- 모달 -->
				<div id="myModal1_8" class="modal fade" role="dialog">
				  <div class="modal-dialog">
				
				    <!-- 모달 내부 내용 -->
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">옵션 변경</h4>
				      </div>	
				      <div class="modal-body">
				      
				      
				      	${ vo.option_name8 }
				        <input type="number" name="option_name8" id="input_item_o8_val" placeholder="${ vo.item_o8_val }">
				        <input type="button" id="option_button8" value="적용" onclick="option8_change();">  
				        
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				
				  </div>
				</div>
				</c:if>
				
				
				
				
				
				
				
				
				</div>
				</div>
			</div>
			
			
			
			
			<!-- 거래회원 정보 기입란 -->
<%-- 			<div id="item_sell">
				<div id="usercard-text">
					<span class="usercard-text"><span>기본정보</span> 💡 ONLINE</span>
				</div>
				<div id="item_sell1">
					<img class="usercard-image" src="https://image.chaoscube.co.kr/new/user/367949/profile/b6478d67-9a45-46da-8910-f9f74efcaa18.jpg"> 
					<img class="usercard-grade" src="https://i.ibb.co/BNKG8b4/image.jpg">
					<span class="usercard-name"><b>블랙마린</b></span>
					<a class="btn-3">&ensp;일반판매&ensp;</a>
					<!-- 판매진행 여부 -->
					<a class="btn-4">&ensp;판매 중&ensp;</a>
				</div>
				<hr>
				<div id="item_sell2">
				<!-- 판매양식 -->
				</div>
				<div id="item_sell3">
					<span class="item_clock">등록</span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="item_clock2">2024.07.20 15:35</span><br>
					<span class="item_clock">종료예정</span>
					<span class="item_clock2">2024.07.27 15:35</span><br>
					<span class="item_clock">판매수량</span>
					<span class="item_clock2">10EA</span><br>
				</div>
				<hr>
				<div id="usercard-text2">
					<span class="usercard-text"><span>판매정보</span></span>
				</div>
				<div id="usercard-cp">
					<div id="usercard-cp2">
						<img src="https://i.ibb.co/85LjcPV/image.jpg" alt="image" border="0">
					</div>
					<div id="usercard-cp3">
						<span>판매가</span>
					</div>
					<div id="usercard-cp4">
						<span></span>
					</div>
					<div id="usercard-cp5">
						<span><fmt:formatNumber type="currency" value="118000" currencySymbol=""/></span>
					</div>
					<div id="usercard-cp6">
						<span>CP</span>
					</div>
				</div>
				<div id="usercard-btn">
					<button>자세히보기 →</button>
				</div>
			</div> --%>
</div>
</body>
</html>