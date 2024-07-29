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
<link rel="stylesheet" href="../resources/css/items_list2.css">
<link rel="stylesheet" href="../resources/css/main2.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<!-- 검색기능 넣기 이이이이이이이 선일작업 -->
<script type="text/javascript">

	var inputSource =[]; 
   
	var inputSource2 =[]; 

    $(function(){
	   
   	// getItem_name
   	$.ajax({
   		url  : "../items/getlist.do",
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
   	
   	
   	// getOption_name1
   	$.ajax({
   		url  	: "../items/getlist2.do",
   		dataType:"json",
   		success	:function(res_data2){
   			for(let data2 of res_data2.result){
   				inputSource2.push(data2);
   			}
   		},
   		error	:function(err){
   			alert("검색정보를 가져오지 못했습니다.");
   		}
   	}); // end: getOption_name1
	   
   });
   

    
    


	
   /* 옵션검색을 넘길때의 로직 */
	function option_search(f) {
		
		let item_name = f.item_name.value.trim();
		let item_name_val = f.item_name_val.value.trim();
		
		let item_name2 = f.item_name2.value.trim();
		let item_name_val2 = f.item_name_val2.value.trim();
		
		let item_name3 = f.item_name3.value.trim();
		let item_name_val3 = f.item_name_val3.value.trim();
		
		let item_name4 = f.item_name4.value.trim();
		let item_name_val4 = f.item_name_val4.value.trim();
		
		let item_name5 = f.item_name5.value.trim();
		let item_name_val5 = f.item_name_val5.value.trim();
		
		let item_name6 = f.item_name6.value.trim();
		let item_name_val6 = f.item_name_val6.value.trim();
		
		// 입력값 option중 동일한 옵션이 있으면 알람
		if(item_name!='' && item_name2!='' && item_name3 !='' && item_name4!='' && item_name5!='' && item_name6!='') {
			if(item_name == item_name2 || item_name == item_name3 || item_name == item_name4 
			|| item_name == item_name5 || item_name == item_name6 
			|| item_name2 == item_name3 || item_name2 == item_name4
			|| item_name2 == item_name5 || item_name2 == item_name6
			|| item_name3 == item_name4 || item_name3 == item_name5
			|| item_name3 == item_name6 || item_name4 == item_name5
			|| item_name4 == item_name6 || item_name5 == item_name6) {
				
			alert("중복되는 아이템 옵션이 있습니다.\n다시 한 번 확인해주시고 검색해주세요.")
			return;
			}
		}
		
		if(item_name!='' && item_name2!='' && item_name3 !='' && item_name4!='' && item_name5!='') {
			if(item_name == item_name2 || item_name == item_name3 || item_name == item_name4 
			|| item_name == item_name5 || item_name2 == item_name3 || item_name2 == item_name4
			|| item_name2 == item_name5 || item_name3 == item_name4 || item_name3 == item_name5
			|| item_name4 == item_name5) {
				
			alert("중복되는 아이템 옵션이 있습니다.\n다시 한 번 확인해주시고 검색해주세요.")
			return;
			}
		}
		
		if(item_name!='' && item_name2!='' && item_name3 !='' && item_name4!='') {
			if(item_name == item_name2 || item_name == item_name3
			|| item_name1 == item_name4 || item_name2 == item_name3
			|| item_name2 == item_name4 || item_name4 == item_name4) {
				
			alert("중복되는 아이템 옵션이 있습니다.\n다시 한 번 확인해주시고 검색해주세요.")
			return;
			}
		}
		
		if(item_name!='' && item_name2!='' && item_name3 !='') {
			if(item_name == item_name2 || item_name == item_name3 || item_name2 == item_name3) {
				
			alert("중복되는 아이템 옵션이 있습니다.\n다시 한 번 확인해주시고 검색해주세요.")
			return;
			}
		}
		
		if(item_name!='' && item_name2!='') {
			if(item_name == item_name2) {
				
			alert("중복되는 아이템 옵션이 있습니다.\n다시 한 번 확인해주시고 검색해주세요.")
			return;
			}
		}

		
		
		const item_shot = $("#item_shot").val();
		const item_type = $("#item_type").val();
		const item_grade = $("#item_grade").val();
		const item_im = $("#item_im").val();
		
		
		f.action = "../items/category.do";
		f.submit();
	}
	
   
	function send(f) {
		
		// 입력값 검증
		let item_name = f.item_name.value.trim();
		
		if(item_name=='') {
			alert("검색어를 입력하세요!")
			f.item_name.value = "";
			f.item_name.focus();
			return;
		}
		
		f.action = "../items/search.do";// 전송대상(PhotoInsertAction)
		f.submit();
	}
		
</script>




<!-- jquery -->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->

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
    

    // option 설정 검색창
	$112('#inputBox2').autocomplete({
        source : inputSource2, // autocomplete가 될 요소
        minLength : 0, // 0글자부터 배열안에 있는 글자를 인식한다.
        select : function(event, ui) {
        	
        	
        	
        	if($("#itemName").val()=="") {
        		
        		$("#itemName").val(ui.item.value);
        		
        	} else if($("#itemName2").val()=="") {
        		
        		$("#itemName2").val(ui.item.value);
        		
        	} else if($("#itemName3").val()=="") {
        		
        		$("#itemName3").val(ui.item.value);
        		
        	} else if($("#itemName4").val()=="") {
        		
        		$("#itemName4").val(ui.item.value);
        		
        	} else if($("#itemName5").val()=="") {
        		
        		$("#itemName5").val(ui.item.value);
        		
        	} else if($("#itemName6").val()=="") {
        		
        		$("#itemName6").val(ui.item.value);
        		
        	}
        	
        	
        	return false;
        }
    });
    
    var inputBox2 = document.querySelector('#inputBox2'); // 변수 저장
    inputBox2.addEventListener("focus", downArrow2); // inputBox(검색창)에 커서가 올라가면 함수실행

});

