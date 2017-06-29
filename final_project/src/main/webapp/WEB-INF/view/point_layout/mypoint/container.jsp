<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>

<div class="list-body" align="center">
	<div class="page-header">
		<h1 align="left">
			| 나의포인트 <small></small>
		</h1>
	</div>

	<!-- 나의 포인트 -->
	<div>
		${userName} 님의 Job square 포인트<br><br>
		<table class="table" >
			<tr>
				<td colspan="3" align="center">
					<font size="3"><b>나의포인트</b></font>
				</td>
			</tr>
			<tr align="center">
				<td rowspan="2" width="50%">
					사용가능한 포인트<br><font size="14"><b>${point.mypoint}</b></font> 원
				</td>
				<td width="200px">
					적립 예정 포인트<br>${point.reserve} 원
				</td>
			</tr>
			<tr align="center">
				<td>
					소멸 예정 포인트<br>${point.terminate} 원
				</td>
			</tr>
		</table>
	</div>
	
	<!-- 포인트 내역 -->
	<div>
		<table class="table table-hover">
			<tbody >
				<c:forEach var="list" items="${list}">
					<tr align="center">
						<td width="150px">${list.classify}</td>
						<td align="left">
							${list.classify}<br>
							${list.history}
						</td>
						<td width="150px">${list.poDate}</td>
						<td width="100px">
							<c:if test="${list.classify=='적립'}">+</c:if>
							<c:if test="${list.classify=='사용'}">-</c:if>
							${list.point}
						</td>
					</tr>
				</c:forEach>
				<tr align="center">
					<td>적립</td>
					<td align="left">
						적립<br>
						가입 이벤트 적립
					</td>
					<td>2017-06-28</td>
					<td>+1000</td>
				</tr>
			</tbody>
		</table>

		<div style="text-align: center;">
			<div>1 2 3${paging}</div>
		</div>
	</div>
</div>