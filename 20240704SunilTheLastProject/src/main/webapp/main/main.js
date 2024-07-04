/**
 * 
 */



// 제이쿼리 버전충돌 막아주기
const $j112 = jQuery.noConflict();


/* 검색 자동완성 로직 start */
$j112(document).ready(function() {

	$j112('#inputBox').autocomplete({
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


