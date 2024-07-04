<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보드밍 회원가입</title>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>

<!-- 주소검색 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/insert_form.css">

<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.12.1/dist/sweetalert2.all.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.12.1/dist/sweetalert2.min.css" rel="stylesheet">

<script type="text/javascript">

	function check_id(){
		
		$("#btn_register").prop("disabled", true);
		
		let mem_id = $("#mem_id").val();
        let mem_id_check = /^[A-Za-z0-9]{3,8}$/;
        
        if(mem_id.length==0) {
            $("#id_msg").html("");
            return;
        }
        
        if(mem_id_check.test(mem_id)==false) {
            $("#id_msg").html("아이디는 3~8자리 영문과 숫자만 사용가능합니다.").css("color","red");
            return;
        }
		
		$.ajax({
			url		:	"check_id.do",		// MemberCheckIdAction
			data	:	{"mem_id":mem_id},	// parameter -> check_id.do?mem_id=one
			dataType:	"json",
			success	:	function(res_data){
				if(res_data.result) {
					$("#id_msg").html("사용가능한 아이디 입니다.").css("color","blue");
					checkRegisterButton();
				} else {
					$("#id_msg").html("이미 사용중인 아이디 입니다.").css("color","red");
					checkRegisterButton();
				}
			},
			error	:	function(err){
				alert("현재, 요청이 지연되고 있습니다.");
			}
		});
	}// end:check_id()
	
		function check_nickname(){
		
		$("#btn_register").prop("disabled", true);
		
		let mem_nickname = $("#mem_nickname").val();
        let mem_nickname_check = /^[가-힣A-Za-z]{2,6}$/;
        
        if(mem_nickname.length==0) {
            $("#nickname_msg").html("");
            return;
        }
        
        if(mem_nickname_check.test(mem_nickname)==false) {
            $("#nickname_msg").html("닉네임은 2~6자리 영문 한글만 사용가능합니다.").css("color","red");
            return;
        }
		
		$.ajax({
			url		:	"check_nickname.do",
			data	:	{"mem_nickname":mem_nickname},
			dataType:	"json",
			success	:	function(res_data){
				if(res_data.result) {
					$("#nickname_msg").html("사용가능한 닉네임 입니다.").css("color","blue");
					checkRegisterButton();
				} else {
					$("#nickname_msg").html("이미 사용중인 닉네임 입니다.").css("color","red");
					checkRegisterButton();
				}
			},
			error	:	function(err){
				alert("현재, 요청이 지연되고 있습니다.");
			}
		});
	}// end:check_nickname()
	
	
	function checkRegisterButton() {
		
	    let idValid = $("#id_msg").text() === "사용가능한 아이디 입니다.";
	    let nicknameValid = $("#nickname_msg").text() === "사용가능한 닉네임 입니다.";
	
	    if (idValid && nicknameValid) {
	        $("#btn_register").prop("disabled", false);
	    } else {
	        $("#btn_register").prop("disabled", true);
	    }
	}
	
	
	
	function find_addr() {
		
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	// input 태그에 넣는 것이니 value 값을 넣어야 한다.
	        	$("#mem_zipcode").val(data.zonecode);
	        	$("#mem_addr").val(data.address);
	        }
	    }).open();
	}// end:find_addr()
	
	// 엔터만 쳐도 가입하기 버튼이 눌림

	
	function send(f) {
		
		let mem_name = f.mem_name.value.trim();
	 	let mem_id = f.mem_id.value.trim();
		let mem_pwd = f.mem_pwd.value.trim();
 		let mem_nickname = f.mem_nickname.value.trim();
		let mem_zipcode = f.mem_zipcode.value.trim();
		let mem_addr = f.mem_addr.value.trim();
		
		if(mem_name==""){
			alert("이름을 입력하세요");
			f.mem_name.value="";
			f.mem_name.focus();
			return;
		}
		
		if(mem_pwd==""){
			alert("비밀번호를 입력하세요");
			f.mem_pwd.value="";
			f.mem_pwd.focus();
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
		
 		$.ajax({
			url: 		"insert.do",
			type: 		"GET",
			dataType:	"json",
			data:
			            {
			            mem_name: mem_name,
			            mem_id: mem_id,
			            mem_pwd: mem_pwd,
			            mem_nickname: mem_nickname,
			            mem_zipcode: mem_zipcode,
			            mem_addr: mem_addr
			            },
			success: function(res_data) {
				if(res_data.result) {
					alert("회원가입 요청이 성공했습니다.");
					location.href = "../main/main.jsp";
					return;
				}
			},
			error: function(err) {
				alert("회원가입 요청이 실패했습니다. 다시 시도해주세요.")
				return;
			}
		});
		
		
/* 		
 		f.action="insert.do";
		f.method="POST";
		f.submit(); */
	}
	

</script>


</head>
<body>
	<button class="img-button2" onclick="location.href='../main/list.do'">
		<img alt="" src="../image/logo.png">
	</button>
<form>
	<div id="box">
	<div id="sub-box">
	<img alt="" src="../image/background_image.jpg" id="background">
	</div>
		<div class="box">
				<h2 id="title">회원가입을 위해<br>정보를 입력해주세요.</h2>
				<label for="mem_name">*이름<br>
					<input name="mem_name"><br><br>
				</label>
				<label for="mem_id">*아이디<br>
					<input name="mem_id" id="mem_id" onkeyup="check_id();"><br><br>
				</label>
				<label for="mem_pwd">*비밀번호<br>
					<input name="mem_pwd" id="mem_pwd" type="password"><br><br>
				</label>
				<label for="mem_nickname">*닉네임<br>
					<input name="mem_nickname" id="mem_nickname" onkeyup="check_nickname();"><br><br>
				</label>
				<label for="mem_zipcode">*우편번호<br>
					<input name="mem_zipcode" id="mem_zipcode"><br><br>
					<input class="btn btn2" type="button" value="주소검색" onclick="find_addr();"><br><br>
				</label>
				<label for="mem_addr">*주소<br>
					<input name="mem_addr" id="mem_addr"><br><br>
				</label>
			<span id="id_msg"></span>
			<span id="nickname_msg"></span>
			<!-- <input class="btn btn3" type="button" value="목록보기" onclick="location.href='list.do'"> -->
			<button id="btn_register" class="img-button" disabled="disabled" onclick="send(this.form);">
				<img alt="" src="../image/icon.png">
			</button>
	   		<!-- <input id="btn_register"src="../image/icon.png" class="img-button" type="button" value="가입하기" 
	   		disabled="disabled" onclick="send(this.form);"> -->
		</div>
		</div>
</form>
</body>
</html>