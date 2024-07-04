<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript">

   var inputSource =[]; 

   $(function(){
	   
   	$.ajax({
   		url  : "../search/getlist.do",
   		dataType:"json",
   		success:function(res_data){
   			//res_data = eval(res_data);
   			//res_data = {"result":  ['스플렌더', '스컬킹', '윙스팬', '스페이스크루', '7원더스'] };
   			//inputSource = res_data.result;
   			console.log(res_data.result);
   			
   			for(let data of res_data.result){
   				inputSource.push(data);
   			}
   			
   			console.log(inputSource);
   			
   		},
   		error:function(err){
   			alert(err.responseText);
   		}
   	});
	   
   });


</script>






<!-- jquery -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- jquery-ui -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- jquery-ui css -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 






<script>

    //var $112 = $.noConflict(true);
 

	/* 검색 자동완성 로직 start */
    $(document).ready(function() {
    	/* requestScope중 list 값이 없으면 만들어라 */
    	/* if("${ empty list }" == "true") {
        	location.href = "../search/getlist.do";
    	} else {
        // 서버에서 받아온 list 데이터를 JavaScript 배열로 변환
        var inputSource = [];
        
        <c:forEach var="item" items="${list}">
            inputSource.push("${item.name}");
        </c:forEach>
        
    	}
    	 */
    	
    	
        /* var inputSource = ['스플렌더', '스컬킹', '윙스팬', '스페이스크루', '7원더스']; */

        $('#inputBox').autocomplete({
            source : inputSource,
            minLength : 0
        });
        
        var inputBox = document.querySelector('#inputBox');
        inputBox.addEventListener("focus", downArrow);

    });

    function downArrow() {
        var event = document.createEvent("Event");
        event.initEvent("keydown", true, true);
        event.keyCode = 40
        document.getElementById("inputBox").dispatchEvent(event);
    };
	
		
	function send(f) {
		
		// 입력값 검증
		let name = f.name.value.trim();
		
		if(name=='') {
			alert("검색어를 입력하세요!")
			f.name.value = "";
			f.name.focus();
			return;
		}
		
		f.action = "../search/list.do";// 전송대상(PhotoInsertAction)
		f.submit();
	}
		
		
		
    
    
</script>
</head>
<body>
	<form>
		<input type="text" name="name" id="inputBox">
		<input type="submit" onclick="send(this.form)" value="검색">
	</form>
	
</body>
</html>