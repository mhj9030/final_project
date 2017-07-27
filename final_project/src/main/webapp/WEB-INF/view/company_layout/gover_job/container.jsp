<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>

<div class="gover_news-list-body" align="center">
	<div class="body-header">
		<h3 align="left">
			| 공무원 직무 소개 
			<small style="font-family: 'Gudea', sans-serif; letter-spacing: 3px; margin-left: 5px; font-size: 16px; font-weight: bold; color: #6d6b6b;">
				Government Job Introduction
			</small>
		</h3>
		<hr>
	</div>

	<div>
		<table class="table table-hover">
			<thead>
				<tr>
					<th width="60">번호</th>
					<th>제목</th>
					<th width="100">작성자</th>
					<th width="100">작성일</th>
				</tr>
			</thead>
	
			<tbody>
				<tr align="center">
					<td>3</td>
					<td align="left"><a href="http://injae.go.kr/user/guide/wel_intro_view8_1.do">경찰청-순경</a></td>
					<td>관리자</td>
					<td>2017-07-25</td>
				</tr>
			</tbody>
			<tbody>
				<tr align="center">
					<td>2</td>
					<td align="left"><a href="http://injae.go.kr/user/guide/wel_intro_view1_1.do">관세청 9급-관세</a></td>
					<td>관리자</td>
					<td>2017-07-25</td>
				</tr>
			</tbody>
			<tbody>
				<tr align="center">
					<td>1</td>
					<td align="left"><a href="http://injae.go.kr/user/guide/wel_intro_view2_3.do">소방-소방교</a></td>
					<td>관리자</td>
					<td>2017-07-25</td>
				</tr>
			</tbody>
		</table>
		<div class= "footer-bar" >
			<div class = "foorter-bar-refresh">
				<button type="button" class="btn btn-default btn-sm wbtn">새로고침</button>
			</div>
			<div class = "footer-search-bar">
				<form name="searchForm" method="post" class="form-inline">
					<select class="form-control input-sm" name="searchKey">
						<option value="gnSubject">제목</option>
						<option value="gnContent">내용</option>
						<option value="gnCreated">등록일</option>
					</select> <input type="text" class="form-control input-sm input-search" name="searchValue">
					<button type="button" class="btn btn-info btn-sm btn-search" onclick="searchList();">
						<span class="glyphicon glyphicon-search"></span> 검색
					</button>
				</form>
			</div>
			<div class = "footer-bar-submit">
			</div>
		</div>

	</div>
</div>