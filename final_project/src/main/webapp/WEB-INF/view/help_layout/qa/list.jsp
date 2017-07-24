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
	<h3>| 질문과답변</h3>
	<p>
	궁금한 점은 이곳에 글을 남겨 주시면 성심껏 답변 해드리겠습니다.
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
			<c:forEach var="dto" items="${list}">
			
				<tr align="center">
					<td>${dto.listNum}</td>
					<td align="left">
					<c:forEach var="n" begin="1" end="${dto.depth}">
                                &nbsp;&nbsp;
                            </c:forEach>
                            <c:if test="${dto.depth!=0}">
                                <img src='<%=cp%>/resources/image/re.gif'>
                            </c:if>
					
						<a href="${articleUrl}&num=${dto.qaNum}">${dto.subject}</a>
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
		
		<table class="list-comp">
			<tr>
				
		    	<td align="right" width="100">
		          	<button class="btn btn-default" type="button" onclick="javascript:location.href='<%=cp%>/help_layout/qa/created';">글올리기</button>
		      	</td>
		    </tr>
		</table>
	</div>
</div>
