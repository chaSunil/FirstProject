<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디아블로2 아이템 거래소</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<!-- 검색기능 넣기 이이이이이이이 선일작업 -->
<script type="text/javascript">

   var inputSource =[]; 

   $(function(){
	   
   	$.ajax({
   		url  : "../items/getlist.do",
   		dataType:"json",
   		success:function(res_data){
   			for(let data of res_data.result){
   				inputSource.push(data);
   			}
   		},
   		error:function(err){
   			alert("검색정보를 가져오지 못했습니다.");
   		}
   	});
	   
   });
	
	function search(f) {
		
		let item_name = f.item_name.value.trim();
		let item_name_val = f.item_name_val.value.trim();
		let item_name2 = f.item_name2.value.trim();
		let item_name_val2 = f.item_name_val2.value.trim();
		let item_name3 = f.item_name3.value.trim();
		let item_name_val3 = f.item_name_val3.value.trim();
		let item_name4 = f.item_name4.value.trim();
		let item_name_val4 = f.item_name_val4.value.trim();
		const item_shot = $("#item_shot").val();
		const item_type = $("#item_type").val();
		const item_grade = $("#item_grade").val();
		const item_im = $("#item_im").val();
		
		
		f.action = "../items/category.do";
		f.submit();
	}
	
	
	function send(f) {
		
		
	}
		
</script>
<link rel="stylesheet" href="../css/item.css">
<style type="text/css">
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}

* {
	font-family: "Pretendard-Regular";
	margin: 0px;
	padding: 0px;
}

.search {
	margin: auto;
	
	background: white;
	border-radius: 20px;
	
	font-weight: bold;
	padding-left: 25px;
	
	height: 50px;
	width: 250px;
	min-width: 18vw;
}

#search-btn {
	position : absolute;
	top : 25px;
	left : 53%; 
}

#search-btn > input {
	background: #f7feff;
	border-radius: 10px;
	width : 65px;
	border: 2px solid skyblue;
	color : skyblue;
	
	height: 45px;
}

/* #search-btn > img {
	width: 20px;
	display: inline;
} */

#search-btn > input:hover {
	box-shadow: 1px 1px 2px gray;
}

.ui-autocomplete {
	width: 300px; /* 원하는 너비로 설정 */
	overflow-y: auto;
	/* prevent horizontal scrollbar */
	overflow-x: hidden;
	height: 500px;
}

.ui-menu-item div.ui-state-hover,
.ui-menu-item div.ui-state-active {
  color: #ffffff;
  text-decoration: none;
  background-color: skyblue;
  border-radius: 0px;
  -webkit-border-radius: 0px;
  -moz-border-radius: 0px;
  background-image: none;
  border:none;
}

#item-box-head {
	width : 900px;
	margin: auto;
}

#item-box {
	width : 1500px;
	height : 350px;
	background-color: #1B1D23;
	margin: auto;
	border: 0.3px solid #ab8a6a;
	border-bottom: 0px;
}

#item-image-box {
 	width: 300px;
	height : 350px;
	display: inline-block;
	float: left;
	
    display: flex;
    justify-content: center; /* 자식 요소를 가로(수평) 기준으로 가운데 정렬시킴 */
    align-items: center; /* 자식 요소를 세로(수직) 기준으로 가운데 정렬시킴 */
    overflow: hidden;
}
#item-image-box > img {
	max-height: 320px;
	height: auto;
    max-width: 150px;
}

#item-box2 {
	width: 300px;
	height : 350px;
	display: inline-block;
	float: left;
	
	display: flex;
    align-items: center; /* 자식 요소를 세로(수직) 기준으로 가운데 정렬시킴 */
    overflow: hidden;
}

#item_name_gongback {
	margin-bottom: 0px;
}

#item_name {
	font-size: 18px;
	color: #c4b590;
}

hr {
	border: 0;
    height: 0.2px;
    background: #292a2b;
	
}

#item-box3 {
	width: 400px;
	height : 350px;
	display: inline-block;
	float: left;
	
	display: flex;
    align-items: center; /* 자식 요소를 세로(수직) 기준으로 가운데 정렬시킴 */
    overflow: hidden;
}

