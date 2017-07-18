<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>

<script>
	function updateInquiry(){
		var cqNum=${dto.cqNum};
		var page=${page};
		var query="cqNum="+cqNum+"&page="+page;
		var url="<%=cp%>/company/inquiry/update?"+query;
		
		location.href=url;
	}

	function deleteInquiry(){
		var cqNum=${dto.cqNum};
		var page=${page};
		var query="cqNum="+cqNum+"&page="+page;
		var url="<%=cp%>/company/inquiry/delete?"+query;
		
		if(confirm("위 자료를 삭제 하시게습니까?"))
			location.href=url;
	}
	
</script>

<div class="inquiry-article-body">
	<div class="body-header">
		<h3 align="left">
			| 기업문의 <small></small>
		</h3>
	</div>
	
	<table class="table">
		<tr style="text-align: center;">
			<td colspan="2">${dto.cqSubject}</td>
		</tr>
		<tr>
			<td>작성자 : <a href="<%=cp%>/profile?id=${dto.mId}">${dto.mName}</a></td>
			<td style="text-align: right;">작성일 : ${dto.cqCreated}</td>
		</tr>
		<tr>
			<td colspan="2" style="height: 300px;">${dto.cqContent}</td>
		</tr>
		<tr>
			<td colspan="2">이전글 : 
				<c:if test="${not empty preReadDto}">
			    	<a href="<%=cp%>/company/inquiry/article?${query}&cqNum=${preReadDto.cqNum}">${preReadDto.cqSubject}</a>
			    </c:if>
			</td>
		</tr>
		<tr>
			<td colspan="2">다음글 : 
				<c:if test="${not empty nextReadDto}">
			    	<a href="<%=cp%>/company/inquiry/article?${query}&cqNum=${nextReadDto.cqNum}">${nextReadDto.cqSubject}</a>
			    </c:if>
			</td>
		</tr>
	</table>
	
	<div style="text-align: right;">
		<c:if test="${dto.cqDepth==0}">
			<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/company/inquiry/answer?cqNum=${cqNum}';">답변</button>
		</c:if>
		<c:if test="${sessionScope.member.userId==dto.mId}">
			<button type="button" class="btn btn-default" onclick="updateInquiry();">수정</button>
			<button type="button" class="btn btn-default" onclick="deleteInquiry();">삭제</button>
		</c:if>
		<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/company/inquiry';">뒤로</button>
	</div>
</div>