function downArrow() {
    var event = document.createEvent("Event");
    event.initEvent("keydown", true, true); // keydown 키로 이동가능
    event.keyCode = 40 // 자동완성 딜레이시간
    document.getElementById("inputBox").dispatchEvent(event);
};

function downArrow2() {
    var event = document.createEvent("Event");
    event.initEvent("keydown", true, true); // keydown 키로 이동가능
    event.keyCode = 40 // 자동완성 딜레이시간
    document.getElementById("inputBox2").dispatchEvent(event);
};

</script>

</head>



<body>


<jsp:include page="loading.jsp"/>

<!-- header 다희 코드 -->
    <div id="header">
    	<div id="header-img1">
    		<img alt="" src="../resources/images/deco_bg_1.png">
    	</div>
    	<div id="header-img2">
    		<img alt="" src="../resources/images/deco_1.png">
    	</div>
        <div id="header-box">
	        <div id="logo">
	            <img alt="" src="../resources/images/디션.png">
	        </div>
	        <div id="login-main">
	            <div id="login-btn">
	                <!-- 로그인 화면 전환 -->
	                <!-- 로그인 안되었을 때 session ~~ -->
	                <!-- <c:if test="${ empty sessionScope.user }"> -->
	                <div class="login-icon">
	                    <a style="cursor: pointer;" href="../member/login_form.do"> 
	                        <!-- <img src="../image/user_icon.png"> -->
	                        <i class="user-circle"></i>
	                        로그인
	                    </a>                  
	                </div>
	                    <a href="#">회원가입</a>
	                <!-- </c:if> -->
	                <!-- 로그인 되었을 때 session 살리기~~ -->
	                <!--  <c:if test="${ not empty sessionScope.user }">
	                    <span id="user_ment">${ sessionScope.user.mem_nickname }님</span>
	                로그아웃시 실행될 onclick 함수
	                    <a id="logout" style="cursor:pointer;">로그아웃</a>
	                </c:if>
	                로그인 계정이 관리자일 경우 회원관리 버튼 생성
	                <c:if test="${ user.mem_grade eq '관리자' }">
	                    <a href="../member/list.do">회원관리</a>
	                </c:if>
	                <c:if test="${ user.mem_grade eq '일반' }">
	                    <a onclick="location.href='../member/modify_form.do?mem_idx=${user.mem_idx}'"
	                     style="cursor:pointer;">내정보</a>
	                </c:if> -->     
	                &nbsp;
	                <div class="updown"></div>
	                &nbsp;
	                <a href="#">채팅</a>
	                <a id="who" onclick="blink();" style="cursor:pointer;">
	                	<img src="../resources/images/who.PNG">비회원
	                </a>
	               
	            </div>
	            
	        </div>
        </div>
        	   
        <div id="header-tab">
        	<div id="header-tab-inside">
	            <nav class="navbar navbar-inverse">
				  <div class="container-fleid">
				    <ul class="container-fleid-list">
				    <img src="../resources/images/category.png">
				      <li class="dropdown header-tab-menu">
				        <a id="first" href="#">
				        	<img src="../resources/images/li1.PNG">
				        	<span>레저렉션</span>
				        </a>
				      </li>
				      <img src="../resources/images/category.png">
				      <li class="dropdown header-tab-menu">
				        <a id="second" href="#">
				        	<span>아이템 마켓</span>
				        </a>
				      </li>
				       <img src="../resources/images/category.png">
				      <li class="dropdown header-tab-menu">
				        <a href="#">
				        	<span>커뮤니티</span>
				        </a>
				      </li>
				       <img src="../resources/images/category.png">
				      <li class="dropdown header-tab-menu">
				        <a href="#">
				        	<span>베스트</span>
				        </a>
				      </li>
				       <img src="../resources/images/category.png">
				      <li class="dropdown header-tab-menu">
				        <a href="#">
				        	<span>아이템 정보</span>
				        </a>
				      </li>
				      <img src="../resources/images/category.png">
				      <li class="dropdown header-tab-menu">
				        <a href="#">
				        	<span>DP충전</span>
				        </a>
				      </li>
				      <img src="../resources/images/category.png">
				    </ul>
				  </div>
				</nav>
			</div>
        </div>
        
    </div><!-- end - header -->
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


		<!-- 아이템 검색창 -->
 	    <div id="search">
	    	<form>
          	  <input type="text" id="inputBox" name="item_name" class="form-control search" placeholder="검색창"/>
			  <input type="submit" onclick="send(this.form)" value="검색" id="search_chang">
			</form>
        </div>
        
        <!-- 옵션 검색창 -->
 	    <div id="search2">
	    	<form>
          	  <input type="text" id="inputBox2" name="item_option" class="form-control search" placeholder="검색창"/>
			  <!-- <input type="submit" onclick="send2(this.form)" value="검색" id="search_chang"> -->
			</form>
        </div>
        
        <input type="hidden" >
        
        
        <form>
        	<input name="item_name" id="itemName" placeholder="옵션명">
        	<input name="item_name_val" placeholder="옵션수치">
        	
        	<input name="item_name2" id="itemName2" placeholder="옵션명2">
        	<input name="item_name_val2" placeholder="옵션수치2"><br>
        	
        	
        	<input name="item_name3" id="itemName3" placeholder="옵션명3">
        	<input name="item_name_val3" placeholder="옵션수치3">
        	
        	<input name="item_name4" id="itemName4" placeholder="옵션명4">
        	<input name="item_name_val4" placeholder="옵션수치4"><br>
        	
        	<input name="item_name5" id="itemName5" placeholder="옵션명5">
        	<input name="item_name_val5" placeholder="옵션수치5">
        	
        	<input name="item_name6" id="itemName6" placeholder="옵션명6">
        	<input name="item_name_val6" placeholder="옵션수치6"><br>
        	
        	<input name="item_name7" id="itemName7" placeholder="아이템명">
        	
        	<input type="button" value="검색" onclick="option_search(this.form);">     
        	<select id="item_type" name="item_type">
        		<option value="양손검">양손검</option>
        		<option value="투구">투구</option>
        		<option value="갑옷">갑옷</option>
        		<option value="방패">방패</option>
        		<option value="장갑">장갑</option>
        		<option value="허리띠">허리띠</option>
        		<option value="신발">신발</option>
        	</select>  
        	<select id="item_grade" name="item_grade">
        		<option value="익셉셔널">익셉셔널</option>
        		<option value="노멀">노멀</option>
        		<option value="엘리트">엘리트</option>
        	</select>   
        	<select id="item_shot" name="item_shot">
        		<option value="0">0</option>
        		<option value="1">1</option>
        		<option value="2">2</option>
        		<option value="3">3</option>
        		<option value="4">4</option>
        	</select>   
        	<select id="item_im" name="item_im">
        		<option value="수리불가">수리불가</option>
        		<option value="수리가능">수리가능</option>
        	</select>   
        </form>
        
        <div id="item-box-advertisement">
        	<img src="https://i.ibb.co/9WWsngp/Kakao-Talk-20240724-144334979.jpg" alt="광고">
        </div>
        
        
        <!-- item head -->
		<div id="item-box-head">
        
        <div id="item-box-head-text">
        	<div id="item-box-head-text-sub">
        	<img alt="" src="https://i.ibb.co/0YqhDTP/bullet-1.png">
        	<span><b>물품 목록</b></span>
        	<span id="item-box-head-text-sub-font"><b>ㅣ</b></span>
        	<span id="item-box-head-text2">총 <b>${ rowTotal }개</b> 검색 결과</span>
        	</div>
        	<img id="item-box-head-text-img" alt="" src="https://i.ibb.co/7bBf5zC/cc-category-titlepin.png">
        	<img id="item-box-head-text-img2" alt="" src="https://i.ibb.co/9hhcwxf/titleline.png">
        	<img id="item-box-head-text-img3" alt="" src="https://i.ibb.co/7bBf5zC/cc-category-titlepin.png">
        </div>
        
        <div id="item-box-head-text-2">
		<div class="dropdown">
		<button class="btn btn-success dropdown-toggle" type="button" data-toggle="dropdown">최근 등록일
		<span class="caret"></span></button>
			<ul class="dropdown-menu">
				<li><a href="#">종료 마감순</a></li>
				<li><a href="#">낮은 가격순</a></li>
				<li><a href="#">높은 가격순</a></li>
			</ul>
		</div>
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
		<c:forEach var="items" items="${ requestScope.list }">
        <form>
