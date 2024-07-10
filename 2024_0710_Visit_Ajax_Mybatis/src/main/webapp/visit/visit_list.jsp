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
<link rel="stylesheet" href="../css/visit.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
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
				
				location.href=`modify_form.do?idx=\${ idx }&no=\${ no }`;
			},
			error	: function(err) {
				alert(err.responseText);
			}
		});
		
	}
</script>
</head>
<body>
<div id="wrap" class="wrapContainerLayer">
	<div id="box">
		<h1 id="title">여러분의 방문을 환영합니다. <br>
		디아블로2 레저렉션 대표 커뮤니티
		</h1>

		<div style="margin-bottom: 10px">
			<input class="btn btn-primary" type="button" value="글쓰기"
			onclick="location.href='insert_form.do'">
		</div>
			<!-- url로 요청하기 -->

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