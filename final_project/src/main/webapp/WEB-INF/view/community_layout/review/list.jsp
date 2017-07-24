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
		f.action="<%=cp%>/community/review";
		f.submit();
	}
	
	
	function searchType(type) {
		var f= document.type_form;
		f.type.value=type;
		f.action="<%=cp%>/community/review";
		f.submit();
	}
	
	$(function(){
		var type = "${type}";
		if(type=='최신순'){
			btn = document.getElementById('newest_btn');
			btn.style.color = "white";
			btn.style.background = "#337ab7";
			btn.style.borderColor = "#337ab7";
		}else if(type=='추천순'){
			btn = document.getElementById('like_btn');
			btn.style.color = "white";
			btn.style.background = "#337ab7";
			btn.style.borderColor = "#337ab7";
		}
	});

</script>



<div class="topBar">
		후기를 등록하고 포인트를 받으세요!!!&nbsp;&nbsp;&nbsp;<a href="<%=cp%>/community/review/created">후기쓰기</a>
</div>
<div class="review_list_wrap">
	
	<h3>| 면접후기 <small style="font-family: 'Gudea', sans-serif; letter-spacing: 3px; margin-left: 5px; font-size: 16px; font-weight: bold; color: #6d6b6b;">PostScript</small></h3>
	<hr>
	<p>
		기업 면접에 관련된 인터뷰형식의 후기를 정성껏 작성해주세요. 많은 취준생분들에게 큰 도움이 됩니다!!
	</p>
	<div class="review_select">
		<form name="type_form">
			<button class="btn btn-default btn-sm" id="newest_btn" onclick="searchType('최신순')">최신순</button>
			<button class="btn btn-default btn-sm" id="like_btn" onclick="searchType('추천순')">추천순</button>
			<input type="hidden" name="type" value="${type}">
		</form>
	</div>
	<table class="table review_list_table">
		<c:forEach var="dto" items="${list}">
		<tr>
			<td width="110">
				<c:if test="${not empty dto.prophoto}">
					<img src="<%=cp%>/resources/image/Desert.jpg" style="width:100px; height: 100px;">
				</c:if>
				<c:if test="${empty dto.prophoto}">
					<img src="<%=cp%>/resources/image/profile_img.jpg" style="width:100px; height: 100px;">
				</c:if>
			</td>
			<td class="review_table_td">
				<div style="line-height: 30px;"><strong style="font-size: 20px;">${dto.subject} [${dto.replyCount}]</strong></div>
				<div style="color:#949494;">
					<div style="line-height: 15px; height: 15px; margin-bottom: 5px;"><i class="glyphicon glyphicon-map-marker"></i>
						<c:if test="${dto.cNum!=0}">
							<a href="<%=cp%>/company/search/article?page=1&cNum=${dto.cNum}" style="text-decoration: underline; color: #2196f3;">${dto.company}</a>
						</c:if>
						<c:if test="${dto.cNum==0}">
							${dto.directcompany}(미등록기업)
						</c:if>	
					</div>
					<div style="line-height: 15px; height: 15px;"><small style="text-align: right;">${dto.created} | 조회수 : ${dto.hitCount} | 추천 : ${dto.likeCount}</small></div>
				</div>
				<div style="line-height: 30px; font-size: 13px;"><strong>이름 : ${dto.mName}</strong> </div>
			</td>
			<td>
				<div style="height:100px; text-align: center; padding: 10px;">
					<div style="height: 50%;">
						<c:if test="${dto.pass=='불합격'}">
							<button class="btn btn-sm btn-danger" style="width: 100px; border-radius: 0px;" >${dto.pass}</button>
						</c:if>
						<c:if test="${dto.pass=='합격'}">
							<button class="btn btn-sm btn-primary" style="width: 100px; border-radius: 0px;">${dto.pass}</button>
						</c:if>
						<c:if test="${dto.pass=='비공개'}">
							<button class="btn btn-sm btn-default" style="width: 100px; border-radius: 0px;">${dto.pass}</button>
						</c:if>
					</div>
					<div style="height: 50%;">
						<button class="btn btn-sm" style="width: 100px; border-radius: 0px;" onclick="javascript:location.href='${articleUrl}&ibnum=${dto.ibnum}'">후기보기</button>
					</div>
				</div>
			</td>
		</tr>
		</c:forEach>
	</table>
	
	<div style="text-align: center;">
		${paging}
	</div>
	
	<div class= "footer-bar" style="height: 50px; margin: 0px;">
		<div class = "foorter-bar-refresh">
			<button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/community/review'">새로고침</button>
		</div>
			
		<div class = "footer-search-bar">
			<form name="searchForm" method="post" class="form-inline">
				<select class="form-control input-sm" name="searchKey">
					<option value="subject">제목</option>
					<option value="mName">작성자</option>
					<option value="company">기업명</option>
					<option value="created">등록일</option>
				</select> <input type="text" class="form-control input-sm input-search"
					name="searchValue">
				<button type="button" class="btn btn-info btn-sm btn-search" onclick="searchList();"> 
					검색
				</button>
			</form>
		</div>
		<div class = "footer-bar-submit">
			<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/community/review/created'">
				 후기쓰기
			</button>
		</div>
	</div>	
</div>
