<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
%>


<div class="review_list_wrap">
	<h3>| 면접후기</h3>
	<p>
		기업 면접에 관련된 인터뷰형식의 후기를 공유합니다.
	</p>
	
	<div class="review_select">
		<input type="radio" name="review_list" value="최신순" checked="checked">최신순&nbsp;&nbsp;
		<input type="radio" name="review_list" value="추천순">추천순
	</div>
	
	<table class="table review_list_table">
		<tr>
			<td width="110">
				<img src="<%=cp%>/resources/image/Desert.jpg" style="width:100px; height: 100px;"> 
			</td>
			<td>
				<div>이름 : 홍길동</div>
				<div>면접 본 기업 : 삼성전자</div>
				<div>제목 ㅠ.ㅠ</div>
			</td>
			<td>
				<div>2017-06-27 | 조회수 : 0 | 추천 : 0</div>
				<div>결과 : 불합격</div>
				<div>
					<button class="btn btn-info">후기보기</button>
				</div>
			</td>
		</tr>
		<tr>
			<td width="110">
				<img src="<%=cp%>/resources/image/Desert.jpg" style="width:100px; height: 100px;"> 
			</td>
			<td>
				<div>이름 : 홍길동</div>
				<div>면접 본 기업 : 삼성전자</div>
				<div>제목 ㅠ.ㅠ</div>
			</td>
			<td>
				<div>2017-06-27 | 조회수 : 0 | 추천 : 0</div>
				<div>결과 : 불합격</div>
				<div>
					<button class="btn btn-info">후기보기</button>
				</div>
			</td>
		</tr>
	</table>
	
	<div style="text-align: center;">
		1 2 3...
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
			<button type="button" class="btn btn-default" onclick="#">
				 글쓰기
			</button>
		</div>
	</div>	
</div>
