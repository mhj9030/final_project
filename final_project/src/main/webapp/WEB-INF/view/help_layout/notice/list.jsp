<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>

<div class="list-body" align="center">
	<div class="page-header">
  		<h1 align="left">| 공지사항 <small></small></h1>
	</div>
	
	<div class="alert-info">
    <span style="font-family: Webdings; font-weight: 600;"></span>
    중요한 일정 및 알림 등은 공지사항 통해 고객님께 알려 드립니다.
	</div>
	
	<div>
		<div align="right">${dataCount}개(${page}/${total_page} 페이지)</div>

		<table class="table table-hover">
			<thead>
				<tr>
					<th width="60">번호</th>
					<th>제목</th>
					<th width="100">작성자</th>
					<th width="100">작성일</th>
					<th width="60">조회수</th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach var="dto" items="${list}">
			
				<tr align="center">
					<td>${dto.notNum}</td>
					<td align="left">
						<a href="${articleUrl}&num=${dto.notNum}">${dto.subject}</a>
					</td>
					<td>${dto.mName}</td>
					<td>${dto.created}</td>
					<td>${dto.hitCount}</td>
				</tr>
				
				
				</c:forEach>
				
			</tbody>
		</table>
		
		<div>
			<div>
			<c:if test="${dataCount==0 }">
			                등록된 게시물이 없습니다.
			         </c:if>
			        <c:if test="${dataCount!=0 }">
			               ${paging}
			         </c:if>
			      </div>
			</div>
		</div>
		
		<table class="list-comp">
			<tr>
				<td align="left" width="100">
		        	<button class="btn btn-default" type="button" class="btn" onclick="javascript:location.href='<%=cp%>/help/notice';">새로고침</button>
		    	</td>
		    	
		    	<td align="center">
		    		<div class="list-search">
		    			<form name="searchForm" action="" method="post">
			    			<select name="searchKey" class="list-searchList" style="float: left;">
						    	<option value="subject">제목</option> 
						        <option value="userName">작성자</option>
						        <option value="content">내용</option>
						        <option value="created">등록일</option>
				           	</select>
				            
				            <div class="input-group" style="float: left;">
		      					<input type="text" class="form-control" placeholder="">
							    <span class="input-group-btn">
							    	<button class="btn btn-default" type="button">검색</button>
							    </span>
							</div>
		    			</form>
		    		</div>
		    	</td>
		    	
		    	<td align="right" width="100">
		          	<button class="btn btn-default" type="button" onclick="javascript:location.href='<%=cp%>/help_layout/notice/created';">글올리기</button>
		      	</td>
		    </tr>
		</table>
	</div>

