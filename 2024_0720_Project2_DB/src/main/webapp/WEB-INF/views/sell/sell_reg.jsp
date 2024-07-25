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
			url  : "../sell/get_item.do",
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
		
		f.action = "../sell/sell_reg_search.do";// 전송대상(PhotoInsertAction)
		f.submit();
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
			<button type="button" class="btn btn-primary active">?&nbsp;&nbsp; ${ requestScope.vo.item_name }</button>
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
		
		<c:forEach var="items" items="${ requestScope.list }">
        <form>
<div id="item-box">
			<div id="item-image-box">
			<img src="../resources/images/${ items.item_image }">
			</div>
			<div id="item-box2">
				<div id="gibon_option_font">
				<div class="item_tag"><a class="btn-0">&ensp;${ items.item_type }&ensp;</a></div>
				<div id="item_name_gongback"><span id="item_name"><b>${ items.item_name }</b></span></div><br>
				<hr>
				<div class="item_tag"><a class="btn-0">&ensp;${ items.item_grade }&ensp;</a>
				<a class="btn-1">&ensp;${ items.item_rarity  }&ensp;</a></div>
				<span>${ items.item_im }</span><br>
				
				<!-- 소켓 유무에 따른 출력 변화 -->
				<span>${ items.item_shot }소켓</span><br>
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
</body>
</html>