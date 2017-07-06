<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
    function sendOk() {
        var f = document.pwdform;
        f.action = "<%=cp%>/profile/pwd";
        f.submit();
    }
</script>
<div class="contents">
    <div class="wrap">
        <div class="span3 well setting"> <a href="#aboutModal" data-toggle="modal" data-target="#myModal"><img src="<%=cp %>/resources/image/profile_img.jpg" name="aboutme" width="140" height="140" class="img-circle"></a>
            <h3>${dto.mname } <small> ${dto.mgender }</small></h3>
            <div class="row"> <em>
        	<c:if test="${empty dto.proIntro }">
                                             자기 소개가 없습니다.
 											</c:if>
 											
 											<c:if test="${!empty dto.proIntro }">
                                             ${dto.proIntro }
 											</c:if>
        </em> </div>
            <div class="row"> <span><strong>스킬: </strong></span> <span class="label label-warning">HTML5/CSS</span> <span class="label label-info">Adobe CS 5.5</span> <span class="label label-info">Microsoft Office</span> <span class="label label-success">Windows XP, Vista, 7</span> </div>
        </div>
        <div class="main all">
            <section class="section_box">
                <div class="panel-head">
                    <h3 class="panel-title">계정설정 <small>프로필 완성도를 높여 본인의 프로필을 꾸며보세요.</small></h3> </div>
                <div class="panel panel-default">
                    <div class="panel-body panel-view shadow">
                        <ul class="list-unstyled list list4 list-overflow-x clearfix">
                        
                            <li role="presentation">
                                <a href="#section_careers" data-toggle="collapse" data-target="#career" aria-expanded="false" aria-controls="collapseExample">
                                    <div class="panel panel-info panel-colorful-cus">
                                        <div class="pad-all text-center"> <i class="fa fa-building-o" aria-hidden="true"></i> <span class="text-2x text-thin">경력</span>
                                            <p class = "bo">경력 추가하기</p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            
                            
                            <li role="presentation">
                            <a href="#section_careers" data-toggle="collapse" data-target="#project" aria-expanded="false">
                                <div class="panel panel-info panel-colorful-cus">
                                    <div class="pad-all text-center"> <i class="fa fa-suitcase" aria-hidden="true"></i> <span class="text-2x text-thin">프로젝트</span>
                                        <p class = "bo">프로젝트 추가하기</p>
                                    </div>
                                </div>
                                </a>
                            </li>
                            
                            <li role="presentation">
                            <a href="#section_careers" data-toggle="collapse" data-target="#school" aria-expanded="false">
                                <div class="panel panel-info panel-colorful-cus">
                                    <div class="pad-all text-center"> <i class="fa fa-university" aria-hidden="true"></i> <span class="text-2x text-thin">학교</span>
                                        <p class = "bo">학교 추가</p>
                                    </div>
                                </div>
                                </a>
                            </li>
                            
                            <li role="presentation">
                            <a href="#section_careers" data-toggle="collapse" data-target="#specialty" aria-expanded="false">
                                <div class="panel panel-info panel-colorful-cus">
                                    <div class="pad-all text-center"> <i class="fa fa-building-o" aria-hidden="true"></i> <span class="text-2x text-thin">대표 전문 분야</span>
                                        <p class = "bo">대표 전문 분야 추가</p>
                                    </div>
                                </div>
                                </a>
                            </li>
                            
                            <li role="presentation">
                            <a href="#section_careers" data-toggle="collapse" data-target="#mypassword" aria-expanded="false">
                                <div class="panel panel-info panel-colorful-cus">
                                    <div class="pad-all text-center"> <i class="fa fa-building-o" aria-hidden="true"></i> <span class="text-2x text-thin">비밀번호 관리</span>
                                        <p class = "bo">비밀번호 변경</p>
                                    </div>
                                </div>
                                </a>
                            </li>
                            
                            <li role="presentation">
                            <a href="#section_careers" data-toggle="collapse" data-target="#otp" aria-expanded="false">
                                <div class="panel panel-info panel-colorful-cus">
                                    <div class="pad-all text-center"> <i class="fa fa-building-o" aria-hidden="true"></i> <span class="text-2x text-thin">OTP</span>
                                        <p class = "bo">OTP 적용</p>
                                    </div>
                                </div>
                                </a>
                            </li>
                            
                        </ul>
                    </div>
                </div>
            </section>
        </div>
                 <div class="collapse" id="career" aria-expanded="false">
      		<div class="well">
        경력
      </div>
    </div>
    
                     <div class="collapse" id="project" aria-expanded="false">
      		<div class="well">
       프로젝트
      </div>
    </div>
    
                         <div class="collapse" id="school" aria-expanded="false">
      		<div class="well">
       학교
      </div>
    </div>
    
                         <div class="collapse" id="specialty" aria-expanded="false">
      		<div class="well">
       대표 전문 분야
      </div>
    </div>
    
                             <div class="collapse" id="mypassword" aria-expanded="false">
      		<div class="well">
       비밀번호 관리
      </div>
    </div>
    
                             <div class="collapse" id="otp" aria-expanded="false">
      		<div class="well">
       	OTP
      </div>
    </div>
        
    </div>
</div>