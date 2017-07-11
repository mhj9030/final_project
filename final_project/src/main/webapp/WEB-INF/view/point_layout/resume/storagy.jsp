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
		<h3>| 이력서 보관함</h3><hr>
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
	<div id="resume_list">
		<c:if test="${empty list}">
			<div style="text-align: center;"> 검색 결과가 없습니다.</div>
		</c:if>
		<c:forEach var="dto" items="${list}">
		<div class="marketDiv">
			<div style="text-align: center;">
				<img src="" width="110px" height="140px" />
			</div>
			<div>
				이력서번호: ${dto.rNum} (${dto.rName})<br>
				<%-- 지원분야: ${dto.apply}<br> --%>
				관심직종: ${dto.subTypes}<br>
				<button type="button" class="btn btn-primary" onclick="javascript:location.href='<%=cp%>/point/storagy/article?rNum=${dto.rNum}'">열람</button>
			</div>
		</div>
		</c:forEach>
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
</script>