#gibon_option_font {
	font-size: 13px;
	color : #aaa8a3
}

#option_font {
	font-size: 13px;
	color: #2b6ca2;
}

#item-box4 {
	width: 500px;
	height : 350px;
	display: inline-block;
}

.item_tag {
	margin-top: 20px;
	margin-bottom: 20px;
}

.btn-0 {
	font-size: 13px;
	text-decoration: none;
	border-radius: 5px;
	width: 100px;
	height: 15px;
	padding: 4px;
	background-color: #353944;
	color: #929a9e;
	margin-top: 20px;
	margin-bottom: 20px;
	
	text-decoration: none;
	pointer-events: none;
	cursor: default;
}

.btn-1 {
	font-size: 13px;
	text-decoration: none;
	border-radius: 5px;
	width: 100px;
	height: 15px;
	padding: 4px;
	background-color: #353944;
	color: #c4b590;
	margin-top: 20px;
	margin-bottom: 20px;
	margin-left: 10px;
	
	text-decoration: none;
	pointer-events: none;
	cursor: default;
}

#item_sell {
	margin-top: 25px;
	margin-left: 100px;
}
</style>


<!-- jquery -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script type="text/javascript">

var $112 = $.noConflict(true);

$(document).ready(function() {

	$112('#inputBox').autocomplete({
        source : inputSource, // autocomplete가 될 요소
        minLength : 0 // 0글자부터 배열안에 있는 글자를 인식한다.
    });
    
    var inputBox = document.querySelector('#inputBox'); // 변수 저장
    inputBox.addEventListener("focus", downArrow); // inputBox(검색창)에 커서가 올라가면 함수실행

});

function downArrow() {
    var event = document.createEvent("Event");
    event.initEvent("keydown", true, true); // keydown 키로 이동가능
    event.keyCode = 40 // 자동완성 딜레이시간
    document.getElementById("inputBox").dispatchEvent(event);
};

</script>

</head>



<body>
 	    <div id="search">
	    	<form>
          	  <input type="text" id="inputBox" name="name" class="form-control search" placeholder="검색창"/>
			  <input type="submit" onclick="send(this.form)" value="검색" id="search_chang">
			</form>
        </div>
        
        <input type="hidden" >
        
        
        <form>
        	<input name="item_name" placeholder="옵션명">
        	<input name="item_name_val" placeholder="옵션수치">
        	<input name="item_name2" placeholder="옵션명2">
        	<input name="item_name_val2" placeholder="옵션수치2"><br>
        	<input name="item_name3" placeholder="옵션명3">
        	<input name="item_name_val3" placeholder="옵션수치3">
        	<input name="item_name4" placeholder="옵션명4">
        	<input name="item_name_val4" placeholder="옵션수치4"><br>
        	<input type="button" value="검색" onclick="search(this.form);">     
        	<select id="item_type" name="item_type">
        		<option value="양손검">양손검</option>
        		<option value="투구">투구</option>
        		<option value="갑옷">갑옷</option>
        		<option value="방패">방패</option>
        		<option value="장갑">장갑</option>
        		<option value="허리띠">허리띠</option>
        		<option value="신발">신발</option>
        	</select>  
        	<select id="item_grade" name="item_grade">
        		<option value="익셉셔널">익셉셔널</option>
        		<option value="노멀">노멀</option>
        		<option value="엘리트">엘리트</option>
        	</select>   
        	<select id="item_shot" name="item_shot">
        		<option value="0">0</option>
        		<option value="1">1</option>
        		<option value="2">2</option>
        		<option value="3">3</option>
        		<option value="4">4</option>
        	</select>   
        	<select id="item_im" name="item_im">
        		<option value="수리불가">수리불가</option>
        		<option value="수리가능">수리가능</option>
        	</select>   
        </form>
        	
		<div id="item-box-head">
			<img src="https://i.ibb.co/q52QLZK/66.jpg">
		</div>
		<c:forEach var="items" items="${ requestScope.list }">
        <form>
