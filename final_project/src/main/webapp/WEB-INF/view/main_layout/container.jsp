<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
   String cp = request.getContextPath();
%>

<!-- 메인 점보트론 -->
<div class="jumbotron">
	<div class="container">
	<div class = "text-zone">
		<h2>구인 | 채용 네트워크, 잡 스퀘어에 오신 것을 환영합니다.</h2>
		<p>지금 가입하고 비즈니스와 커리어를 성장시킬 수 있는 다양한 기회들을 만나보세요!
</p>
		<p>
			<a class="btn btn-lg btn-primary" href="#" role="button" data-toggle="modal" data-target="#job-register">무료 가입</a>
		</p>
		</div>
	</div>
</div>



<div class="wrap">
	
	<!-- 광고 슬라이드 -->
	<div class="row">
	  <div class="col-md-6">
	  	<div style="width: 100%; height: 150px; border: 1px solid black;"></div>
	  </div>
	  <div class="col-md-6">
		<div style="width: 100%; height: 150px; border: 1px solid black;"></div>
	  </div>
	</div>
	
	
	<div class="row blank">
		<div class="col-md-11">
			<h4 class="panel-title">추천그룹</h4>
		</div>
		<div class="col-md-1">
			<a class="panel-link" href="#">더보기</a>
		</div>
	</div> 
	
	<!-- 추천그룹 -->
	<div class="row">
	  <div class="col-md-4">
	  	<div class="panel-group">
	  		<div class="group-img">11</div>
	  		<div class="group-name">22</div>
	  		<div class="group-intro">33</div>
	  		<div class="gruop-join">44</div>
	  	</div>
	  </div>
	  <div class="col-md-4">
		<div class="panel-group">
			<div class="group-img"></div>
	  		<div class="group-name"></div>
	  		<div class="group-intro"></div>
	  		<div class="gruop-join"></div>
		</div>
	  </div>
	  <div class="col-md-4">
	  	<div class="panel-group">
	  		<div class="group-img"></div>
	  		<div class="group-name"></div>
	  		<div class="group-intro"></div>
	  		<div class="gruop-join"></div>
	  	</div>
	  </div>
	</div>
	
	<div class="row blank">
		<div class="col-md-11">
			<h4 class="panel-title">인기 채용정보</h4>
		</div>
		<div class="col-md-1">
			<a class="panel-link" href="#">더보기</a>
		</div>
	</div> 
	
	
	<div class="row">
	  <div class="col-md-4">
	  	<div  class="panel-hire"></div>
	  </div>
	  <div class="col-md-4">
		<div class="panel-hire"></div>
	  </div>
	  <div class="col-md-4">
	  	<div class="panel-hire"></div>
	  </div>
	</div>
	
	<div class="row blank">
		<div class="col-md-11">
			<h4 class="panel-title">인기 기업정보</h4>
		</div>
		<div class="col-md-1">
			<a class="panel-link" href="#">더보기</a>
		</div>
	</div> 
	
	<div class="row">
	  <div class="col-md-4">
	  	<div class="panel-busi"></div>
	  </div>
	  <div class="col-md-4">
		<div class="panel-busi"></div>
	  </div>
	  <div class="col-md-4">
	  	<div class="panel-busi"></div>
	  </div>
	</div>
	
	<div class="row blank">
		<div class="col-md-11">
			<div></div>
		</div>
		<div class="col-md-1">
			<div></div>
		</div>
	</div>
	
	<div class="row">
	  <div class="col-md-6">
	  	<div class="panel-news"></div>
	  </div>
	  <div class="col-md-6">
		<div class="panel-news"></div>
	  </div>
	</div>
	
	<div class="row blank">
		<div class="col-md-11">
			<div></div>
		</div>
		<div class="col-md-1">
			<div></div>
		</div>
	</div>
</div>