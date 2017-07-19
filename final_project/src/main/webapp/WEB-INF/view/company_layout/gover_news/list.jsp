<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
%>
<script>
	function searchList(){
		var f=document.searchForm;
		f.action="<%=cp%>/company/gover_news";
		f.submit();
	}
</script>
<div class="gover_news-list-body" align="center">
	<div class="body-header">
		<h3 align="left">
			| 공무원 소식 <small></small>
		</h3>
	</div>

	<div>
		<div align="right">${dataCount}개(${page}/${total_page} 페이지)</div>
		<table class="table table-hover">
			<thead>
				<tr>
					<th width="60">번호</th>
					<th>제목</th>
					<th width="100">작성자</th>
					<th width="100">작성일</th>
					<th width="60">조회수</th>
				</tr>
			</thead>
	
			<c:forEach var="dto" items="${list}">
			<tbody>
				<tr align="center">
					<td>${dto.listNum}</td>
					<td align="left"><a href="${articleUrl}&gnNum=${dto.gnNum}">${dto.gnSubject}</a></td>
					<td>${dto.mName}</td>
					<td>${dto.gnCreated}</td>
					<td>${dto.gnHitCount}</td>
				</tr>
			</tbody>
			</c:forEach>
		</table>

		<div>
			<div>${paging}</div>
		</div>

		<div class= "footer-bar" >
			<div class = "foorter-bar-refresh">
				<button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/company/gover_news';">새로고침</button>
			</div>
			<div class = "footer-search-bar">
				<form name="searchForm" method="post" class="form-inline">
					<select class="form-control input-sm" name="searchKey">
						<option value="gnSubject">제목</option>
						<option value="gnContent">내용</option>
						<option value="gnCreated">등록일</option>
					</select> <input type="text" class="form-control input-sm input-search" name="searchValue">
					<button type="button" class="btn btn-info btn-sm btn-search" onclick="searchList();">
						<span class="glyphicon glyphicon-search"></span> 검색
					</button>
				</form>
			</div>
			<div class = "footer-bar-submit">
				<c:if test="${sessionScope.member.userId=='admin@a.com'}">
					<button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/company/gover_news/created';">글쓰기</button>
				</c:if>
			</div>
		</div>

	</div>
</div>
