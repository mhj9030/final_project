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
					<font size="3"><b>${sessionScope.member.userName} 님</b></font>의 Job square 포인트
				</td>
				<td rowspan="2" width="50%">
					사용가능한 포인트<br><font size="14">${point.mypoint}</font> p
				</td>
			</tr>
			<tr align="center">
				<td>
					적립 예정 포인트 ${point.reserve} p
				</td>
			</tr>
		</table>
	</div>
	
	<!-- 기간 검색 -->
	<div class="search_list">
		<form name="searchForm" >
			<table>
				<tr>
					<td width="10%">조회</td>
					<td width="23%" align="center">
						<input type="date" name="startDate" class="form-control" value="${startDate}" /> 
					</td>
					<td width="3%">
						~
					</td>
					<td width="23%" align="center">
						<input type="date" name="endDate" class="form-control" value="${endDate}" />
					</td>
					<td width="23%" align="center">
						<select name="pointType" id="pointType" class="form-control">
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
				<c:forEach var="dto" items="${list}">
					<tr align="center">
						<td width="150px">${dto.classify}</td>
						<td align="left">
							${dto.classify}<br>
							${dto.history}
						</td>
						<td width="150px">${dto.poDate}</td>
						<td width="100px">
							<c:if test="${dto.classify=='적립'}">+</c:if>
							<c:if test="${dto.classify=='사용'}">-</c:if>
							${dto.point}
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
	
			<div class="paging">
				${paging}
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	if('${pointType}'=='적립'){
		$("select option:eq(1)").attr("selected", "selected");
	}else if('${pointType}'=='사용'){
		$("select option:eq(2)").attr("selected", "selected");
	} 
});

$(function(){
	$("body").on("change", "#endDate", function(){
		var startdate = $("#startDate").val().split(".");
		var enddate = $("#endDate").val().split(".");
		
		if(startdate==""){
			alert("시작날짜를 먼저 입력해주세요");
			$("#endDate").val("");
			return;
		}
		
		if(startdate[0]-enddate[0]>0) {
			alert("종료날짜는 시작날짜 이상만 가능합니다.");
			$("#endDate").val("");	
			return;
		} else if(startdate[1]-enddate[1]>0) {
			alert("종료날짜는 시작날짜 이상만 가능합니다.");
			$("#endDate").val("");	
			return;
		} else if(startdate[2]-enddate[2]>0) {
			alert("종료날짜는 시작날짜 이상만 가능합니다.");
			$("#endDate").val("");	
			return;
		}
	});
});
</script>