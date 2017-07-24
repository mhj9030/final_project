<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>



<script type="text/javascript">
function deleteEvent() {
<c:if test="${sessionScope.member.userId=='admin@a.com' || sessionScope.member.userId==dto.mId}">
  var num = "${dto.evtNum}";
  var page = "${page}";
  var query = "num="+num+"&page="+page;
  var url = "<%=cp%>/event/delete?" + query;

  if(confirm("위 자료를 삭제 하시 겠습니까 ? "))
  	location.href=url;
</c:if>
<c:if test="${sessionScope.member.userId!='admin' && sessionScope.member.userId!=dto.mId}">
  alert("게시물을 삭제할 수  없습니다.");
</c:if>
}

function updateEvent() {
<c:if test="${sessionScope.member.userId==dto.mId}">
  var num = "${dto.evtNum}";
  var page = "${page}";
  var query = "num="+num+"&page="+page;
  var url = "<%=cp%>/event/update?" + query;

  location.href=url;
</c:if>

<c:if test="${sessionScope.member.userId!=dto.mId}">
 alert("게시물을 수정할 수  없습니다.");
</c:if>
}








</script>

<div class="wrapper center-block" style="max-width: 980px;">

<div id="title"class="text-center">
<h2>${dto.subject}</h2>
</div>
<div class="text-right">
<h5>${dto.created}</h5>
</div>
<hr>

<!-- 글내용  content -->
<div id="content">
<pre style="white-space: pre-wrap; background:white;">
 <img src="<%=cp%>/uploads/event/${dto.imageFilename}" style="max-width:100%; height:auto; resize:both;">
 ${dto.content}
</pre>
</div>
<hr>
	<div class= "footer-bar">
			<div style="text-align: right;">
				<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/help_layout/event/list'">목록</button>
			
			<button type="button" class="btn btn-default btn-sm wbtn" onclick="updateEvent();">수정</button>
			<button type="button" class="btn btn-default btn-sm wbtn" onclick="deleteEvent();">삭제</button>
			</div>
	</div>



</div>

