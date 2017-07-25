<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript">
function updateImgGroup(){
	var f = document.imgForm;
	f.action = "<%=cp%>/community/group/update";
    f.submit();
}

function updateInfoGroup(){
	var f = document.infoForm;
	f.action = "<%=cp%>/community/group/update";
    f.submit();
}

function deleteGroup() {
	  var groupNum = "${dto.groupNum}";
	  var query = "groupNum="+groupNum;
	  var url = "<%=cp%>/community/group/delete?" + query;

	  if(confirm("위 자료를 삭제 하시 겠습니까 ? "))
	  	location.href=url;
}
</script>


<div class="group_article_wrap" style="min-height:750px; border: 0px; width: 800px; margin : 30px auto;">
	<h3>| 그룹정보 <small style="font-family: 'Gudea', sans-serif; letter-spacing: 3px; margin-left: 5px; font-size: 16px; font-weight: bold; color: #6d6b6b; margin-bottom: 10px;">Group Imformation</small>
		<button onclick="javascript:location.href='<%=cp%>/community/group'" class="btn btn-xs btn-default" style="margin-left: 435px; font-size: 14px; vertical-align: baseline;">돌아가기</button>
	</h3>
	<hr>
	<div class="group_article_info">
		<div class="group_article_info_image">
			<c:if test="${not empty dto.saveFilename}">
				<img src="<%=cp%>/uploads/community/${dto.saveFilename}">
				<c:if test="${sessionScope.member.userId==dto.mId}">
					<button class="group_admin_imgBtn" data-toggle="modal" data-target="#imgUpdate"><i class="glyphicon glyphicon-camera"></i>&nbsp;대표사진변경</button>
				</c:if>
			</c:if>
			<c:if test="${empty dto.saveFilename}">
				<img src="<%=cp%>/resources/image/noimage.png">
				<c:if test="${sessionScope.member.userId==dto.mId}">
					<button class="group_admin_imgBtn" data-toggle="modal" data-target="#imgUpdate"><i class="glyphicon glyphicon-camera"></i>&nbsp;대표사진변경</button>
				</c:if>
			</c:if>
		</div>
		<div style="float: left; width: 50%; height: 100%; padding: 11px;">
			<div class="group_article_info_name">
				<strong>${dto.groupName}</strong>
			</div>
			<div class="group_article_info_tag">
				<c:forEach var="vo" items="${dto.list}">	
					<button class="btn btn-sm btn-default">${vo.groupTag}</button>
				</c:forEach>	
			</div>
			<div class="group_article_info_created">
				<strong>그룹생성일</strong> : <small>${dto.created}</small>
			</div>
		</div>
		<div style="float: left; width: 20%; height: 100%; text-align: center;">
				 <button class="btn btn-sm btn-success" style="MARGIN-TOP: 40PX; BORDER-RADIUS: 0; height: 47px;">그룹장 : ${dto.mName}</button>
				<c:if test="${check==0}">
					<button class="btn btn-info" style="width: 65%; MARGIN-TOP: 9PX; BORDER-RADIUS: 0; height: 26%; PADDING: 1PX;" onclick="javascript:location.href='<%=cp%>/community/group/join?groupNum=${dto.groupNum}&page=${page}'">
						가입하기
					</button>
				</c:if>
				<c:if test="${check==1 && dto.mName==sessionScope.member.userName}">
					<button class="btn btn-info" style="width: 65%; MARGIN-TOP: 9PX; BORDER-RADIUS: 0; height: 26%; PADDING: 1PX;" 
							onclick="deleteGroup();">
						그룹삭제
					</button>
				</c:if>
				<c:if test="${check==1 && dto.mName!=sessionScope.member.userName}">
					<button class="btn btn-info" style="width: 65%; MARGIN-TOP: 9PX; BORDER-RADIUS: 0; height: 26%; PADDING: 1PX;" onclick="javascript:location.href='<%=cp%>/community/group/out?groupNum=${dto.groupNum}&page=${page}'">
						탈퇴하기
					</button>
				</c:if>
		</div>
	</div>
	<div class="group_article_info_intro">
		<strong style="font-size: 20px; padding-left: 10px;">소개글</strong>
		<c:if test="${sessionScope.member.userId==dto.mId}">
			<button class="group_info_introBtn" data-toggle="modal" data-target="#infoUpdate"><i class="glyphicon glyphicon-pencil"></i>&nbsp;소개글 수정하기</button>
		</c:if>		
		<div style="height: 69px; padding-left: 11px; padding-top: 5px;">
			${dto.groupInfo}
		</div>
	</div>
	<h3>| 그룹원 소개<small style="font-family: 'Gudea', sans-serif; letter-spacing: 3px; margin-left: 5px; font-size: 16px; font-weight: bold; color: #6d6b6b; margin-bottom: 10px;">Group Member</small></h3>
	<hr>
	<div class="group_article_info_member" style="min-height: 100px; padding-left: 24px;">
			<c:forEach var="member" items="${memberList}">
				<div style="float: left; margin:10px; width: 120px; height: 130px;
							background: rgba(240, 248, 255, 0.3); box-shadow: 0 2px 0 rgba(0,0,0,0.075);">
					<div style="width: 100%; height: 80%;">
						<c:if test="${not empty member.prophoto}">
							<img src="<%=cp%>/uploads/profile/${member.prophoto}" style="width:100%; height: 100%;">
						</c:if>
						<c:if test="${empty member.prophoto}">
							<img src="<%=cp%>/resources/image/profile_img.jpg" style="width:100%; height: 100%;">
						</c:if>
					</div>
					<div style="width: 100%; height: 20%; text-align: center; padding: 5px;">
						<strong style="font-size: 15px; font-family: 'Jeju Gothic', serif; cursor: pointer;" onclick="javascript:location.href='<%=cp%>/profile?id=${member.mId}'">${member.mName}</strong>
					</div>
				</div>
			</c:forEach>
	</div>
	
	<c:if test="${check==0}">
	</c:if>
	
	<c:if test="${check==1}">
		<div class="list-body" align="center" style="min-height:500px;">
		<h3 style="text-align:left;">| 그룹게시판 <small style="font-family: 'Gudea', sans-serif; letter-spacing: 3px; margin-left: 5px; font-size: 16px; font-weight: bold; color: #6d6b6b; margin-bottom: 10px;">Group Board</small></h3>
		<hr>
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
									<a href="${articleUrl}&gbNum=${dto.gbNum}">${dto.subject}[${dto.replyCount}]</a>
								</td>
								<td>${dto.mName}</td>
								<td>${dto.created}</td>
								<td>${dto.hitCount}</td>
								<td>${dto.likeCount}</td>
								<td>
									<c:if test="${not empty dto.saveFilename}">
										<a href="<%=cp%>/community/group/boardDownload?gbNum=${dto.gbNum}&groupNum=${dto.groupNum}"><img width="24" src="<%=cp%>/resources/image/download-2-icon.png"></a>
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
						<button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/community/group/article?groupNum=${dto.groupNum}'">새로고침</button>
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
							onclick="javascript:location.href='<%=cp%>/community/group/boardCreated?groupNum=${dto.groupNum}'">
							 글쓰기
						</button>
					</div>
				</div>
			</div>
	</div>
	</c:if>
