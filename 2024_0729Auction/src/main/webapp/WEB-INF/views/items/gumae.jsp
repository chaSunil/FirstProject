<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/bid_reg_form.css">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>

<script type="text/javascript">

// jQuery 초기화
$(document).ready(function(){
	
	//showMessage();
	setTimeout(showMessage,100); // 0.1초후에 메시지 띄워라
	
}); // end - ready()

function showMessage() {
	
	if("${ param.reason == 'fail_gumae' }" == "true") {
		alert("구매에 필요한 DP가 부족합니다. 확인해주세요!")
		
	}
	
	if("${ param.reason == 'fail_auction' }" == "true") {
		alert("입찰에 필요한 DP가 부족합니다. 확인해주세요!")
		
	}
}

</script>


<script type="text/javascript">	
	function buy(item_idx) {
		
		//const hiddenPrice = document.querySelector("#hiddenPrice").value;
		
		const a_direct_price  = $("#a_direct_price").val();
		const gumae_mem_idx = $("#gumae_mem_idx").val();
		const panmae_mem_idx = $("#panmae_mem_idx").val();
		const mem_point = $("#mem_point").val();
		const a_idx = $("#a_idx").val();
		
		if(gumae_mem_idx == panmae_mem_idx) {
			alert("구매자 계정이 판매자 계정과 동일하여, 구매가 불가능합니다.");
			return;
		}
		
		
		if(confirm("정말 구매하시겠습니까? 구매시 가지고 있는 DP가 차감이 됩니다.") == false) {
			alert("구매가 취소되었습니다.");
			return;
		}
		
		
		location.href="../items/gumae_check.do?item_idx=" + item_idx + "&a_direct_price=" + a_direct_price +
				"&gumae_mem_idx=" + gumae_mem_idx + "&panmae_mem_idx=" + panmae_mem_idx + 
				"&mem_point=" + mem_point + "&a_idx=" + a_idx;
		//location.href="../items/gumae_check" + a_direct_price;
	}
	
	
	
	
	
	
	function bid() {
		
		const bidding_point = $("#additional-amount").val();
		const a_idx = $("#a_idx").val();
		const item_idx = $("#item_idx").val();
		const mem_point = $("#mem_point").val();
		const a_initial_price = $("#a_initial_price").val();
		const gumae_mem_idx = $("#gumae_mem_idx").val();
		const auction_mem_idx = $("#auction_mem_idx").val();
		const gumae_mem_name = $("#gumae_mem_name").val();
		
		if(confirm("정말 입찰하시겠습니까? 입찰시 가지고 있는 DP가 차감이 됩니다.") == false) {
			alert("입찰이 취소되었습니다.");
			return;
		}
		
		if(gumae_mem_idx == panmae_mem_idx) {
			alert("구매자 계정이 판매자 계정과 동일하여, 입찰이 불가능합니다.");
			return;
		}
		
		if(bidding_point < a_initial_price) {
			alert("기존 입찰가보다 낮은 입찰가로 입찰 할 수 없습니다.");
			return;
		}
		
		location.href = "../items/auction_check.do?bidding_point=" + bidding_point  + "&a_idx=" + a_idx +
				"&item_idx=" + item_idx + "&mem_point=" + mem_point + "&a_initial_price=" + a_initial_price +
				"&gumae_mem_idx=" + gumae_mem_idx + "&auction_mem_idx=" + auction_mem_idx + "&gumae_mem_name=" + gumae_mem_name;
		
/* 		$.ajax({
			url		:	"bid_reg_data.do",
			data	:	{"bidding_point":bidding_point},
			success	:	function(res_data){
				
				location.reload(); // 페이지를 새로고침
			},
			error	:	function(err){
				alert(err.responseText)
			}
		}); */
	}
	
</script>

<script type="text/javascript">

	function startTimer(duration, display) {
		var timer = duration, minutes, seconds;

	    // 저장된 타이머 값이 있는 경우 로드
	    if (localStorage.getItem('remainingTime')) {
	        timer = parseInt(localStorage.getItem('remainingTime'), 10);
	    }

	    var interval = setInterval(function () {
	        minutes = parseInt(timer / 60, 10);
	        seconds = parseInt(timer % 60, 10);

	        minutes = minutes < 10 ? "0" + minutes : minutes;
	        seconds = seconds < 10 ? "0" + seconds : seconds;

	        display.textContent = minutes + "분 " + seconds + "초";

	        if (--timer < 0) {
	            clearInterval(interval);
	            timer = 0;
	            localStorage.removeItem('remainingTime');
	        } else {
	            localStorage.setItem('remainingTime', timer);
	        }
	    }, 1000);
	}
	
	window.onload = function () {
	    var timerMinutes = 60 * "${ a_selltime }"/* 변수값 불러오기 */,
	        display = document.querySelector('#time');
	    // 초기 표시를 비워놓고 타이머를 설정하는 동안 잠시 동안 숨기기
	    display.textContent = '로딩 중...';

	    // 0.5초 후에 타이머를 시작
	    setTimeout(function() {
	        startTimer(timerMinutes, display);
	    }, 500);
	};
