<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
@font-face {
    font-family: 'PyeongChangPeace-Bold';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-02@1.0/PyeongChangPeace-Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}

@font-face {
    font-family: 'MabinogiClassicR';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2207-01@1.0/MabinogiClassicR.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

* {
	font-family: 'MabinogiClassicR';
}

#title a{
	font-family: 'PyeongChangPeace-Bold';
	text-align: : center;
	z-index: 10;
	left: 50%;
    transform: translate(-50%, 0);
	top: 0;
	position: fixed;
	margin-top: 30px;
	font-size: 80px;
	color: skyblue;
	text-shadow: -2px 0px white, 0px 2px white, 2px 0px white, 0px -2px white;
}
	
#box {
padding-left: 0px;
width: 100vw;
}

#box img {
	width: 100%;
	z-index: -1;
}

.sub-box {
/* flex 속성 벗어나서 배치하기 위해서 */
   position: relative;
}

.box{
	position: fixed;
	left: 35%;
   	top: 20%;
	width: 600px;
	margin: auto;
	margin-top: 100px;		
}


textarea {
	resize: none;
}

th {
	width: 18%;
	vertical-align: middle !important;
}
</style>

<script type="text/javascript">
	function send(f) {
		
		//입력값 검증
		let a_content   = f.a_content.value.trim();
		
		if(a_content=='') {
			alert('내용을 입력하시오.');
			f.a_content.value = "";
			f.a_content.focus();
			return;
		}
		
		//f.method = "post";
		f.action = "insert.do?a_cate=${ param.a_cate}"; // 전송대상(AssessmentInsertAction)
		f.submit();	// 전송
	}

</script>

</head>
<body>
<div id="title">
	<a href="#">보드밍</a> <!-- 메인페이지로 이동 -->
</div>
	<form >
		<div id="box">
		<input type="hidden"  name="a_cate"  value="${ param.a_cate }">
			<div id="sub-box">
			<img alt="" src="../image/assess-back.PNG" id="background">
			</div>
			<!-- 코드 정렬 : ctrl + shift + f -->
			<div class="box">
				<div class="panel panel-info">
					<div class="panel-heading"><h4>보드게임 평가</h4></div>
					<div class="panel-body">
						
						<table class="table">	
							<tr>
								<th>게임을<br> 플레이하며<br> 느낀 점</th>
								<td>
									<textarea class="form-control" rows="6" name="a_content"></textarea>
								</td>
							</tr>
													
							<tr>
								<td class="reg-btn" colspan="2" align="center" style="padding-top: 10px">
									<input class="btn btn-success" type="button" value="취소" 
										   onclick="location.href='list.do'">
									<input class="btn btn-info" type="button" value="등록"
											onclick="send(this.form);">
								</td>
							</tr>
							
						</table>
					</div>
				</div>
			</div>
		</div>	
	</form>
	
</body>
</html>