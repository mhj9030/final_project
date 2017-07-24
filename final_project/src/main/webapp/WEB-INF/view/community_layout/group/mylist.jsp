<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
%>


<div class="group_list_wrap">
	<h3>| 그룹 <small style="font-family: 'Gudea', sans-serif; letter-spacing: 3px; margin-left: 5px; font-size: 16px; font-weight: bold; color: #6d6b6b;">Group</small></h3>
	<hr>
	<p>
		하나의 목적을 가지는 다양한 그룹을 만들어 보세요. 친목을 나누고 좋은 정보를 공유할 수 있습니다.
	</p>
	
	<ul class="nav nav-tabs">
		<li role="presentation"><a style="cursor: pointer;" href="javascript:location.href='<%=cp%>/community/group'">그룹리스트</a></li>
	    <li role="presentation" class="active"><a style="cursor: pointer;" href="javascript:location.href='<%=cp%>/community/group/mylist'">나의 그룹</a></li>
	    <li role="presentation"><a style="cursor: pointer;" href="javascript:location.href='<%=cp%>/community/group/created'">그룹 만들기</a></li>
	</ul>
	<div class="mylistBar">
		그룹은 최대 3개의 그룹에 소속이 가능합니다.
	</div>
	
			<div class="row group_row" style="margin-top: 50px;">
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
		  					<button type="button" class="btn btn-warning btn-sm" onclick="javascript:location.href='<%=cp%>/community/group/article?groupNum=${dto.groupNum}&page=${page}'">자세히 보기</button>
		  				</div>
		  			</div>
		  		</c:forEach>
		  		
			</div>
</div>

