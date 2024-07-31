<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디션</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../resources/css/items_list.css">
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
		
		
		let a_selltime 	= f.a_selltime.value;
		let a_initial_price = f.a_initial_price.value.trim();
		let a_direct_price	= f.a_direct_price.value.trim();
		
		
		if(a_initial_price==''){
			alert("최초입찰가를 입력하세요.")
			f.a_initial_price.value="";
			f.a_initial_price.focus();
			return;
		}
		if(a_direct_price==''){
			alert("즉시구매가를 입력하세요.")
			f.a_direct_price.value="";
			f.a_direct_price.focus();
			return;
		}
		if(a_selltime==''){
			alert("판매기간을 설정해주세요.")
			f.a_selltime.value="";
			f.a_selltime.focus();
			return;
		}
		
		
		if(a_direct_price < a_initial_price) {
			alert("즉시구매가가 최초입찰가보다 낮으면 등록할 수 없습니다.");
			return;
		}
		
		
	    var checkbox = document.getElementById("switch");
	    
	    // 체크박스가 체크되어 있지 않은 경우
	    if (!checkbox.checked) {
	        alert("판매 등록을 위해 약관에 동의 해주세요.");
	        return; // 함수 종료
	    }


		
 		if(confirm("판매등록하시겠습니까?")==false) {
			return;
		}
		
		f.action = "../items/sell_reg_data.do";
		f.submit();
		
	}
	
	
	// 3자리 단위마다 콤마추가하기
	function formatNumber() {
		
		const input = document.getElementById('coin_sell_input');
		
	    let value = input.value.replace(/,/g, '');
	    
        // 숫자 범위 제한: 1,000,000 초과 시 입력 제한
        if (parseInt(value, 10) > 10000000) {
            value = '10000000'; // 최대값으로 설정
        }

	    // 정규 표현식을 사용하여 3자리마다 콤마 추가
	    const regex = /(\d)(?=(\d{3})+(?!\d))/g;
	    const formattedValue = value.replace(regex, '$1,');
	    
	    // 포맷된 값을 입력 필드에 다시 설정
	    input.value = formattedValue;
	    
        // 색상 변경 로직
        const numericValue = parseInt(value, 10); // 숫자로 변환

        if (numericValue >= 1000000) { // 백만 이상
            input.className = 'red';
        } else if (numericValue >= 100000) { // 십만 이상
        	input.className = 'pink';
        } else if (numericValue >= 10000) { // 만 이상
        	input.className = 'yellow';
        } else if (numericValue >= 1000) { // 천 이상
        	input.className = 'blue';
        } else if (numericValue >= 100) { // 백 이상
        	input.className = 'white';
        } else {
        	input.className = 'gray'; // 기본 색상
        }
	}
	
	
	// 3자리 단위마다 콤마추가하기
	function formatNumber2() {
		
		const input = document.getElementById('coin_sell_input2');
		
	    let value = input.value.replace(/,/g, '');
	    
	    
        // 숫자 범위 제한: 1,000,000 초과 시 입력 제한
        if (parseInt(value, 10) > 10000000) {
            value = '10000000'; // 최대값으로 설정
        }

	    // 정규 표현식을 사용하여 3자리마다 콤마 추가
	    const regex = /(\d)(?=(\d{3})+(?!\d))/g;
	    const formattedValue = value.replace(regex, '$1,');
	    
	    // 포맷된 값을 입력 필드에 다시 설정
	    input.value = formattedValue;
	    
        // 색상 변경 로직
        const numericValue = parseInt(value, 10); // 숫자로 변환
	    
        if (numericValue >= 1000000) { // 백만 이상
            input.className = 'red';
        } else if (numericValue >= 100000) { // 십만 이상
        	input.className = 'pink';
        } else if (numericValue >= 10000) { // 만 이상
        	input.className = 'yellow';
        } else if (numericValue >= 1000) { // 천 이상
        	input.className = 'blue';
        } else if (numericValue >= 100) { // 백 이상
        	input.className = 'white';
        } else {
        	input.className = 'gray'; // 기본 색상
        }
		
	}
	
	

	
	

	
    
    
