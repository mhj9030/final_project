<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
   String cp = request.getContextPath();
%>



<div id="wrap">
    <div id="content">
        <div class="page profile">
            <div class="wrap_wide cmenu">
                <div class="wrap">
                    <ul class="nav nav-pills" role="tablist">
                        <li role="presentation" class="on"><a href="<%=cp%>/profile?mid=${member.userId }">내 프로필</a></li>
                        <li role="presentation" class=""><a href="/@maryjune778/friends">내 친구들</a></li>
                        <li role="presentation" class=""><a href="/@maryjune778/find-friends">친구 찾기 </a></li>
                        <li role="presentation" class=""><a href="/@maryjune778/activities">활동로그</a></li>
                        <li role="presentation" class=""><a href="/@maryjune778/notifications">알림 </a></li>
                        <li role="presentation" class=""><a href="/@maryjune778/applications">지원서 관리</a></li>
                    </ul>
                </div>
            </div>
            <div class="wrap_wide section cover">
                <div id="cover_image" class="image">
                    <div class="in"></div>
                    버튼   	
                </div>
            </div>
            <div class="wrap_wide ontop shadow">
                <div class="wrap">
                    <div class="main all">
                        <section class="section summary">
                            <div class="user_thumb">
                                <div class="preview"> <img id="profile_image_preview" src="<%=cp %>/resources/image/profile_img.jpg" alt="" class="img img-center"> </div>
                                <div class="icontrol show">
                                </div>
                            </div>
                            <div id="user_info" class="section user_info">
                                <div class="name clearfix">
                                    <p class="job_title"> </p>
                                    <h2 class="break">
                                <strong>${dto.mname }</strong><span>  ${dto.mgender } </span>
 
                                
                            </h2> </div>
                            </div>
  
                            <div id="user_overview" class="section overview">
                                <div class="tab-content set">
                                    <div id="overview_view" class="panel-inline media tab-pane active">
                                        <div class="panel-body overview">
                                            <div id="overview_view_text" class="overview">
 											 <c:if test="${empty dto.proIntro }">
                                             자기 소개가 없습니다.
 											</c:if>
 											
 											<c:if test="${!empty dto.proIntro }">
                                             ${dto.proIntro }
 											</c:if>
                                            </div>
                                        </div>
                                    </div>
                                    

                                </div>
                            </div>
    
                        </section>
                        
  
                    </div>
                </div>
            </div>
        </div>
        </div>
        </div>

