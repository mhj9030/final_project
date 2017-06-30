<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>


<div class="recommend_list_wrap">
	<h3>| 기업 추천 게시판</h3>
	
	<p class="recommend_list_info">
		자신의 경험담 및 기업의 정보를 공유하고 기업을 추천합시다!!
	</p>
	<div class="recommend_list_tab">
		<i class="glyphicon glyphicon-inbox"></i><span> 등록된 회사 : 700</span>&nbsp;&nbsp;&nbsp;&nbsp;
		<i class="glyphicon glyphicon-edit"></i><span> 등록된 후기 : 800</span>
		<form name="searchForm" method="post" class="form-inline recommend_search">
			<input type="text" class="form-control input-sm input-search"
			  		name="searchValue" placeholder="기업명을 입력하세요.">
			<button type="button" class="btn btn-info btn-sm btn-search" onclick="searchList();"> 
				검색
			</button>
			<button type="button" class="btn btn-info btn-sm btn-search" onclick=""> 
				후기쓰기
			</button>
		</form>
	</div>
	
	<table class="table recommend_list_table">
		<tr>
			<td rowspan="3" width="100" height="130"><img src="<%=cp%>/resources/image/Desert.jpg"></td>
			<td colspan="2" class="recommend_list_company">삼성전자!!!</td>
		</tr>
		<tr>
			<td colspan="2" class="recommend_list_content">현재 170명의 회원들의 평점은 00점 입니다.</td>
		</tr>
		<tr>
			<td class="recommend_list_created">2017-06-28</td>
			<td class="recommend_list_hitCount">조회수 0</td>
		</tr>
		
		<tr>
			<td rowspan="3" width="100" height="130"><img src="<%=cp%>/resources/image/Desert.jpg"></td>
			<td colspan="2" class="recommend_list_company">LG</td>
		</tr>
		<tr>
			<td colspan="2" class="recommend_list_content">현재 2000명의 회원들의 평점은 00점 입니다.</td>
		</tr>
		<tr>
			<td class="recommend_list_created">2017-06-28</td>
			<td class="recommend_list_hitCount">조회수 0</td>
		</tr>
		
	</table>
	
	<div style="text-align: center;">
		1 2 3...
	</div>
	
	
</div>