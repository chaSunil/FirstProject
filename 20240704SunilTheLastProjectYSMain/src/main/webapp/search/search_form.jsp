<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/search_css.css">

<!-- Bootstrap -->
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
 
 
<!-- CSS -->
<link rel="stylesheet" href="../css/main.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>

<!-- 검색기능 넣기 이이이이이이이 선일작업 -->
<script type="text/javascript">

   var inputSource =[]; 

   $(function(){
	   
   	$.ajax({
   		url  : "../search/getlist.do",
   		dataType:"json",
   		success:function(res_data){
   			//res_data = eval(res_data);
   			//res_data = {"result":  ['스플렌더', '스컬킹', '윙스팬', '스페이스크루', '7원더스'] };
   			//inputSource = res_data.result;
   			console.log(res_data.result);
   			
   			for(let data of res_data.result){
   				inputSource.push(data);
   			}
   			
   			console.log(inputSource);
   			
   		},
   		error:function(err){
   			alert(err.responseText);
   		}
   	});
	   
   });


</script>
<!-- 검색기능 넣기 이이이이이이이 선일작업 end -->

<!-- jquery -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- jquery-ui -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- jquery-ui css -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 



<script type="text/javascript">

$(document).ready(function() {
	/*  // 1초에 한번씩 함수 수행 
	    setInterval(moveImage, 4000);// cf) setTimeout(fn,시간); */
	    // quickmenu의 이미지의 top 위치가 얼마인지 담기
	    var top = parseInt($("#quickmenu img").css("top"));
	    
	    
	    
	    // 상단 메인 메뉴 관리
	    $("li.mainmenu ul").hide(); // 하위메뉴 숨기기
	    $("li.mainmenu").hover(function(){
	        $("ul",this).slideDown(300);
	    }, function(){
	        $("ul",this).slideUp(300);
	    });
	    
	 	// 카테고리 박스 함수
	    $(".side-menu ul").hide(); // 하위메뉴 숨기기
	   
	   $(".side-menu").hover(function(){
	       $("ul",this).show(0);
	   }, function(){
	       $("ul",this).hide(0);
	   }); 
	    
		// 회원 전용 사이드바 작업 선일 //
	   	// overlay는 웹페이지 아무곳이나 누르면 사이드바 사라지게 하는 설정 //
	   	$("#love-icon").click(function() {
	   	    $("#side_menu").show(500);
	   	    $(".overlay").fadeIn();
	   	});
	   	
	   	$(".overlay").click(function() {
	   	    $("#side_menu").hide(500);
	   	    $(".overlay").fadeOut();
	   	});
	   	
	   	
	});
	
	
	function blink() {
		document.getElementById("love").src = "image/love2.png";
	}

</script>

<script>

    //var $112 = $.noConflict(true);
 

	/* 검색 자동완성 로직 start */
    $(document).ready(function() {
    	/* requestScope중 list 값이 없으면 만들어라 */
    	/* if("${ empty list }" == "true") {
        	location.href = "../search/getlist.do";
    	} else {
        // 서버에서 받아온 list 데이터를 JavaScript 배열로 변환
        var inputSource = [];
        
        <c:forEach var="item" items="${list}">
            inputSource.push("${item.name}");
        </c:forEach>
        
    	}
    	 */
    	
    	
        /* var inputSource = ['스플렌더', '스컬킹', '윙스팬', '스페이스크루', '7원더스']; */

        $('#inputBox').autocomplete({
            source : inputSource,
            minLength : 0
        });
        
        var inputBox = document.querySelector('#inputBox');
        inputBox.addEventListener("focus", downArrow);

    });

    function downArrow() {
        var event = document.createEvent("Event");
        event.initEvent("keydown", true, true);
        event.keyCode = 40
        document.getElementById("inputBox").dispatchEvent(event);
    };
	
		
	function send(f) {
		
		// 입력값 검증
		let name = f.name.value.trim();
		
		if(name=='') {
			alert("검색어를 입력하세요!")
			f.name.value = "";
			f.name.focus();
			return;
		}
		
		f.action = "../search/list.do";// 전송대상(PhotoInsertAction)
		f.submit();
	}
		
    
</script>

