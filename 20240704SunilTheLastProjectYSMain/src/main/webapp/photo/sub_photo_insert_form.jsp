<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sub_photo_insert_form</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
#box{
	width: 600px;
	margin: auto;
	margin-top: 100px;
}
.panel-heading{
	font-size: 17px;
	font-weight: bold;
}
textarea {
	resize: none;
}
th{
	width: 15%;
	vertical-align: middle !important;
	text-align: center;
	font-size: 15px;
}

</style>

<script type="text/javascript">
	function send(f){
		
		//입력값 검증
		let sub_p_title			= f.sub_p_title.value.trim();
		let sub_p_playtime		= f.sub_p_playtime.value.trim();
		let sub_p_min_player	= f.sub_p_min_player.value.trim();
		let sub_p_max_player	= f.sub_p_max_player.value.trim();
		let sub_p_age			= f.sub_p_age.value.trim();
		
		let photo				= f.photo.value;
		
		if(sub_p_title==''){
			alert("제목을 입력하세요");
			f.sub_p_title.value="";	//지우기
			f.sub_p_title.focus();	//포커스
			return;
		}
		
		if(sub_p_playtime==''){
			alert("플레이시간을 입력하세요");
			f.sub_p_playtime.value="";	//지우기
			f.sub_p_playtime.focus();	//포커스
			return;
		}
		
		if(sub_p_min_player==''){
			alert("최소인원을 입력하세요");
			f.sub_p_min_player.value="";	//지우기
			f.sub_p_min_player.focus();		//포커스
			return;
		}
		
		if(sub_p_max_player==''){
			alert("최대인원을 입력하세요");
			f.sub_p_max_player.value="";	//지우기
			f.sub_p_max_player.focus();		//포커스
			return;
		}
		
		if(sub_p_age==''){
			alert("연령을 입력하세요");
			f.sub_p_age.value="";	//지우기
			f.sub_p_age.focus();	//포커스
			return;
		}
		
		if(photo==''){
			alert("사진을 등록하세요");
			return;
		}
		
		//f.method = "POST";
		f.action = "insert.do";	//전송대상(PhotoInsertAction)
		f.submit();	//전송
	}
	
</script>

</head>
<body>
	
	<form method="POST" enctype="multipart/form-data">
		<div id="box">
				<div class="panel panel-info">
				<div class="panel-heading">사진올리기</div>
				<div class="panel-body">
				
					<table class="table">
						<tr>
							<th>제목</th>
							<td><input class="form-control" name="sub_p_title"></td>
						</tr>
						
						<tr>
							<th>플레이타임</th>
							<td>
								<textarea class="form-control" name="sub_p_playtime"></textarea>
							</td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td>
								<textarea class="form-control" name="sub_p_category"></textarea>
							</td>
						</tr>
						<tr>
							<th>최소 인원수</th>
							<td>
								<textarea class="form-control" name="sub_p_min_player"></textarea>
							</td>
						</tr>
						<tr>
							<th>최대 인원수</th>
							<td>
								<textarea class="form-control" name="sub_p_max_player"></textarea>
							</td>
						</tr>
						<tr>
							<th>연령</th>
							<td>
								<textarea class="form-control" name="sub_p_age"></textarea>
							</td>
						</tr>
						<tr>
							<th>출시년도</th>
							<td>
								<textarea class="form-control" name="sub_p_year"></textarea>
							</td>
						</tr>
						<tr>
							<th>출판사</th>
							<td>
								<textarea class="form-control" name="sub_p_publisher"></textarea>
							</td>
						</tr>
						<tr>
							<th>사진등록</th>
							<td><input class="form-control" type="file" name="photo"></td>
						</tr>
						
						<tr>
							<td colspan="2" align="center">
								<input class="btn btn-primary" type="button" value="사진올리기"
										onclick="send(this.form);">
								<input class="btn btn-danger" type="button" value="메인화면"
										onclick="location.href='list.do'">
							</td>
						</tr>
						
					</table>
				</div>
			</div>
		</div>
	</form>
</body>
</html>