<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- SweetAlert2사용설정  -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style type="text/css">
  #box{
      width: 600px;
      margin: auto;
      margin-top: 50px;  
  }

  textarea {
	  width: 100%;
	  resize: none;
  }
  
  input[type='button']{
      width: 100px;
  }
  
  img{
      width: 200px;
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
		
		/* let photo				= f.photo.value; */
		
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
		
	/* 	if(photo==''){
			alert("사진을 등록하세요");
			return;
		} */
		
		//f.method = "POST";
		f.action = "modify.do";	//전송대상(PhotoModifyAction)
		f.submit();	//전송
	}
 
   
//------ Ajax이용한 이미지 수정----------------------------------------------   
   
   function ajaxFileUpload() {
       // 업로드 버튼이 클릭되면 파일 찾기 창을 띄운다.
       $("#ajaxFile").click();
   }

   function ajaxFileChange() {
       // 파일이 선택되면 업로드를 진행한다.
       photo_upload();
   }


   
   function photo_upload() {

	   //파일선택->취소시
	   if( $("#ajaxFile")[0].files[0]==undefined)return;
	   //[0]의 의미는 따로 있진 않지만 문법적으로 필요
	   
	   	   
	   var form = $("#ajaxForm")[0];
       var formData = new FormData(form);
       formData.append("sub_p_idx", '${ vo.sub_p_idx }');				//p_idx=5
       formData.append("photo", $("#ajaxFile")[0].files[0]);	//photo=a.jpg

       $.ajax({
             url : "photo_upload.do", //PhotoUploadAction-이미지만 수정
             type : "POST",
             data : formData,
             processData : false,	//binarydata이기때문
             contentType : false,	//binarydata이기때문
             dataType : 'json',
             success:function(res_data) {
            	 //res_data = {"p_filename":"aaa.jpb"}
                 
            	 //location.href=''; //자신의 페이지를 리로드(refresh)
            	 
            	 $("#my_img").attr("src","../images/" + res_data.sub_p_filename);
            	 //$("#my_img").prop("src","../images/" + res_data.p_filename);
            	 
             },
             error : function(err){
            	 alert(err.responseText);
             }
       });

   }
</script>



</head>
<body>

<!--파일업로드용 폼  -->
<form enctype="multipart/form-data" id="ajaxForm" method="post">
    <input id="ajaxFile" type="file"  style="display:none;"  onChange="ajaxFileChange();" >
</form>

  
  
  
<form>

  <input type="hidden"  name="sub_p_idx"  value="${ vo.sub_p_idx }"> 

  <div id="box">
        <div class="panel panel-primary">
	      <div class="panel-heading"><h4>수정화면</h4></div>
	      <div class="panel-body">
	          <table class="table  table-striped">
	               <tr>
	                   <td colspan="2" align="center">
	                       <img src="../images/${ vo.sub_p_filename }" id="my_img">
	                       <br>
	                       <input  class="btn  btn-info" type="button"  value="이미지편집"  onclick="ajaxFileUpload();">
	                   </td>
	               </tr>
	          
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
							<td colspan="2" align="center">
								<input class="btn btn-primary" type="button" value="수정하기"
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