<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript">

$(function(){
	var gradeAvg = "${dto.gradeAvg}";
	gradeAvg = Math.round(gradeAvg);
	
	for(var i=1; i<=gradeAvg; i++){
		$("#star"+i).addClass("on");
	}
});

function moreInfo(gcNum){
	var url = "<%=cp%>/community/recommend/moreInfo";
	
	// text/html
	$.post(url, {gcNum:gcNum}, function(data){
		$("#articleInfo"+gcNum).html(data);
	});

}


function hideInfo(gcNum){
	$("#articleInfo"+gcNum).html("");
}

</script>


<div class="community_article_wrap" style="border: 0px;">
	<div style="width:760px; height: 700px; margin:0px auto;">
		<div style="float: left; height: 410px; width:250px; position: relative; margin-bottom: 160px;">
			<div class="recommend_article_cname">${dto.cName}</div>
			<div class="recommend_article_employ">
				진행중인 채용공고? ${employCount}
				<div onclick="javacript:location.href='<%=cp%>/employ/main'">바로보기<i class="glyphicon glyphicon-play"></i></div>
				<hr class="recommend_article_hr">
			</div>
			<div class="recommend_article_rating">
				<p class="star_rating">
				    <a id="star1">★</a>
				    <a id="star2">★</a>
				    <a id="star3">★</a>
				    <a id="star4">★</a>
				    <a id="star5">★</a>
				</p>
				<strong>${dto.gradeAvg}</strong>
			</div>
			<div class="recommend_article_grade" style="height: 6%; width: 100%;"><strong>5점</strong>  ${dto.grade5}</div>
			<div class="recommend_article_grade" style="height: 6%; width: 100%;"><strong>4점</strong>  ${dto.grade4}</div>
			<div class="recommend_article_grade" style="height: 6%; width: 100%;"><strong>3점</strong>  ${dto.grade3}</div>
			<div class="recommend_article_grade" style="height: 6%; width: 100%;"><strong>2점</strong>  ${dto.grade2}</div>
			<div class="recommend_article_grade" style="height: 6%; width: 100%;"><strong>1점</strong>  ${dto.grade1}</div>
			<div class="recommend_article_createBtn">
				<button class="btn btn-info">글쓰기</button>
			</div>
		</div>
		<div style="float: left;">
			<div class="recommend_article_user_wrap">
				<c:forEach var="vo" items="${list}">
					<div class="recommend_article_review">
						<div style="float: left; width: 80px; height: 80px;">
							<c:if test="${vo.grade==1}">
								<img style="width: 100%; height: 100%;" src="<%=cp%>/resources/image/1.png">
							</c:if>
							<c:if test="${vo.grade==2}">
								<img style="width: 100%; height: 100%;" src="<%=cp%>/resources/image/2.png">
							</c:if>
							<c:if test="${vo.grade==3}">
								<img style="width: 100%; height: 100%;" src="<%=cp%>/resources/image/3.png">
							</c:if>
							<c:if test="${vo.grade==4}">
								<img style="width: 100%; height: 100%;" src="<%=cp%>/resources/image/4.png">
							</c:if>
							<c:if test="${vo.grade==5}">
								<img style="width: 100%; height: 100%;" src="<%=cp%>/resources/image/5.png">
							</c:if>
						</div>
						<div class="recommend_article_review_subject"><strong>${vo.subject}</strong></div>
						<div class="recommend_article_review_etc">
							<div class="etc_created">${vo.created}</div>
							<div class="etc_name">${vo.mName}</div>
							<div class="etc_more">
								<a style="cursor: pointer;" onclick="moreInfo(${vo.gcNum});">더보기▼</a>
							</div>
						</div>
					</div>
					<div id="articleInfo${vo.gcNum}"></div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>