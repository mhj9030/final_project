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
  <title>Insert title here</title>

  <!-- SUB CSS -->
  <link rel="stylesheet" href="<%=cp%>/resources/custom_css/sub_layout.css">

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="<%=cp%>/resources/css/bootstrap.min.css">

  <!-- Jquery 3.1.0 -->
  <script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>

  <!-- Bootstrap JS -->
  <script src="<%=cp%>/resources/js/bootstrap.js" type="text/javascript"></script>

  <!-- Font Awesome CSS -->
  <link rel="stylesheet" href=" https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


</head>

<body>

  <!-- Modal -->
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
                <input type="text" id="id_last_name" name="last_name" required="" data-required="성을 입력해주세요" placeholder="성" class="form-control last_name">
              </div>
            </div>
            <div class="col-sm-6 col-xs-6">
              <div class="form-group">
                <input type="text" id="id_first_name" name="first_name" required="" data-required="이름을 입력해주세요" placeholder="이름" class="form-control first_name">
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-sm-12">
              <div class="form-group">
                <input type="email" id="id_email" name="email" required="" data-required="E-mail을 입력해주세요" data-validate="E-mail 형식을 확인해주세요."
                  placeholder="E-mail" class="form-control email">
              </div>
            </div>
          </div>

          <div class="form-group row">
            <div class="col-sm-12">
              <div class="form-group">
                <input type="password" id="id_password" name="password" required="" data-required="비밀번호를 입력해주세요" placeholder="비밀번호" class="form-control password">
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
          <button type="button" class="btn btn-success">가입하기</button>
        </div>
      </div>
    </div>
  </div>

  <div>
    <video id="video1" height="100%" autoplay="autoplay">
      <source src="<%=cp%>/resources/video/submain.mp4"> </video>
  </div>
  <div class="container">
    <div class="form-signin">
      <h2 class="form-signin-heading">Welcome!</h2>
      <span class="form-signin-heading2">지금 가입하고 비즈니스와 커리어를 성장시킬 수 있는 다양한 기회들을 만나보세요!</span>



      <input type="email" id="inputEmail" class="form-control" placeholder="E-mail" required="required" autofocus="">

      <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="required">

      <button class="sub-layout-btn" type="submit">로그인</button>

      <div class="footer-login">
        잡스퀘어에 가입해보세요! <button class="register-btn" data-toggle="modal" data-target="#myModal"> 무료 가입</button><a href="#">둘러보기</a>
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

</html>
