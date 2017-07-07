<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript">
	function searchList() {
		var f=document.searchForm;
		f.action="<%=cp%>/community/news";
		f.submit();
	}
	
	function searchType(type) {
		var f=document.searchForm;
		f.type.value=type;
		f.action="<%=cp%>/community/news";
		f.submit();
	}
	$(function(){
		var type = "${type}";
		if(type==''){
			btn = document.getElementById('all_btn');
			btn.disabled="disabled";
		}else if(type=="직장인"){
			btn = document.getElementById('worker_btn');
			btn.disabled = "disabled";
		}else if(type=="취준생"){
			btn = document.getElementById('ready_btn');
			btn.disabled = "disabled";
		}else if(type=="알바생"){
			btn = document.getElementById('alba_btn');
			btn.disabled = "disabled";
		}
	});
</script>

<div class="news_list_wrap">
	<h3>| 취업뉴스</h3>
	<p>
		직장인, 취준생, 알바생의 다양한 소식을 볼 수 있습니다.
	</p>
	<div class="news_search_wrap">
		<div>
			<button class="btn btn-default btn-xs" id="all_btn" onclick="searchType('')">전체 뉴스</button>
			<button class="btn btn-default btn-xs" id="worker_btn" onclick="searchType('직장인')">직장인 뉴스</button>
			<button class="btn btn-default btn-xs" id="ready_btn" onclick="searchType('취준생')">취준생 뉴스</button>
			<button class="btn btn-default btn-xs" id="alba_btn" onclick="searchType('알바생')">알바생 뉴스</button>
			<c:if test="${sessionScope.member.userName=='관리자'}">
				<button class="btn btn-warning btn-xs" onclick="javascript:location.href='<%=cp%>/community/news/created'">뉴스올리기</button>
			</c:if>
		</div>
		
		<form name="searchForm" action="" method="post">
			<select name="searchKey" class="form-control news_search_select">
					<option value="subject">제목</option>
					<option value="content">내용</option>
					<option value="created">작성일</option>
			</select>
			<input type="text" name="searchValue" class="form-control news_search_input">
			<input type="hidden" name="type" value="${type}">
			<button class="btn btn-info news_search_btn">검색</button>
		</form>
	</div>

	<table class="table news_list_table">
		<c:forEach var="dto" items="${list}">
			<tr>
				<td rowspan="3" width="200" height="200"><img src="<%=cp%>/uploads/community/${dto.saveFilename}"></td>
				<td colspan="2" class="news_subject"><a href="${articleUrl}&jbnum=${dto.jbnum}">${dto.subject}[${dto.replyCount}]</a></td>
			</tr>
			<tr>
				<td class="news_content">
					<c:if test="${dto.type=='직장인'}">
						<span style="background: #ff8888; color: white;">${dto.type}</span>
					</c:if>
					<c:if test="${dto.type=='취준생'}">
						<span style="background: #9b88ff; color: white;">${dto.type}</span>
					</c:if>
					<c:if test="${dto.type=='알바생'}">
						<span style="background: #ffca00; color: white;">${dto.type}</span>
					</c:if>
				</td>
				<td class="news_likeCount">
					<span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;${dto.likeCount}
				</td>
			</tr>
			<tr>
				<td class="news_create">${dto.mName } | ${dto.created }</td>
				<td class="news_hitCount">조회수 ${dto.hitCount } </td>
			</tr>
		</c:forEach>
	</table>
	
	<div class="news_list_paging">
		${paging}
	</div>

</div>
