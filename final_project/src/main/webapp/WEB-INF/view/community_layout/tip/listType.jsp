<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
%>

<div>
    <div align="right">${dataCount}개(${page}/${total_page}페이지)</div>
	<div style="text-align: right; margin: 10px;">
		<button type="button" class="btn btn-info" style="" 
				onclick="javascript:location.href='<%=cp%>/community/tip/created'">
					글쓰기
		</button>
	</div>

	<table class="table table-hover">
		<thead>
			<tr>
				<th width="110">말머리</th>
				<th width="60">번호</th>
				<th>제목</th>
				<th width="100">작성자</th>
				<th width="100">작성일</th>
				<th width="60">조회수</th>
				<th width="60">추천수</th>
				
			</tr>
		</thead>

		<tbody>
			<c:forEach var="dto" items="${list}">
				<tr align="center">
					<td style="color:${dto.type_color}; font-weight: bold;">${dto.type}</td>
					<td>${dto.listNum}</td>
					<td align="left">
						<a style="cursor: pointer;" onclick="articleTip(${dto.jtnum},${page});">${dto.subject} [${dto.replyCount}]
						<c:if test="${not empty dto.saveFilename}">
							&nbsp;&nbsp;&nbsp;<img width="17" src="<%=cp%>/resources/image/download-2-icon.png">
						</c:if>
						</a>
					</td>
					<td>${dto.mName}</td>
					<td>${dto.created}</td>
					<td>${dto.hitCount}</td>
					<td>${dto.likeCount}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div>
		<div>${paging}</div>
	</div>
</div>