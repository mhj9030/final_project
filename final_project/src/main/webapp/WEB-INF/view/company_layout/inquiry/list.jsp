<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>
<script>
	function searchList(){
		var f=document.searchForm;
		f.action="<%=cp%>/company/inquiry";
		f.submit();
	}
</script>

<div class="list-body" align="center">
	<div class="page-header">
		<h1 align="left">
			| 기업문의 <small></small>
		</h1>
	</div>

	<div>
		<div align="right">${dataCount}개(${page}/${total_page}페이지)</div>

		<table class="table table-hover">
			<thead>
				<tr>
					<th width="60">번호</th>
					<th>제목</th>
					<th width="100">작성자</th>
					<th width="100">작성일</th>
					<th width="80">답변여부</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="dto" items="${list}">
					<tr align="center">
						<td>${dto.listNum}</td>
						<td align="left">
							<c:if test="${dto.cqDepth!=0}">
	                        	<img src='<%=cp%>/resources/image/re.gif'>
	                        </c:if>
							<a href="${articleUrl}&cqNum=${dto.cqNum}">${dto.cqSubject}</a>
						</td>
						<c:if test="${dto.cqDepth==0}">
							<td>${dto.mName}</td>
						</c:if>
						<c:if test="${dto.cqDepth==1}">
							<td>${dto.cName}</td>
						</c:if>
						<td>${dto.cqCreated}</td>
						<c:if test="${dto.cqDepth==0}">
							<td>${dto.cqIsq=='1'?'Y':'N'}</td>
						</c:if>
						<c:if test="${dto.cqDepth!=0}">
							<td></td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div>
			<div>${paging}</div>
		</div>

		<div class= "footer-bar" >
			<div class = "footer-search-bar">
				<form name="searchForm" method="post" class="form-inline" style="width: 560px; text-align: right;">
					<select class="form-control input-sm" name="searchKey">
						<option value="cqSubject">제목</option>
						<option value="mName">작성자</option>
						<option value="cqContent">내용</option>
						<option value="cqCreated">등록일</option>
					</select> 
					<input type="text" class="form-control input-sm input-search" name="searchValue">
					<button type="button" class="btn btn-info btn-sm btn-search" onclick="searchList();">
						<span class="glyphicon glyphicon-search"></span> 검색
					</button>
				</form>
			</div>
			<div class = "footer-bar-submit" style="width: 300px;">
				<button type="button" class="btn btn-default"
					onclick="javascript:location.href='<%=cp%>/company/inquiry';">
					 새로고침
				</button>
			</div>
		</div>
	</div>
</div>