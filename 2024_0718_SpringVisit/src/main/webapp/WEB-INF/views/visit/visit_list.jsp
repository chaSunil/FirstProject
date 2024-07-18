<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>박정환 Story</title>
<%-- 현재 컨텍스트 경로 : ${ pageContext.request.contextPath } --%>
<style type="text/css">

	img {
		width: 200px;
	}
	
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/visit.css">
	
<script type="text/javascript">
	function del(f) {
		
		let c_pwd = f.c_pwd.value.trim(); // 내가 입력한 비밀번호
		let no = f.no.value; // 게시물의 순서
		let idx = f.idx.value;
		
		if(c_pwd=="") {
			alert("삭제할 게시물의 비밀번호를 반드시 입력해주세요");
			f.c_pwd.value="";
			f.c_pwd.focus();
			return;
		}
		
		// jQuery Ajax : 비밀번호 체크
		$.ajax({
			url		:	"check_pwd.do", 			// VisitCheckAction
			data	:	{"idx":idx, "c_pwd":c_pwd}, // parameter : check_pwd.do?idx=5&c_pwd=1234
			
			dataType: "json",
			success : function(res_data) {
				//            비밀번호 일치      비밀번호 불일치
				// res_data = {"result":true} or {"result":false}
				if(res_data.result==false) {
					alert("삭제할 게시물의 비밀번호가 틀립니다.");
					return;
				}
				// 삭제확인
				if(confirm("정말 삭제하시겠습니까?")==false) {
					return;
				}
				// 삭제처리
				// location.href="delete.do?idx=" + idx + "&no=" + no;
				//             JSP EL 와   JS 변수처리 충돌 : 해결방법 백틱안에 '\'
				location.href=`delete.do?idx=\${ idx }&no=\${ no }`; // javascript 백틱 활용
			},
			error	: function(err) {
				alert(err.responseText);
			}
		});
		
		
	} // end:del()
	
	function modify_form(f) {
		
		let c_pwd = f.c_pwd.value.trim();
		let no = f.no.value;
		let idx = f.idx.value;
		
		if(c_pwd=="") {
			alert("수정할 게시물의 비밀번호를 반드시 입력해주세요");
			f.c_pwd.value="";
			f.c_pwd.focus();
			return;
		}
		
		$.ajax({
			url		:	"check_pwd.do",
			data	:	{"idx":idx, "c_pwd":c_pwd},
			datType : "json",
			success : function(res_data) {
				
				if(res_data.result==false) {
					alert("수정할 게시물의 비밀번호가 틀립니다.");
					return;
				}
				if(confirm("정말 수정하시겠습니까?")==false) {
					return;
				}
				
				// 수정폼 띄우기
				// JSP 내에서 back-tic 사용시 자바스크립트 변수표현 : \${자바스크립트 변수}
				location.href=`modify_form.do?idx=\${ idx }&page=${ empty param.page ? 1 : param.page }&search=${ empty param.search ? 'all' : param.search }&search_text=${ param.search_text }`;
			},
			error	: function(err) {
				alert(err.responseText);
			}
		});
		
	}// end:modify_form
	
	function find(){
		let search = $("#search").val();
		let search_text = $("#search_text").val().trim();
		// search value 값이 전체검색이 아니고, 빈칸으로 되어있으면,
		if(search != "all" && search_text==""){
			alert("검색어를 입력하세요.");
			$("#search_text").val("");
			$("#search_text").focus();
			return;
		}
		
		// 자바스크립트 이용해서, 호출
		location.href="list.do?search=" + search + "&search_text=" + 
										  encodeURIComponent(search_text,"utf-8");
	}
</script>
<script type="text/javascript">
	/* 초기화 */
	/* 이렇게 설정해주면, 새로고침을 하면, 값이 들어가있다. */
	$(document).ready(function(){
		
		if("${ not empty param.search }" == "true"){
			$("#search").val("${ param.search }");
		}
		
		// 전체보기면 입력창 지우기
		if("${ param.search eq 'all' }" == "true"){
			$("#search_text").val("");
		}
				
	});
