<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>

<div class="page_body">
	<h3>
		| 이력서 보관함
		<small style="font-family: 'Gudea', sans-serif; letter-spacing: 3px; margin-left: 5px; font-size: 16px; font-weight: bold; color: #6d6b6b;">Point Storagy</small>
	</h3><hr>
	
	<!-- 검색 -->
	<div class="search_list">
		<form name="searchForm">
			<table class="table">
				<tr>
					<td width="15%">검색</td>
					<td width="25%" align="center">
						<select name="mainCode" id="mainCode" class="form-control" onchange="onChange()">
							<option value="0">대분류</option>
						<c:forEach var="dto" items="${mainType}">
							<option value="${dto.mainCode}">${dto.mainName}</option>
						</c:forEach>
						</select> 
					</td>
					<td width="25%" align="center">
						<div id="subType">
							<select name="subCode" id="subCode" class="form-control">
								<option value="">소분류</option>
							</select>
						</div>
					</td>
					<td><button class="btn btn-primary" type="submit">조회하기</button></td>
				</tr>
			</table>
		</form>
	</div>
	
	<!-- 열람 -->
	<div id="resume_list" class="row">
		<c:if test="${empty list}">
			<div style="text-align: center;"> 검색 결과가 없습니다.</div>
		</c:if>
		<c:forEach var="dto" items="${list}">
		<div class="list-content col-xs-5 col-sm-5">
			<div class="col-xs-6 col-sm-5">
					<c:if test="${empty dto.rPhoto}">
						<img src="<%=cp%>/resources/image/profile_img.jpg" style="width: 110px; height: 110px;" />
					</c:if>
					<c:if test="${not empty dto.rPhoto}">
						<img src="<%=cp%>/uploads/resume/${dto.rPhoto}" style="width: 110px; height: 110px;"/>
					</c:if>
				</div>
			<div class="col-xs-6 col-sm-7">
				<span>${dto.rName}(${dto.rNum})</span>
				<p class="text-muted small">${dto.mId}</p>
				<p class="small">관심분야<br>${dto.subTypes}</p>
				<button type="button" class="btn btn-primary btn-xs" onclick="article(${dto.rNum});"> <i class="fa fa-user" aria-hidden="true"></i> 지원서 열람 </button>
			</div>
		</div>
		</c:forEach>
	</div>
	
	<div class="paging">
		${paging}
	</div>
</div>

<script>
$(document).ready(function() {
	if('${mainCode}'!=""){
		//$("#mainCode option:eq(${mainCode})").attr("selected", "selected");
		$('#mainCode').val('${mainCode}');
		onChange();
	}else{
		$('#mainCode').val('0');
	}
});

function onChange() {
	var query = $("form[name=searchForm]").serialize();
	
	$.ajax({
		type: "post",
		url: "<%=cp%>/point/market/subType",
		data: query,
		dataType: "json",
		success: function(data){
			subPrint(data);
		},
		error:function(e){
			console.log(e);
		}
	});
}

function subPrint(data){
	if(data.subType.length!=0){
		var out = '<select name="subCode" id="subCode" class="form-control">';
		out += '<option value="">소분류</option>';
		for(var i=0; i<data.subType.length; i++){
			if(data.subType[i].subCode=='${subCode}')
				out += '<option value="' + data.subType[i].subCode + '" selected="selected">' + data.subType[i].subName + '</option>';
			else
				out += '<option value="' + data.subType[i].subCode + '">' + data.subType[i].subName + '</option>';
		}
		out += '</select>';
		
		$("#subType").html(out);
	}
	
	return ;
}

function article(num) {
	location.href="<%=cp%>/member/applications/application?rNum=" + num + "&page=${page}";
}
</script>