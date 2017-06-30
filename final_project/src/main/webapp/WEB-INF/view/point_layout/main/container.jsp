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
		<h3>| 포인트 소개</h3><hr>
	</div>

	<div class="point_intro">
		<div style="width: 170px; height: 170px">
			<img src="" height="150px" width="150px">
		</div>
		<div style="width: 450px; height: 150px; vertical-align: bottom;">
			<h3>포인트란?</h3><br>
			홈페이지 내에서 사용 가능한 마일리지 제도입니다.<br>
			회사 면접 후기 글과 각 종 댓글과 이력서 공개를 통하여 얻을 수 있으며 <br>
			공개된 이력서를 열람하는데 사용하실 수 있습니다.
		</div>
		<div style="width: 620px;">
			※ 주의사항<br>
			본 포인트는 현금처럼 사용하실 수 없습니다.<br>
			잘못된 경로로 획득한 포인트에 대해선 회수 될 수 있으며 처벌 대상이 될 수 있습니다.
		</div>
	</div>

	<div class="point_bbs_list">
		<table>
			<thead>
				<tr>
					<th width="100">번호</th>
					<th>제목</th>
					<th width="150">작성자</th>
					<th width="150">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach begin="1" end="10" step="1">
				<tr align="center">
					<td>1</td>
					<td align="left"><a href="#">Job square 포인트 이용약관 170628</a></td>
					<td>관리자</td>
					<td>2017-06-28</td>
				</tr>
				</c:forEach>
				
				<c:forEach var="dto" items="${list}">
				<tr align="center">
					<td>${dto.poNum}</td>
					<td align="left"><a href="#">${dto.subject}</a></td>
					<td>${dto.mId}</td>
					<td>${dto.created}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="paging">
			1 2 3${paging}
		</div>

	<c:if test="${mId=='admin'}">
		<div class= "footer-bar">
			<div class = "footer-bar-submit">
				<button type="button" class="btn btn-default" onclick="#">글쓰기</button>
			</div>
		</div>
	</c:if>
	</div>
</div>