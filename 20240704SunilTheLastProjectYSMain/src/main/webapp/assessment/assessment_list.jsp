<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/detail.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
		function assessment_insert(){
			
			// 로그인 체크 -> 데이터 표현할 땐 무조건 ""로 감싸기(EL, jQuery와 혼동을 피하기 위함)
			if("${ empty user }"=="true") {
				if(confirm('게임 평가는 로그인 후 가능합니다.\n로그인하시겠습니까?')==false)return;
				
				// 로그인폼으로 이동
				location.href = "../member/login_form.do"; /*login_form.do 추후 변경 */
				return;	// 의미는 없음
			}
			
			// 로그인이 된 경우 => 사진등록 폼으로 이동
			location.href="insert_form.do"; // AssesssmentInsertFormAction
		}
				
		function del(f) {
			let a_idx	  = f.a_idx.value;			
			let a_no	  = f.a_no.value;
			
			if(confirm("정말 삭제하시겠습니까? 삭제된 평가는 복구할 수 없습니다!")==false) return;
			
			location.href = "delete.do?a_idx=" + a_idx + "&a_no=" + a_no + "&a_cate=" + f.a_cate.value;
		}
		
		function modify_form(f) {
			let a_idx	  = f.a_idx.value;			
			let a_no	  = f.a_no.value;			
			
			location.href = "modify_form.do?a_idx=" + a_idx + "&a_no=" + a_no;
		}		
</script>


</head>
<body>
    <!-- 한줄평 -->
    <div id="comment">
    	<div id="comment-title-tap">
    		<div id="comment-title">
    			<div class="comment">게임 한줄 평</div>	
		    			<input class="btn btn-info comment-btn" type="button" value="게임 평가하기"
		    				   onclick="assessment_insert();"/>	    	<!-- 팝업창 생성시 함수  -->			   
    			<div class="warning">*건전한 인터넷문화를 준수해주시기 바랍니다. 부적절한 글은 삭제될 수 있습니다.</div> 	   
    		</div>
    		
			   		<!-- 내용이 없을 경우 -->
			<c:if test="${ empty requestScope.list }">
				<div id="empty_msg">등록된 게시물이 없습니다</div>
			</c:if>
			
			<!-- for(AssessmentVo vo: list) -->		

	   		<c:forEach var="vo" items="${ list }">	 
	   			<form>		
					<div id="comment-content">
 						<input type="hidden" name="a_idx" value="${ vo.a_idx }">
						<input type="hidden" name="a_no"  value="${ vo.a_no }">
						<input type="hidden" name="a_cate"  value="${ vo.a_cate }"> 
						<div class="comment-row even">
							<div class="row-up">
								<span class="nickname"> ${ vo.mem_nickname }
									&nbsp;&nbsp;&nbsp;&nbsp;</span> 
								<span class="comment-regdate">${ fn:substring(vo.a_regdate,0,10) }</span>
							</div>
							<div class="content">${ vo.a_content }
							<c:if
									test="${ user.mem_grade eq '관리자' or ( user.mem_idx eq vo.mem_idx) }">
									<input class="btn btn-danger" type="button" value="삭제"
										onclick="del(this.form);">
									<input class="btn btn-success" type="button" value="수정"
										onclick="modify_form(this.form);">
							</c:if>
							</div>
						</div>
					</div>
				</form>	
			</c:forEach>	
		  </div>	
   	</div>   	

</body>
</html>