<div id="item-box">
			<div id="item-image-box">
			<img src="../resources/images/${ items.item_image }">
			</div>
			<div id="item-box2">
				<div id="gibon_option_font">
				<span>거래번호 : ${ items.item_idx }</span><br>
				<div class="item_tag"><a class="btn-0">&ensp;${ items.item_type }&ensp;</a></div>
				<c:if test="${ items.item_rarity == '유니크' }">
				<div id="item_name_gongback"><span id="item_name"><b>${ items.item_name }</b></span></div><br>
				</c:if>
				<c:if test="${ items.item_rarity == '세트' }">
				<div id="item_name_gongback"><span id="item_name-set"><b>${ items.item_name }</b></span></div><br>
				</c:if>
				<hr>
				<div class="item_tag"><a class="btn-0">&ensp;${ items.item_grade }&ensp;</a>
				
				<c:if test="${ items.item_rarity == '유니크' }">
				<a class="btn-1">&ensp;${ items.item_rarity  }&ensp;</a></div>
				</c:if>
				
				<c:if test="${ items.item_rarity == '세트' }">
				<a class="btn-7">&ensp;${ items.item_rarity  }&ensp;</a></div>
				</c:if>
				<span>${ items.item_im }</span><br>
				
				<!-- 소켓 유무에 따른 출력 변화 -->
				<c:if test="${ items.item_shot != 0 }">
				<span>${ items.item_shot }소켓</span><br>
				</c:if>
				<c:if test="${ items.item_shot == 0 }">
				<span>소켓없음</span><br>
				</c:if>
				</div>
			</div>
			<div id="item-box3">
				<div id="gibon_option_font">
				<!-- 해당 값에 값이 0이거나 이름이 null이라면 출력하지 않겠다. -->
				<c:if test="${ items.gibon_option1_name != null }">
				<span>${ items.gibon_option1_name } ${ items.gibon_option1_val }</span><br>
				</c:if>
				<c:if test="${ items.gibon_option2_name != null }">
				<span>${ items.gibon_option2_name } ${ items.gibon_option2_val }</span><br>
				</c:if>
				<c:if test="${ items.gibon_option3_name != null }">
				<span>${ items.gibon_option3_name } ${ items.gibon_option3_val }</span><br>
				</c:if>
				<c:if test="${ items.gibon_option4_name != null }">
				<span>${ items.gibon_option4_name } ${ items.gibon_option4_val }</span><br>
				</c:if>
				<c:if test="${ items.gibon_option5_name != null }">
				<span>${ items.gibon_option5_name} ${ items.gibon_option5_val }</span><br>
				</c:if>
				<c:if test="${ items.gibon_option6_name != null }">
				<span>${ items.gibon_option6_name } ${ items.gibon_option6_val }</span><br>
				</c:if>
				<c:if test="${ items.gibon_option7_name != null }">
				<span>${ items.gibon_option7_name } ${ items.gibon_option7_val }</span><br>
				</c:if>
				<br>
				<div id="option_font">
				<!-- 해당 값에 값이 0이거나 이름이 null이라면 출력하지 않겠다. -->
				<c:if test="${ items.item_o1_val != 0 || items.option_name1 != null }">
				<span>${ items.option_name1 } ${ items.item_o1_val }</span><br>
				</c:if>
				<c:if test="${ items.item_o2_val != 0 || items.option_name2 != null }">
				<span>${ items.option_name2 } ${ items.item_o2_val }</span><br>
				</c:if>
				<c:if test="${ items.item_o3_val != 0 || items.option_name3 != null }">
				<span>${ items.option_name3 } ${ items.item_o3_val }</span><br>
				</c:if>
				<c:if test="${ items.item_o4_val != 0 || items.option_name4 != null }">
				<span>${ items.option_name4 } ${ items.item_o4_val }</span><br>
				</c:if>
				<c:if test="${ items.item_o5_val != 0 || items.option_name5 != null }">
				<span>${ items.option_name5 } ${ items.item_o5_val }</span><br>
				</c:if>
				<c:if test="${ items.item_o6_val != 0 || items.option_name6 != null }">
				<span>${ items.option_name6 } ${ items.item_o6_val }</span><br>
				</c:if>
				<c:if test="${ items.item_o7_val != 0 || items.option_name7 != null }">
				<span>${ items.option_name7 } ${ items.item_o7_val }</span><br>
				</c:if>
				<c:if test="${ items.item_o8_val != 0 || items.option_name8 != null }">
				<span>${ items.option_name8 } ${ items.item_o8_val }</span><br>
				</c:if>
				</div>
				</div>
			</div>
			
			<!-- 거래회원 정보 기입란 -->
			<div id="item_sell">
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
			</div>
</div>
		</form>
		</c:forEach>
		
		<div style="text-align:center; margin-top:20px;">
			${ pageMenu }
		</div>

</body>
</html>