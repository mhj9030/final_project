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
		f.action="<%=cp%>/community/photo";
		f.submit();
	}
</script>

<script type="text/javascript">
function login() {
	location.href="<%=cp%>/submain";
}

function sendLikePhoto(ptnum) {
	var uid="${sessionScope.member.userId}";
	if(! uid) {
		login();
		return;
	}

	msg="게시물에 공감하십니까 ?";
	if(! confirm(msg))
		return;
	
	var query="ptnum="+ptnum;
	$.ajax({
		type:"post"
		,url:"<%=cp%>/community/photo/insertLikePhoto"
		,data:query
		,dataType:"json"
		,success:function(data) {
			var state=data.state;
			if(state=="true") {
				location.href="<%=cp%>/community/photo";
			} else if(state=="false") {
				alert("좋아요는 한번만 가능합니다. !!!");
			}
		}
		,beforeSend : function(jqXHR) {
	          jqXHR.setRequestHeader("AJAX", true);
	      }
	    ,error : function(jqXHR) {
	          if (jqXHR.status == 401) {
	          	 console.log(jqXHR);
	          } else if (jqXHR.status == 403) {
	              login();
	          } else {
	          	 console.log(jqXHR.responseText);
	          }
	      }
	 });
}
</script>

<div class="photo_list_wrap">
	<h3>| 포토갤러리</h3>
	<p>자유롭게 사진을 공유할 수 있습니다.</p>
	<div class="photo_list_subwrap">

		<c:forEach var="dto" items="${list}">
			<div class="photo_list">
				<div class="photo_list_btns">
					<button class="btn btn-default btn-sm" title="글보기" onclick="javascript:location.href='${articleUrl}&ptnum=${dto.ptnum}'"> 
						<i class="glyphicon glyphicon-search"></i>
					</button>
					<button class="btn btn-default btn-sm" title="사진 다운받기" onclick="javascript:location.href='<%=cp%>/community/photo/download?ptnum=${dto.ptnum}'">
						<i class="glyphicon glyphicon-save"></i>
					</button>
					<button class="btn btn-default btn-sm" title="추천하기" onclick="sendLikePhoto(${dto.ptnum});">
						<i class="glyphicon glyphicon-heart"></i>
					</button>
					<button class="btn btn-default btn-sm" title="댓글수" style="padding-right: 30px;">
						<i class="glyphicon glyphicon-comment"></i><span><b>&nbsp;${dto.replyCount}</b></span>
					</button>
				</div>
				<div class="photo_list_img">
					<img src="<%=cp%>/uploads/community/${dto.saveFilename}">
				</div>
				<div class="photo_list_subject">${dto.subject}</div>
				<div class="photo_list_create">
					${dto.mName} | ${dto.created } | <i class="glyphicon glyphicon-heart"></i><span>&nbsp;${dto.likeCount}</span>
				</div>
			</div>
		</c:forEach>
		
		<div class="photo_list_paging">${paging}</div>
		
		
		<div class="footer-bar photo_search_wrap">
			<div class="foorter-bar-refresh">
				<button type="button" class="btn btn-default btn-sm wbtn"
					onclick="javascript:location.href='<%=cp%>/community/photo'">새로고침</button>
			</div>
			<div class="footer-search-bar">
				<form name="searchForm" method="post" class="form-inline">
					<select class="form-control input-sm" name="searchKey">
						<option value="subject">제목</option>
						<option value="mName">작성자</option>
						<option value="content">태그(단어)</option>
						<option value="created">등록일</option>
					</select> <input type="text" class="form-control input-sm input-search"
						name="searchValue">
					<button type="button" class="btn btn-info btn-sm btn-search"
						onclick="searchList();">검색</button>
				</form>
			</div>
			<div class="footer-bar-submit">
				<button type="button" class="btn btn-default"
					onclick="javascript:location.href='<%=cp%>/community/photo/created'">
					글쓰기</button>
			</div>
		</div>
	</div>			
</div>