</head>
<body>


	<div id="main-head">
	    <!-- 상단 헤더 선일 작업 start 06.28 로그인, 회원가입 기능, session -->
	    <div id="head">
	            <a href="../main/list.do">
	                <img id="logo" src="image/logo.png">
	            </a>
	    <div id="search">
	    	<form>
          	  <input type="text" id="inputBox" name="name" class="form-control search" placeholder="검색창"/>
			  <input type="submit" onclick="send(this.form)" value="검색" id="search_chang">
			</form>
        </div>
        
        
	        <div id="login-main">
	            <div id="login-btn">
	            <!-- 로그인 화면 전환 -->
	            <!-- 로그인 안되었을 때 session ~~ -->
	            <c:if test="${ empty sessionScope.user }">
	                <a href="../member/login_form.do">로그인</a>
	                <a href="../member/insert_form.do">회원가입</a>
	            </c:if>
	            <!-- 로그인 되었을 때 session 살리기~~ -->
	            <c:if test="${ not empty sessionScope.user }">
	            	<span id="user_ment">${ sessionScope.user.mem_nickname }님</span>
	            <!-- 로그아웃시 실행될 onclick 함수 -->
	                <a id="logout" style="cursor:pointer;">로그아웃</a>
	            </c:if>
	            <!-- 로그인 계정이 관리자일 경우 회원관리 버튼 생성 -->
	            <c:if test="${ user.mem_grade eq '관리자' }">
	                <a href="../member/list.do">회원관리</a>
	            </c:if>
	            <c:if test="${ user.mem_grade eq '일반' }">
	            	<a onclick="location.href='../member/modify_form.do?mem_idx=${user.mem_idx}'"
	            	 style="cursor:pointer;">내정보</a>
	            </c:if>
	            
	            <div class="login-icon">
	                <a id="love-icon" style="cursor:pointer;">
	                    <img src="image/user_icon.png">
	                </a>
	            </div>
	            <div class="login-icon">
                    <img id="love" src="image/love.png" onclick="blink();" style="cursor:pointer;">
	            </div>
	            </div>
	        </div>
	    </div>
	    <!-- 상단 헤더 end 선일 작업 -->
	    
