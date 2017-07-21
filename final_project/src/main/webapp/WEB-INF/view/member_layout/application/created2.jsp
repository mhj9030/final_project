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
.file-class{
	margin: 10px auto;
	border: 1px solid #cccccc;
}
</style>

<script>
$(document).ready(function () {
	$('#exampleInputFile').change(function(e) {
		var upload = document.getElementById('exampleInputFile');
		var imgdiv = document.getElementById('imgdiv');
		
		e.preventDefault();
		
		alert(e);
	
		var file = upload.files[0], reader = new FileReader();
		reader.onload = function(event) {
			var img = new Image();
			img.src = event.target.result;
			img.width = 110;
			imgdiv.innerHTML = '';
			imgdiv.appendChild(img);
		};
		reader.readAsDataURL(file);
	
		return false;
	)};
});

function add(type) {
	
}
</script>

<div class="page_body .container-fluid ">
	<div class="page_head">
		<h3>
			| 이력서 작성 
			(1단계 > <b>2단계</b>)
		</h3><hr>
	</div>
	<form name="member_detail">
		<div id="resume_div">
			<table id="license" class="table" style="height: 60px;">
				<caption>▶ 자격증</caption>
				<tr>
					<td>자격증명</td>
					<td>취득일</td>
					<td>발급기관</td>
				</tr>
			<c:if test="${empty licenseList}">
				<tr>
					<td colspan="3">
					<button type="button" class="btn btn-default" aria-label="Left Align" onclick="add('license');">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 추가하기
					</button>
					</td>
				</tr>
			</c:if>
				<tr>
					<td>.</td>
					<td>.</td>
					<td>.</td>
				</tr>
			</table>
			
			<table id="language" class="table" style="height: 60px;">
				<caption>▶ 외국어 점수</caption>
				<tr>
					<td>외국어시험명</td>
					<td>외국어 점수</td>
				</tr>
			<c:if test="${empty languageList}">
				<tr>
					<td colspan="2">
						<button type="button" class="btn btn-default" aria-label="Left Align" onclick="add('language');">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 추가하기
						</button>
					</td>
				</tr>
			</c:if>
				<tr>
					<td>.</td>
					<td>.</td>
				</tr>
			</table>
			
			<table id="award" class="table" style="height: 60px;">
				<caption>▶ 수상</caption>
				<tr>
					<td>개최</td>
					<td>수상명</td>
					<td>수상일</td>
				</tr>
			<c:if test="${empty awardList}">
					<td colspan="3">
						<button type="button" class="btn btn-default" aria-label="Left Align" onclick="add('award');">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 추가하기
						</button>
					</td>
			</c:if>
			<tr>
				<td>.</td>
				<td>.</td>
				<td>.</td>
			</tr>
			</table>
			
			<table id="intro" class="table">
				<caption>▶ 자기소개</caption>
				<tr height="100px">
					<td><textarea rows="7" cols="100"></textarea></td>
				</tr>
			</table>
			
			<table class="table">
				<caption>▶ 지원동기</caption>
				<tr height="100px">
					<td><textarea rows="7" cols="100"></textarea></td>
				</tr>
			</table>
			
			<table class="table">
				<caption>▶ 성장배경</caption>
				<tr height="100px">
					<td><textarea rows="7" cols="100"></textarea></td>
				</tr>
			</table>
			
			<table class="table">
				<caption>▶ ???</caption>
				<tr>
					<td><textarea rows="7" cols="100"></textarea></td>
				</tr>
			</table>
			<hr>
		</div>
		<div class= "footer-bar">
			<div style="text-align: right;">
				<button type="button" class="btn btn-info" onclick="javascript:location.href='<%=cp%>/member/applications/list'">추가 정보 등록</button>
				<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/member/applications/list'">이력서 목록</button>
			</div>
		</div>
	</form>
</div>