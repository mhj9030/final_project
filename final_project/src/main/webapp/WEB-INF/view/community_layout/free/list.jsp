<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>

<div class="free_list_wrap">
		<h3>| 자유게시판</h3>
		<p>
			자유롭게 대화하고 소통할 수 있는 게시판입니다.
		</p>
		
		<div class="list-body" align="center">
			<div>
				<div align="right">${dataCount}개(${page}/${total_page} 페이지)</div>

				<table class="table table-hover free_list_table">
					<thead>
						<tr>
							<th width="60">번호</th>
							<th>제목</th>
							<th width="100">작성자</th>
							<th width="100">작성일</th>
							<th width="60">조회수</th>
							<th width="60">추천수</th>
							<th width="60">파일</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="dto" items="${list}">
							<tr align="center" height="41">
								<td>${dto.listNum}</td>
								
								<td align="left">
									<c:forEach var="n" begin="1" end="${dto.depth}">
	                                	&nbsp;&nbsp;
	                            	</c:forEach>
		                            <c:if test="${dto.depth!=0}">
		                                <img src='<%=cp%>/resources/image/re.gif'>
		                            </c:if>
									<a href="${articleUrl}&frnum=${dto.frnum}">${dto.subject}[${dto.replyCount}]</a>
								</td>
								<td>${dto.mName}</td>
								<td>${dto.created}</td>
								<td>${dto.hitCount}</td>
								<td>${dto.likeCount}</td>
								<td>
									<c:if test="${not empty dto.saveFilename}">
										<a href="<%=cp%>/community/free/download?frnum=${dto.frnum}"><img width="24" src="<%=cp%>/resources/image/download-2-icon.png"></a>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div>
					<div>${paging}</div>
				</div>

				<div class= "footer-bar" >
					<div class = "foorter-bar-refresh">
						<button type="button" class="btn btn-default btn-sm wbtn" onclick="#">새로고침</button>
					</div>
					<div class = "footer-search-bar">
						<form name="searchForm" method="post" class="form-inline">
							<select class="form-control input-sm" name="searchKey">
								<option value="subject">제목</option>
								<option value="mName">작성자</option>
								<option value="content">내용</option>
								<option value="created">등록일</option>
							</select> <input type="text" class="form-control input-sm input-search"
								name="searchValue">
							<button type="button" class="btn btn-info btn-sm btn-search" onclick="searchList();">
								검색
							</button>
						</form>
					</div>
					<div class = "footer-bar-submit">
						<button type="button" class="btn btn-default"
							onclick="javascript:location.href='<%=cp%>/community/free/created'">
							 글쓰기
						</button>
					</div>
				</div>
			</div>
	</div>
</div>