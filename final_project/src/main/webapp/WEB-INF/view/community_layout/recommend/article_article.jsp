<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
%>
	<div class="recommend_article_info_nameandContent">
		<div class="recommend_article_info_name">
			<strong style="color:#ff9b00;">${dto.mName}</strong>님의 기업 후기 입니다.
			<small style="font-size: 10px; margin-left: 60px;">
				<c:if test="${sessionScope.member.userId == dto.mId}">
					<a onclick="updateRecommend(${dto.gcNum});" style="cursor: pointer;">수정 | </a>
				</c:if>
				<c:if test="${sessionScope.member.userId == dto.mId || sessionScope.member.userId=='admin@a.com'}">
					<a onclick="deleteRecommend(${dto.gcNum}, ${dto.cNum});" style="cursor: pointer;">삭제</a>
				</c:if>
				<c:if test="${sessionScope.member.userId != dto.mId && sessionScope.member.userId !='admin@a.com'}">
					<a href="#" style="cursor: pointer;">신고</a>
				</c:if>
			</small>
		</div>
		<div class="recommend_article_info_content" style="">
			${dto.content}
		</div>
		
	</div>
