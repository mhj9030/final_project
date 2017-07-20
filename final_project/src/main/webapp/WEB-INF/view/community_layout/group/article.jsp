<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript">

</script>


<div class="community_article_wrap" style="min-height:750px; border: 0px;">
	<div class="group_article_info">
		<div class="group_article_info_image">
			<c:if test="${not empty dto.saveFilename}">
				<img src="<%=cp%>/uploads/community/${dto.saveFilename}">
			</c:if>
			<c:if test="${empty dto.saveFilename}">
				<img src="<%=cp%>/resources/image/noimage.png">
			</c:if>
		</div>
		<div style="float: left; width: 50%; height: 100%; padding: 11px;">
			<div class="group_article_info_name">
				<strong>${dto.groupName}</strong> <button class="btn btn-sm btn-success">그룹장 : ${dto.mName}</button>
			</div>
			<div class="group_article_info_tag">
				<c:forEach var="vo" items="${dto.list}">	
					<button class="btn btn-sm btn-default">${vo.groupTag}</button>
				</c:forEach>	
			</div>
			<div class="group_article_info_created">
				<small>그룹생성일 : ${dto.created}</small>
			</div>
		</div>
		<div style="float: left; width: 20%; height: 100%;">
			<button class="btn btn-info" style="width: 100%; height:100%">
				가입하기/탈퇴하기
			</button>
		</div>
	</div>
	<div class="group_article_info_intro">
		<strong style="font-size: 20px; padding-left: 10px;">소개말</strong>
		<div style="height: 69px; padding-left: 11px; padding-top: 5px;">
			${dto.groupInfo}
		</div>
	</div>
	
	<c:if test="${check==0}">
		<div class="groupNo">
			그룹원만 이용 가능합니다.
		</div>
	</c:if>
	
	<c:if test="${check==1}">
		<div class="list-body" align="center" style="min-height:500px;">
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
									<a href="${articleUrl}&gbnum=${dto.gbNum}">${dto.subject}[${dto.replyCount}]</a>
								</td>
								<td>${dto.mName}</td>
								<td>${dto.created}</td>
								<td>${dto.hitCount}</td>
								<td>${dto.likeCount}</td>
								<td>
									<c:if test="${not empty dto.saveFilename}">
										<a href="<%=cp%>/community/group/download?frnum=${dto.gbNum}"><img width="24" src="<%=cp%>/resources/image/download-2-icon.png"></a>
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
						<button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/community/free'">새로고침</button>
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
							onclick="javascript:location.href='<%=cp%>/community/group/board/created?groupNum=${dto.groupNum}&page=${page}'">
							 글쓰기
						</button>
					</div>
				</div>
			</div>
	</div>
	</c:if>
</div>