/*     // 입력값이 변경될 때마다 실행
    document.getElementById("inputBox").addEventListener("input", function() {
        var value = this.value; // 입력값 가져오기
        var button = document.getElementById("inputBox_x"); // 버튼 요소

        // 입력값이 비어 있으면 버튼 숨기기, 아니면 버튼 보이기
        if (value === '') {
            button.style.display = 'none'; // 버튼 숨김
        } else {
            button.style.display = 'block'; // 버튼 보임
        }
    }); */
	
	
		
	
	

	
	
	

		
</script>





<script>



function im_change() {
    
	let input_item_im = $("#input_item_im").val().trim();
	alert("값을 넘겨받았습니다.");

   	$("span#item_im").text(input_item_im);
   	$("input#item_im").val(input_item_im);
  
}




function shot_change() {
	
	let input_item_shot = $("#input_item_shot").val().trim();
	alert("값을 넘겨받았습니다.");
	
	
	$("span#item_shot").text(input_item_shot);
	$("input#item_shot").val(input_item_shot);
	
} 




function gibon_option1_change() {
	
	let input_gibon_option1_val = $("#input_gibon_option1_val").val().trim();
	
	if(input_gibon_option1_val>3000 || input_gibon_option1_val < 0) {
		alert("값이 올바르지 않습니다. 0~3000 범위 안에서만 입력해주세요.");
		$("#input_gibon_option1_val").val("");
		$("#input_gibon_option1_val").focus();
		return;
		
	} else {
		alert("값을 넘겨받았습니다.");
		$("span#gibon_option1_val").text(input_gibon_option1_val);
		$("#gibon_option1_val").val(input_gibon_option1_val);
	}
} 



function gibon_option2_change() {
	
	let input_gibon_option2_val = $("#input_gibon_option2_val").val().trim();
	
	if(input_gibon_option2_val>3000 || input_gibon_option2_val < 0) {
		alert("값이 올바르지 않습니다. 0~3000 범위 안에서만 입력해주세요.");
		$("#input_gibon_option2_val").val("");
		$("#input_gibon_option2_val").focus();
		return;
		
	} else {
		alert("값을 넘겨받았습니다.");
		$("span#gibon_option2_val").text(input_gibon_option2_val);
		$("#gibon_option2_val").val(input_gibon_option2_val);
	}
} 



function gibon_option3_change() {
	
	let input_gibon_option3_val = $("#input_gibon_option3_val").val().trim();
	
	if(input_gibon_option3_val>3000 || input_gibon_option3_val < 0) {
		alert("값이 올바르지 않습니다. 0~3000 범위 안에서만 입력해주세요.");
		$("#input_gibon_option3_val").val("");
		$("#input_gibon_option3_val").focus();
		return;
		
	} else {
		alert("값을 넘겨받았습니다.");
		$("span#gibon_option3_val").text(input_gibon_option3_val);
		$("#gibon_option3_val").val(input_gibon_option3_val);
	}
} 



function gibon_option4_change() {
	
	let input_gibon_option4_val = $("#input_gibon_option4_val").val().trim();
	
	if(input_gibon_option4_val>3000 || input_gibon_option4_val < 0) {
		alert("값이 올바르지 않습니다. 0~3000 범위 안에서만 입력해주세요.");
		$("#input_gibon_option4_val").val("");
		$("#input_gibon_option4_val").focus();
		return;
		
	} else {
		alert("값을 넘겨받았습니다.");
		$("span#gibon_option4_val").text(input_gibon_option4_val);
		$("#gibon_option4_val").val(input_gibon_option4_val);
	}
} 



function gibon_option5_change() {
	
	let input_gibon_option5_val = $("#input_gibon_option5_val").val().trim();
	
	if(input_gibon_option5_val>3000 || input_gibon_option5_val < 0) {
		alert("값이 올바르지 않습니다. 0~3000 범위 안에서만 입력해주세요.");
		$("#input_gibon_option5_val").val("");
		$("#input_gibon_option5_val").focus();
		return;
		
	} else {
		alert("값을 넘겨받았습니다.");
		$("span#gibon_option5_val").text(input_gibon_option5_val);
		$("#gibon_option5_val").val(input_gibon_option5_val);
	}
} 



function gibon_option6_change() {
	
	let input_gibon_option6_val = $("#input_gibon_option6_val").val().trim();
	
	if(input_gibon_option6_val>3000 || input_gibon_option6_val < 0) {
		alert("값이 올바르지 않습니다. 0~3000 범위 안에서만 입력해주세요.");
		$("#input_gibon_option6_val").val("");
		$("#input_gibon_option6_val").focus();
		return;
		
	} else {
		alert("값을 넘겨받았습니다.");
		$("span#gibon_option6_val").text(input_gibon_option6_val);
		$("#gibon_option6_val").val(input_gibon_option6_val);
	}
} 



