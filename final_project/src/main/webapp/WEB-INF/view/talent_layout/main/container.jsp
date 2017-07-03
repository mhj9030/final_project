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
		<h3>| 인재검색</h3><hr>
	</div>
	
	<!-- 검색 -->
	<div class="search_list">
		<form name="searchForm">
			<table>
				<tr align="center">
					<td width="10%">직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종</td>
					<td width="25%">
						<select name="point_type" class="form-control">
							<option value="">대분류</option>
							<option value="적립">적립</option>
							<option value="사용">사용</option>
						</select> 
					</td>
					<td width="3%"> </td>
					<td width="25%"> </td>
					<td width="25%"> </td>
					<td width="12%"> </td>
				</tr>
				<tr>
					<td>세부직종</td>
					<td colspan="5" style="height: 100px; padding-left: 25px; text-align: left; line-height: 230%;">
						<c:forEach begin="1" end="10" step="1">
							<span class="button-checkbox">
						        <button type="button" class="btn btn-primary">Checked</button>
						        <input type="checkbox" class="hidden" checked />
						    </span>
						</c:forEach>
					</td>
				</tr>
				<tr align="center">
					<td>기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;간</td>
					<td>
						<input type="date" name="startDate" class="form-control" /> 
					</td>
					<td> ~ </td>
					<td>
						<input type="date" name="endDate" class="form-control" />
					</td>
					<td> </td>
					<td><button class="btn btn-primary" type="submit">조회하기</button></td>
				</tr>
			</table>
		</form>
	</div>
	
	<!-- 리스트 -->
	<div class="">
		리스트
	</div>
</div>