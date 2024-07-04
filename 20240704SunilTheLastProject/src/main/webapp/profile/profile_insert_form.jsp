<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
@font-face {
    font-family: 'MabinogiClassicR';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2207-01@1.0/MabinogiClassicR.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

* {
    font-family: "MabinogiClassicR";
}

#title {
	text-align: center;
	font-size: 28px;
	
	margin-bottom: 60px;
}

#box {
	width: 1200px;
	margin: auto;
	margin-top: 100px;
}

textarea {
	resize: none;
}

th {
	vertical-align: middle !important;
	width: 15%;
}
</style>

<script>



</script>
	
</head>
<body>

	<form method="POST" enctype="multipart/form-data">
		<div id="box">
			<h1 id="title">회원정보 수정하기</h1>
			<!-- Ctrl + Shift + F -->
			<div class="panel panel-primary">
				<div class="panel-heading"><h4>사진올리기</h4></div>
				<div class="panel-body">
					<table class="table">
						<tr>
							<th>배경화면 사진 변경</th>
							<td><input class="form-control" name="p_title" autofocus></td>
						</tr>
						
						<tr>
							<th>프로필 사진 변경</th>
							<td><input class="form-control" type="file" name="photo" required="required"></td>
						</tr>
						
						<tr>
							<th>한줄인사</th>
							<td>
								<textarea class="form-control" rows="6" name="p_content"></textarea>
							</td>
						</tr>
						
						
						<tr>
							<td colspan="2" align="center">
								<input class="btn btn-success" type="button" value="메인화면"
									onclick="location.href='../main/main.jsp'">
								<input class="btn btn-primary" type="button" value="사진올리기"
									onclick="send(this.form)">
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</form>
	
</body>
</html>