function gibon_option7_change() {
	
	let input_gibon_option7_val = $("#input_gibon_option7_val").val().trim();
	
	if(input_gibon_option7_val>3000 || input_gibon_option7_val < 0) {
		alert("값이 올바르지 않습니다. 0~3000 범위 안에서만 입력해주세요.");
		$("#input_gibon_option7_val").val("");
		$("#input_gibon_option7_val").focus();
		return;
		
	} else {
		alert("값을 넘겨받았습니다.");
		$("span#gibon_option7_val").text(input_gibon_option7_val);
		$("#gibon_option7_val").val(input_gibon_option7_val);
	}
} 








function option1_change() {
	
	let input_item_o1_val = $("#input_item_o1_val").val().trim();
	
	if(input_item_o1_val>3000 || input_item_o1_val < 0) {
		alert("값이 올바르지 않습니다. 0~3000 범위 안에서만 입력해주세요.");
		$("#input_item_o1_val").val("");
		$("#input_item_o1_val").focus();
		return;
		
	} else if(input_item_o1_val<=3000 && input_item_o1_val >= 0) {
		alert("값을 넘겨받았습니다.");
		$("span#item_o1_val").text(input_item_o1_val);
		$("input#item_o1_val").val(input_item_o1_val);
	}
} 



function option2_change() {
	
	let input_item_o2_val = $("#input_item_o2_val").val().trim();
	
	if(input_item_o2_val>3000 || input_item_o2_val < 0) {
		alert("값이 올바르지 않습니다. 0~3000 범위 안에서만 입력해주세요.");
		$("#input_item_o2_val").val("");
		$("#input_item_o2_val").focus();
		return;
		
	} else if(input_item_o2_val<=3000 && input_item_o2_val >= 0) {
		alert("값을 넘겨받았습니다.");
		$("span#item_o2_val").text(input_item_o2_val);
		$("input#item_o2_val").val(input_item_o2_val);
	}
	
} 



function option3_change() {
	
	let input_item_o3_val = $("#input_item_o3_val").val().trim();
	
	if(input_item_o3_val>3000 || input_item_o3_val < 0) {
		alert("값이 올바르지 않습니다. 0~3000 범위 안에서만 입력해주세요.");
		$("#input_item_o3_val").val("");
		$("#input_item_o3_val").focus();
		return;
		
	} else if(input_item_o3_val<=3000 && input_item_o3_val >= 0) {
		alert("값을 넘겨받았습니다.");
		$("span#item_o3_val").text(input_item_o3_val);
		$("input#item_o3_val").val(input_item_o3_val);
	}
	
} 



function option4_change() {
	
	let input_item_o4_val = $("#input_item_o4_val").val().trim();
	
	if(input_item_o4_val>3000 || input_item_o4_val < 0) {
		alert("값이 올바르지 않습니다. 0~3000 범위 안에서만 입력해주세요.");
		$("#input_item_o4_val").val("");
		$("#input_item_o4_val").focus();
		return;
		
	} else if(input_item_o4_val<=3000 && input_item_o4_val >= 0) {
		alert("값을 넘겨받았습니다.");
		$("span#item_o4_val").text(input_item_o4_val);
		$("input#item_o4_val").val(input_item_o4_val);
	}
} 



function option5_change() {
	
	let input_item_o5_val = $("#input_item_o5_val").val().trim();
	
	if(input_item_o5_val>3000 || input_item_o5_val < 0) {
		alert("값이 올바르지 않습니다. 0~3000 범위 안에서만 입력해주세요.");
		$("#input_item_o5_val").val("");
		$("#input_item_o5_val").focus();
		return;
		
	} else if(input_item_o5_val<=3000 && input_item_o5_val >= 0) {
		alert("값을 넘겨받았습니다.");
		$("span#item_o5_val").text(input_item_o5_val);
		$("input#item_o5_val").val(input_item_o5_val);
	}
} 



