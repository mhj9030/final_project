<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>

<div class="page_body">
	<h3>
	| 공지사항 <small style="font-family: 'Gudea', sans-serif; letter-spacing: 3px; margin-left: 5px; font-size: 16px; font-weight: bold; color: #6d6b6b;">Reading</small>
	</h3><hr>

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
		
		<!-- 이전글 다음글 -->
		
		<div>
		이전글 : <c:if test="${empty preReadDto}">이전글이 없습니다.</c:if>
		<c:if test="${not empty preReadDto}">
			<a href="<%=cp%>/point/main/article?num=${preReadDto.poNum}&page=${page}">${preReadDto.subject}</a>
		</c:if><br>
		다음글 : <c:if test="${empty nextReadDto}">다음글이 없습니다.</c:if>
		<c:if test="${not empty nextReadDto}">
			<a href="<%=cp%>/point/main/article?num=${nextReadDto.poNum}&page=${page}">${nextReadDto.subject}</a>
		</c:if>
		</div>
		
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