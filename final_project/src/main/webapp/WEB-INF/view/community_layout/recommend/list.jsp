<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
function searchList() {
		var f=document.searchForm;
		f.action="<%=cp%>/community/recommend";
		f.submit();
	}
</script>

<div class="topBar">
		기업의 후기를 올려주시면  포인트가 제공됩니다.
</div>

<div class="recommend_list_wrap">
	<h3>| 기업추천게시판 <small style="font-family: 'Gudea', sans-serif; letter-spacing: 3px; margin-left: 5px; font-size: 16px; font-weight: bold; color: #6d6b6b;">Recommend Company</small></h3>
	<hr>
	
	<p class="recommend_list_info">
		자신의 경험담 및 기업의 정보를 공유하고 기업을 추천합시다. 지피지기면 백전백승입니다!!
	</p>
	<div class="recommend_list_tab">
		<i class="glyphicon glyphicon-inbox"></i><span> 등록된 회사 : ${dataCount}</span>&nbsp;&nbsp;&nbsp;&nbsp;
		<i class="glyphicon glyphicon-edit"></i><span> 등록된 후기 : ${total_goodCom}</span>
		<form name="searchForm" method="post" class="form-inline recommend_search">
			<input type="text" class="form-control input-sm input-search"
			  		name="searchValue" placeholder="기업명을 입력하세요.">
			<button type="button" class="btn btn-info btn-sm btn-search" onclick="searchList();"> 
				검색
			</button>
		</form>
	</div>
	
	<table class="table recommend_list_table" style="border-top: 2px solid #9e9999;">
		<c:forEach var="dto" items="${list}">
			<tr>
				<td rowspan="3" width="100" height="130"><img src="<%=cp%>/uploads/company/${dto.cLogoImage}"></td>
				<td colspan="2" class="recommend_list_company">${dto.cName}</td>
				<td rowspan="2" style="text-align: center;">
					<div><small>진행중인 채용공고</small></div>
					<div style="height: 60px; font-size: 30px; padding: 10px;">
						<i class="glyphicon glyphicon-inbox"></i>&nbsp;&nbsp;${dto.employCount}
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="recommend_list_content">현재 <strong style="font-weight:bold; color : blue;">${dto.gcCount}</strong>명의 회원들의 평점은 <strong style="color : red;">${dto.grade}</strong>점 입니다.</td>
			</tr>
			<tr>
				<td colspan="2" class="recommend_list_created">설립일 : ${dto.ccreated}</td>
				<td style="text-align: center;"><strong><a style="text-decoration: underline; color:#337ab7;" href="${articleUrl}&cNum=${dto.cNum}">자세히 보기</a></strong></td>
			</tr>
		</c:forEach>
	</table>
	
	<div style="text-align: center;">
		${paging}
	</div>
</div>