<!-- 헤더 탭 코드-->	
<div id="header-tap">
	<ul id="header-tap-list">
		<li class="side-menu">
			<img id="tab-img" src="../image/sidemenu.png">
			<ul>
				<li class="cate-box cate-box0">
					<a href="../photo/allGame.do">전체게임</a>
				</li>
				<li class="cate-box cate-box1 f-1">
					<a href="../photo/category.do?sub_p_category=가족게임&sub_p_page=family">가족게임</a>
					<ul>
						<li class="cate2 c2-box1 f-2"><a href="../assessment/list.do?a_cate=f-1">스플렌더</a></li>
						<li class="cate2 c2-box2 f-2"><a href="../assessment/list.do?a_cate=f-2">스컬킹</a></li>
						<li class="cate2 c2-box3 f-2"><a href="../assessment/list.do?a_cate=f-3">윙스팬</a></li>
						<li class="cate2 c2-box4 f-2"><a href="../assessment/list.do?a_cate=f-4">스페이스 크루</a></li>
						<li class="cate2 c2-box5 f-2"><a href="../assessment/list.do?a_cate=f-5">7 윈더스</a></li>
						<li class="cate2 c2-box6 f-2"><a href="../assessment/list.do?a_cate=f-6">에버델</a></li>
						<li class="cate2 c2-box7 f-2"><a href="../assessment/list.do?a_cate=f-7">티켓 투 라이드</a></li>
						<li class="cate2 c2-box8 f-2"><a href="../assessment/list.do?a_cate=f-8">카르카손</a></li>
						<li class="cate2 c2-box9 f-2"><a href="../assessment/list.do?a_cate=f-9">크베들린부르크의 돌팔이 약장수</a></li>
						<li class="cate2 c2-box10 f-2"><a href="../assessment/list.do?a_cate=f-10">카탄의 개척자</a></li>
					</ul>
				</li>
				<li class="cate-box cate-box2 k-1">
					<a href="../photo/category.do?sub_p_category=어린이게임&sub_p_page=kid">어린이게임</a>
						<ul>
						<li class="cate2 c2-box1 k-2"><a href="../assessment/list.do?a_cate=k-1">마헤</a></li>
						<li class="cate2 c2-box2 k-2"><a href="../assessment/list.do?a_cate=k-2">코코너츠</a></li>
						<li class="cate2 c2-box3 k-2"><a href="../assessment/list.do?a_cate=k-3">피그 파일</a></li>
						<li class="cate2 c2-box4 k-2"><a href="../assessment/list.do?a_cate=k-4">슈퍼 라이노</a></li>
						<li class="cate2 c2-box5 k-2"><a href="../assessment/list.do?a_cate=k-5">핑고 핑고</a></li>
						<li class="cate2 c2-box6 k-2"><a href="../assessment/list.do?a_cate=k-6">생쥐 만세!</a></li>
						<li class="cate2 c2-box7 k-2"><a href="../assessment/list.do?a_cate=k-7">카탄 : 주니어</a></li>
						<li class="cate2 c2-box8 k-2"><a href="../assessment/list.do?a_cate=k-8">슈퍼 라이노 : 슈퍼 배틀</a></li>
						<li class="cate2 c2-box9 k-2"><a href="../assessment/list.do?a_cate=k-9">숨바꼭질 왕국</a></li>
						<li class="cate2 c2-box10 k-2"><a href="../assessment/list.do?a_cate=k-10">한밤의 파티</a></li>
					</ul> 
				</li>
				<li class="cate-box cate-box3 w-1">
					<a href="../photo/category.do?sub_p_category=워게임&sub_p_page=war">워게임</a>
						<ul>
						<li class="cate2 c2-box1 w-2"><a href="../assessment/list.do?a_cate=w-1">황혼의 투쟁</a></li>
						<li class="cate2 c2-box2 w-2"><a href="../assessment/list.do?a_cate=w-2">반지 전쟁(2판)</a></li>
						<li class="cate2 c2-box3 w-2"><a href="../assessment/list.do?a_cate=w-3">루트</a></li>
						<li class="cate2 c2-box4 w-2"><a href="../assessment/list.do?a_cate=w-4">세키가하라 : 일본의 통일</a></li>
						<li class="cate2 c2-box5 w-2"><a href="../assessment/list.do?a_cate=w-5">패스 오브 글로리</a></li>
						<li class="cate2 c2-box6 w-2"><a href="../assessment/list.do?a_cate=w-6">스타워즈 : X-웡 미니어처 게임</a></li>
						<li class="cate2 c2-box7 w-2"><a href="../assessment/list.do?a_cate=w-7">마리아</a></li>
						<li class="cate2 c2-box8 w-2"><a href="../assessment/list.do?a_cate=w-8">워해머 언더월드 : 나이트 볼트</a></li>
						<li class="cate2 c2-box9 w-2"><a href="../assessment/list.do?a_cate=w-9">메모아 44</a></li>
						<li class="cate2 c2-box10 w-2"><a href="../assessment/list.do?a_cate=w-10">커맨드 & 컬러스 : 고대</a></li>
					</ul> 
				</li>
				<li class="cate-box cate-box4 s-1">
					<a href="../photo/category.do?sub_p_category=전략게임&sub_p_page=strategy">전략게임</a>
						<ul>
						<li class="cate2 c2-box1 s-2"><a href="../assessment/list.do?a_cate=s-1">글룸헤이븐</a></li>
						<li class="cate2 c2-box2 s-2"><a href="../assessment/list.do?a_cate=s-2">테라포밍 마스</a></li>
						<li class="cate2 c2-box3 s-2"><a href="../assessment/list.do?a_cate=s-3">메이지 나이트</a></li>
						<li class="cate2 c2-box4 s-2"><a href="../assessment/list.do?a_cate=s-4">가이아 프로젝트</a></li>
						<li class="cate2 c2-box5 s-2"><a href="../assessment/list.do?a_cate=s-5">팬데믹 레거시 : 시즌 1</a></li>
						<li class="cate2 c2-box6 s-2"><a href="../assessment/list.do?a_cate=s-6">쓰루 디 에이지스 : 문명에 관한 새로운 이야기</a></li>
						<li class="cate2 c2-box7 s-2"><a href="../assessment/list.do?a_cate=s-7">브라스 : 버밍엄</a></li>
						<li class="cate2 c2-box8 s-2"><a href="../assessment/list.do?a_cate=s-8">7 원더스 대결</a></li>
						<li class="cate2 c2-box9 s-2"><a href="../assessment/list.do?a_cate=s-9">푸에르토 리코</a></li>
						<li class="cate2 c2-box10 s-2"><a href="../assessment/list.do?a_cate=s-10">아그리콜라</a></li>
					</ul> 
				</li>
				<li class="cate-box cate-box5 a-3">
					<a href="../photo/category.do?sub_p_category=추상게임&sub_p_page=abstract">추상 게임</a>
						<ul>
						<li class="cate2 c2-box1 a-4"><a href="../assessment/list.do?a_cate=a-1">마작</a></li>
						<li class="cate2 c2-box2 a-4"><a href="../assessment/list.do?a_cate=a-2">워 체스트</a></li>
						<li class="cate2 c2-box3 a-4"><a href="../assessment/list.do?a_cate=a-3">캐스캐디아</a></li>
						<li class="cate2 c2-box4 a-4"><a href="../assessment/list.do?a_cate=a-4">아줄</a></li>
						<li class="cate2 c2-box5 a-4"><a href="../assessment/list.do?a_cate=a-5">인쉬</a></li>
						<li class="cate2 c2-box6 a-4"><a href="../assessment/list.do?a_cate=a-6">패치워크</a></li>
						<li class="cate2 c2-box7 a-4"><a href="../assessment/list.do?a_cate=a-7">우봉고 3D 프로</a></li>
						<li class="cate2 c2-box8 a-4"><a href="../assessment/list.do?a_cate=a-8">리코셰 로봇</a></li>
						<li class="cate2 c2-box9 a-4"><a href="../assessment/list.do?a_cate=a-9">사그라다</a></li>
						<li class="cate2 c2-box10 a-4"><a href="../assessment/list.do?a_cate=a-10">토레스</a></li>
					</ul>
				</li>
				<li class="cate-box cate-box6 c-1">
					<a href="../photo/category.do?sub_p_category=컬렉터블 게임&sub_p_page=collectable">컬렉터블 게임</a>
						<ul>
						<li class="cate2 c2-box1 c-2"><a href="../assessment/list.do?a_cate=c-1">아컴 호러 : 카드게임</a></li>
						<li class="cate2 c2-box2 c-2"><a href="../assessment/list.do?a_cate=c-2">안드로이드 : 넷러너</a></li>
						<li class="cate2 c2-box3 c-2"><a href="../assessment/list.do?a_cate=c-3">마블 챔피언스 : 카드게임</a></li>
						<li class="cate2 c2-box4 c-2"><a href="../assessment/list.do?a_cate=c-4">메이즈 워즈 아레나</a></li>
						<li class="cate2 c2-box5 c-2"><a href="../assessment/list.do?a_cate=c-5">반지의 제왕 : 카드게임</a></li>
						<li class="cate2 c2-box6 c-2"><a href="../assessment/list.do?a_cate=c-6">왕좌의 게임 : 카드게임 (2판)</a></li>
						<li class="cate2 c2-box7 c-2"><a href="../assessment/list.do?a_cate=c-7">안드로이드 : 렛러너 - 데이터와 운명</a></li>
						<li class="cate2 c2-box8 c-2"><a href="../assessment/list.do?a_cate=c-8">서머너 워즈 (2판) 마스터 세트</a></li>
						<li class="cate2 c2-box9 c-2"><a href="../assessment/list.do?a_cate=c-9">마블 다이스 마스터 : 어벤져스 vs. X-men</a></li>
						<li class="cate2 c2-box10 c-2"><a href="../assessment/list.do?a_cate=c-10">히어로클릭스</a></li>
					</ul>
				</li>
				<li class="cate-box cate-box7 t-1">
					<a href="../photo/category.do?sub_p_category=테마게임&sub_p_page=theme">테마게임</a>
					<ul>
						<li class="cate2 c2-box1 t-2"><a href="../assessment/list.do?a_cate=t-1">네메시스</a></li>
						<li class="cate2 c2-box2 t-2"><a href="../assessment/list.do?a_cate=t-2">팬데믹 레거시 : 시즌 2</a></li>
						<li class="cate2 c2-box3 t-2"><a href="../assessment/list.do?a_cate=t-3">글룸헤이븐: 사자의 턱</a></li>
						<li class="cate2 c2-box4 t-2"><a href="../assessment/list.do?a_cate=t-4">스타워즈 : 리벨리온</a></li>
						<li class="cate2 c2-box5 t-2"><a href="../assessment/list.do?a_cate=t-5">광기의 저택 (2판)</a></li>
						<li class="cate2 c2-box6 t-2"><a href="../assessment/list.do?a_cate=t-6">디센트: 어둠속의 여정 (2판)</a></li>
						<li class="cate2 c2-box7 t-2"><a href="../assessment/list.do?a_cate=t-7">엘드리치 호러</a></li>
						<li class="cate2 c2-box8 t-2"><a href="../assessment/list.do?a_cate=t-8">로빈슨 크루소 : 저주받은 섬에서의 모험</a></li>
						<li class="cate2 c2-box9 t-2"><a href="../assessment/list.do?a_cate=t-9">데드 오브 윈터 : 크로스로드 게임</a></li>
						<li class="cate2 c2-box10 t-2"><a href="../assessment/list.do?a_cate=t-10">반지의 제왕: 가운데땅 여정</a></li>
					</ul>
				</li>
				<li class="cate-box cate-box8 p-1">
					<a href="../photo/category.do?sub_p_category=파티게임&sub_p_page=party">파티게임</a>
					<ul>
						<li class="cate2 c2-box1 p-2"><a href="../assessment/list.do?a_cate=p-1">레지스탕스</a></li>
						<li class="cate2 c2-box2 p-2"><a href="../assessment/list.do?a_cate=p-2">라스베가스</a></li>
						<li class="cate2 c2-box3 p-2"><a href="../assessment/list.do?a_cate=p-3">텔레스트레이션</a></li>
						<li class="cate2 c2-box4 p-2"><a href="../assessment/list.do?a_cate=p-4">코드네임</a></li>
						<li class="cate2 c2-box5 p-2"><a href="../assessment/list.do?a_cate=p-5">디셉션 : 홍콩 살인사건</a></li>
						<li class="cate2 c2-box6 p-2"><a href="../assessment/list.do?a_cate=p-6">딕싯</a></li>
						<li class="cate2 c2-box7 p-2"><a href="../assessment/list.do?a_cate=p-7">한밤의 늑대인간</a></li>
						<li class="cate2 c2-box8 p-2"><a href="../assessment/list.do?a_cate=p-8">위대한 달무티</a></li>
						<li class="cate2 c2-box9 p-2"><a href="../assessment/list.do?a_cate=p-9">디크립토</a></li>
						<li class="cate2 c2-box10 p-2"><a href="../assessment/list.do?a_cate=p-10">더 마인드</a></li>
					</ul> 
				</li>
				
			</ul>
		</li>
		<li>
			<a href="https://ko.boardgamearena.com/gamelist" target='_blank'>게임하기</a>
		</li>
		<li>
			<a href="https://www.wadiz.kr/web/wcampaign/search?keyword=%EB%B3%B4%EB%93%9C%EA%B2%8C%EC%9E%84" target='_blank'>게임펀딩</a>
		</li>
		<li>
			<a href="https://brand.naver.com/koreaboardgames" target='_blank'>게임구매</a>
		</li>
		<li>
			<a href="https://boardlife.co.kr/bbs_list.php?tb=board_used" target='_blank'>중고장터</a>
		</li>
		<li>
			<a href="../boardming/sublist.do">자유게시판</a>
		</li>
		
	</ul>
	
	</div>
	</div> <!-- end - header - 정환 -->
	
	
	
	
	
	
 		<!-- 사이드 메뉴 프로필 화면 선일 작업 -->
		
	<div id="side_menu">
		<c:if test="${ not empty sessionScope.user }">
			<div id="side_menu_1"><img src="image/member_background.jpg"></div>
		</c:if>
		<c:if test="${ empty sessionScope.user }">
			<div id="side_menu_1"><img src="image/member_background.jpg"></div>
		</c:if>
		<ul>
		
			<!-- 프로필 사진올리기 수정기능 작업-->
			<li>
			<c:if test="${ not empty sessionScope.user && user.mem_grade eq '일반' }">
				<div id="member_icon" onclick="photo_insert();" style="cursor:pointer;">
				<img src="image/member_icon.png"></div>
			</c:if>
			<c:if test="${ not empty sessionScope.user && user.mem_grade eq '관리자' }">
				<div id="member_icon" onclick="photo_insert();" style="cursor:pointer;">
				<img src="image/운영자.png"></div>
			</c:if>
			<c:if test="${ empty sessionScope.user }">
				<div id="member_icon" onclick="photo_insert();" style="cursor:pointer;">
				<img src="image/member_icon.png"></div>
			</c:if>
			</li>
			
			
			<c:if test="${ sessionScope.user.mem_grade eq '관리자' }">
			<li><span style="font-size: 15px; font-weight: bold; display: inline-block; margin-top: 15px;">관리자 계정</span></li>
			<li><span id="member_name">${ sessionScope.user.mem_nickname }</span></li>
			</c:if>
			<!-- 유저가 로그인 안되어있을때 -->
			<c:if test="${ empty sessionScope.user }">
			<li><span style="font-size: 15px; font-weight: bold; display: inline-block; margin-top: 15px;">보드게임 뉴비</span></li>
			<li><span id="member_name">비로그인 계정</span></li>
			</c:if>
			<!-- 유저가 로그인 되어있을때 -->
			<c:if test="${ not empty sessionScope.user && user.mem_grade eq '일반' }">
			<li><span style="font-size: 15px; font-weight: bold; display: inline-block; margin-top: 15px;">보드게임 유저</span></li>
			<li><span id="member_name">${ sessionScope.user.mem_nickname }</span></li>
			</c:if>
			<!-- <li><a href="javascript:setStartPage(this);"><img src="image/start.png" id="best_game_img"></a></li> -->
			<li><div id="best_game1_img"><a href="https://boardlife.co.kr/rank.php" target="_blank"><img src="image/보드라이프.JPG" id="best_game_img"></a></div></li>
			<li><div id="best_game1_img"><a href="https://brand.naver.com/koreaboardgames" target="_blank"><img src="image/코리아보드게임즈.jpg" id="best_game_img"></a></div></li>
			<li><div id="best_game2_img"><a href="https://ko.boardgamearena.com/gamelist" target="_blank"><img src="image/보드게임아레나.JPG" id="best_game_img3"></a></div></li>
			
			<li><a href="javascript:bookmarksite('보드밍', 'main.jsp')"><img src="image/다오2.png" id="best_game_img2"></a></li>
		</ul>
	</div>
	<div class="overlay"></div>
	<!-- 회원전용 슬라이드 화면 선일 작업 end -->
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	<div id="box">
		<div id="title"><img alt="" src="image/search_logo.png"></div>
			<div id="main_image"><img alt="" src="image/다오.png"></div>
			<c:if test="${not empty searchData}">
			<div id="center">
					<a href="${searchData.link}">
					<img src="image/${searchData.filename}" id="main_image2">
					</a>
			<div id="search_span">
				<br><span id="search-victory" style="font-size: 25px">'${searchData.name}'</span>
				<span>에 대한 검색결과를 찾아드렸어요!</span><br><br>
				<span id="search-victory2">결과가 마음에 드시나요??</span><br>
				<span id="search-victory2">이미지를 누르면 해당 게임 상세페이지로 이동합니다</span>
			</div>
			</div>
			</c:if>
			
			<!-- 데이터 없는 경우 -->
			<c:if test="${empty searchData}">
			<div id="center2">
			<div id="search_span2">
				<img alt="" src="image/no_list.png">
			</div>
			</div>
			</c:if>
			
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!-- footer start -->
    <div id="footer">
    	<div class="footer1">
	        <span><br>&nbsp;&nbsp;&emsp;&emsp;<a href="header2.html">
	                <img id="footerlogo" src="image/logo.png">
	            </a><br></span>
	        <span>&emsp;&emsp;&emsp;&nbsp;<a href="#">커뮤니티 규칙</a>&emsp; | &emsp;
	        							  <a href="#">서비스 약관/정책</a>&emsp;  |&emsp;
	        							  <a href="#">개인정보취급방침</a>&emsp;  |&emsp; 
	        							  <a href="#">청소년보호정책</a>&emsp;  |&emsp;
	        							  <a href="#">공지사항</a>&emsp;  |  &emsp;
	        							  <a href="#">광고센터</a><br></span>
	        <span>&emsp;&emsp;&emsp;&nbsp;회사명 : 보드밍&ensp; |&ensp;
	         서울특별시 관악구 남부순환로 1820, 에그옐로우 7층&ensp; | &ensp;
	         등록번호 : 123-45-67890&ensp; | &ensp;
	         대표자명 : 박정환&ensp; |&ensp;
	         고객지원 : klkcpc@globalit.com<br></span>
	        <span>&emsp;&emsp;&emsp;&nbsp;위 내용에 대한 저작권 및 법적 책임은 자료제공사 또는 글쓴이에 있으며 보드밍의 입장과 다를 수 있습니다.<br></span>
	        <span>&emsp;&emsp;&emsp;&nbsp;ⓒ BOARDMING. ALL RIGHTS RESERVED.</span>
        </div>
        <div class="footer2">
        	<span><br><br><br>TEL : 02-123-4567<br></span>
        	<span>AM 09:30 ~ PM 06:20<br></span>
        	<span>주말, 공휴일 휴무<br></span>
        </div>
    </div>
    <!-- footer end -->
	
	


</body>
</html>