<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>
<div class="page_body">
	<div class="container-fluid .page_head">
		<h3>| 인재검색</h3><hr>
	</div>
	
	<!-- 검색 -->
	<div class="search_list" style="width: 100%;">
		<form name="searchForm">
			<table class="table">
			<tbody>
				<tr align="center">
					<td width="10%">직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종</td>
					<td colspan="5">
						<div style="height: 90px; padding-left: 25px; text-align: left;">
						<c:forEach var="dto" items="${mainType}">
							<span class="button-checkbox">
						        <button type="button" name="mainName" class="btn btn-xs" value="${dto.mainCode}">${dto.mainName}</button>
						        <input type="radio" name="mainCode" class="hidden" value="${dto.mainCode}" />
						    </span>
						</c:forEach>
						</div>
					</td>
				</tr>
				<tr>
					<td>세부직종</td>
					<td colspan="5">
						<div id="subType" style="padding-left: 25px; padding-button: 25px; text-align: left;"></div>
					</td>
				</tr>
			</tbody>
			</table>
		</form>
	</div>
	<br><br>
	
	<!-- 리스트 -->
	<div id="talent_list">
	</div>
	
	<div class="paging">
		${paging}
	</div>
</div>

<script type="text/javascript">
var cc = 0;

$(document).ready(function() {
	list(0);
	$("#subType").html('직종을 선택해 주세요.');
});

$("body").on("click", 'button[name="mainName"]', function(){
	$('input:radio[name="mainCode"][value="' + $(this).val() + '"]').prop("checked", true);
	for(var i=0;i<10;i++)
		$('button[name="mainName"][value="' + i + '"]').attr("class", "btn btn-xs");
	$(this).attr("class", "btn btn-info btn-xs");
	query = $("form[name=searchForm]").serialize();
	
	$.ajax({
		type: "post",
		url: "<%=cp%>/talent/main/subType",
		data: query,
		dataType: "json",
		success: function(data){
			subPrint(data);
			listPrint(data);
		},
		error:function(e){
			console.log(e);
		}
	});
});

function isCheck(data) {
	if($('input:checkbox[name="subCode"][value="' + data + '"]').is(":checked")){
		$('input:checkbox[name="subCode"][value="' + data + '"]').attr("checked", false);
		$('button[name="subName"][value="' + data + '"]').attr("class", "btn btn-xs");
		cc--;
	}else{
		$('input:checkbox[name="subCode"][value="' + data + '"]').attr("checked", true);
		$('button[name="subName"][value="' + data + '"]').attr("class", "btn btn-info btn-xs");
		cc++;
	}
	
	var query = $("form[name=searchForm]").serialize();
	list(query);
} 

function list(query){
	$.ajax({
		type: "post",
		url: "<%=cp%>/talent/main/searchList",
		data: query,
		dataType: "json",
		success: function(data){
			listPrint(data);
		},
		error:function(e){
			console.log(e);
		}
	});
}

function subPrint(data){
	var out = "";
	if(data.subType.length!=0){
		out += '<span class="button-checkbox">';
		out += '<button type="button" name="subName" class="btn btn-xs"> 전체 </button>';
		out += '<input type="checkbox" name="subCode" class="hidden" value="" />';
		out += '</span>';
		for(var i=0; i<data.subType.length; i++){
			out += '<span class="button-checkbox">';
			out += '<button type="button" name="subName" class="btn btn-xs" value="' + data.subType[i].subCode + '" onclick="isCheck(' + data.subType[i].subCode + ');">' + data.subType[i].subName + '</button>';
			out += '<input type="checkbox" name="subCode" class="hidden" value="' + data.subType[i].subCode + '" />';
			out += '</span>';
		}
	}else{
		out = '직종을 선택해 주세요.';
	}
	
	$("#subType").html(out);
}

function listPrint(data){
	var out = "";
	
	if(data.list.length!=0){
		for(var i=0; i<data.list.length; i++){
			out += '<div class="marketDiv">';
			out += '	<div style="text-align: center;">';
			out += '		<img src="<%=cp%>/resources/image/profile_img.jpg" width="110px" />';//data.list[i].photo
			out += '	</div>';
			out += '	<div>';
			out += '		이름: ' + data.list[i].rName + '(' + data.list[i].rNum + ')<br>';
			out += '		관심직종<br>' + data.list[i].subTypes + '<br>';
			out += '		<a href="<%=cp%>/talent/main/article?mId=&rNum=' + data.list[i].rNum + '">[ 이력서 보러가기 ]</a>';
			out += '	</div>';
			out += '</div>';
		}
	}else{
		out = '<div style="text-align: center;"> 검색 결과가 없습니다.</div>';	
	}
	
	$("#talent_list").html(out);
}
</script>