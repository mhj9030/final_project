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
		<h3>| 포인트 마켓</h3><hr>
	</div>
	
	<!-- 나의 포인트 -->
	<div style="height: 50px; text-align: center; font-size: 7;">
		<b>${sessionScope.member.userId}</b> 님의 사용가능한 포인트 <b>${point.mypoint}</b> 원
	</div>
	
	<!-- 검색 -->
	<div class="search_list">
		<form name="searchForm">
			<table>
				<tr>
					<td width="15%">검색</td>
					<td width="25%" align="center">
						<select name="point_type" class="form-control">
							<option value="">대분류</option>
							<option value="적립">적립</option>
							<option value="사용">사용</option>
						</select> 
					</td>
					<td width="25%" align="center">
						<select name="point_type" class="form-control">
							<option value="">소분류</option>
							<option value="적립">적립</option>
							<option value="사용">사용</option>
						</select> 
					</td>
					<td><button class="btn btn-primary" type="submit">조회하기</button></td>
				</tr>
			</table>
		</form>
	</div>
	
	<!-- 열람 -->
	<div class="resume_list">
		<c:forEach begin="1" end="8" step="1">
		<div class="marketDiv">
			<div style="text-align: center;">
				<img src="" width="100px" height="140px" />
			</div>
			<div>
				지원분야: ${a}<br>
				직종<br>
				대분류: ${a}<br>
				소분류: ${a}<br>
				<button>-3000p</button>
			</div>
		</div>
		</c:forEach>
	</div>
</div>