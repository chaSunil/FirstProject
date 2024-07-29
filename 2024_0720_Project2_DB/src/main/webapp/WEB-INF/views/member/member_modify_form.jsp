<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 회원 정보 수정 페이지 -->


<!-- css 연결 -->
<link rel="stylesheet" href="../resources/css/member/modify_form.css">

<!-- BootStrap 3.x-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 주소 검색 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
	
	// 주소 찾기 -> API
	function find_addr(){
		
		var themeObj = {
				   bgColor: "#B51D1D" //바탕 배경색
		   };
	
		new daum.Postcode({
			 theme: themeObj,
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분
	            $("#mem_zipcode").val(data.zonecode);		// 우편번호 넣기
	            $("#mem_addr").val(data.address);			// 주소 넣기
	        }
	    }).open();
		
	}// end: find_addr()
	
	// 입력했는지 확인
	function send(f){
		
		let mem_name 	 = f.mem_name.value.trim();
		let mem_id 		 = f.mem_id.value.trim();
		let mem_pwd	 	 = f.mem_pwd.value.trim();
		let mem_nickname = f.mem_nickname.value.trim();
		
		let mem_zipcode = f.mem_zipcode.value.trim();
		let mem_addr 	= f.mem_addr.value.trim();
		
		if(mem_name==''){
			alert("이름을 입력하세요");
			f.mem_name.value='';
			f.mem_name.focus();
			return;
		} 
		if(mem_id==''){
			alert("아이디를 입력하세요");
			f.mem_id.value='';
			f.mem_id.focus();
			return;
		} 
		if(mem_pwd==''){
			alert("비밀번호를 입력하세요");
			f.mem_pwd.value='';
			f.mem_pwd.focus();
			return;
		} 
		if(mem_nickname==''){
			alert("닉네임을 입력하세요");
			f.mem_nickname.value='';
			f.mem_nickname.focus();
			return;
		} 

		if(mem_zipcode==""){
			alert("우편번호를 입력하세요");
			f.mem_zipcode.value="";
			f.mem_zipcode.focus();
			return;
		}
		
		if(mem_addr==""){
			alert("주소를 입력하세요");
			f.mem_addr.value="";
			f.mem_addr.focus();
			return;
		}
		
		f.action = "modify.do";
		f.submit();		// 전송
	}// end: send
	
</script>

<script type="text/javascript">
	$(document).ready(function(){
		// 엘리먼트 셀럭터 + 어트리뷰트 셀렉터 함께 사용 
		$("select[name='mem_grade']").val("${ vo.mem_grade}")	/* select인데 name이 mem_grade인 애를 셀렉 */
		
	});
</script>


</head>

<body>

<form>
	<!-- 회원번호 안 보이게 전송 -->
	<input type="hidden" name="mem_idx" value=${ vo.mem_idx }>
	
	<div id="box">
	<div class="sujeong">회원수정</div>
	<div class="form-group form-group-lg">
		<div class="form-group">
			<div class="text1">이름</div>							<!-- 수정 전 원본 이름 -->
			<input type="text" class="form-control" name="mem_name" value="${ vo.mem_name }" placeholder="이름 입력">
		</div>
		<div class="form-group">
			<div class="text1">아이디</div>						  <!-- id는 수정 불가하므로 읽기 전용 -->
			<input type="text" class="form-control" name="mem_id" value="${ vo.mem_id }" readonly="readonly"">
		</div>
		<div class="form-group">
			<div class="text1">비밀번호</div>
			<input type="password" class="form-control" name="mem_pwd" value="${ vo.mem_pwd }" placeholder="비밀번호 입력">
		</div>
		<div class="form-group">
			<div class="text1">닉네임</div>
			<input type="text" class="form-control" name="mem_nickname" value="${ vo.mem_nickname }" placeholder="닉네임 입력">
		</div>
		<div class="form-group">
			<div class="text1">우편번호</div>
			<input type="text" class="form-control addr_text" name="mem_zipcode" id="mem_zipcode" value="${ vo.mem_zipcode }">
			<input  style="background-color: #2B2E36 !important;" class="a_search btn btn-lg" type="button" 
						  value="주소검색" onclick="find_addr();">
		</div>
		<div class="form-group addr">
			<div class="text1">주소</div>
			<input style="width:100%" type="text" class="form-control" name="mem_addr" id="mem_addr" value="${ vo.mem_addr }" placeholder="상세주소 입력">
		</div>
		<div class="form-group">
			<div class="text1">회원등급</div>
				<div>
					<!-- 회원등급이 관리자일 경우 나오는 화면 -->
					<c:if test="${ user.mem_grade eq '관리자' }">
						<select style="width:50%;" name="mem_grade" class="form-control">
							<option value="일반">일반</option>
							<option value="관리자">관리자</option>
						</select>
					</c:if>
					<!-- 회원등급이 일반일 경우 나오는 화면 -->
					<c:if test="${ user.mem_grade eq '일반' }">
						<input style="width:50%" class="form-control" name="mem_grade" 
							   value="${ vo.mem_grade }" readonly="readonly">	
					</c:if>
				</div>
		</div>
		
		<!-- 파일명 입력 -->
		<div class="form-group">
			<div class="text1">파일</div>
			<input style="width:100%" type="text" class="form-control" name="mem_filename" value="${ vo.mem_filename }" placeholder="파일명 입력">
		</div>

		<hr>
		<div class="membership-btn">
	 		<input style="background-color: #2B2E36 !important;" type="button" class="btn btn-block btn-lg"
	 		 	   value="수정하기" onclick="send(this.form);">
		</div>
		
		<div class="home" style="text-align: center;"><a href="../main/list.do">← &nbsp; 메인화면으로 돌아가기</a></div>
	
		
	</div>
	</div>
</form>
</body>
</html>