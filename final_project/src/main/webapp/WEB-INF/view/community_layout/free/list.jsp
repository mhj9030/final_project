<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>

<div class="free_list_wrap">
		<h3>| 자유게시판</h3>
		<p>
			자유롭게 대화하고 소통할 수 있는 게시판입니다.
		</p>
		
		<div class="list-body" align="center">
			<div>
				<div align="right">1개(1/10 페이지)</div>

				<table class="table table-hover free_list_table">
					<thead>
						<tr>
							<th width="60">번호</th>
							<th>제목</th>
							<th width="100">작성자</th>
							<th width="100">작성일</th>
							<th width="60">조회수</th>
							<th width="60">추천수</th>
						</tr>
					</thead>

					<tbody>
						<tr align="center">
							<td>1</td>
							<td align="left"><a href="#">공무원 소식1</a></td>
							<td>관리자</td>
							<td>2017-06-27</td>
							<td>0</td>
							<td>0</td>
						</tr>
						<tr align="center">
							<td>2</td>
							<td align="left"><a href="#">공무원 소식2</a></td>
							<td>관리자</td>
							<td>2017-06-27</td>
							<td>0</td>
							<td>0</td>
						</tr>
					</tbody>
				</table>

				<div>
					<div>1 2 3</div>
				</div>

				<div class= "footer-bar" >
					<div class = "foorter-bar-refresh">
						<button type="button" class="btn btn-default btn-sm wbtn" onclick="#">새로고침</button>
					</div>
					<div class = "footer-search-bar">
						<form name="searchForm" method="post" class="form-inline">
							<select class="form-control input-sm" name="searchKey">
								<option value="subject">제목</option>
								<option value="userName">작성자</option>
								<option value="content">내용</option>
								<option value="created">등록일</option>
							</select> <input type="text" class="form-control input-sm input-search"
								name="searchValue">
							<button type="button" class="btn btn-info btn-sm btn-search" onclick="searchList();">
								검색
							</button>
						</form>
					</div>
					<div class = "footer-bar-submit">
						<button type="button" class="btn btn-default"
							onclick="#">
							 글쓰기
						</button>
					</div>
				</div>
			</div>
	</div>
</div>