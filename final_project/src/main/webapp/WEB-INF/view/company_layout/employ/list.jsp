<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>
<script>
	function searchList(searchValue){
		var f=document.searchForm;
		
		f.searchValue.value=searchValue;
		
		f.action="${listUrl}";
		f.submit();
	}
</script>

<div class="employ-body">
	<div class="page-header">
		<h1 align="left">
			| 채용관리 <small></small>
		</h1>
	</div>
	
	<div>
		<div align="right">${dataCount}개(${page}/${total_page} 페이지)</div>
		
		<table class="table table-hover">
			<thead>
				<tr>
					<th width="60">번호</th>
					<th>제목</th>
					<th width="100">시작일</th>
					<th width="100">마감일</th>
				</tr>
			</thead>
			
			<c:forEach var="dto" items="${list}">
				<tbody>
					<tr align="center">
						<td>${dto.listNum}</td>
						<td align="left"><a href="${articleUrl}&ceNum=${dto.ceNum}">${dto.ceSubject}</a></td>
						<td>${dto.ceStart}</td>
						<td>${dto.ceEnd}</td>
					</tr>
				</tbody>
			</c:forEach>	
		</table>
		
		<div align="center">
			<div>${paging}</div>
		</div>
		
		<div class= "footer-bar" >
			<div class = "foorter-bar-refresh">
				<button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/company/employ';">새로고침</button>
			</div>
			<div class = "footer-search-bar">
				<form name="searchForm" method="post" class="form-inline">
					<input type="text" class="form-control input-sm input-search"
						name="searchValue">
					<button type="button" class="btn btn-info btn-sm btn-search"
						onclick="searchList();">
						<span class="glyphicon glyphicon-search"></span> 검색
					</button>
				</form>
			</div>
			<div class = "footer-bar-submit">
				<button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/company/employ/created';">채용등록</button>
			</div>
		</div>
	</div>
</div>