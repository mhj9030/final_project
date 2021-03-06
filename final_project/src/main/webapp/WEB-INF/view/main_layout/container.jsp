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
		</p>
		</div>
	</div>
</div>



<div class="wrap">
	
	<!-- 광고 슬라이드 -->
	<div class="row">
	  <div class="col-md-6">
	  	<div style="width: 100%; height: 200px;">
	  		<a href="https://docs.google.com/forms/d/e/1FAIpQLSfVZyIC7WYZUpT9sUvKOft1ASwP5QBLbBVBm64kO8ZVBgh0HA/viewform?c=0&w=1">
	  			<img style="width: 100%; height: 100%" src="<%=cp%>/resources/image/Fursys-Partnership-20170101-1080x460-B.jpg">
	  		</a>
	  	</div>
	  </div>
	  <div class="col-md-6">
		<div style="width: 100%; height: 200px;">
			<a href="http://startup.ncia.kr/">
				<img style="width: 100%; height: 100%" src="<%=cp%>/resources/image/Lvstudy-Business-20170719-1080x460.png">
			</a>
		</div>
	  </div>
	</div>
	
	
	<div class="row blank">
		<div class="col-md-11">
			<h4 class="panel-title">추천그룹</h4>
		</div>
		<div class="col-md-1">
			<a class="panel-link" href="<%=cp%>/community/group">더보기</a>
		</div>
	</div> 
	
	<!-- 추천그룹 -->
	<div class="row">
	  <c:forEach var="gdto" items="${groupList}">
		  <div class="col-md-4">
		  	<div class="panel-group">
		  		<div class="group-img"><img src="<%=cp%>/uploads/community/${gdto.saveFilename}"></div>
		  		<div class="group-name">${gdto.groupName}</div>
		  		<div class="group-type">
		  			<c:forEach var="grouplist" items="${gdto.list}">
		  				<button class="btn btn-xs btn-default">${grouplist.groupTag}</button>
		  			</c:forEach>
		  		</div>
		  		<div class="gruop-join"><button class="btn btn-warning" onclick="javascript:location.href='<%=cp%>/community/group/article?groupNum=${gdto.groupNum}'">가입하기</button></div>
		  	</div>
		  </div>
	  </c:forEach>
	</div>
	
	<div class="row blank">
		<div class="col-md-11">
			<h4 class="panel-title">인기 채용정보</h4>
		</div>
		<div class="col-md-1">
			<a class="panel-link" href="<%=cp%>/employ/main">더보기</a>
		</div>
	</div> 
	
	<!-- 채용시작 -->
	
	<div class="row">
		<c:forEach var="dto" items="${employList}">
	  <div class="col-md-4">
	  	<div class="panel-hire">
	  		<div class="hire-info">
	  			<div class="hire-img"><img src='<%=cp%>/uploads/company/${dto.cLogoimage}' onError='imageError(this);' class='img-responsive' style='max-height: 100px; margin:auto;'>
	  			<a href='<%=cp%>/company/search/article?page=1&cNum=${dto.cNum}' style="font-size:16px; font-weight:bold;">${dto.cName}</a></div>
	  			<div class="hire-etc">
	  				<div><a href='<%=cp%>/employ/article?ceNum=${dto.ceNum}'>${dto.ceSubject}</a></div>
	  				<div><br></div>
	  				<div>지원자 <span class="badge" style="background: red;">${dto.applicant_count }</span> </div>
	  			</div>
	  		</div>
	  		<hr style="margin:10px;">
	  		<div>
	  		<table style="margin:0 auto;">
      	<tr><th><span class="label label-primary">채용 분야</span> </th><td><span class="label label-info">${dto. subname}</span></td></tr>
      	<tr><th><span class="label label-primary">고용 형태</span> </th><td><span class="label label-info">${dto.ceType}</span></td></tr>
      	<tr><th><span class="label label-primary">&nbsp;&nbsp;&nbsp;&nbsp;연봉&nbsp;&nbsp;&nbsp;&nbsp;</span> </th><td><span class="label label-info">${dto.cePay } 만원</span></td></tr>
      	<tr><th><span class="label label-primary">&nbsp;&nbsp;마감일&nbsp;&nbsp;&nbsp;</span> </th><td><span class="label label-info">~${dto.ceEnd}</span></td></tr>
      	</table>
      		</div>
	  		<%-- <div class="hire-type">고용형태:${dto.ceType}, 분야:${dto.subname}</div>
	  		<div class="hire-now">마감일: ~${dto.ceEnd }, 연봉 ${dto.cePay}</div> --%>
	  	</div>
	  </div>
	   </c:forEach>
	 
	</div>
	
	<!-- 채용끝 -->
	
	<div class="row blank">
		<div class="col-md-11">
			<h4 class="panel-title">인기 기업정보</h4>
		</div>
		<div class="col-md-1">
			<a class="panel-link" href="<%=cp%>/company/search">더보기</a>
		</div>
	</div> 
	
	<div class="row">	
	  <c:forEach var="dto" items="${comList}">
	  <div class="col-md-4">
	  	<div class="panel-busi">
	  		<div class="busi-img" style="background-size: cover; background-image: url('<%=cp%>/uploads/company/${dto.cCoverImage}');">
	  			<c:if test="${not empty dto.cLogoImage}">
					<img width="80px" src="<%=cp%>/uploads/company/${dto.cLogoImage}">
				</c:if>
				<c:if test="${empty dto.cLogoImage}">
					<img width="80px" src="<%=cp%>/resources/image/profile_img.jpg">
				</c:if>
	  		</div>
	  		<div class="busi-name"><a href="${articleUrl}?cNum=${dto.cNum}">${dto.cName}</a></div>
	  		<div class="busi-type" style="overflow: hidden;"><span class="label label-primary">${dto.maName}</span> : <span class="label label-info">${dto.subName}</span></div>
	  		<div class="busi-intro" style="overflow: auto; font-size: 11px;">${dto.cDescription}</div>
	  		<div class="busi-etc">
	  			<div>
	  				<c:if test="${not empty dto.proPhoto}">
						<img width="80px" src="<%=cp%>/uploads/profile/${dto.proPhoto}">
					</c:if>
					<c:if test="${empty dto.proPhoto}">
						<img width="80px" src="<%=cp%>/resources/image/profile_img.jpg">
					</c:if>
	  			</div>
	  			<div class="busi-etc-text">
	  				<a href="<%=cp%>/profile?id=${dto.mId}">${dto.mName}</a>
	  			</div>
	  			<div class="busi-etc-text" align="right">
	  				<c:if test="${dto.employ_cnt>0}">
						<a href="<%=cp%>/employ/main">채용 <span class="badge" style="background: red;">${dto.employ_cnt}</span></a>
					</c:if>
	  			</div>
	  		</div>
	  	</div>
	  </div>
	  </c:forEach>
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
	  			<h4>취업뉴스 <small style="margin-left: 300px; font-size: 11px; cursor: pointer;" onclick="javascript:location.href='<%=cp%>/community/news'">더보기</small></h4>
	  			<hr>
				<table>
					<c:forEach var="newsdto" items="${newsList}">
						<tr>
							<td rowspan="2" class="news-subject" width="300"><a href="<%=cp%>/community/news/article?jbnum=${newsdto.jbnum}">${newsdto.subject}</a></td>
							<c:if test="${newsdto.type=='직장인'}">
								<td width="100" style="text-align: center;"><span style="background: #ff8888; color: white;">${newsdto.type}</span></td>
							</c:if>
							<c:if test="${newsdto.type=='취준생'}">
								<td width="100" style="text-align: center;"><span style="background: #9b88ff; color: white;">${newsdto.type}</span></td>
							</c:if>
							<c:if test="${newsdto.type=='알바생'}">
								<td width="100" style="text-align: center;"><span style="background: #ffca00; color: white;">${newsdto.type}</span></td>
							</c:if>
						</tr>
						<tr>
							<td width="100" class="news-created">${newsdto.created}</td>
						</tr>
					</c:forEach>
				</table>	  			
	  		</div>
	  	</div>
	  </div>
	  <div class="col-md-6">
		<div class="panel-news">
			<div class="news-event">
				<h4>공지사항<small style="margin-left: 300px; font-size: 11px; cursor: pointer;" onclick="javascript:location.href='<%=cp%>/help_layout/notice/list'">더보기</small></h4>
	  			<hr>
				<table>
			
			
			<c:forEach var="dto" items="${list}">
			
				<tr align="center">
					<td><span style="display: inline-block;width: 28px;height:18px;line-height:18px; background: #ED4C00;color: #FFFFFF">공지</span></td>
					<td align="left">
						<a href="${articleUrl1}&num=${dto.notNum}">&nbsp;&nbsp;&nbsp;${dto.subject}</a>
						
					</td>
					<td><br><br></td>
				</tr>
				
				
				</c:forEach>
			
			
					
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

<script type="text/javascript">
function imageError(image) {
	image.src="<%=cp%>/resources/image/profile_img.jpg";
}
</script>