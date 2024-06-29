<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- SweetAlert2 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <!-- SweetAlert2 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>
<style type="text/css">

button {
  background-color: cadetblue;
  color: whitesmoke;
  border: 0;
  -webkit-box-shadow: none;
  box-shadow: none;
  font-size: 18px;
  font-weight: 500;
  border-radius: 7px;
  padding: 15px 35px;
  cursor: pointer;
  white-space: nowrap;
  margin: 10px;
}

</style>
<script type="text/javascript">

$(document).on('click', '#logout', function(e) {
    swal({
    title: "로그아웃 하시겠습니까?", 
    text: "확인을 누르면 저희가 안전하게 로그아웃 해드릴게요.", 
    type: "question",
    confirmButtonText: "확인",
    showCancelButton: true
    })
      .then((result) => {
      if (result.value) {
          href.location = '../member/logout.do';
      } else if (result.dismiss === 'cancel') {
          swal(
            '로그아웃이 취소되었습니다.',
            '저희와 함께 해주셔서 고마워요.',
            'info'
          )
      }
    })
});

</script>
</head>
<body>
<button id="link">Redirect to Utopian</button>

<a id="logout">로그아웃</a>
</body>
</html>