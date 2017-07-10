<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>
<div class="list-body" align="center" style="height: auto;">
	<div class="page-header">
		<h1 align="left">
			| 지원자 현황 <small></small>
		</h1>
	</div>
	
	<div class="search" style="width: 800px; height: 34px;">
		<div class="row">
			<div class="col-xs-2">
				<div class="btn-group">
				  	<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
				    	채용 선택 <span class="caret"></span>
				  	</button>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">2017년 SI사업부 시스템 유지보수 및 기술지원 신입(인턴) 채용</a></li>
						<li><a href="#">2017년 SW설계 및 구매 신입/경력사원 모집</a></li>
						<li><a href="#">2018년 쿠팡맨 모집</a></li>
					</ul>
				</div>
			</div>
			<div class="col-xs-10" style="text-align: left">
				<div class="search-content" style="margin-top: 7px;">
					2017년 SI사업부 시스템 유지보수 및 기술지원 신입(인턴) 채용
				</div>
			</div>
		</div>
	</div>
	
	<div class="list">
		<div class="list-header" style="margin-top: 30px;">
			<div class="subject" align="left">
				<h4>전체 지원자(10)</h4>
			</div>
			<div class="chk_info" align="right">
				<input type="radio" name="order" value="recent" checked="checked"> 최신순
				<input type="radio" name="order" value="name"> 이름순
			</div>
		</div>
		
		<%-- <c:forEach var="dto" items="${list}"> --%>
			<div class="list-item">
				<div class="item-image">
					<img width="80px" src="<%=cp%>/resources/image/profile_img.jpg">
				</div>
				<div class="item-content">
					<div class="content-name" style="margin-top: 5px; margin-bottom: 7px;">
						<strong>홍길동</strong><span> 남</span>
					</div>
					<div class="content-info" align="right">
						<a href="#">프로필 보기</a>
						<a href="#">&nbsp;&nbsp;이력서 보기</a>
					</div>
					<div class="content-intro"><h5>자기소개가 없습니다.</h5></div>
					<div class="content-email"><h5>phj375@naver.com</h5></div>
				</div>
			</div>
		<%-- </c:forEach> --%>
		<div class="page">
			<div>1 2 3</div>
		</div>
	</div>
</div>