</script>
</head>
<body>
<div id="wrap" class="wrapContainerLayer">
	<div id="box">
		<h1 id="title">여러분의 방문을 환영합니다. <br>
		디아블로2 레저렉션 대표 커뮤니티
		</h1>
		<!-- <img alt="" src="https://i.ibb.co/wJ9PrpD/i14735195771.jpg" style="width= 1000px !important;"> -->
		<!-- <img alt="" src="https://i.ibb.co/9yk6xxb/images-1.jpg" width="600px"> -->
		

		<div style="margin-bottom: 10px">
			<input class="btn btn-primary" type="button" value="글쓰기"
			onclick="location.href='insert_form.do'">
		</div>
		
		
		<!-- 검색메뉴 -->
		<div style="text-align: right; margin-bottom: 5px;">
			<form class="form-inline"><!-- class="form-inline"을 사용하면 한 줄로 배치가 가능하다. -->
				<select id="search" class="form-control">
					<option value="all">전체보기</option>
					<option value="name">이름</option>
					<option value="content">내용</option>
					<option value="name_content">이름+내용</option>
				</select>
				<!-- "${ param.search_text }" 설정은 파라미터를 넣어주면, 새로고침이 되어도 기존값으로 고정이 되어있기 때문에 설정 -->
				<!-- 위에 $(document).ready에서 함수 설정으로 val()값에 parameter 값이 기본적으로 들어가있다. -->
				<input id="search_text" class="form-control" value="${ param.search_text }">
				<input type="button" class="btn btn-primary" value="검색" onclick="find();">
			</form>
		</div>
		
			<!-- url로 요청하기 -->
			
			<!-- 페이지 메뉴 -->
			<div style="text-align:center; margin-top:20px;">
				${ pageMenu }
			</div>

	
<!-- 		<div>
			<ul class="pagination">
			  <li><a href="list.do?page=1">1</a></li>
			  <li><a href="list.do?page=2">2</a></li>
			  <li><a href="list.do?page=3">3</a></li>
			  <li><a href="list.do?page=4">4</a></li>
			  <li><a href="list.do?page=5">5</a></li>
			</ul> -->


		

		<!-- 내용이 없을 경우 -->
		<c:if test="${ empty requestScope.list }">
			<div id="empty_msg">등록된 게시물이 없습니다.</div>
		</c:if>

		<!-- 내용 -->
		<!-- for(VisitVo vo : list) 동일 -->
		<!-- 글자 자동정렬 Ctrl + Shift + F -->
		<c:forEach var="vo" items="${ requestScope.list }">
		<form class="form-inline">
			<!-- 삭제해야할 idx 게시물 번호도 hidden으로 보낸다 (임시방편) -->
			<input type="hidden" name="idx" value="${ vo.idx }">
			<!-- 현페이지에서 다른페이지에서 정보를 넘겨줄때 정보를 유지하는 기술 -->
			<input type="hidden" name="no"  value="${ vo.no }">
			
			<div class="panel panel-primary" id="p_${ vo.no }">
				<div class="panel-heading">
					<h4><b>${ vo.name }</b>님의 글 : ${ vo.ip }</h4>
				</div>
				<div class="panel-body">
					<div class="mycommon content">${ vo.content }</div>
					<div class="mycommon regdate"><b>작성일자 : </b>${ fn:substring(vo.regdate,0,16) }</div>
					<div class="mycommon pwd">비밀번호${ vo.pwd } :
						<!-- c_pwd 수정 -->		
						<input class="form-control" type = "password" id="c_pwd">
						<input class="btn btn-info" type = "button" value="수정" onclick="modify_form(this.form)">
						<!-- delete onclick 추가 -->		
						<input class="btn btn-danger" type = "button" value="삭제" onclick="del(this.form);">
					</div>
				</div>
			</div>
		</form>
		</c:forEach>
	</div>
	

</div>

</body>
</html>