<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript">

</script>


<div class="community_article_wrap" style="height:750px; border: 0px;">
	<div class="group_article_info">
		<div class="group_article_info_image">
			<c:if test="${not empty dto.saveFilename}">
				<img src="<%=cp%>/uploads/community/${dto.saveFilename}">
			</c:if>
			<c:if test="${empty dto.saveFilename}">
				<img src="<%=cp%>/resources/image/noimage.png">
			</c:if>
		</div>
		<div style="float: left; width: 50%; height: 100%; padding: 11px;">
			<div class="group_article_info_name">
				<strong>${dto.groupName}</strong> <button class="btn btn-sm btn-success">그룹장 : ${dto.mName}</button>
			</div>
			<div class="group_article_info_tag">
				<c:forEach var="vo" items="${dto.list}">	
					<button class="btn btn-sm btn-default">${vo.groupTag}</button>
				</c:forEach>	
			</div>
			<div class="group_article_info_created">
				<small>그룹생성일 : ${dto.created}</small>
			</div>
		</div>
		<div style="float: left; width: 20%; height: 100%;">
			<button class="btn btn-info" style="width: 100%; height:100%">
				가입하기/탈퇴하기
			</button>
		</div>
	</div>
	<div class="group_article_info_intro">
		<strong style="font-size: 20px; padding-left: 10px;">소개말</strong>
		<div style="height: 69px; padding-left: 11px; padding-top: 5px;">
			${dto.groupInfo}
		</div>
	</div>
	
	<div class="groupNo">
		그룹원만 이용 가능합니다.
	</div>
</div>