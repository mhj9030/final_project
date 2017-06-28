<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
%>


<div class="list_wrap">
	<h3>| 면접후기</h3>
	<div class="search_wrap">
		<form name="searchForm" action="" method="post">
			<select name="searchKey" class="selectField">
				<option value="company">기업명</option>
				<option value="name">작성자</option>
			</select> 
			<input type="text" name="searchValue">
			<button>검색</button>
		</form>
	</div>

	<table class="table table-hover">
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
					<button>보러가기</button>
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
					<button>보러가기</button>
				</div>
			</td>
		</tr>
	</table>
	
	<div style="text-align: center;">
		1 2 3...
	</div>
	<div style="text-align: center;">
		<button>글쓰기</button>
		<button>추천순</button>
		<button>최신목록</button>
	</div>

</div>
