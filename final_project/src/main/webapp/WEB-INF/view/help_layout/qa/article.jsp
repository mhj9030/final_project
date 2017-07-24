<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>


<!-- 중앙정렬용 center-block  -->
<div class="wrapper center-block" style="max-width: 980px;">

<div id="title"class="text-center">
<h1>${dto.subject}</h1>
</div>
<div class="text-right">
<h5>${dto.created} ${dto.hitCount}</h5>
</div>
<hr>

<!-- 글내용  content -->
<div id="content">
<pre style="white-space: pre-wrap; background:white;">
 ${dto.content}
</pre>
</div>
<hr>



<div class= "footer-bar">
			<div style="text-align: right;">
				<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/help_layout/qa/list'">목록</button>
				<c:if test="${sessionScope.member.userId=='admin'}">
				<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/help_layout/qa/reply?qaNum=${dto.qaNum}&page=${page}';">답변</button>
				</c:if>
			</div>
	</div>



</div>