function option6_change() {
	
	let input_item_o6_val = $("#input_item_o6_val").val().trim();
	
	if(input_item_o6_val>3000 || input_item_o6_val < 0) {
		alert("값이 올바르지 않습니다. 0~3000 범위 안에서만 입력해주세요.");
		$("#input_item_o6_val").val("");
		$("#input_item_o6_val").focus();
		return;
		
	} else if(input_item_o6_val<=3000 && input_item_o6_val >= 0) {
		alert("값을 넘겨받았습니다.");
		$("span#item_o6_val").text(input_item_o6_val);
		$("input#item_o6_val").val(input_item_o6_val);
	}
} 



function option7_change() {
	
	let input_item_o7_val = $("#input_item_o7_val").val().trim();
	
	if(input_item_o7_val>3000 || input_item_o7_val < 0) {
		alert("값이 올바르지 않습니다. 0~3000 범위 안에서만 입력해주세요.");
		$("#input_item_o7_val").val("");
		$("#input_item_o7_val").focus();
		return;
		
	} else if(input_item_o7_val<=3000 && input_item_o7_val >= 0) {
		alert("값을 넘겨받았습니다.");
		$("span#item_o7_val").text(input_item_o7_val);
		$("input#item_o7_val").val(input_item_o7_val);
	}
} 



function option8_change() {
	
	let input_item_o8_val = $("#input_item_o8_val").val().trim();
	
	if(input_item_o8_val>3000 || input_item_o8_val < 0) {
		alert("값이 올바르지 않습니다. 0~3000 범위 안에서만 입력해주세요.");
		$("#input_item_o8_val").val("");
		$("#input_item_o8_val").focus();
		return;
	} else {
		alert("값을 넘겨받았습니다.");
		$("span#item_o8_val").text(input_item_o8_val);
		$("input#item_o8_val").val(input_item_o8_val);
	}


}



