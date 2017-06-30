<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
%>


<div class="news_list_wrap">
	<h3>| 취업뉴스</h3>
	<p>
		직장인, 취준생, 알바생의 다양한 소식을 볼 수 있습니다.
	</p>
	<div class="news_search_wrap">
		<div>
			<button class="btn btn-default btn-xs">전체 뉴스</button>
			<button class="btn btn-default btn-xs">직장인 뉴스</button>
			<button class="btn btn-default btn-xs">취준생 뉴스</button>
			<button class="btn btn-default btn-xs">알바생 뉴스</button>
		</div>
		
		<form name="searchForm" action="" method="post">
			<select name="searchKey" class="form-control news_search_select">
					<option value="subject">제목</option>
					<option value="content">내용</option>
					<option value="created">작성일</option>
			</select>
			<input type="text" name="searchValue" class="form-control news_search_input">
			<button class="btn btn-info news_search_btn">검색</button>
		</form>
	</div>

	<table class="table news_list_table">
		<tr>
			<td rowspan="3" width="200" height="200"><img src="<%=cp%>/resources/image/Desert.jpg"></td>
			<td colspan="2" class="news_subject">직장인 55.3%, 현재 노후준비 하고 있다!</td>
		</tr>
		<tr>
			<td colspan="2" class="news_content">설문코리아가 남녀 직장인들을 대상으로 '노후준비'에 관한 설문조사를 실시했습니다.</td>
		</tr>
		<tr>
			<td class="news_create">잡스퀘어 | 2017-06-28</td>
			<td class="news_hitCount">조회수 0</td>
		</tr>
		
	</table>
	<div class="news_admin_created">
		<button class="btn btn-warning btn-xs">뉴스올리기</button>
	</div>
	<div class="news_list_paging">
		1 2 3...
	</div>

</div>
