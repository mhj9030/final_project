<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>
<!-- Bootstrap CSS -->

<!-- <link href="/final_project/resources/css/bootstrap.min.css" rel="stylesheet"> -->

<script>

</script>

<!-- 중앙정렬용 center-block  -->
<div class="wrapper center-block" style="max-width: 980px;">

<div id="title"class="text-center">
<h1>제목</h1>
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
				<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/help_layout/claim/list'">목록</button>
			<c:if test="${sessionScope.member.userId=='admin@a.com'}">
				<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/notice/main/update?num=${dto.claimNum}&page=${page}'">수정</button>
				<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/claim/delete?num=${dto.claimNum}'">삭제</button>
			</c:if>
			</div>
	</div>





<!-- 댓글용 text-center -->
<!-- <div class="text-center">
	
	
	<hr>
	
	답글 및 버튼
	<div class="row">
	<h3>답글남기기</h3>

			<textarea id='replyCountent' class="form-control" rows="4" placeholder="남기시오 답글">
			
			</textarea>
			<hr>
			<button type="button" style="float: left;" class="btn" onclick="sendReply();">답글등록</button>
			
			
			
			<button style="float: right;" class="btn">목록</button>
	</div>
	
	
		
	
</div> -->

</div>