<div id="item-box">
			<div id="item-image-box">
			<img src="${ items.item_image }">
			</div>
			<div id="item-box2">
				<div id="gibon_option_font">
				<span>거래번호 : ${ items.item_idx }</span><br>
				<div class="item_tag"><a class="btn-0">&ensp;${ items.item_type }&ensp;</a></div>
				<div id="item_name_gongback"><span id="item_name"><b>${ items.item_name }</b></span></div><br>
				<hr>
				<div class="item_tag"><a class="btn-0">&ensp;${ items.item_grade }&ensp;</a>
				<a class="btn-1">&ensp;${ items.item_rarity  }&ensp;</a></div>
				<span>${ items.item_im }</span><br>
				
				<!-- 소켓 유무에 따른 출력 변화 -->
				<c:if test="${ items.item_shot != 0 }">
				<span>${ items.item_shot }소켓</span><br>
				</c:if>
				<c:if test="${ items.item_shot == 0 }">
				<span>소켓없음</span><br>
				</c:if>
				</div>
			</div>
			<div id="item-box3">
				<div id="gibon_option_font">
				<!-- 해당 값에 값이 0이거나 이름이 null이라면 출력하지 않겠다. -->
				<c:if test="${ items.gibon_option1_val != 0 || items.gibon_option1_name != null }">
				<span>${ items.gibon_option1_name } ${ items.gibon_option1_val }</span><br>
				</c:if>
				<c:if test="${ items.gibon_option2_val != 0 || items.gibon_option2_name != null }">
				<span>${ items.gibon_option2_name } ${ items.gibon_option2_val }</span><br>
				</c:if>
				<c:if test="${ items.gibon_option3_val != 0 || items.gibon_option3_name != null }">
				<span>${ items.gibon_option3_name } ${ items.gibon_option3_val }</span><br>
				</c:if>
				<c:if test="${ items.gibon_option4_val != 0 || items.gibon_option4_name != null }">
				<span>${ items.gibon_option4_name } ${ items.gibon_option4_val }</span><br>
				</c:if>
				<c:if test="${ items.gibon_option5_val != 0 || items.gibon_option5_name != null }">
				<span>${ items.gibon_option5_name} ${ items.gibon_option5_val }</span><br>
				</c:if>
				<c:if test="${ items.gibon_option6_val != 0 || items.gibon_option6_name != null }">
				<span>${ items.gibon_option6_name } ${ items.gibon_option6_val }</span><br>
				</c:if>
				<c:if test="${ items.gibon_option7_val != 0 || items.gibon_option7_name != null }">
				<span>${ items.gibon_option7_name } ${ items.gibon_option7_val }</span><br>
				</c:if>
				<br>
				<div id="option_font">
				<!-- 해당 값에 값이 0이거나 이름이 null이라면 출력하지 않겠다. -->
				<c:if test="${ items.item_o1_val != 0 || items.option_name1 != null }">
				<span>${ items.option_name1 } ${ items.item_o1_val }</span><br>
				</c:if>
				<c:if test="${ items.item_o2_val != 0 || items.option_name2 != null }">
				<span>${ items.option_name2 } ${ items.item_o2_val }</span><br>
				</c:if>
				<c:if test="${ items.item_o3_val != 0 || items.option_name3 != null }">
				<span>${ items.option_name3 } ${ items.item_o3_val }</span><br>
				</c:if>
				<c:if test="${ items.item_o4_val != 0 || items.option_name4 != null }">
				<span>${ items.option_name4 } ${ items.item_o4_val }</span><br>
				</c:if>
				<c:if test="${ items.item_o5_val != 0 || items.option_name5 != null }">
				<span>${ items.option_name5 } ${ items.item_o5_val }</span><br>
				</c:if>
				<c:if test="${ items.item_o6_val != 0 || items.option_name6 != null }">
				<span>${ items.option_name6 } ${ items.item_o6_val }</span><br>
				</c:if>
				<c:if test="${ items.item_o7_val != 0 || items.option_name7 != null }">
				<span>${ items.option_name7 } ${ items.item_o7_val }</span><br>
				</c:if>
				</div>
				</div>
			</div>
			
			<!-- 거래회원 정보 기입란 -->
			<div id="item_sell">
				<img src="https://i.ibb.co/Sfsqy2k/55.jpg">
			</div>
</div>
		</form>
		</c:forEach>

</body>
</html>