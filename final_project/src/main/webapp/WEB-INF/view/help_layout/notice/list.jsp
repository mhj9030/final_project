<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
  
<%
	String cp=request.getContextPath();
%>




<div class="list-body" align="center">
<div class="notice_list_wrap" style="text-align: left ">
	<h3>| 공지사항<small style="font-family: 'Gudea', sans-serif; letter-spacing: 3px; margin-left: 5px; font-size: 16px; font-weight: bold; color: #6d6b6b;">Notice</small></h3>
	<hr>
	<p>
	중요한 일정 및 알림 등은 공지사항 통해 고객님께 알려 드립니다.
	</p>    
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
			
			  <c:forEach var="dto" items="${noticeList}">
                    <tr align="center">
                        <td class="text-center"><span style="display: inline-block;width: 28px;height:18px;line-height:18px; background: #ED4C00;color: #FFFFFF">공지</span></td>
                        <td align="left">
                        <a href="${articleUrl}&num=${dto.notNum}">${dto.subject}</a></td>
                        <td>${dto.mName}</td>
                        <td>${dto.created}</td>
                        <td>${dto.hitCount}</td>
                    </tr>
    	 </c:forEach>      
			
			<c:forEach var="dto" items="${list}">
			
				<tr align="center">
					<td>${dto.listNum}</td>
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
		    	
		    	
		    	<td align="right" width="100">
		    	<c:if test="${sessionScope.member.userId=='admin'}">
		          	<button class="btn btn-default" type="button" onclick="javascript:location.href='<%=cp%>/help_layout/notice/created';">글올리기</button>
		         </c:if>
		      	</td>
		    </tr>
		</table>
	</div>


