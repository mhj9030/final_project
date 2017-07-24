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
            <div class="wrap_wide section cover">
                <div id="cover_image" class="image">
                    <div class="in"></div>
                 	
                </div>
            </div>
            <div class="wrap_wide ontop shadow">
                <div class="wrap">
                    <div class="main all">
                        <section class="section summary">
                            <div class="user_thumb">
                                <div class="preview">
                                	<c:if test="${empty dto.proPhoto}">
                                		<img id="profile_image_preview" src="<%=cp %>/resources/image/profile_img.jpg" alt="" class="img img-center">
                                	</c:if>
                                	<c:if test="${not empty dto.proPhoto}">
                                		<img id="profile_image_preview" src="<%=cp %>/uploads/profile/${dto.proPhoto}" alt="" class="img img-center">
                                	</c:if>
                                </div>
                                <div class="icontrol show">
	                                <a href="<%=cp%>/profile/update?id=${member.userId}">
	                                	<span class="glyphicon glyphicon-cog"></span> 프로필 수정
	                                </a>
                                </div>
                            </div>
                            <div id="user_info" class="section user_info">
                                <div class="name clearfix">
                                    <p class="job_title"> </p>
                                    <h2 class="break">
                                <strong>${dto.mname }</strong><span>&nbsp;&nbsp;&nbsp;${dto.mgender } </span>
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
                                             ${dto.proIntro}
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
        
        <div class ="contents">
        		<div class = "wrap">
        			<div class ="main all">
        			<section class = "section_box">
        			<div class ="panel-head">
        						<h3 class="panel-title">프로필 정보 <small>프로필 완성도를 높여 더 많은 기회를 만나세요.</small></h3>
        					</div>
        				<div class ="panel panel-default">
        					<div class = "panel-body panel-view shadow">
        						<ul class  = "list-unstyled list list4 list-overflow-x clearfix">
        						
        							<li role="presentation">
                                        <div class="panel panel-info panel-colorful">
                                            <div class="pad-all text-center">
                                                <i class="fa fa-building-o" aria-hidden="true"></i>
                                                <span class="text-2x text-thin">경력</span>
                                                <p>경력 보기</p>
                                            </div>
                                        </div>
                                </li>
                                
                               <li role="presentation">
                                        <div class="panel panel-info panel-colorful">
                                            <div class="pad-all text-center">
                                                <i class="fa fa-suitcase" aria-hidden="true"></i>
                                                <span class="text-2x text-thin">프로젝트</span>
                                                <p>프로젝트 보기</p>
                                            </div>
                                        </div>
                                </li>
                                
                               <li role="presentation">
                                        <div class="panel panel-info panel-colorful">
                                            <div class="pad-all text-center">
                                               <i class="fa fa-university" aria-hidden="true"></i>
                                                <span class="text-2x text-thin">학교</span>
                                                <p>서울대학교 졸업</p>
                                            </div>
                                        </div>
                                </li>
                                
                                
                               <li role="presentation">
                                        <div class="panel panel-info panel-colorful">
                                            <div class="pad-all text-center">
                                                <i class="fa fa-building-o" aria-hidden="true"></i>
                                                <span class="text-2x text-thin">대표 전문 분야</span>
                                                <p>JAVA, ORACLE, JSP, CSS</p>
                                            </div>
                                        </div>
                                </li>
                                
                                
        						</ul>
        					</div>
        				</div>
        			</section>
        		</div>
        		</div>
        </div>
        
        </div>
        </div>

