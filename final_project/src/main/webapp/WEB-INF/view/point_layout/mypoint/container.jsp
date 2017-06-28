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

	<div>
		사용자 님의 Job square 포인트<br><br>
		
		<table class="table" >
			<tr>
				<td colspan="3" align="center">
					<font size="3"><b>나의포인트</b></font>
				</td>
			</tr>
			<tr align="center">
				<td rowspan="2" width="50%">
					사용가능한 포인트<br>
					<font size="14"><b>0</b></font> 원
				</td>
				<td width="200px">
					적립 예정 포인트<br>
					0 원
				</td>
			</tr>
			<tr align="center">
				<td>
					소멸 예정 포인트<br>
					0 원
				</td>
			</tr>
		</table>
	</div>

	<div>
		<table class="table table-hover">
			<thead>
				<tr>
					<th width="100">번호</th>
					<th>제목</th>
					<th width="150">작성자</th>
					<th width="150">작성일</th>
				</tr>
			</thead>

			<tbody>
				<tr align="center">
					<td>1</td>
					<td align="left"><a href="#">Job square 포인트 이용약관 170628</a></td>
					<td>관리자</td>
					<td>2017-06-28</td>
				</tr>
				<tr align="center">
					<td>2</td>
					<td align="left"><a href="#">Job square 포인트 이용약관 160627</a></td>
					<td>관리자</td>
					<td>2016-06-27</td>
				</tr>
			</tbody>
		</table>

		<div>
			<div>1 2 3</div>
		</div>

	</div>
</div>