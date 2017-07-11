<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>

<div class="page_body">
	<div class="page_head">
		<h3>| 공지사항</h3><hr>
	</div>
	<div class="wrapper center-block" style="max-width: 980px;">
		<div id="title"class="text-center">
			<h1>${dto.subject}</h1>
		</div>
		<div class="text-right">
			<h5>날짜: ${dto.created}</h5>
		</div>
		<hr>
	
		<!-- 글내용  content -->
		<div id="content">
<pre style="white-space: pre-wrap; background:white;">
${dto.content}
</pre>
		</div>
		<hr>
		
		<!-- 버튼 -->
		<div class= "footer-bar">
			<div style="text-align: right;">
				<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/point/main'">목록</button>
			<c:if test="${sessionScope.member.userId=='admin@a.com'}">
				<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/point/main/update?num=${dto.poNum}&page=${page}'">수정</button>
				<button type="button" class="btn btn-default" onclick="deleteCheck('<%=cp%>/point/main/delete?num=${dto.poNum}')">삭제</button>
			</c:if>
			</div>
		</div>
	</div>
</div>

<script>
function deleteCheck(url){
	if(confirm("게시글을 삭제하시겠습니까?")){
		location.href=url;
	}
}
</script>