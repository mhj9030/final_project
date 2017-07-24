<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
%>
<c:forEach var="vo" items="${listReplyAnswer}">
	<div class='answer' style='padding: 0px 10px;'>
		<div style='clear: both; padding: 10px 0px;'>
			<div style='float: left; width: 5%;'>└</div>
			<div style='float: left; width: 95%;'>
				<div style='float: left;'>
					<b>${vo.mName}</b>
				</div>
				<div style='float: right;'>
					<span>${vo.created}</span> |
					<c:if
						test="${sessionScope.member.userId==vo.mId || sessionScope.member.userId=='admin'}">
						<a onclick='deleteReplyAnswer("${vo.replyNum}", "${vo.answer}");'>삭제</a>
					</c:if>
					<c:if
						test="${sessionScope.member.userId!=vo.mId && sessionScope.member.userId!='admin'}">
						<a href='#'>신고</a>
					</c:if>
				</div>
			</div>
		</div>
		<div
			style='clear: both; padding: 5px 5px 5px 5%; border-bottom: 1px solid #ccc;'>
			${vo.content}</div>
	</div>
</c:forEach>