<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>
<style>
#resume_div table{
	text-align: center;
}
</style>

<div class="page_body .container-fluid ">
	<h3>
		<c:if test="${mode!='update'}">
			이력서 작성 (1단계 > <b>2단계</b> > 3단계)
			<small style="font-family: 'Gudea', sans-serif; letter-spacing: 3px; margin-left: 5px; font-size: 16px; font-weight: bold; color: #6d6b6b;">Write Resume (2step)</small>
		</c:if>
		<c:if test="${mode=='update'}">
			이력서 작성 (1단계 > <b>2단계</b> > 3단계)
			<small style="font-family: 'Gudea', sans-serif; letter-spacing: 3px; margin-left: 5px; font-size: 16px; font-weight: bold; color: #6d6b6b;">Write Resume</small>
		</c:if>
	</h3><hr>
	
	<form name="resume_detail" method="post">
		<div id="resume_div">
			<input type="hidden" name="rNum" value="${rDto.rNum}" />
			<table id="license" class="table" style="height: 60px;">
				<caption>▶ 자격증</caption>
				<thead>
					<tr>
						<td>자격증명</td>
						<td>취득일</td>
						<td>발급기관</td>
						<td>비고</td>
					</tr>
				</thead>
				<tbody>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4">
							<button type="button" class="btn btn-default" aria-label="Left Align" onclick="add('license');">
								<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 추가하기
							</button>
						</td>
					</tr>
				</tfoot>
			</table>
			
			<table id="language" class="table" style="height: 60px;">
				<caption>▶ 외국어 점수</caption>
				<thead>
					<tr>
						<td>외국어시험명</td>
						<td>외국어 점수</td>
						<td>삭제</td>
					</tr>
				</thead>
				<tbody>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="3">
							<button type="button" class="btn btn-default" aria-label="Left Align" onclick="add('language');">
								<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 추가하기
							</button>
						</td>
					</tr>
				</tfoot>
			</table>
			
			<table id="award" class="table" style="height: 60px;">
				<caption>▶ 수상</caption>
				<thead>
					<tr>
						<td>개최</td>
						<td>수상명</td>
						<td>수상일</td>
						<td>비고</td>
					</tr>
				</thead>
				<tbody>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4">
							<button type="button" class="btn btn-default" aria-label="Left Align" onclick="add('award');">
								<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 추가하기
							</button>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
		<hr>
		<div class= "footer-bar">
			<div style="text-align: right;">
				<c:if test="${mode!='update'}">
					* 자기소개는 다음 단계에서 쓸 수 있습니다.<br>
					<button type="button" class="btn btn-info" onclick="check()">추가 정보 등록</button>
				</c:if>
				<c:if test="${mode=='update'}">
					<button type="button" class="btn btn-info" onclick="check()">추가 정보 수정</button>
				</c:if>
				<button type="button" class="btn btn-default" onclick="javascript:history.back();">취소</button>
				<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/member/applications/list'">이력서 목록</button>
			</div>
		</div>
	</form>
</div>

<script>
$(document).ready(function () {
	$("#license").on("click", "#btn-remove", function() {
		$(this).closest("tr").remove();
	});
	
	$("#language").on("click", "#btn-remove", function() {
		$(this).closest("tr").remove();
	});
	
	$("#award").on("click", "#btn-remove", function() {
		$(this).closest("tr").remove();
	});
});

function add(type) {
	if(type=='license'){
		var out = '<tr>';
		out += '	<td><input type="text" name="license" class="form-control input-sm" /></td>';
		out += '	<td><input type="text" name="expStart" class="form-control input-sm" /></td>';
		out += '	<td><input type="text" name="liGC" class="form-control input-sm" /></td>';
		out += '	<td>';
		out += '		<button type="button" id="btn-remove" class="btn btn-default" aria-label="Left Align" onclick="remove(\'' + type + '\');">';
		out += '			<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>';
		out += '		</button>';
		out += '	</td>';
		out += '</tr>';
	}else if(type=='language'){
		var out = '<tr>';
		out += '	<td><input type="text" name="language" class="form-control input-sm" /></td>';
		out += '	<td><input type="text" name="laScore" class="form-control input-sm" /></td>';
		out += '	<td>';
		out += '		<button type="button" id="btn-remove" class="btn btn-default" aria-label="Left Align" onclick="remove(\'' + type + '\');">';
		out += '			<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>';
		out += '		</button>';
		out += '	</td>';
		out += '</tr>';
	}else if(type=='award'){
		var out = '<tr>';
		out += '	<td><input type="text" name="awAgency" class="form-control input-sm" /></td>';
		out += '	<td><input type="text" name="awSector" class="form-control input-sm" /></td>';
		out += '	<td><input type="text" name="awDate" class="form-control input-sm" /></td>';
		out += '	<td>';
		out += '		<button type="button" id="btn-remove" class="btn btn-default" aria-label="Left Align" onclick="remove(\'' + type + '\');">';
		out += '			<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>';
		out += '		</button>';
		out += '	</td>';
		out += '</tr>';
	}
	
	$('#' + type + ' > tbody:last').append(out);
}

function check() {
	var f = document.resume_detail;

	if(${mode=='update'}){
		f.action='<%=cp%>/member/applications/update2';
	}else{
		f.action='<%=cp%>/member/applications/created2';
	}
	
	f.submit();
}
</script>