function show_div() {
	
    var div = document.getElementById('input_coin');
    var item_box_radius_footer = document.getElementById('item_box_radius_footer');
    div.style.display = 'block'; // div를 보여줍니다.
    item_box_radius_footer.style.display = 'none';
	
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

<jsp:include page="../items/loading.jsp"/>



<!-- header 다희 코드 -->
    <div id="header">
  
    	<div id="header1">
	    	<div id="header-img1">
	    		<img alt="" src="../resources/images/deco_bg_1.png">
	    	</div>
	    	<div id="header-img1">
	    		<img alt="" src="../resources/images/deco_bg_1.png">
	    	</div>
	    	<div id="header-img1">
	    		<img alt="" src="../resources/images/deco_bg_1.png">
	    	</div>
	    	<div id="header-img1">
	    		<img alt="" src="../resources/images/deco_bg_1.png">
	    	</div>
	    	<div id="header-img1">
	    		<img alt="" src="../resources/images/deco_bg_1.png">
	    	</div>
	    	<div id="header-img1">
	    		<img alt="" src="../resources/images/deco_bg_1.png">
	    	</div>
	    	<div id="header-img1">
	    		<img alt="" src="../resources/images/deco_bg_1.png">
	    	</div>
	    	<div id="header-img1">
	    		<img alt="" src="../resources/images/deco_bg_1.png">
	    	</div>
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
	                    <a style="cursor: pointer;" href="#"> 
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
	                	<img src="../resources/images/who.PNG">${ user.mem_name }
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        <div id="item-search2">
	        <div id="item-box-head-text">
	        	<div id="item-box-head-text-sub">
	        	<img alt="" src="https://i.ibb.co/0YqhDTP/bullet-1.png">
	        	<span style="color: #646464;"><b>아이템 등록</b></span>
	        	<span id="item-box-head-text-sub-font"><b>ㅣ</b></span>
	        	<span id="item-box-head-text2">일반판매, 경매</span>
	        	</div>
	        	<img id="item-box-head-text-img" alt="" src="https://i.ibb.co/7bBf5zC/cc-category-titlepin.png">
	        	<img id="item-box-head-text-img2" alt="" src="https://i.ibb.co/9hhcwxf/titleline.png">
	        	<img id="item-box-head-text-img3" alt="" src="https://i.ibb.co/7bBf5zC/cc-category-titlepin.png">
	        </div>
		<div>
		    <div class="tab-box">
		        <div class="tabs">
		        <ul id="search-tab-list">
		            <!-- 페이지 별로 active를 따로 줘야함 -->
		            <li class="cate-box cate1 active"><a href="#" >아이템 찾기</a></li>
		            <li class="cate-box" onclick="buy_list();"><a>나의 구매 현황</a></li>
		            <li class="cate-box" onclick="sell_list();"><a>나의 판매 현황</a></li>
		            <li class="cate-box cate4">
		                <a  href="#">찜</a>
		            </li>
		        </ul>
		        </div>
		        <div class="sell-btn">
                        <a href="#" id="sell-link">아이템을 등록해주세요</a>
                </div>    
		    </div>    
		</div>
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
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
    <div id="main-content" style="padding-top: 10px;">
        
        <div id="item-search">
        
        
            <div class="search-tab">
            	<c:if test="${ vo.item_idx == null }">
           		<div id="side-btn">
           			<span>&ensp;STEP 1&ensp;</span>
           		</div>
            	</c:if>
            	<c:if test="${ vo.item_idx != null }">
           		<div id="side-btn2">
           			<span>&ensp;✓&ensp;</span>
           		</div>
            	</c:if>
            
            
                <div class="tab-label">
                    <span style="color: #B89971; font-size: 15px;">게임 & 모드</span>
                </div>
                
                <div class="game-mode">
                    <div class="mode">
                        <div class="mode-title">
                            <div class="mode-sub">
                                <span style="color: #666666; font-size: 12px;">Game</span>
                            </div>
                            <div style="color: #8D795C;">레저렉션 (D2R)</div>
                        </div>
                    </div>
                    <div class="mode">
                        <div class="mode-title">
                            <div class="mode-sub">
                                <span style="color: #666666; font-size: 12px;">Platform</span>
                            </div>
                            <div style="color: #8D795C;">PC</div>
                        </div>
                    </div>
                    <div class="mode">
                        <div class="mode-title">
                            <div class="mode-sub">
                                <span style="color: #666666; font-size: 12px;">Server (TimeZone)</span>
                            </div>
                            <div style="color: #8D795C;">아시아 (Asia)</div>
                        </div>
                    </div>
                    <div class="mode">
                        <div class="mode-title">
                            <div class="mode-sub">
                                <span style="color: #666666; font-size: 12px;">Game Type</span>
                            </div>
                            <div style="color: #8D795C;">래더</div>
                        </div>
                    </div>
                    <div class="mode">
                        <div class="mode-title">
                            <div class="mode-sub">
                                <span style="color: #666666; font-size: 12px;">Mode</span>
                            </div>
                            <div style="color: #8D795C;">소프트코어</div>
                        </div>
                    </div>
                </div>            
            </div> <!-- search-tab end -->
                
            <div id="item-filter">
            	<c:if test="${ vo.item_idx == null }">
           		<div id="side-btn">
           			<span>&ensp;STEP 2&ensp;</span>
           		</div>
            	</c:if>
            	<c:if test="${ vo.item_idx != null }">
           		<div id="side-btn2">
           			<span>&ensp;✓&ensp;</span>
           		</div>
            	</c:if>
            
                <div id="filter-title">
                    <span style="color: #B89971; font-size: 15px;">아이템 필터</span>
                </div>
                <div class="filter-box" style="margin-top: -5px;">
                    <div class="filter-box1">
                        <div class="filter-box">
                            <div style="flex: 1;">
                                <div style="position: relative;">
                                    <div style="position: relative; width: 100%">
                                        <div class="search-window">
                                        <span>
                                        <form>
                                            <input id="inputBox" name="item_name" type="text" placeholder="판매할 아이템 이름을 검색하세요.">
                                            <button id="inputBox_x" type="reset">
                                           		<img src="../resources/images/X.png" alt="버튼 이미지" style="width: 15px; height: 15px;">
                                            </button>
                                            <input type="image" src="../resources/images/search_sell.png" value="submit" onclick="send(this.form);" class="search-btn">
                                        </span>
                                        </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="flex: 1;">
                            
                            </div>                
                        </div>
                        

                    </div>
                </div>
            </div> <!-- item-filter end -->
            
        
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

		<c:if test="${ vo.item_idx != null }">
		
		<audio id="myAudio2">
        	<source src="../resources/sound/identify.mp3" type="audio/mpeg">
    	</audio>
    	
    	<script>
			const audio = document.getElementById('myAudio2');
		
		    setTimeout(function() {
		        audio.volume = 0.3;
		        audio.play();
			}, 300);
		</script>
		
		
		
		<!-- item_trade_list -->
		
<div id="item-box">


	        <div class="tab-label">
            	<span style="color: #B89971; font-size: 15px;">상세 옵션 설정</span>
            </div>
                
            
            <div id="item-box-radius-head">
                <c:if test="${ vo.item_idx != null }">
           		<div id="side-btn">
           			<span>&ensp;STEP 3&ensp;</span>
           		</div>
           		</c:if>
            	<div id="item-box-radius-head-children">
            		<img alt="" src="../resources/images/말풍선.png">
            	</div>
            	<div id="item-box-radius-head-children2">
            		<span>아이템 상세 옵션을 설정하세요.</span>
            	</div>
            </div>
            
            
            <!-- 아이템 둘러싸여있는 항목 -->
            <div id="item-box-radius">
            
            
                
                
                
			<div id="item-image-box">
			<img src="../resources/images/${ vo.item_image }">
			</div>
			<div id="item-box2">
				<div id="gibon_option_font">
				<div class="item_tag"><a class="btn-0">&ensp;${ vo.item_type }&ensp;</a></div>
				
				<c:if test="${ vo.item_rarity == '유니크' }">
				<div id="item_name_gongback"><span id="item_name"><b>${ vo.item_name }</b></span></div><br>
				</c:if>
				<c:if test="${ vo.item_rarity == '세트' }">
				<div id="item_name_gongback"><span id="item_name-set"><b>${ vo.item_name }</b></span></div><br>
				</c:if>
				
				<hr>
				<div class="item_tag"><a class="btn-0">&ensp;${ vo.item_grade }&ensp;</a>
				
				
				<c:if test="${ vo.item_rarity == '유니크' }">
				<a class="btn-1">&ensp;${ vo.item_rarity  }&ensp;</a></div>
				</c:if>
				
				<c:if test="${ vo.item_rarity == '세트' }">
				<a class="btn-7">&ensp;${ vo.item_rarity  }&ensp;</a></div>
				</c:if>
				<hr>
				
				
				<c:if test="${ vo.item_im != null }">
				<div class="modal-text" id="modali" data-toggle="modal" data-target="#myModali">
					<span id="item_im2"><img src="../resources/images/pencil.png">&nbsp;&nbsp;</span><span id="item_im" data-value="item_im">${ vo.item_im }</span><br>
				</div>
				
				<!-- 모달 -->
				<div id="myModali" class="modal fade" role="dialog">
				  <div class="modal-dialog">
				
				    <!-- 모달 내부 내용 -->
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">수리여부 변경</h4>
				      </div>	
				      <div class="modal-body">
				      
				      	<select id="input_item_im" name="input_item_im">
				      		<option value="수리가능">수리가능</option>
				      		<option value="수리불가">수리불가</option>
				      	</select>
						
				        <input type="button" id="im_change_button1" value="적용" onclick="im_change();">  
				        
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				
				  </div>
				</div>
			</c:if>		
				
				
				
				<c:if test="${ vo.item_shot != null }">
				<div class="modal-text" id="modals" data-toggle="modal" data-target="#myModals">
					<span id="item_shot2"><img src="../resources/images/pencil.png"></span>&nbsp;&nbsp;<span id="item_shot" data-value="item_shot">${ vo.item_shot }</span>소켓<br>
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
			</c:if>
				</div>
			</div>
			
			
			


		
		
				
				
				
			
			
			
			
			
			
			
			
			
			
			
			
			<div id="item-box3">
				<div id="gibon_option_font">
				
				
				<!-- 해당 값에 값이 0이거나 이름이 null이라면 출력하지 않겠다. -->
				<c:if test="${ vo.gibon_option1_name != null }">
				<!-- 기본 옵션1번 변경 모달 -->
				<!-- 모달 버튼 -->
				
				
				<div class="modal-text" id="modal" data-toggle="modal" data-target="#myModal">
					&nbsp;<img src="../resources/images/pencil.png">&nbsp;&nbsp;${ vo.gibon_option1_name }
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
				      
				      
				      	🖋️ ${ vo.gibon_option1_name }
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
				
				
				<div class="modal-text" id="modal2" data-toggle="modal" data-target="#myModal2">
					&nbsp;<img src="../resources/images/pencil.png">&nbsp;&nbsp;${ vo.gibon_option2_name }
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
				
				
				<div class="modal-text" id="modal3" data-toggle="modal" data-target="#myModal3">
					&nbsp;<img src="../resources/images/pencil.png">&nbsp;&nbsp;${ vo.gibon_option3_name }
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
				
				
				<div class="modal-text" id="modal4" data-toggle="modal" data-target="#myModal4">
					&nbsp;<img src="../resources/images/pencil.png">&nbsp;&nbsp;${ vo.gibon_option4_name }
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
				
				
				<div class="modal-text" id="modal5" data-toggle="modal" data-target="#myModal5">
					&nbsp;<img src="../resources/images/pencil.png">&nbsp;&nbsp;${ vo.gibon_option5_name }
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
				
				
				<div class="modal-text" id="modal6" data-toggle="modal" data-target="#myModal6">
					&nbsp;<img src="../resources/images/pencil.png">&nbsp;&nbsp;${ vo.gibon_option6_name }
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
				
				
				<div class="modal-text" id="modal7" data-toggle="modal" data-target="#myModal7">
					&nbsp;<img src="../resources/images/pencil.png">&nbsp;&nbsp;${ vo.gibon_option7_name }
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
				
				
				<div class="modal-text-option" id="modal1_1" data-toggle="modal" data-target="#myModal1_1">
					&nbsp;<img src="../resources/images/pencil.png">&nbsp;&nbsp;${ vo.option_name1 }
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
				
				
				<div class="modal-text-option" id="modal1_2" data-toggle="modal" data-target="#myModal1_2">
					&nbsp;<img src="../resources/images/pencil.png">&nbsp;&nbsp;${ vo.option_name2 }
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
				
				
				<div class="modal-text-option" id="modal1_3" data-toggle="modal" data-target="#myModal1_3">
					&nbsp;<img src="../resources/images/pencil.png">&nbsp;&nbsp;${ vo.option_name3 }
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
				
				
				<div class="modal-text-option" id="modal1_4" data-toggle="modal" data-target="#myModal1_4">
					&nbsp;<img src="../resources/images/pencil.png">&nbsp;&nbsp;${ vo.option_name4 }
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
				
				
				<div class="modal-text-option" id="modal1_5" data-toggle="modal" data-target="#myModal1_5">
					&nbsp;<img src="../resources/images/pencil.png">&nbsp;&nbsp;${ vo.option_name5 }
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
				
				
				<div class="modal-text-option" id="modal1_6" data-toggle="modal" data-target="#myModal1_6">
					&nbsp;<img src="../resources/images/pencil.png">&nbsp;&nbsp;${ vo.option_name6 }
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
				
				
				<div class="modal-text-option" id="modal1_7" data-toggle="modal" data-target="#myModal1_7">
					&nbsp;<img src="../resources/images/pencil.png">&nbsp;&nbsp;${ vo.option_name7 }
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
				
				
				<div class="modal-text-option" id="modal1_8" data-toggle="modal" data-target="#myModal1_8">
					&nbsp;<img src="../resources/images/pencil.png">&nbsp;&nbsp;${ vo.option_name8 }
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












	</div>
	
			<input id="item_box_radius_footer" type="button" class="btn btn-info btn-lg" value="판매 방식 및 가격 설정하기 ↓" onclick="show_div()">
			
			</c:if>
			
            
            <div id="input_coin" style="display: none;">
            <form>
            
			
        		<div id="input_coin-sub1">
        		
        		
        		
        			<div id="input_coin-sub1-1">
        			<span>판매방식</span>
        			<button type="button" class="btn btn-primary2-1 active">●&nbsp;&nbsp;일반판매&nbsp;</button>
        			<button type="button" class="btn btn-primary2-2 active">●&nbsp;&nbsp;경매판매&nbsp;</button>
        			</div>
        			
        			
        			
        			<div id="input_coin-sub1-1">
					<div class="dropdown">
        			<span>판매기간</span>
					    <input type="hidden" name="a_selltime" id="drop-time"> 
						<input id="hadan_dropdown" class="btn dropdown-toggle" type="button"
										data-toggle="dropdown" value="아이템 판매 기간을 선택하세요.">
						<ul class="dropdown-menu" id="sell-time">
							<li><a>3</a></li>
							<li><a>10</a></li>
							<li><a>15</a></li>
							<li><a>30</a></li>
							<li><a>60</a></li>
						</ul>
					</div>
					<hr>
					
					
					<script>
						// jQuery를 사용하여 문서가 준비되면 실행될 함수 설정
						$(document).ready(function() {
							// 드롭다운 메뉴의 각 항목을 클릭했을 때의 처리
							$('#sell-time a').click(function() {
								// 클릭된 항목의 텍스트를 가져와서 버튼의 value로 설정
								var selectedText = $(this).text();
								$('#drop-time').val(selectedText);
								$('#hadan_dropdown').val("판매기간을 " + selectedText+"분으로 설정합니다.");
							});
						});
						
						const input = document.querySelector('#coin_sell_input');
						input.addEventListener('keyup', function(e) {
						  let value = e.target.value;
						  value = Number(value.replaceAll(',', ''));
						  if(isNaN(value)) {         //NaN인지 판별
						    input.value = 0;   
						  }else {                   //NaN이 아닌 경우
						    const formatValue = value.toLocaleString('ko-KR');
						    input.value = formatValue;
						  }
						})
						
						
					</script>
					
					
        			</div>
        			
        			<div id="input_coin-sub1-3">
        				<span>* 아이템 판매 등록 시 반드시 보유하고 있는 아이템을 등록하며, 구매자가 있으면 반드시 인계해야 합니다.</span><br>
        				<span>* 구매자가 있을 때 장시간 연락이 안되거나 아이템 인계를 거부하면 사이트 이용 제재를 받을 수 있습니다.</span><br>
        				<span>* 허위 또는 임의 아이템 편법 거래 시 사이트 이용 제재를 받을 수 있습니다.</span><br>
        				<label id="filsu">
						    <input id="switch" role="switch" type="checkbox"/>
						    <span id="filsu_text">필수 *</span><span id="filsu_text2">ㅣ 위 안내를 읽고 이해했으며 진행 방식에 동의합니다.</span>
					    </label>
        			</div>
        			
        		</div>
        		
        		
        		
        		
        		
        		
        		<div id="input_coin-sub2">
        			<div id="input_coin-sub1-2">
        			
	        			<div id="coin_sell_price">
	        			<span id="coin_sell_price_text1">즉시 구매가</span>
	        				
		        			<input id="coin_sell_input" type="text" name="a_direct_price" 
		        			placeholder="0" style="text-align:right;">
		        			
		        			<!-- oninput="formatNumber();" -->
		        			
							<img src="https://i.ibb.co/85LjcPV/image.jpg" alt="image" border="0"
							id="coin_sell_price_img">
							
							<span id="coin_sell_price_text2">CP</span>
	        			</div>
        			</div>
        			
        			
        			<div id="input_coin-sub1-2">
        			
	        			<div id="coin_sell_price">
	        			<span id="coin_sell_price_text1">최초 입찰가</span>
	        			
		        			<input id="coin_sell_input2" type="text" name="a_initial_price" 
		        			placeholder="0" style="text-align:right;">
		        			
		        			<!-- oninput="formatNumber2();" -->
		        			
							<img src="https://i.ibb.co/85LjcPV/image.jpg" alt="image" border="0"
							id="coin_sell_price_img">
							<span id="coin_sell_price_text2">CP</span>
	        			</div>
	        			<hr>
						
        			</div>
        			
        			

        			

		
		
		
    		</div><!-- // end:item_box -->
    		
    		
    		
    		        			
				<!-- 아이템 table 공유해서 넘겨주는 공식 (어떤 테이블이여도 가능) ---중요도★10000--- -->
				
				
			    <!-- user 정보 넘기기 -->
				<input type="text" id="mem_idx" name="mem_idx" value="${ user.mem_idx }">
				<input type="text" id="mem_name" name="mem_name" value="${ user.mem_name }">
				<input type="text" id="mem_point" name="mem_point" value="${ user.mem_point }">

				
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
				
				<!-- ★이미지 수리가능 여부 넘겨주기★ -->
				<input type="hidden" name="item_im" id="item_im" value="${ vo.item_im }">
				
				<!-- ★이미지 소켓 넘겨주기★ -->
				<input type="hidden" id="item_shot" name="item_shot" value="${ vo.item_shot }">
				
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
				

				
				<input id="reset_footer_btn" type="button" class="btn btn-info btn-lg" value="모두 초기화" onclick="location.href='sell_reg.do'">
				<input id="sell_footer_btn" type="button" class="btn btn-info btn-lg" value="지금 판매 등록하기" onclick="sell_reg_data(this.form);">
		</form>
            
            
		
		

</div>
<jsp:include page="../items/footer.jsp"/>		
</body>
</html>