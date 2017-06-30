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
		<h3>| 나의 포인트</h3><hr>
	</div>
	
	<!-- 나의 포인트 -->
	<div style="padding-top: 30px;">
		<table class="mypoint_list">
			<tr align="center">
				<td background="#525f78">
					<font size="3"><b>${userName} 님</b></font>의 Job square 포인트
				</td>
				<td rowspan="2" width="50%">
					사용가능한 포인트<br><font size="14"><b>${point.mypoint}</b></font> 원
				</td>
			</tr>
			<tr align="center">
				<td>
					적립 예정 포인트 ${point.reserve} 원
				</td>
				
			</tr>
		</table>
	</div>
	
	<!-- 기간 검색 -->
	<div class="search_list">
		<form name="searchForm">
			<table>
				<tr>
					<td width="10%">조회</td>
					<td width="23%" align="center">
						<input type="date" name="startDate" class="form-control" /> 
					</td>
					<td width="3%">
						~
					</td>
					<td width="23%" align="center">
						<input type="date" name="endDate" class="form-control" />
					</td>
					<td width="23%" align="center">
						<select name="point_type" class="form-control">
							<option value="">전체</option>
							<option value="적립">적립</option>
							<option value="사용">사용</option>
						</select>
					</td>
					<td><button class="btn btn-primary" type="submit">조회하기</button></td>
				</tr>
			</table>
		</form>
	</div>
	
	<!-- 포인트 내역 -->
	<div>
		<div style="height: 50px; text-align: center;">
			<br><h4>- 나의 포인트 내역 -</h4>
		</div>
		<div>
			<table class="point_list">
				<tbody>
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
					<c:forEach step="1" end="5" begin="1">
					<tr align="center">
						<td width="150px">적립</td>
						<td align="left">
							적립<br>
							가입 이벤트 적립
						</td>
						<td width="150px">2017-06-28</td>
						<td width="100px">+1000</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
	
			<div class="paging">
				1 2 3${paging}
			</div>
		</div>
	</div>
</div>