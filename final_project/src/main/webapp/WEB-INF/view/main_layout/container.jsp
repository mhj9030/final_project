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
	  		<div class="group-img"><img src="<%=cp%>/resources/image/Desert.jpg"></div>
	  		<div class="group-name">자바를 자바라!</div>
	  		<div class="group-type">IT</div>
	  		<div class="gruop-join"><button>가입하기</button></div>
	  	</div>
	  </div>
	  <div class="col-md-4">
		<div class="panel-group">
			<div class="group-img"></div>
	  		<div class="group-name"></div>
	  		<div class="group-type"></div>
	  		<div class="gruop-join"></div>
		</div>
	  </div>
	  <div class="col-md-4">
	  	<div class="panel-group">
	  		<div class="group-img"></div>
	  		<div class="group-name"></div>
	  		<div class="group-type"></div>
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
	  	<div class="panel-hire">
	  		<div class="hire-info">
	  			<div class="hire-img"><img src="<%=cp%>/resources/image/Desert.jpg"></div>
	  			<div class="hire-etc">
	  				<div>채용제목</div>
	  				<div>기업명</div>
	  				<div>신입 _경력</div>
	  			</div>
	  		</div>
	  		<div class="hire-type">IT</div>
	  		<div class="hire-now">현재 지원자 수 , 마감일, 연봉, 등등</div>
	  	</div>
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
	  	<div class="panel-busi">
	  		<div class="busi-img" style="background-size: cover; background-image: url('<%=cp%>/resources/image/google.jpeg');">
	  			<img src="<%=cp%>/resources/image/Desert.jpg">
	  		</div>
	  		<div class="busi-name">기업명</div>
	  		<div class="busi-intro">직원은 가족이다!!</div>
	  		<div class="busi-etc">
	  			<div><img src="<%=cp%>/resources/image/Desert.jpg"></div>
	  			<div class="busi-etc-text">사진이름</div>
	  			<div class="busi-etc-text">채용중</div>
	  		</div>
	  	</div>
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
	  	<div class="panel-news">
	  		<div class="news-job">
	  			<h4>취업꿀팁</h4>
	  			<hr>
				<table>
					<tr>
						<td class="news-subject" width="300">취업이가능할까?(제목)</td>
						<td class="news-created"  rowspan="2">2017-07-07</td>
					</tr>
					<tr>
						<td width="300">한연구결과에따르면 어쩌구....</td>
					</tr>
				</table>	  			
	  		</div>
	  	</div>
	  </div>
	  <div class="col-md-6">
		<div class="panel-news">
			<div class="news-event">
				<h4>취업꿀팁</h4>
	  			<hr>
				<table>
					<tr>
						<td class="news-subject" width="250">가입자 무료포인트 100증정 </td>
						<td class="news-created" >2017-07-07 ~ 2017-08-07</td>
					</tr>
					
				</table>	
			</div>
		</div>
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