</script>


</head>
<body>





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
	            <img alt="" src="../resources/images/디션.png" onclick="location.href='list.do'">
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
           	        <c:if test="${ user.mem_name != null }">
                	<img src="../resources/images/who.PNG">${ sessionScope.user.mem_name }
                	<a id="logout" href="../member/logout.do">로그아웃</a>
	                </c:if>
	                <c:if test="${ user.mem_name == null }">
	                	<img src="../resources/images/who.PNG">비회원
	                </c:if>
	                </a>
	                <a id="who" onclick="blink();" style="cursor:pointer;">
	                <c:if test="${ user.mem_name != null }">
	                	<img src="https://i.ibb.co/85LjcPV/image.jpg" alt="image" border="0">
	                	보유 CP : <span><fmt:formatNumber type="currency" value="${ sessionScope.user.mem_point }" currencySymbol=""/></span>
	                </c:if>
	               
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

	<div id="bid-box">
		<div id="bid-title">
			<span style="margin-right: 710px;">no.${ items.item_idx } ${ items.item_name }</span>
			<span style="font-size: 15px;">${ items.mem_name }</span>
		</div>
		<br>
		<div id="bid-content">
			<div class="item-info">
				<div id="selltime-info">
					<div id="reg-start" class="reg">
						판매시작 &nbsp;&nbsp;&nbsp;&nbsp; ${ fn:substring(items.a_regtime,0,19) }		
					</div>
					<hr>
					<div id="reg-end" class="reg">
						판매종료  &nbsp;&nbsp;&nbsp;&nbsp;  ${ fn:substring(items.a_endtime,0,19) }	
						<span id="countdown"></span>
					</div>
				</div>
				
				
<c:set var="endTime" value="${fn:substring(items.a_endtime, 0, 19)}" />                    
				
<!-- JavaScript를 사용하여 남은 시간 계산 -->
<script>
    // 종료 시간을 Date 객체로 변환 (UTC로 변환)
    var endTime = new Date("${endTime}".replace(" ", "T") + "Z"); // UTC 시간으로 변환

    // 한국 시간(KST)을 고려하여 9시간 추가
    endTime.setHours(endTime.getHours() - 9);

    function updateCountdown() {
        var now = new Date();
        var timeRemaining = endTime - now; // 남은 시간 (밀리초)

        if (timeRemaining > 0) {
            // 남은 시간 계산
            var seconds = Math.floor((timeRemaining / 1000) % 60);
            var minutes = Math.floor((timeRemaining / (1000 * 60)) % 60);
            var hours = Math.floor((timeRemaining / (1000 * 60 * 60)) % 24);
            var days = Math.floor(timeRemaining / (1000 * 60 * 60 * 24));

            // 마감까지 남은 시간 출력
            document.getElementById("countdown").innerText = days + "일 " + hours + "시간 " + minutes + "분 " + seconds + "초";
        } else {
            document.getElementById("countdown").innerText = "종료되었습니다.";
        }
    }

    // 1초마다 카운트다운 업데이트
    setInterval(updateCountdown, 1000);
    updateCountdown(); // 초기 호출
</script>




<div id="countdown"></div>

즉시구매가<input type="text" id="a_direct_price" value="${ items.a_direct_price }">
<!-- 구매자 idx 가져오기 -->
현재 구매자 idx<input type="text" id="gumae_mem_idx" value="${ user.mem_idx }">

<!-- 구매자 name 가져오기 -->
현재 구매자 이름 idx<input type="text" id="gumae_mem_name" value="${ user.mem_name }">

<!-- 판매자 idx 가져오기 -->
판매자 idx<input type="text" id="panmae_mem_idx" value="${ items.mem_idx }">
<!-- 구매자가 가지고 있는 금액 가져오기 -->
가지고 있는 포인트<input type="text" id="mem_point" value="${ user.mem_point }">
거래번호 <input type="text" id="a_idx" value="${ items.a_idx }">
아이템 번호 <input type="text" id="item_idx" value="${ items.item_idx }">

옥션 최근 입찰자<input type="text" id="auction_mem_idx" value="${ items.gumae_mem_idx }">


