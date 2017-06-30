<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
%>


<div class="group_list_wrap">
	<h3>| 그룹</h3>
	<p>하나의 목적을 가지는 다양한 그룹을 만들어 보세요. 친목을 나누고 좋은 정보를 공유할 수 있습니다.</p>
	
	<div class="group_list_tag">
		<div class="group_list_tag_subject">
			인기태그
		</div>
		<div class="group_list_tag_btns">
			<button class="btn btn-default btn-sm">IT/통신</button>
			<button class="btn btn-default btn-sm">직장인</button>
			<button class="btn btn-default btn-sm">금융/은행</button>
			<button class="btn btn-default btn-sm">제조/화학</button>
			<button class="btn btn-default btn-sm">알바생</button>
			<button class="btn btn-default btn-sm">공무원</button>
			<button class="btn btn-default btn-sm">디자인/미디어</button>
			<button class="btn btn-default btn-sm">디자인/미디어</button>
			<button class="btn btn-default btn-sm">직장인</button>
			<button class="btn btn-default btn-sm">금융/은행</button>
			<button class="btn btn-default btn-sm">제조/화학</button>
			<button class="btn btn-default btn-sm">알바생</button>
			<button class="btn btn-default btn-sm">공무원</button>
			<button class="btn btn-default btn-sm">학생</button>	
		</div>
	</div>
	
	<div class="btn-group group_list_btn_group">
  		<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
        	인기순 <span class="caret"></span>
  		</button>
  		<ul class="dropdown-menu group_list_dropdown" role="menu">
   			<li><a href="#">인기순</a></li>
    		<li><a href="#">최근 생성순</a></li>
		</ul>
	</div>
	<div class="group_list_search">
		<form name="searchForm" method="post" class="form-inline">
			<select class="form-control input-sm" name="searchKey">
				<option value="groupName">그룹명</option>
				<option value="groupTag">태그명</option>
			</select> 
			<input type="text" class="form-control input-sm input-search" name="searchValue">
			<button type="button" class="btn btn-info btn-sm btn-search" onclick="searchList();">
				검색
			</button>
		</form>
	</div>
	<div class="btn-group group_list_createbtn">
  		<button type="button" class="btn btn-info btn-sm" onclick="searchList();">
			그룹만들기
		</button>
	</div>
	
	<div class="group_back">
	</div>
	
	<div class="row group_row">
		<c:forEach var="d" begin="1" end="8" step="1">
  			<div class="group_list_group">
  				<div class="group_list_groupimg"><img src="<%=cp%>/resources/image/group_impty.jpg"></div>
  				<div class="group_list_groupsubject">자바를 자바라</div>
  				<div class="group_list_groupmember">
  					<c:forEach var="d" begin="1" end="4" step="1">
  						<div class="grorpmember_img">
  							<img src="<%=cp%>/resources/image/group_profile.jpg">
  						</div>
  					</c:forEach>
  				</div>
  				<div class="group_list_groupjoin">
  					<button type="button" class="btn btn-info btn-sm">가입</button>
  				</div>
  			</div>
  		</c:forEach>
	</div>
</div>

