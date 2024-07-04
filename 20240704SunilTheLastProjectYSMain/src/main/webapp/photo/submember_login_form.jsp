<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head >
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 주소검색 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- 제이쿼리 로드 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- youtube-background 라이브러리 로드 -->
<script src="https://unpkg.com/youtube-background@1.0.14/jquery.youtube-background.min.js"></script>
<link rel="stylesheet" href="../css/login_form.css">

<script type="text/javascript">
	
	function send(f) {
		
		let mem_id = f.mem_id.value.trim();
		let mem_pwd = f.mem_pwd.value.trim();
		
		
		if(mem_id==""){
			alert("아이디를 입력하세요");
			f.mem_id.value="";
			f.mem_id.focus();
			return;
		}
		
		if(mem_pwd==""){
			alert("비밀번호를 입력하세요");
			f.mem_pwd.value="";
			f.mem_pwd.focus();
			return;
		}
		
		f.action="sublogin.do";
		f.submit();
	}// end:send()

</script>

<script type="text/javascript">
	$(document).ready(function(){
		
		setTimeout(showMessage, 100);
	});
	
	function showMessage() {
		
		if("${param.reason == 'fail_id'}" == "true") {
			
			Swal.fire({
				  icon: "error",
				  title: "아이디가 틀립니다.",
				  text: "조금만 생각해보면 아이디가 기억날거에요!",
				  width: 600,
				  height: 400,
				});
		}
		if("${param.reason == 'fail_pwd'}" == "true") {
			Swal.fire({
				  icon: "error",
				  title: "비밀번호가 틀립니다.",
				  text: "조금만 생각해보면 비밀번호가 기억날거에요!",
				  width: 600,
				  height: 400,
				});
		}
		
		if("${ param.reason == 'session_timeout' }" == "true") {
			alert("시간이 경과되어, 로그아웃 되었습니다.\n로그인 후 다시 등록해주세요.")
		}
	}// end:showMessage()
</script>

</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<form>

<input type="hidden"  name="sub_p_category" value="${ param.sub_p_category}">
<input type="hidden"  name="sub_p_page" value="${ param.sub_p_page}">


<div class="video_bg">
    <iframe src="https://www.youtube.com/embed/ZCFNtcwhe9w?autoplay=1&mute=1&loop=1&playlist=ZCFNtcwhe9w"></iframe>
</div>
<div id="title"><img alt="" src="../image/login_logo.png"></div>
<div id="box">
	<div class="panel panel-primary good">
   		<div class="panel-heading header"><h4>로그인</h4></div>
   		<div class="panel-body">
   			<table class="table">
   				<tr>
   					<td>
   						<input class="form-control" name="mem_id" value="${param.mem_id}" placeholder="ID">
   						<input class="form-control" type="password" name="mem_pwd" placeholder="Password">
   					</td>
   				</tr>
   				<tr>
   					<td colspan="2" align="center">	
   						<input class="btn btn-success" type="button" value="메인화면" onclick="location.href='../main/main.jsp'">
   						<input class="btn btn-primary" type="button" value="로그인" onclick="send(this.form);">
   					</td>
   				</tr>
   			</table>
   		</div>
   	</div>
</div>
	

</form>
</body>
</html>