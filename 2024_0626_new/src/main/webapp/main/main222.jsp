<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="image/favicon.ico" type="image/x-icon">
<title>우리들의 보드게임 세상 보드밍</title>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>

<!-- Bootstrap -->
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
<!-- CSS -->
<link rel="stylesheet" href="../css/main.css">

<!-- slick  -->
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />

<!-- SweetAlert2 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	/*  // 1초에 한번씩 함수 수행 
	    setInterval(moveImage, 4000);// cf) setTimeout(fn,시간); */
	    // quickmenu의 이미지의 top 위치가 얼마인지 담기
	    var top = parseInt($("#quickmenu img").css("top"));
	    console.log(top);
	    
	    // 상단 메인 메뉴 관리
	    $("li.mainmenu ul").hide(); // 하위메뉴 숨기기
	    $("li.mainmenu").hover(function(){
	        $("ul",this).slideDown(300);
	    }, function(){
	        $("ul",this).slideUp(300);
	    });
	    
		// 카테고리 박스 함수
	    $("li#header-category ul").hide(); // 하위메뉴 숨기기
	   
	   $("li#header-category").hover(function(){
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
	// 상단 메인 배너 함수
	/* function moveImage() {
	    $("#box2").animate(
	        {"left" : "-=1200"}, 1200, 
	        function() {
	            var left = parseInt($("#box2").css("left"));
	            // box2의 left 좌표가 -805보다 작아진다면, 0px로 돌아온다.
	            if (left < -2401) {
	                $("#box2").css("left", "0px");
	        }
	    });
	} */
	
	/* 이미지 슬라이드 */
	$(function() {
		$('.image_slide').slick({
			infinite : true, 		/* 무한 스와이프 */
			slidesToShow : 4, 		/* 한 화면에 보이는 슬라이드 갯수 */
			slidesToScroll : 1, 	/* 한 번에 슬라이드 되는 갯수 */
			dots: true,
			prevArrow:$('.prevArrow'),
			nextArrow:$('.nextArrow')
		});
	});

	$(function() {
		$('.image_slide2').slick({
			infinite : true, 		/* 무한 스와이프 */
			slidesToShow : 4, 		/* 한 화면에 보이는 슬라이드 갯수 */
			slidesToScroll : 1, 	/* 한 번에 슬라이드 되는 갯수 */
			dots: true,
			prevArrow:$('.prevArrow2'),
			nextArrow:$('.nextArrow2')
		});
	});
	</script>
	
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
		    	  window.location.href = "../member/logout.do";
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
	
	</head>
	<body>

<!-- 로그아웃에 대한 parameter를 받아주는 함수 -->
<%-- <% 
    String logout = request.getParameter("logout");
	System.out.println("Logout parameter: " + logout);
    if ("true".equals(logout)) {
%>
<!-- 알림처리 -->
    <script>
    console.log("SweetAlert2 script loaded");
        Swal.fire({
            title: '로그아웃되었습니다.',
            text: '성공적으로 로그아웃되었습니다.',
            icon: 'success'
        });
    </script>
<% 
    } 
%> --%>
	<div id="main-head">
	    <!-- 상단 헤더 선일 작업 start 06.28 로그인, 회원가입 기능, session -->
	    <div id="head">
	            <a href="main.jsp">
	                <img id="logo" src="image/logo.png">
	            </a>
	           <div id="search">
            <input class="form-control search" placeholder="검색창"/>
        </div>  
<!--         <div id="search-btn">
        	<input type="button" value="검색"/>
			<img src="../image/search-btn.png">
        </div> -->
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
	            	<a onclick="location.href='../member/modify_form.do?mem_idx=${user.mem_idx}'">내정보</a>
	            </c:if>
	            
	            <div class="login-icon">
	                <a id="love-icon" style="cursor:pointer;">
	                    <img src="image/user_icon.png">
	                </a>
	            </div>
	            <div class="login-icon">
	                <a href="main.jsp">
	                    <img src="image/love.png">
	                </a>
	            </div>
	            </div>
	        </div>
	    </div>
	    <!-- 상단 헤더 end 선일 작업 -->
	    
	        <!-- 헤더 탭 코드-->	
	<div id="header-tap">
		<ul id="header-tap-list">
			<li id="header-category" class="">
				<img id="tab-img" src="image/sidemenu.png">
				<ul>
					<div class="test">
						<li class="cate-box cate-box1"><a href="#">가족게임</a></li>
						<li class="cate-box"><a href="#">어린이게임</a></li>
						<li class="cate-box"><a href="#">워게임</a></li>
						<li class="cate-box"><a href="#">전략게임</a></li>
						<li class="cate-box"><a href="#">추상게임</a></li>
						<li class="cate-box"><a href="#">컬렉터블 게임</a></li>
						<li class="cate-box"><a href="#">테마게임</a></li>
						<li class="cate-box8"><a href="#">파티게임</a></li>
					</div>
				</ul>
			</li>
			<li>
				<a href="#">신상품</a>
			</li>
			<li>
				<a href="#">베스트</a>
			</li>
			<li>
				<a href="#">세트상품</a>
			</li>
			<li>
				<a href="#">기획전</a>
			</li>
			<li>
				<a href="#">이벤트</a>
			</li>
			
		</ul>
		
		</div>
	</div> <!-- end - header - 정환 -->
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!-- 회원전용 슬라이드 화면 선일 작업 -->
	<div id="side_menu">
		<div id="side_menu_1"><img src="image/member_background.jpg"></div>
		<ul>
		
			<!-- 프로필 사진올리기 수정버튼까-->
			<li><div id="member_icon" onclick="photo_insert();" style="cursor:pointer;">
			<img src="image/member_icon.png"></div></li>
			
			
			<c:if test="${ sessionScope.user.mem_grade eq '관리자' }">
			<li><span style="font-size: 15px; font-weight: bold; display: inline-block;">관리자 계정</span></li>
			<li><span id="member_name">${ sessionScope.user.mem_nickname }</span></li>
			</c:if>
			<!-- 유저가 로그인 안되어있을때 -->
			<c:if test="${ empty sessionScope.user }">
			<li><span style="font-size: 15px; font-weight: bold; display: inline-block;">보드게임 뉴비</span></li>
			<li><span id="member_name">비로그인 계정</span></li>
			</c:if>
			<!-- 유저가 로그인 되어있을때 -->
			<c:if test="${ not empty sessionScope.user && user.mem_grade eq '일반' }">
			<li><span style="font-size: 15px; font-weight: bold; display: inline-block;">보드게임 유저</span></li>
			<li><span id="member_name">${ sessionScope.user.mem_nickname }</span></li>
			</c:if>
			
			<li style="font-size: 25px; font-weight: bold;">나만의 한줄소개</li>
			<li><div id="mem_introduce">안녕하세요? 보드게임 일반 회원 박정환입니다.</div></li>
			<li><img src="image/best_game.png" id="best_game"></li>
			<li><img src="image/f-game4.png" id="best_game_img"></li>
		</ul>
	</div>
	<div class="overlay"></div>
	<!-- 회원전용 슬라이드 화면 선일 작업 end -->
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
<!-- 헤더 메인 메뉴 end -->
    <!-- 상단 슬라이딩 배너 -->
    <div id="demo" class="carousel slide" data-bs-ride="carousel">
        <!-- Indicators/dots -->
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#demo" data-bs-slide-to="0"
                class="active"></button>
            <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
            <button type="button" data-bs-target="#demo" data-bs-slide-to="3"></button>
        </div>
        <!-- The slideshow/carousel -->
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="image/product_banner1.jpg" alt="Los Angeles"
                    class="d-block w-100">
            </div>
            <div class="carousel-item">
                <img src="image/product_banner2.jpg" alt="Chicago"
                    class="d-block w-100">
            </div>
            <div class="carousel-item">
                <img src="image/product_banner3.jpg" alt="New York"
                    class="d-block w-100">
            </div>
            <div class="carousel-item">
                <img src="image/product_banner4.jpg" alt="New York"
                    class="d-block w-100">
            </div>
        </div>
        <!-- Left and right controls/icons -->
        <button class="carousel-control-prev" type="button"
            data-bs-target="#demo" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </button>
        <button class="carousel-control-next" type="button"
            data-bs-target="#demo" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
        </button>
    </div>
    <!-- 상단 슬라이딩 배너 end -->
    
    
    <!-- 배너 아래 카테고리 아이콘 -->
    <section class="category-icon">
        <ul>
            <li>
                <a href=header2.html">
                    <div class="a-1">
                        <img src="image/003.png" alt="" class="a1-a">
                        <img src="image/004.png" alt="" class="a1-b">
                    </div>
                    <p>베스트</p>
                </a>
            </li>
            <li>
                <a href=header2.html">
                    <div class="a-1">
                        <img src="image/001.png" alt="" class="a1-a">
                        <img src="image/002.png" alt="" class="a1-b">
                    </div>
                    <p>가족게임</p>
                </a>
            </li>
            <li>
                <a href=header2.html">
                    <div class="a-1">
                        <img src="image/005.png" alt="" class="a1-a">
                        <img src="image/006.png" alt="" class="a1-b">
                    </div>
                    <p>어린이게임</p>
                </a>
            </li>
            <li>
                <a href=header2.html">
                    <div class="a-1">
                        <img src="image/007.png" alt="" class="a1-a">
                        <img src="image/008.png" alt="" class="a1-b">
                    </div>
                    <p>전략게임</p>
                </a>
            </li>
            <li>
                <a href=header2.html">
                    <div class="a-1">
                        <img src="image/009.png" alt="" class="a1-a">
                        <img src="image/010.png" alt="" class="a1-b">
                    </div>
                    <p>추상게임</p>
                </a>
            </li>
            <li>
                <a href=header2.html">
                    <div class="a-1">
                        <img src="image/011.png" alt="" class="a1-a">
                        <img src="image/012.png" alt="" class="a1-b">
                    </div>
                    <p>워게임</p>
                </a>
            </li>
            <li>
                <a href=header2.html">
                    <div class="a-1">
                        <img src="image/013.png" alt="" class="a1-a">
                        <img src="image/014.png" alt="" class="a1-b">
                    </div>
                    <p>파티게임</p>
                </a>
            </li>
            <li>
                <a href=header2.html">
                    <div class="a-1">
                        <img src="image/015.png" alt="" class="a1-a">
                        <img src="image/016.png" alt="" class="a1-b">
                    </div>
                    <p>컬렉터블게임</p>
                </a>
            </li>
        </ul>
    </section>
    <!-- 상단 배너 아래 카테고리 아이콘 선일 작업 end -->
    
<!-- main 화면 예송, 찬종 작업 -->
<div class="mainbox">
    <div id="center"></div>
    
    <div class="maincontent">
        <div class="contenttitle">BEST 10
        </div>
        <div class="image_arrow_wrap">
	        <div class="image_slide">
	            <div class="img-container1">
	            	<div class="img-wrapper">
	                <img src="image/best1_new2.jpg" class="img-in-container"/>
	                </div>
	                <span class="game_name">글룸헤이븐</span>
	            </div>
	            <div class="img-container1">
	            	<div class="img-wrapper">
	                <img src="image/best2.jpg" class="img-in-container"/>
	                </div>
	                <span class="game_name">테라포밍마스</span>
	            </div>
	            <div class="img-container1">
	            	<div class="img-wrapper">
	                <img src="image/best3.jpg" class="img-in-container"/>
	                </div>
	                <span class="game_name">메이지 나이트</span>
	            </div>
	            <div class="img-container1">
	            	<div class="img-wrapper">
	                <img src="image/best4.jpg" class="img-in-container"/>
	                </div>
	                <span class="game_name">가이아 프로젝트</span>
	            </div>
	            <div class="img-container1">
	            	<div class="img-wrapper">
	                <img src="image/best5.jpg" class="img-in-container"/>
	                </div>
	                <span class="game_name">브라스 - 버밍엄</span>
	            </div>
	            <div class="img-container1">
	            	<div class="img-wrapper">
	                <img src="image/best6.png" class="img-in-container"/>
	                </div>
	                <span class="game_name">7 원더스 대결</span>
	            </div>
	            <div class="img-container1">
	            	<div class="img-wrapper">
	                <img src="image/best7.png" class="img-in-container"/>
	                </div>
	                <span class="game_name">아그리콜라</span>
	            </div>
	            <div class="img-container1">
	            	<div class="img-wrapper">
	                <img src="image/best8.jpg" class="img-in-container"/>
	                </div>
	                <span class="game_name">아컴호러 - 카드게임</span>
	            </div>
	            <div class="img-container1">
	            	<div class="img-wrapper">
	                <img src="image/best9.png" class="img-in-container"/>
	                </div>
	                <span class="game_name">루트</span>
	            </div>
	            <div class="img-container1">
	            	<div class="img-wrapper">
	                <img src="image/best10.jpg" class="img-in-container"/>
	                </div>
	                <span class="game_name">팬데믹 레거시 시즌2</span>
	            </div>
	        </div>
	        <div class="arrow_wrap">
	    		<span class="prevArrow"> < </span>
	    		<span class="nextArrow"> > </span>  
			</div>
		</div>
		<a href="https://www.naver.com" class="more2"> + 더보기 </a>
    </div>
    
    <div class="maincontent">
        <div class="contenttitle"> 보드밍 Pick!
        </div>
        <div class="image_arrow_wrap">
        	<div class = "image_slide2">
                <div class="img-container1">
                	<div class="img-wrapper">
                    <img src="image/recommend1.jpg" class="img-in-container"/>
                    </div>
                    <span class="game_name">캐스캐디아</span>
                </div>
                <div class="img-container1">
                	<div class="img-wrapper">
                    <img src="image/recommend2.jpg" class="img-in-container"/>
                    </div>
                    <span class="game_name">패치워크</span>
                </div>
                <div class="img-container1">
                	<div class="img-wrapper">
                    <img src="image/recommend3.png" class="img-in-container"/>
                    </div>
                    <span class="game_name">더마인드</span>
                </div>
                <div class="img-container1">
                	<div class="img-wrapper">
                    <img src="image/recommend4.png" class="img-in-container"/>
                    </div>
                    <span class="game_name">윙스팬</span>
                </div>
                <div class="img-container1">
                	<div class="img-wrapper">
                    <img src="image/recommend5.jpg" class="img-in-container"/>
                    </div>
                    <span class="game_name">스페이스 크루 -<br>9번째 행성을 찾아서</span>
                </div>
                <div class="img-container1">
                	<div class="img-wrapper">
                    <img src="image/recommend6.jpg" class="img-in-container"/>
                    </div>
                    <span class="game_name">7 원더스</span>
                </div>
                <div class="img-container1">
                	<div class="img-wrapper">
                    <img src="image/recommend7.png" class="img-in-container"/>
                    </div>
                    <span class="game_name">카르카손</span>
                </div>
                <div class="img-container1">
                	<div class="img-wrapper">
                    <img src="image/recommend8.jpg" class="img-in-container"/>
                    </div>
                    <span class="game_name">카탄</span>
                </div>
            </div>
	        <div class="arrow_wrap">
	    		<span class="prevArrow2"><</span>
	    		<span class="nextArrow2">></span>  
			</div>
		</div>
		<a href="https://www.naver.com" class="more2"> + 더보기 </a>
    </div>

		<div class="maincontent">
			<div class="contenttitle">
				<a href="https://www.naver.com">두 명 모였다고?! 오히려 좋아!</a>
			</div>
			<div>
				<div class="img-container2">
					<div class="img-wrapper">
						<img src="image/game-ex4.jpg" class="img-in-container" />
					</div>
					<span>캐스캐디아</span>
				</div>
				<div class="img-container2">
					<div class="img-wrapper">
						<img src="image/game-ex2.jpg" class="img-in-container" />
					</div>
					<span>익스플로딩 키튼</span>
				</div>
				<div class="img-container2">
					<div class="img-wrapper">
						<img src="image/game-ex3.jpg" class="img-in-container" />
					</div>
					<span>스플렌더</span>
				</div>
				<div class="img-container2">
					<div class="img-wrapper">
						<img src="image/game-ex4.jpg" class="img-in-container" />
					</div>
					<span>캐스캐디아</span>
				</div>
			</div>
			<a href="https://www.naver.com" class="more2"> + 더보기 </a>
		</div>
		<div class="maincontent">
        	<div class="contenttitle">
        		<a href="https://www.naver.com">머리 맞대고 싸우자!!</a>
        </div>
            <div>
            <div class="img-container2">
                <div class="img-wrapper">
            		<img src="image/game-ex4.jpg" class="img-in-container"/>
        		</div>
                <span>캐스캐디아</span>
            </div>
            <div class="img-container2">
                <div class="img-wrapper">
            		<img src="image/game-ex2.jpg" class="img-in-container"/>
        		</div>
                <span>익스플로딩 키튼</span>
            </div>
            <div class="img-container2">
                <div class="img-wrapper">
            		<img src="image/game-ex3.jpg" class="img-in-container"/>
        		</div>
                <span>스플렌더</span>
            </div>
            <div class="img-container2">
                <div class="img-wrapper">
            		<img src="image/game-ex4.jpg" class="img-in-container"/>
        		</div>
                <span>캐스캐디아</span>
            </div>
        </div>
        <a href="https://www.naver.com" class="more2"> + 더보기 </a>
    </div>
    <div class="maincontent">
        <div class="contenttitle">
        	<a href="https://www.naver.com">머리 아프긴 싫은걸? 단순한 게임으로 스트레스 풀래</a>
            <a href="https://www.naver.com"><img class="more1" src="image/more1.PNG" /></a>
        </div>
            <div>
            <div class="img-container2">
                <div class="img-wrapper">
            		<img src="image/game-ex4.jpg" class="img-in-container"/>
        		</div>
                <span>캐스캐디아</span>
            </div>
            <div class="img-container2">
                <div class="img-wrapper">
            		<img src="image/game-ex2.jpg" class="img-in-container"/>
        		</div>
                <span>익스플로딩 키튼</span>
            </div>
            <div class="img-container2">
                <div class="img-wrapper">
            		<img src="image/game-ex3.jpg" class="img-in-container"/>
        		</div>
                <span>스플렌더</span>
            </div>
            <div class="img-container2">
                <div class="img-wrapper">
            		<img src="image/game-ex4.jpg" class="img-in-container"/>
        		</div>
                <span>캐스캐디아</span>
            </div>
        </div>
        <a href="https://www.naver.com" class="more2"> + 더보기 </a>
    </div>
</div>
<!-- main 화면 예송, 찬종 작업 end -->
    
    
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