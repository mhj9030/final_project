<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>




<div class="wrapper center-block" style="max-width: 980px;">

<div id="title"class="text-center">
<h2>${dto.subject}</h2>
</div>
<div class="text-right">
<h5>${dto.created} ${dto.hitCount}</h5>
</div>
<hr>

<!-- 글내용  content -->
<div id="content">
<iframe src="https://docs.google.com/forms/d/e/1FAIpQLSd32nHQ1UeFAyuOQmkknkeWZOFEe1vGZjd5g34Fc0v6Sbl4tQ/viewform?usp=sf_link" width=800px; height=800px;></iframe>

</div>
<hr>
	<div class= "footer-bar">
			<div style="text-align: right;">
				<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/help_layout/notice/list'">목록</button>
			<c:if test="${sessionScope.member.userId=='admin@a.com'}">
				<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/notice/update?num=${dto.notNum}&page=${page}'">수정</button>
				<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/notice/delete?num=${dto.notNum}'">삭제</button>
			</c:if>
			</div>
	</div>



</div>