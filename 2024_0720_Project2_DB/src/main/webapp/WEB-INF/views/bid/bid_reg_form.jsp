<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/bid_reg.css">

<script type="text/javascript">
	
	function buy(reg_idx) {
		
		location.href="../transaction/transaction_list.do?reg_idx=" + reg_idx;
	}
	
	function bid(a_idx) {
		
		location.href="../bid/bid_list.do?a_idx=" + a_idx;
	}
</script>
</head>
<body>
	<div id="bid-box">
		<div id="bid-title">
			no.21 간지나는 투구
		</div>
		<br>
		<div id="bid-content">
			<div class="item-info">
				<div id="selltime-info">
					<div id="reg-start" class="reg">
						판매시작 &nbsp;&nbsp;&nbsp;&nbsp; 2024.07.28.19.37.30					
					</div>
					<hr>
					<div id="reg-end" class="reg">
						판매종료  &nbsp;&nbsp;&nbsp;&nbsp; 2024.07.28.19.40.30
					</div>
				</div>
			
				<div id="main-info">
					<c:forEach var="items" items="${ requestScope.list }">
						<form>
							<div id="item-box">
								<div id="item-image-box">
									<img src="../resources/images/${ items.item_image }">
								</div>
								<div id="item-box2">
									<div id="gibon_option_font">
										<span>거래번호 : ${ items.item_idx }</span><br>
										<div class="item_tag">
											<a class="btn-0">&ensp;${ items.item_type }&ensp;</a>
										</div>
										<div id="item_name_gongback">
											<span id="item_name"><b>${ items.item_name }</b></span>
										</div>
										<br>
										<hr>
										<div class="item_tag">
											<a class="btn-0">&ensp;${ items.item_grade }&ensp;</a> <a
												class="btn-1">&ensp;${ items.item_rarity  }&ensp;</a>
										</div>
										<span>${ items.item_im }</span><br>

										<!-- 소켓 유무에 따른 출력 변화 -->
										<c:if test="${ items.item_shot != 0 }">
											<span>${ items.item_shot }소켓</span>
											<br>
										</c:if>
										<c:if test="${ items.item_shot == 0 }">
											<span>소켓없음</span>
											<br>
										</c:if>
									</div>
								</div>
								<div id="item-box3">
									<div id="gibon_option_font">
										<!-- 해당 값에 값이 0이거나 이름이 null이라면 출력하지 않겠다. -->
										<c:if test="${ items.gibon_option1_name != null }">
											<span>${ items.gibon_option1_name } ${ items.gibon_option1_val }</span>
											<br>
										</c:if>
										<c:if test="${ items.gibon_option2_name != null }">
											<span>${ items.gibon_option2_name } ${ items.gibon_option2_val }</span>
											<br>
										</c:if>
										<c:if test="${ items.gibon_option3_name != null }">
											<span>${ items.gibon_option3_name } ${ items.gibon_option3_val }</span>
											<br>
										</c:if>
										<c:if test="${ items.gibon_option4_name != null }">
											<span>${ items.gibon_option4_name } ${ items.gibon_option4_val }</span>
											<br>
										</c:if>
										<c:if test="${ items.gibon_option5_name != null }">
											<span>${ items.gibon_option5_name} ${ items.gibon_option5_val }</span>
											<br>
										</c:if>
										<c:if test="${ items.gibon_option6_name != null }">
											<span>${ items.gibon_option6_name } ${ items.gibon_option6_val }</span>
											<br>
										</c:if>
										<c:if test="${ items.gibon_option7_name != null }">
											<span>${ items.gibon_option7_name } ${ items.gibon_option7_val }</span>
											<br>
										</c:if>
										<br>
										<div id="option_font">
											<!-- 해당 값에 값이 0이거나 이름이 null이라면 출력하지 않겠다. -->
											<c:if
												test="${ items.item_o1_val != 0 || items.option_name1 != null }">
												<span>${ items.option_name1 } ${ items.item_o1_val }</span>
												<br>
											</c:if>
											<c:if
												test="${ items.item_o2_val != 0 || items.option_name2 != null }">
												<span>${ items.option_name2 } ${ items.item_o2_val }</span>
												<br>
											</c:if>
											<c:if
												test="${ items.item_o3_val != 0 || items.option_name3 != null }">
												<span>${ items.option_name3 } ${ items.item_o3_val }</span>
												<br>
											</c:if>
											<c:if
												test="${ items.item_o4_val != 0 || items.option_name4 != null }">
												<span>${ items.option_name4 } ${ items.item_o4_val }</span>
												<br>
											</c:if>
											<c:if
												test="${ items.item_o5_val != 0 || items.option_name5 != null }">
												<span>${ items.option_name5 } ${ items.item_o5_val }</span>
												<br>
											</c:if>
											<c:if
												test="${ items.item_o6_val != 0 || items.option_name6 != null }">
												<span>${ items.option_name6 } ${ items.item_o6_val }</span>
												<br>
											</c:if>
											<c:if
												test="${ items.item_o7_val != 0 || items.option_name7 != null }">
												<span>${ items.option_name7 } ${ items.item_o7_val }</span>
												<br>
											</c:if>
											<c:if
												test="${ items.item_o8_val != 0 || items.option_name8 != null }">
												<span>${ items.option_name8 } ${ items.item_o8_val }</span>
												<br>
											</c:if>
										</div>
									</div>
								</div>

								<!-- 거래회원 정보 기입란 -->
								<div id="item_sell">
									<div id="usercard-text">
										<span class="usercard-text"><span>기본정보</span> 💡 ONLINE</span>
									</div>
									<div id="item_sell1">
										<img class="usercard-image"
											src="https://image.chaoscube.co.kr/new/user/367949/profile/b6478d67-9a45-46da-8910-f9f74efcaa18.jpg">
										<img class="usercard-grade"
											src="https://i.ibb.co/BNKG8b4/image.jpg"> <span
											class="usercard-name"><b>${ items.mem_name }</b></span> <a
											class="btn-3">&ensp;즉시구매&ensp;</a> <a class="btn-3">&ensp;경매&ensp;</a>
										<!-- 판매진행 여부 -->
										<a class="btn-4">&ensp;판매중&ensp;</a>
									</div>
									<hr>
									<div id="item_sell2">
										<!-- 판매양식 -->
									</div>
									<div id="item_sell3">
										<span class="item_clock">등록</span>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="item_clock2">${ fn:substring(items.a_regtime,0,19) }</span><br>
										<span class="item_clock">종료예정</span> <span class="item_clock2">2024.07.26</span>
									</div>
									<hr>
									<div id="usercard-text2">
										<span class="usercard-text"><span>판매정보</span></span>
									</div>
									<div id="usercard-cp">
										<div id="usercard-cp2">
											<img src="https://i.ibb.co/85LjcPV/image.jpg" alt="image"
												border="0">
										</div>
										<div id="usercard-cp3">
											<span>즉시 구매가</span>
										</div>
										<div id="usercard-cp4">
											<span></span>
										</div>
										<div id="usercard-cp5">
											<span><fmt:formatNumber type="currency"
													value="${ items.a_direct_price }" currencySymbol="" /></span>
										</div>
										<div id="usercard-cp6">
											<span>CP</span>
										</div>
									</div>
									<div id="usercard-cp">
										<div id="usercard-cp2">
											<img src="https://i.ibb.co/85LjcPV/image.jpg" alt="image"
												border="0">
										</div>
										<div id="usercard-cp3">
											<span>현재 입찰가</span>
										</div>
										<div id="usercard-cp4">
											<span></span>
										</div>
										<div id="usercard-cp5">
											<span><fmt:formatNumber type="currency"
													value="${ items.a_initial_price }" currencySymbol="" /></span>
										</div>
										<div id="usercard-cp6">
											<span>CP</span>
										</div>
									</div>

									<div id="usercard-btn">
										<button>자세히보기 →</button>
									</div>
								</div>
							</div>
						</form>
					</c:forEach>
				</div>
			</div>
		</div>
		<input type="button" class="btn btn-warning" value="즉시구매" onclick="buy('${vo.a_idx}');"><br><br>
       	<input type="button" class="btn btn-danger" value="입찰하기" onclick="bid('${vo.a_idx}');">
	</div>
</body>
</html>