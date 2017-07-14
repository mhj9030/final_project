<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>

<div class="page_body">
	<div class="page_head">
		<h3>| 포인트 마켓</h3><hr>
	</div>
	
	<!-- 나의 포인트 -->
	<div style="height: 50px; text-align: center; font-size: 7;">
		<b>${sessionScope.member.userName}</b> 님의 사용가능한 포인트 <b>${point.mypoint}</b> 포인트
	</div>
	
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
		<div class="list-content col-sm-5">
			<div class="col-xs-6 col-sm-5">
				<img src="<%=cp%>/resources/image/profile_img.jpg" width="110px" />
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
		error: function(e){
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

function usePoint(num) {
	var mypoint = ${point.mypoint};

	if(mypoint-3000 >= 0){
		var query = $("form[name=reintro" + num + "]").serialize();
		
		$.ajax({
			type: "post",
			url: "<%=cp%>/point/market/usePoint",
			data: query,
			dataType: "json",
			success: function(data){
				if(data.state=="1"){
					if(confirm("이력서를 바로 열람하시겠습니까?")){
						alert(num);
						location.href="<%=cp%>/point/storagy/article?rNum=" + num + "&page=${page}";
					}
				}else{
					alert("포인트가 부족합니다.");
				}
			},
			error: function(e){
				alert("관리자에게 문의하세요.");
				return;
			}
		});
	}else{
		alert("포인트가 부족합니다.");
	}
}
</script>