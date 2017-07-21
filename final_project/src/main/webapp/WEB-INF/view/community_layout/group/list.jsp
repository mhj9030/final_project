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
		f.action="<%=cp%>/community/group";
		f.submit();
	}
	function searchTag(str){
		location.href="<%=cp%>/community/group?searchKey=groupTag&searchValue="+encodeURIComponent(str);
	}
</script>

<div class="group_list_wrap">
	<h3>| 그룹</h3>
	<p>하나의 목적을 가지는 다양한 그룹을 만들어 보세요. 친목을 나누고 좋은 정보를 공유할 수 있습니다.</p>
	
	<ul class="nav nav-tabs">
		<li role="presentation" class="active"><a style="cursor: pointer;" href="javascript:location.href='<%=cp%>/community/group'">그룹리스트</a></li>
	    <li role="presentation"><a style="cursor: pointer;" href="javascript:location.href='<%=cp%>/community/group/mylist'">나의 그룹</a></li>
	    <li role="presentation"><a style="cursor: pointer;" href="javascript:location.href='<%=cp%>/community/group/created'">그룹 만들기</a></li>
	</ul>
	
	<div class="group_list_tag">
		<div class="group_list_tag_subject">
			인기태그
		</div>
		<div class="group_list_tag_btns">
			<c:forEach	var="menu" items="${menuTag}">
				<button class="btn btn-default btn-sm" onclick="searchTag('${menu.groupTag}');">${menu.groupTag}</button>
			</c:forEach>
		</div>
	</div>
	
	<div class="btn-group group_list_btn_group">
  		<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
        	정렬순 <span class="caret"></span>
  		</button>
  		<ul class="dropdown-menu group_list_dropdown" role="menu">
    		<li><a href="<%=cp%>/community/group">최근 생성순</a></li>
   			<li><a href="#">인기순</a></li>
		</ul>
	</div>
	<div class="group_list_search">
		<form name="searchForm" method="post" class="form-inline">
			<select class="form-control input-sm" name="searchKey">
				<option value="groupName">그룹명</option>
				<option value="groupTag">태그명</option>
			</select> 
			<input type="text" class="form-control input-sm input-search" name="searchValue" placeholder="영문자는 대소문자 구별!">
			<button type="button" class="btn btn-info btn-sm btn-search" onclick="searchList();">
				검색
			</button>
		</form>
	</div>
	
	
	<div class="group_back">
	</div>
	
	<div class="row group_row">
		<c:forEach var="dto" items="${list}">
  			<div class="group_list_group">
  				<div class="group_list_groupimg">
  					<c:if test="${not empty dto.saveFilename}">
	  					<img src="<%=cp%>/uploads/community/${dto.saveFilename}">
  					</c:if>
  					<c:if test="${empty dto.saveFilename}">
  						<img src="<%=cp%>/resources/image/noimage.png">
  					</c:if>
  					
  				</div>
  				<div class="group_list_groupsubject">${dto.groupName}</div>
  				<div class="group_list_groupmember">
  					<c:forEach var="vo" items="${dto.list}">
  						<button class="btn  btn-xs btn-default" onclick="searchTag('${vo.groupTag}');">${vo.groupTag}</button>
  					</c:forEach>
  				</div>
  				<div class="group_list_groupjoin">
  					<button type="button" class="btn btn-info btn-sm" onclick="javascript:location.href='<%=cp%>/community/group/article?groupNum=${dto.groupNum}&page=${page}'">자세히 보기</button>
  				</div>
  			</div>
  		</c:forEach>
	</div>
	<div style="text-align: center;">
		${paging}
	</div>
</div>