</div>


<div class="modal fade" id="imgUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">대표사진변경</h4>
      </div>
      <div class="modal-body">
        <form method="post" enctype="multipart/form-data" name="imgForm">
	        <table>
	        	<tr height="40">
					<td width="100" style="text-align: center;">대표사진</td>
					<td>
						<input type="file" name="upload" accept=".gif, .jpg, .png">
						<input type="hidden" name="groupInfo" value="${dto.groupInfo}">
						<input type="hidden" name="groupNum" value="${dto.groupNum}">
						<input type="hidden" name="page" value="${page}">
					</td>
				</tr>
				<tr height="40">
				 	<td width="100" style="text-align: center;">기존사진</td>
					<td style="padding-left:10px;">
						${dto.originalFilename}
						<c:if test="${not empty dto.originalFilename}">
							| <a href="<%=cp%>/community/group/deleteFile?groupNum=${dto.groupNum}&page=${page}">삭제</a>
						</c:if>
					</td>
				</tr>
			</table>
		</form>
						
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" onclick="updateImgGroup();">확인</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="infoUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">소개말 수정하기</h4>
      </div>
      <div class="modal-body">
        <form method="post" enctype="multipart/form-data" name="infoForm">
	        <table>
	        	<tr height="40">
					<td width="100" style="text-align: center;">소개말</td>
				</tr>
				<tr height="40">
				 	<td>
				 		<textarea name="groupInfo" cols="40" rows="5">${dto.groupInfo}</textarea>
				 		<input type="hidden" name="groupNum" value="${dto.groupNum}">
				 		<input type="hidden" name="saveFilename" value="${dto.saveFilename}">
				 		<input type="hidden" name="originalFilename" value="${dto.originalFilename}">
				 	</td>
				</tr>
			</table>
		</form>
						
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" onclick="updateInfoGroup();">확인</button>
      </div>
    </div>
  </div>
</div>