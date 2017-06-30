<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
	// String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+cp;
%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>잡스퀘어 - 구인 구직 네트워크</title>

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="<%=cp%>/resources/css/bootstrap.min.css">
  
    <!-- SUB CSS -->
  <link rel="stylesheet" href="<%=cp%>/resources/custom_css/sub_layout.css">

  <!-- Jquery 3.2.1 -->
  <script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
  
    <!-- datepicker JS -->
  <script src="<%=cp%>/resources/js/datepicker.js" type="text/javascript"></script>
  
   <!-- 알림창 JS -->
  <script src="<%=cp%>/resources/js/sweetalert2.min.js" type="text/javascript"></script>

  <!-- Bootstrap JS -->
  <script src="<%=cp%>/resources/js/bootstrap.js" type="text/javascript"></script>
  
  <!-- 회원가입 JS -->
  <script src="<%=cp%>/resources/js/register.js" type="text/javascript"></script>
  
    <!-- 회원가입 JS -->
  <script src="<%=cp%>/resources/js/login.js" type="text/javascript"></script>
  
  <!-- 알림창 CSS -->
  <link rel="stylesheet" href="<%=cp%>/resources/css/sweetalert2.min.css">
 
  <!-- datepicker CSS -->
  <link rel="stylesheet" href="<%=cp%>/resources/css/datepicker.min.css">

  <!-- Font Awesome CSS -->
  <link rel="stylesheet" href=" https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script>
$(function() {
	var mode = "${mode}";
	if(mode =="registerComplet"){
		swal(
				  '가입을 환영합니다!',
				  '이제 등록한 아이디로 로그인 할 수 있습니다.',
				  'success'
				)
	} else if(mode == "loginfail"){
		swal(
  				'Oops...',
  				'존재하지 않는 아이디나 비밀번호가 틀립니다.',
  				'error'
)
	}
});


</script>


</head>

<body>

  <!-- Modal -->
  <form name = "memberRegister" method="post" onsubmit="return register();">
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="myModalLabel">잡스퀘어 회원가입</h4>
        </div>
        <div class="modal-body">

          <div class="row">
            <div class="col-sm-6 col-xs-6">
              <div class="form-group">
                <input type="text" id="id_first_name" name="firstname" required="required" data-required="성을 입력해주세요" placeholder="성" class="form-control last_name">
              </div>
            </div>
            <div class="col-sm-6 col-xs-6">
              <div class="form-group">
                <input type="text" id="id_last_name" onchange="getUsername();" name="lastname" required="required" data-required="이름을 입력해주세요" placeholder="이름" class="form-control first_name">
                <input type="hidden" id = "mname" name="mname" value="">
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-sm-12">
              <div class="form-group">
                <input type="email" id="m_email" name="mid" required="required" data-required="E-mail을 입력해주세요" data-validate="E-mail 형식을 확인해주세요."
                  placeholder="E-mail" class="form-control email" onchange="userEmailCheckl();">
              </div>
            </div>
          </div>

          <div class="form-group row">
            <div class="col-sm-12">
              <div class="form-group">
                <input type="password" id="id_password" min="6" maxlength="20" name="mpwd" required="required" data-required="비밀번호를 입력해주세요" placeholder="비밀번호" class="form-control password">
              </div>
            </div>
          </div>
          
                    <div class="row">
            <div class="col-sm-6 col-xs-6">
              <div class="form-group">
            <input type="text" class="form-control docs-date" id = "mbirth" name="mbirth" data-toggle="datepicker" placeholder="생일 입력">
              </div>
            </div>
            <div class="col-sm-6 col-xs-6">
              <div class="form-group">
               <label class="radio-inline">
  <input type="radio" name="mgender" id="inlineRadio1" value="남"> 남성
</label>
<label class="radio-inline">
  <input type="radio" name="mgender" id="inlineRadio2" value="여"> 여성
</label>
              </div>
            </div>
          </div>
          


          <div class="row">
            <div class="col-sm-12">
              <div class="text agreement">회원가입시 잡스퀘어 <a href="/tos" target="_blank" rel="nofollow">이용약관</a>, <a href="/privacy" target="_blank" rel="nofollow">개인정보취급방침</a>을
                읽고 이해하셨으며 해당 내용에 동의하신 것이 됩니다.</div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
          <button type="submit" class="btn btn-success">가입하기</button>
         
        </div>
      </div>
    </div>
  </div>
  </form>

  <div>
    <video id="video1" autoplay="autoplay">
      <source src="<%=cp%>/resources/video/submain.mp4"> </video>
  </div>
  
  
  <div class="container" id = "shows">
    <div class="form-signin">
      <h2 class="form-signin-heading">Welcome! Job Square</h2>
      <span class="form-signin-heading2">지금 가입하고 비즈니스와 커리어를 성장시킬 수 있는 다양한 기회들을 만나보세요!</span>


<form name = "loginac" method="post" onsubmit="return login();">
      <input type="email" id="mid" name = "mid" class="form-control" placeholder="E-mail" required="required" autofocus="autofocus">

      <input type="password" id="mpwd" name = "mpwd" class="form-control" placeholder="Password" required="required">

      <button class="sub-layout-btn" type="submit">로그인</button>
</form>
      <div class="footer-login">
        잡스퀘어에 가입해보세요!  <button class="register-btn" data-toggle="modal" data-target="#myModal"> 무료 가입</button><a href="<%=cp%>/main">둘러보기</a>
      </div>
    </div>
  </div>
  

</body>

<!-- 회원가입 모달 창 -->
<script type="text/javascript">
  $('#myModal').on('shown.bs.modal', function () {
    $('#myInput').focus()
  })
</script>

<script type="text/javascript">
$('[data-toggle="datepicker"]').datepicker();
</script>


</html>
