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
			<li><div id="best_game1_img"><a href="https://boardlife.co.kr/rank.php" target="_blank"><img src="../image/보드라이프.JPG" id="best_game_img"></a></div></li>
			<li><div id="best_game1_img"><a href="https://brand.naver.com/koreaboardgames" target="_blank"><img src="../image/코리아보드게임즈.jpg" id="best_game_img"></a></div></li>
			<li><div id="best_game2_img"><a href="https://ko.boardgamearena.com/gamelist" target="_blank"><img src="../image/보드게임아레나.JPG" id="best_game_img3"></a></div></li>
			
			<li><a href="javascript:bookmarksite('보드밍', 'main.jsp')"><img src="../image/다오2.png" id="best_game_img2"></a></li>
		</ul>
	</div>
	<div class="overlay"></div>
	<!-- 회원전용 슬라이드 화면 선일 작업 end -->