<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>

<div class="page_body">
	<h3>
		| 포인트 소개 <small style="font-family: 'Gudea', sans-serif; letter-spacing: 3px; margin-left: 5px; font-size: 16px; font-weight: bold; color: #6d6b6b;">Point Intro</small>
	</h3><hr>

	<div class="point_intro">
		<div style="width: 200px; height: 200px">
			<img src="<%=cp%>/resources/image/intro_coin.jpg" height="170px">
		</div>
		<div style="width: 450px; height: 150px; vertical-align: bottom;">
			<h3>포인트란?</h3><br>
			Job square 홈페이지 내에서만 사용 가능한 마일리지 제도입니다.<br>
			포인트를 모아서 포인트 마켓을 이용해보세요~<br>
			포인트는 회사 면접 후기 글과 각 종 댓글, 이력서 공개를 통하여 얻을 수 있으며 공개된 이력서를 열람하는데 사용하실 수 있습니다.
		</div>
		<div style="font-size: 8px; font-color: gray; width: 620px;">
			※ 주의사항<br>
			본 포인트는 현금처럼 사용하실 수 없습니다.<br>
			공개된 이력서는 포인트 일부를 차감하여 열람하실 수 있습니다.<br>
			잘못된 경로로 획득한 포인트에 대해선 회수 될 수 있으며 처벌 대상이 될 수 있습니다.
		</div>
	</div>

	<hr>
	
	<div class="point_bbs_list">
		<table class="table">
			<caption>공지사항</caption>
			<thead>
				<tr>
					<th width="100">번호</th>
					<th>제목</th>
					<th width="150">작성자</th>
					<th width="150">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${list}">
				<tr align="center">
					<td>${dto.poNum}</td>
					<td align="left">
						<a href="<%=cp%>/point/main/article?num=${dto.poNum}&page=${page}">${dto.subject}</a>
					</td>
					<td>${dto.mName}</td>
					<td>${dto.created}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class= "footer-bar">
			<div class="paging">
				${paging}
			</div>

		<c:if test="${sessionScope.member.userId=='admin@a.com'}">
			<div style="text-align: right;">
				<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/point/main/created'">글쓰기</button>
			</div>
		</c:if>
		</div>
	</div>
</div>