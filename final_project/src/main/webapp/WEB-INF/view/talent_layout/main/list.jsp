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
		| 인재검색<small style="font-family: 'Gudea', sans-serif; letter-spacing: 3px; margin-left: 5px; font-size: 16px; font-weight: bold; color: #6d6b6b;">Telent search</small>
	</h3><hr>
	
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
	<div id="talent_list" class="row">
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
	
	if(cc==0){
		$('input:checkbox[name="subCode"][value="0"]').attr("checked", true);
		$('button[name="subName"][value="0"]').attr("class", "btn btn-info btn-xs");
	}else{
		$('input:checkbox[name="subCode"][value="0"]').attr("checked", false);
		$('button[name="subName"][value="0"]').attr("class", "btn btn-xs");
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
		out += '<button type="button" name="subName" class="btn btn-info btn-xs" value="0"> 전체 </button>';
		out += '<input type="checkbox" name="subCode" class="hidden" checked="checked" value="0" />';
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
			out += '<div class="list-content col-xs-5 col-sm-5">';
			out += '	<div class="col-xs-6 col-sm-5">';
			out += '		<img src="<%=cp%>/resources/image/profile_img.jpg" width="110px" />';//data.list[i].photo
			out += '	</div>';
			out += '	<div class="col-xs-6 col-sm-7">';
			out += '		<span>' + data.list[i].rName + '(' + data.list[i].rNum + ')</span>';
			out += '		<p class="text-muted small">' + data.list[i].mId + '</p>';
			out += '		<p class="small">관심분야<br>' + data.list[i].subTypes + '</p>';
			out += '		<button type="button" class="btn btn-primary btn-xs" onclick="proArti(\'' + data.list[i].mId + '\');"> <i class="fa fa-user" aria-hidden="true"></i> 프로필 </button>';
			out += '		<button type="button" class="btn btn-primary btn-xs" onclick="article(' + data.list[i].rNum + ');"> <i class="fa fa-user" aria-hidden="true"></i> 지원서 </button>';
			out += '	</div>';
			out += '</div>';
		}
	}else{
		out = '<div style="text-align: center;"> 검색 결과가 없습니다.</div>';	
	}
	
	$("#talent_list").html(out);
}

function proArti(mId){
	location.href = "<%=cp%>/profile?id=" + mId;
}

function article(rNum) {
	location.href = "<%=cp%>/member/applications/application?rNum=" + rNum + "&page=${page}";
}
</script>