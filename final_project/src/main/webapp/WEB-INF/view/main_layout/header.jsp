
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
%>
<script>
function navloginCheck() {
	var f = document.navlogin;
	f.action = "/final_project/member/login_check";
	return true;
}

    $(function () {
        var mode = "${mode}";
        if (mode == "loginfail") {
            swal('Oops...', '존재하지 않는 아이디나 비밀번호가 틀립니다.', 'error')
        }
    });
</script>
<!-- nav시작 -->
<nav class="navbar navbar-default navbar-static-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button> <a class="navbar-brand" href="<%=cp%>/main">Job square</a> </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
            	<li><a href="<%=cp%>/profile?id=${member.userId}">회원</a></li>
                <li><a href="<%=cp%>/company/search">기업</a></li>
                <li><a href="<%=cp%>/employ/main">채용</a></li>
                <li><a href="<%=cp%>/talent/main">인재</a></li>
                <li><a href="<%=cp%>/community/review">커뮤니티</a></li>
                <li><a href="<%=cp%>/point/main">포인트</a></li>
                <li><a href="<%=cp%>/help_layout/notice/list">고객센터</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <c:if test="${empty sessionScope.member }">
                    <li><a href="<%=cp%>/member/signin" type="button">무료
							가입</a></li>
                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">로그인 <span class="caret"></span></a>
                        <ul id="login-dp" class="dropdown-menu">
                            <li>
                                <div class="row">
                                    <div class="col-md-12">
                                        <form class="form" name="navlogin" method="post" onsubmit="return navloginCheck();">
                                            <div class="form-group">
                                                <label class="sr-only" for="exampleInputEmail2">사용자 이메일</label>
                                                <input type="text" class="form-control" name="mId" id="exampleInputEmail2" placeholder="사용자 이메일" required> </div>
                                            <div class="form-group">
                                                <label class="sr-only" for="exampleInputPassword2">사용자 비밀번호</label>
                                                <input type="password" class="form-control" name="mPwd" id="exampleInputPassword2" placeholder="비밀번호" required>
                                                <input type="hidden" name="state" value="navlogin">
                                                <div class="help-block text-right"> <a href="">비밀번호를 잊으셨나요?</a> </div>
                                            </div>
                                            <div class="form-group">
                                                <button type="submit" class="btn btn-primary btn-block" data-loading-text="Loading..." autocomplete="off">로그인</button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="bottom text-center"> 계정이 없으신가요? <a href="<%=cp%>/member/signin"><b>가입하기</b></a> </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                </c:if>
                <c:if test="${not empty sessionScope.member}">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span class="user-avatar pull-left" style="margin-right: 8px; margin-top: -5px;"> 
                        <c:if test="${not empty member.proPhoto}">
                        	<img src="<%=cp%>/uploads/profile/${member.proPhoto}"
								class="img-responsive img-circle" title="John Doe"
								alt="John Doe" width="30px" height="30px">
                        </c:if>
                        <c:if test="${empty member.proPhoto}">
                        	<img src="<%=cp%>/resources/image/profile_img.jpg"
								class="img-responsive img-circle" title="John Doe"
								alt="John Doe" width="30px" height="30px">
                        </c:if>
                        
						</span> <span class="user-name"> ${member.userName } </span> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <div class="navbar-content">
                                    <div class="row">
                                        <div class="col-md-5"> 
                                        	<c:if test="${not empty member.proPhoto}">
                                        		<img src="<%=cp%>/uploads/profile/${member.proPhoto}" alt="Alternate Text" class="img-responsive" width="120px" height="120px" />
                                        	</c:if>
                                        	<c:if test="${empty member.proPhoto}">
                                        		<img src="<%=cp%>/resources/image/profile_img.jpg" alt="Alternate Text" class="img-responsive" width="120px" height="120px" />
                                        	</c:if> 
                                        </div>
                                        <div class="col-md-7"> <span>${member.userName }</span>
                                            <p class="text-muted small">${member.userId }</p>
                                            <input type="hidden" value="${member.userId }">
                                            <div class="divider"></div>
                                            <form name="profileaction">
                                                <button type="button" class="btn btn-primary btn-xs" onclick="profileMenu('mypage', '${member.userId}');"> <i class="fa fa-user" aria-hidden="true"></i>마이페이지</button>
                                                <button type="button" class="btn btn-primary btn-xs" onclick="memberMenu('applications', '${member.userId}');"> <i class="fa fa-user" aria-hidden="true"></i> 지원서 관리 </button>
                                                <button type="button" class="btn btn-primary btn-xs" onclick="profileMenu('pwd', 'update');"> <i class="fa fa-cogs" aria-hidden="true"></i> 계정설정 </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="navbar-footer">
                                    <div class="navbar-footer-content">
                                        <div class="row">
                                            <div class="col-md-6"> <a href="<%=cp%>/member/logout" class="btn btn-danger btn-xs"><i
													class="fa fa-power-off" aria-hidden="true"></i>로그아웃</a> </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                </c:if>
            </ul>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="회사명, 서비스명 검색"> </form>
        </div>
    </div>
</nav>
<!-- nav종료 -->