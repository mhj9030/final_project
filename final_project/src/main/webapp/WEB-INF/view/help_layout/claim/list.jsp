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
	<h3>| 문의하기<small style="font-family: 'Gudea', sans-serif; letter-spacing: 3px; margin-left: 5px; font-size: 16px; font-weight: bold; color: #6d6b6b;">Claim</small></h3>
	<hr>
	<p>
	서비스 이용관련 궁금하신 사항을 문의해주세요
	</p>    
</div>
	
	<div>
		<div align="right">${dataCount}개(${page}/${total_page} 페이지)</div>

		<table class="table table-hover">
			<thead>
				<tr>
					<th width="150">분류</th>
					<th>제목</th>
					<th width="100">작성자</th>
					<th width="100">작성일</th>
					<th width="60">조회수</th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach var="dto" items="${list}">
			
				<tr align="center">
					<td>[${dto.category}]</td>
					<td align="left">
						<a href="${articleUrl}&num=${dto.claimNum}">${dto.subject}</a>
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
		          	<button class="btn btn-default" type="button" onclick="javascript:location.href='<%=cp%>/help_layout/claim/created';">글올리기</button>
		      	</td>
		    </tr>
		</table>
	</div>

