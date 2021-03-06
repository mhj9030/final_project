<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>

<script>
	function updateGoverNews(){
		var gnNum=${dto.gnNum};
		var page=${page};
		var query="gnNum="+gnNum+"&page="+page;
		var url="<%=cp%>/company/gover_news/update?"+query;
		
		location.href=url;
	}

	function deleteGoverNews(){
		var gnNum=${dto.gnNum};
		var page=${page};
		var query="gnNum="+gnNum+"&page="+page;
		var url="<%=cp%>/company/gover_news/delete?"+query;
		
		if(confirm("위 자료를 삭제 하시게습니까?"))
			location.href=url;
	}
	
</script>

<div class="goverNews-article-body">
	<div class="body-header">
		<h3 align="left">
			| 공무원 소식 
			<small style="font-family: 'Gudea', sans-serif; letter-spacing: 3px; margin-left: 5px; font-size: 16px; font-weight: bold; color: #6d6b6b;">
				Government Employee News
			</small>
		</h3>
		<hr>
	</div>
	
	<table class="table">
		<tr style="text-align: center;">
			<td colspan="2">${dto.gnSubject}</td>
		</tr>
		<tr>
			<td>작성자 : ${dto.mName}</td>
			<td style="text-align: right;">작성일 : ${dto.gnCreated}</td>
		</tr>
		<tr>
			<td colspan="2" style="height: 300px;">${dto.gnContent}</td>
		</tr>
		<tr>
			<td colspan="2">이전글 : 
				<c:if test="${not empty preReadDto}">
			    	<a href="<%=cp%>/company/gover_news/article?${query}&gnNum=${preReadDto.gnNum}">${preReadDto.gnSubject}</a>
			    </c:if>
			</td>
		</tr>
		<tr>
			<td colspan="2">다음글 : 
				<c:if test="${not empty nextReadDto}">
			    	<a href="<%=cp%>/company/gover_news/article?${query}&gnNum=${nextReadDto.gnNum}">${nextReadDto.gnSubject}</a>
			    </c:if>
			</td>
		</tr>
	</table>
	
	<div style="text-align: right;">
		<c:if test="${sessionScope.member.userId=='admin'}">
			<button type="button" class="btn btn-default" onclick="updateGoverNews();">수정</button>
			<button type="button" class="btn btn-default" onclick="deleteGoverNews();">삭제</button>
		</c:if>
		<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/company/gover_news?${query}';">뒤로</button>
	</div>
</div>