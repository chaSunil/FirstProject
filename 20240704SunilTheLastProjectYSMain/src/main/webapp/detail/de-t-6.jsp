<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="image/favicon.ico" type="image/x-icon">
<title>우리들의 보드게임 세상 보드밍</title>

<!-- Bootstrap -->
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="../css/detail.css">

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
   			for(let data of res_data.result){
   				inputSource.push(data);
   			}
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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<!-- slick  -->
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />

<!-- SweetAlert2 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>


<script type="text/javascript">
$(document).ready(function() {
    
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
		
	
function imgChange(img) {
    document.getElementById('a1').src = img.src;
}

function assessment_insert(){
	
	// 로그인 체크 -> 데이터 표현할 땐 무조건 ""로 감싸기(EL, jQuery와 혼동을 피하기 위함)
	if("${ empty user }"=="true") {
		if(confirm('게임 평가는 로그인 후 가능합니다.\n로그인하시겠습니까?')==false)return;
		
		// 로그인폼으로 이동
		location.href = "../member/login_form.do"; /*login_form.do 추후 변경 */
		return;	// 의미는 없음
	}
	
	// 로그인이 된 경우 => 사진등록 폼으로 이동
	location.href="../assessment/insert_form.do?a_cate=${ param.a_cate}"; // AssesssmentInsertFormAction
}

function del(f) {
	let a_idx	  = f.a_idx.value;			
	let a_no	  = f.a_no.value;
	let a_cate	  = f.a_cate.value;
	
	if(confirm("정말 삭제하시겠습니까? 삭제된 평가는 복구할 수 없습니다!")==false) return;
	
	location.href = "../assessment/delete.do?a_idx=" + a_idx + "&a_no=" + a_no + "&a_cate=" + f.a_cate.value;;
}

function modify_form(f) {
	let a_idx	  = f.a_idx.value;			
	let a_no	  = f.a_no.value;			
	
	location.href = "../assessment/modify_form.do?a_idx=" + a_idx + "&a_no=" + a_no;
}
</script>

<!-- 로그아웃시 실행되는 함수 작업 선일 -->
<script type="text/javascript">
	// 로그아웃시 실행될 함수
	
	// sweetalert2
	$(document).on('click', '#logout', function(e) {
	    swal({
	    title: "로그아웃 하시겠습니까?", 
	    text: "확인을 누르면 저희가 안전하게 로그아웃 해드릴게요.", 
	    type: "question",
	    confirmButtonText: "확인",
	    showCancelButton: true,
	    cancelButtonText: '취소'
	    })
	      .then((result) => {
	      if (result.value) {
	    	  window.location.href = "../member/detaillogout.do?a_cate=t-6";
	      } else if (result.dismiss === 'cancel') {
	          swal(
	            '로그아웃이 취소되었습니다.',
	            '저희와 함께 해주셔서 고마워요.',
	            'info'
	          )
	      }
	    })
	});

</script>
<!-- 로그아웃시 실행되는 함수 작업 선일 end -->

<!-- 프로필 사진 누르면 수정 뜨게하는 작업 선일 -->
<script type="text/javascript">


function bookmarksite(title,url) {    
	  // Internet Explorer   
	    if(document.all) {       
	    	window.external.AddFavorite(url, title);    
		}   
	  	// Google Chrome   
	    else if(window.chrome) {      
	    	alert("크롬을 사용하시는 분은 Ctrl+D키를 누르시면 즐겨찾기에 추가하실 수 있습니다.");   
	    }   
	  	// Firefox   
	  	else if (window.sidebar) {       
	      	window.sidebar.addPanel(title, url, "");    
	    }   
	  	// Opera   
	  	else if(window.opera && window.print) {      
			var elem = document.createElement('a');
	      	elem.setAttribute('href',url);       
			elem.setAttribute('title',title);
			elem.setAttribute('rel','sidebar');       
			elem.click();    
		}
	}






/* 검색 자동완성 로직 start */
$(document).ready(function() {

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

	
function blink() {
	document.getElementById("love").src = "../image/love2.png";
}


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
<!-- 프로필 사진 누르면 수정 모달 팝업 뜨게하는 작업 선일 end -->

</head>
<body>
	<div id="main-head">
	    <!-- 상단 헤더 선일 작업 start 06.28 로그인, 회원가입 기능, session -->
	    <div id="head">
	            <a href="../main/main.jsp">
	                <img id="logo" src="../image/logo.png">
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
	                <a href="../member/detaillogin_form.do?a_cate=t-6">로그인</a>
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
	                    <img src="../image/user_icon.png">
	                </a>
	            </div>
	            <div class="login-icon">
                    <img id="love" src="../image/love.png" onclick="blink();" style="cursor:pointer;">
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
					<a href="#">전체게임</a>
				</li>
				<li class="cate-box cate-box1 f-1">
					<a href="#">가족게임</a>
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
					<a href="#">어린이게임</a>
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
					<a href="#">워게임</a>
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
					<a href="#">전략게임</a>
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
					<a href="#">추상 게임</a>
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
					<a href="#">컬렉터블 게임</a>
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
					<a href="#">테마게임</a>
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
					<a href="#">파티게임</a>
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
			<a href="https://ko.boardgamearena.com/gamelist">게임하기</a>
		</li>
		<li>
			<a href="https://www.wadiz.kr/web/wcampaign/search?keyword=%EB%B3%B4%EB%93%9C%EA%B2%8C%EC%9E%84">게임펀딩</a>
		</li>
		<li>
			<a href="https://brand.naver.com/koreaboardgames">게임구매</a>
		</li>
		<li>
			<a href="https://boardlife.co.kr/bbs_list.php?tb=board_used">중고장터</a>
		</li>
		<li>
			<a href="https://www.boardgamemall.co.kr/">자유게시판</a>
		</li>
		
	</ul>
	
	</div>
	</div> <!-- end - header - 정환 -->
		
	
 		<!-- 사이드 메뉴 프로필 화면 선일 작업 -->
		
	<div id="side_menu">
		<c:if test="${ not empty sessionScope.user }">
			<div id="side_menu_1"><img src="../image/member_background.jpg"></div>
		</c:if>
		<c:if test="${ empty sessionScope.user }">
			<div id="side_menu_1"><img src="../image/member_background.jpg"></div>
		</c:if>
		<ul>
		
			<!-- 프로필 사진올리기 수정기능 작업-->
			<li>
			<c:if test="${ not empty sessionScope.user && user.mem_grade eq '일반' }">
				<div id="member_icon" onclick="photo_insert();" style="cursor:pointer;">
				<img src="../image/member_icon.png"></div>
			</c:if>
			<c:if test="${ not empty sessionScope.user && user.mem_grade eq '관리자' }">
				<div id="member_icon" onclick="photo_insert();" style="cursor:pointer;">
				<img src="../image/운영자.png"></div>
			</c:if>
			<c:if test="${ empty sessionScope.user }">
				<div id="member_icon" onclick="photo_insert();" style="cursor:pointer;">
				<img src="../image/member_icon.png"></div>
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
		
	
<!-- 헤더 메인 메뉴 end -->
    <div class="box">
    
            <div class="image-box">
                <div class="image">
                    <img alt="" src="../image/t-game6.png" id="a1">
                </div>
            </div>
            		
        <div class="write-box">
               <!-- <img alt="" src="image/list2.png"> -->

               	
               	<a class="btn-5">&ensp;&ensp;BEST&ensp;&ensp;</a>
               	<!-- 투명박스 -->
               	
               	<a class="btn-2">보드밍Pick!</a>
               	<a class="btn-3">&ensp;꿀잼게임&ensp;</a>
               	
               <div id="write-box-top">            
               	<span style="font-size: 39px;">디센트: 어둠속의 여정 (2판)</span>
               </div>
               <div id="write-box-middle">
               <div id="empty-box">
               	<span id="event">이 게임과 비슷한 게임&ensp;<a href="category.do?sub_p_category=테마게임&sub_p_page=theme">보러가기</a></span>
               </div>
                 <table class="table" id="layout-table">
				  <tbody>
				    <tr>
				      <th>장르</th>
				      <td>테마게임</td>
				    </tr>
				    <tr>
				      <th>게임시간</th>
				      <td>150분</td>
				    </tr>
				    <tr>
				      <th>최소 </th>
				      <td>13세 이상</td>
				    </tr>
				    <tr>
				      <th>제조사</th>
				      <td>Zhiyanjia<br>제작연도 : 2011(년)</td>				      
				  </tbody>
				</table>
				</div>
               <div id="write-box-bottom">
               		<img id="write-bottom" src="../image/blue02.png">
               </div>
        </div> 
        
        <div class="small-image-box">
                <div></div>
                <div class="small-image">
                    <img id="game1" src="../image/t-game6.png" onmouseover="imgChange(this)">
                </div>
                <div class="small-image">
                    <img id="game2" src="../image/t6-a.jpg" onmouseover="imgChange(this)">
                </div>
                <div class="small-image">
                    <img id="game3" src="../image/t6-b.jpg" onmouseover="imgChange(this)">
                </div>
                <div class="small-image">
                    <img id="game4" src="../image/t6-c.jpg" onmouseover="imgChange(this)">
                </div>
                <div class="small-image">
                    <img id="game5" src="../image/t6-d.jpg" onmouseover="imgChange(this)">
                </div>
                <div></div>
            </div>
        
    </div>
  
 <div class="container">
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">게임 한줄 평가</a></li>
    <li><a data-toggle="tab" href="#menu1">보드밍 커뮤니티</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
    <!-- 한줄평 -->
    <div id="comment">
    	<div id="comment-title-tap">
    		<div id="comment-title">
    			<div class="comment">게임 한줄 평</div>	
		    			<input class="btn btn-info comment-btn" type="button" value="게임 평가하기"
		    				   onclick="assessment_insert();"/>	    	<!-- 팝업창 생성시 함수  -->			   
    			<div class="warning">*건전한 인터넷문화를 준수해주시기 바랍니다. 부적절한 글은 삭제될 수 있습니다.</div> 	   
    		</div>
    		
			   		<!-- 내용이 없을 경우 -->
			<c:if test="${ empty requestScope.list }">
				<div id="empty_msg">등록된 게시물이 없습니다.</div>
			</c:if>
			
			<!-- for(AssessmentVo vo: list) -->		

	   		<c:forEach var="vo" items="${ list }">	
	   			<form>  		
					<div id="comment-content">
 						<input type="hidden" name="a_idx" value="${ vo.a_idx }">
						<input type="hidden" name="a_no"  value="${ vo.a_no }"> 
						<input type="hidden" name="a_cate"  value="${ vo.a_cate }"> 
						<div class="comment-row even">
							<div class="row-up">
								<span class="nickname"> ${ vo.mem_nickname }
									&nbsp;&nbsp;&nbsp;&nbsp;</span> 
								<span class="comment-regdate">${ fn:substring(vo.a_regdate,0,10) }</span>
							</div>
							<div class="content">${ vo.a_content }
							<c:if
									test="${ user.mem_grade eq '관리자' or ( user.mem_idx eq vo.mem_idx) }">
									<input class="btn btn-danger" type="button" value="삭제"
										onclick="del(this.form);">
									<input class="btn btn-success" type="button" value="수정"
										onclick="modify_form(this.form);">
							</c:if>
							</div>
						</div>
					</div>
				</form> 	
			</c:forEach>	
		  </div>	
   	</div>      
    </div>
    <div id="menu1" class="tab-pane fade">
    <br><br>
      <a href="../boardming/sublist.do" style="font-size: 20px">자유 게시판 보러가기</a>
    </div>
  </div>
</div>   
       
    <div class="bottom">
        <div class="video">
            <iframe width="800" height="420" 
src="https://www.youtube.com/embed/6gslCTv5vmY?si=fVc1AgWp9DICigUU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>		
		</div>
<!--         <div class="sangse">
            <img alt="" src="../image/t4-sangse.jpg">
        </div> -->
        <!-- <div class="sangse">
            <img alt="" src="../image/sangse2.jpg">
        </div> -->
    </div>
    <!-- footer start -->
    <div id="footer">
    	<div class="footer1">
	        <span><br>&nbsp;&nbsp;&emsp;&emsp;<a href="header2.html">
	                <img id="footerlogo" src="../image/logo.png">
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