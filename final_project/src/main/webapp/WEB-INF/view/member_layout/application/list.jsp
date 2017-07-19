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
		<h3>| 나의 지원서 관리</h3><hr>
	</div>
	
	<div class="point_bbs_list">
		<table class="table">
			<thead>
				<tr>
					<th width="40px"><input type="checkbox" style="width: 30px;" /></th>
					<th width="100px">이력서 번호</th>
					<th>이력서 메모</th>
					<th width="150px">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${list}">
				<tr align="center">
					<td><input type="checkbox" value="${dto.poNum}" style="width: 20px;" /></td>
					<td>${dto.poNum}</td>
					<td align="left">
						<a href="<%=cp%>/point/main/article?num=${dto.poNum}&page=${page}">${dto.subject}</a>
					</td>
					<td>${dto.created}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div style="text-align: right;">
			<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/member/applications/created'">새 이력서 작성</button>
			<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/member/applications/created'">삭제</button>
		</div>
			
		<div class= "footer-bar">
			<div class="paging">
				${paging}
			</div>
		</div>
	</div>
</div>