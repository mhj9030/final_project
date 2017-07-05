<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
$(document).ready(function() {
	var query="mainCode=0";
	
	if("${mainCode!=0}"){
		$('input:radio[name="mainCode"][value="${mainCode}"]').attr("checked", "true");
		$('button[name="mainName"][value="${mainCode}"]').attr("class", "btn btn-info");
		query="mainCode=${mainCode}";
	}
	
	/* if("${subCode!=0}"){
		var list = new Array(); 
		<c:forEach var="item" items="${subCode}">
			list.push("${item.subCode}");
		</c:forEach>
		
		for(var i=0;i<list.length();i++){
			$('input:checkbox[name="subCode"][value="' + list[i] + '"]').attr("checked", true);
			$('button[name="subName"][value="' + list[i] + '"]').attr("class", "btn btn-info");
		}
	} */
	
	list(query);
	
	$('button[name="mainName"]').on("click", function(){
		$('input:radio[name="mainCode"][value="' + $(this).val() + '"]').attr("checked", "true");
		for(var i=0;i<10;i++)
			$('button[name="mainName"][value="' + i + '"]').attr("class", "btn");
		$(this).attr("class", "btn btn-info");
		query = $("form[name=searchForm]").serialize();
		list(query);
	});
});

$(function(){
	$("body").on("change", "#endDate", function(){
		var startdate = $("#startDate").val().split(".");
		var enddate = $("#endDate").val().split(".");
		
		if(startdate==""){
			alert("시작날짜를 먼저 입력해주세요");
			$("#endDate").val("");
			return;
		}
		
		if(startdate[0]-enddate[0]>0) {
			alert("종료날짜는 시작날짜 이상만 가능합니다.");
			$("#endDate").val("");	
			return;
		} else if(startdate[1]-enddate[1]>0) {
			alert("종료날짜는 시작날짜 이상만 가능합니다.");
			$("#endDate").val("");	
			return;
		} else if(startdate[2]-enddate[2]>0) {
			alert("종료날짜는 시작날짜 이상만 가능합니다.");
			$("#endDate").val("");	
			return;
		}
	});
});

function list(query) {
	$.ajax({
		type: "post",
		url: "<%=cp%>/talent/main/subType",
		data: query,
		dataType: "json",
		success: function(data){
			print(data);
		},
		error:function(e){
			console.log(e);
		}
	});
}

function print(data){
	var out = "";
	if(data.subType.length!=0){
		for(var i=0; i<data.subType.length; i++){
			out += '<span class="button-checkbox">';
			out += '<button type="button" name="subName" class="btn" value="' + data.subType[i].subCode + '" onclick="isCheck(' + data.subType[i].subCode + ');">' + data.subType[i].subName + '</button>';
			out += '<input type="checkbox" name="subCode" class="hidden" value="' + data.subType[i].subCode + '" />';
			out += '</span>';
		}
	}else{
		out = '직종을 선택해 주세요.';
	}
	
	$("#subType").html(out);
}

function isCheck(data) {
	if($('input:checkbox[name="subCode"][value="' + data + '"]').is(":checked")){
		$('input:checkbox[name="subCode"][value="' + data + '"]').attr("checked", false);
		$('button[name="subName"][value="' + data + '"]').attr("class", "btn");
	}else{
		$('input:checkbox[name="subCode"][value="' + data + '"]').attr("checked", true);
		$('button[name="subName"][value="' + data + '"]').attr("class", "btn btn-info");
	}
}
</script>

<div class="page_body">
	<div class="page_head">
		<h3>| 인재검색</h3><hr>
	</div>
	
	<!-- 검색 -->
	<div class="search_list">
		<form name="searchForm">
			<table>
				<tr align="center">
					<td width="10%">직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종</td>
					<td colspan="5" style=" padding-left: 25px; text-align: left; line-height: 230%;">
						<c:forEach var="dto" items="${mainType}">
							<span class="button-checkbox">
						        <button type="button" name="mainName" class="btn" value="${dto.mainCode}">${dto.mainName}</button>
						        <input type="radio" name="mainCode" class="hidden" value="${dto.mainCode}" />
						    </span>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td>세부직종</td>
					<td colspan="5" style="padding-left: 25px; text-align: left; line-height: 230%;">
						<div id="subType"></div>
					</td>
				</tr>
				<tr align="center">
					<td>기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;간</td>
					<td width="25%">
						<input type="date" name="startDate" id="startDate" class="form-control" value="${startDate}" /> 
					</td>
					<td width="3%"> ~ </td>
					<td width="25%">
						<input type="date" name="endDate" id="endDate" class="form-control" value="${endDate}" />
					</td>
					<td width="25%"> </td>
					<td width="12%"><button class="btn btn-primary" type="submit">조회하기</button></td>
				</tr>
			</table>
		</form>
	</div>
	
	<!-- 리스트 -->
	<div class="">
		리스트
	</div>
</div>