옥션 입찰가<input type="text" id="a_initial_price" value="${ items.a_initial_price }">



	

				<div id="main-info">
					<div id="item-image-box">
						<img src="../resources/images/${ items.item_image }">
					</div>
					<div id="item-box2">
						<div id="gibon_option_font">
							<span>거래번호 : ${ items.item_idx }</span><br>
							<div class="item_tag">
								<a class="btn-0">&ensp;${ items.item_type }&ensp;</a>
							</div>
							<div id="item_name_gongback">
								<span id="item_name"><b>${ items.item_name }</b></span>
							</div>
							<br>
							<hr>
							<div class="item_tag">
								<a class="btn-0">&ensp;${ items.item_grade }&ensp;</a> 
								
							<c:if test="${ items.item_rarity == '유니크' }">
							<a class="btn-1">&ensp;${ items.item_rarity  }&ensp;</a>
							</c:if>
							
							<c:if test="${ items.item_rarity == '세트' }">
							<a class="btn-7">&ensp;${ items.item_rarity  }&ensp;</a>
							</c:if>
							
							
							
							</div>
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
				</div>
				
			</div>

				<div id="usercard-cp">
					<div id="usercard-cp2">
						<img src="https://i.ibb.co/85LjcPV/image.jpg" alt="image" border="0">
					</div>
					<div id="usercard-cp3">
						<span>즉시 구매가</span>
					</div>
					<div id="usercard-cp4">
						<span></span>
					</div>
					<div id="usercard-cp5">
						<span><fmt:formatNumber type="currency" value="${ items.a_direct_price }" currencySymbol=""/></span>
					</div>
					<div id="usercard-cp6">
						<span>CP</span>
					</div>
					<div id="usercard-cp7">
						<input type="button" class="btn btn-warning" value="즉시구매" onclick="buy('${ items.item_idx }');">
					</div>
					
				</div>
				<div id="usercard-cp">
					<div id="usercard-cp2">
						<img src="https://i.ibb.co/85LjcPV/image.jpg" alt="image" border="0">
					</div>
					<div id="usercard-cp3">
						<span>현재 입찰가</span>
					</div>
					<div id="usercard-cp4">
						<span></span>
					</div>
					<div id="usercard-cp5">
						<span><fmt:formatNumber type="currency" value="${ items.a_initial_price }" currencySymbol=""/></span>
					</div>
					<div id="usercard-cp6">
						<span>CP</span>
					</div>
					<div id="usercard-cp7">
						<input type="button" class="btn btn-danger" value="입찰하기"
							onclick="bid();">
					</div>
				</div>
				<div id="usercard-cp">
					<div id="usercard-cp2">
						<img src="https://i.ibb.co/85LjcPV/image.jpg" alt="image" border="0">
					</div>
					<div id="usercard-cp3">
						<span>현재 입찰가</span>
					</div>
					<div id="usercard-cp4">
						<span></span>
					</div>
					<div id="usercard-cp5">
						<span>${ items.gumae_mem_name }</span>
					</div>
					<div id="usercard-cp6">
						<span>CP</span>
					</div>
					<div id="usercard-cp7">
						<input type="button" class="btn btn-danger" value="입찰하기"
							onclick="bid();">
					</div>
				</div>
				<div id="bid-btn">
					<div style="margin-left: 650px; color: #999999;">추가 입찰할 만큼의 금액을 클릭하거나 입력하세요.</div>
					<hr style="margin-left: 650px; margin-bottom: 3px;">
					<input type="text" id="additional-amount" value="0">                  
                    <input type="button" class="btn" value="5000CP" onclick="bidding_button('5000');">
                    <input type="button" class="btn" value="1000CP" onclick="bidding_button('1000');">
                    <input type="button" class="btn" value="500CP" onclick="bidding_button('500');">
					<input type="button" class="btn" value="100CP" onclick="bidding_button('100');">
					<input type="button" class="btn" value="초기화" onclick="reset();">
				</div>
			<script>
				// 클릭된 버튼의 값을 입력 필드에 추가하는 함수
				function bidding_button(amount) {
					// 입력 필드를 가져옵니다.
					var inputField = document
							.getElementById('additional-amount');

					// 입력 필드의 현재 값과 클릭된 버튼의 값을 더하여 업데이트합니다.
					var currentValue = parseInt(inputField.value); // 기존 값 정수로 변환
					var newValue = currentValue + parseInt(amount); // 새로운 값 계산

					// 입력 필드에 새로운 값을 설정합니다.
					inputField.value = newValue;
				}
				
				function reset() {
					var inputField = document.getElementById('additional-amount');
					
					inputField.value = 0;
				}
				
			</script>
		</div>	
	</div>
</body>
</html>