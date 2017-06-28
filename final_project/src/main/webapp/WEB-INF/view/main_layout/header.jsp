<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
%>
  <!-- Job Register-->
  <div class="modal fade" id="job-register" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                <input type="text" id="id_last_name" name="last_name" required="required" data-required="성을 입력해주세요" placeholder="성" class="form-control last_name">
              </div>
            </div>
            <div class="col-sm-6 col-xs-6">
              <div class="form-group">
                <input type="text" id="id_first_name" name="first_name" required="required" data-required="이름을 입력해주세요" placeholder="이름" class="form-control first_name">
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-sm-12">
              <div class="form-group">
                <input type="email" id="id_email" name="email" required="required" data-required="E-mail을 입력해주세요" data-validate="E-mail 형식을 확인해주세요."
                  placeholder="E-mail" class="form-control email">
              </div>
            </div>
          </div>

          <div class="form-group row">
            <div class="col-sm-12">
              <div class="form-group">
                <input type="password" id="id_password" name="password" required="required" data-required="비밀번호를 입력해주세요" placeholder="비밀번호" class="form-control password">
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
  
    <!-- Job Login-->
  <div class="modal fade" id="job-login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="myModalLabel">잡스퀘어 로그인</h4>
        </div>
        <div class="modal-body">

          <div class="row">
            <div class="col-sm-6 col-xs-6">
              <div class="form-group">
                <input type="text" id="id_last_name" name="last_name" required="required" data-required="성을 입력해주세요" placeholder="성" class="form-control last_name">
              </div>
            </div>
            <div class="col-sm-6 col-xs-6">
              <div class="form-group">
                <input type="text" id="id_first_name" name="first_name" required="required" data-required="이름을 입력해주세요" placeholder="이름" class="form-control first_name">
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-sm-12">
              <div class="form-group">
                <input type="email" id="id_email" name="email" required="required" data-required="E-mail을 입력해주세요" data-validate="E-mail 형식을 확인해주세요."
                  placeholder="E-mail" class="form-control email">
              </div>
            </div>
          </div>

          <div class="form-group row">
            <div class="col-sm-12">
              <div class="form-group">
                <input type="password" id="id_password" name="password" required="required" data-required="비밀번호를 입력해주세요" placeholder="비밀번호" class="form-control password">
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


<!-- nav시작 -->
<nav class="navbar navbar-default navbar-static-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<%=cp%>/main">Job square</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a href="#">네트워크</a></li>
				<li><a href="<%=cp%>/company/search">기업</a></li>
				<li><a href="<%=cp%>/employ/main">채용</a></li>
				<li><a href="<%=cp%>/talent/main">인재</a></li>
				<li><a href="<%=cp%>/community/review">커뮤니티</a></li>
				<li><a href="<%=cp%>/point/main">포인트</a></li>
				<li><a href="<%=cp%>/help/main">고객센터</a></li>
			</ul>	
			
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#" type="button" role="button" data-toggle="modal" data-target="#job-register" rel="nofollow">무료 가입</a></li>
				<li><a href="#" type="button" role="button" data-toggle="modal" data-target="#job-login" rel="nofollow">로그인</a></li>
			</ul>

			<form class="navbar-form navbar-right">
				<input type="text" class="form-control" placeholder="회사명, 서비스명 검색">
			</form>
		</div>
	</div>
</nav>
<!-- nav종료 -->


