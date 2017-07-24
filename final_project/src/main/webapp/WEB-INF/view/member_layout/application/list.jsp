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

<div class="page_body">
	<div class="page_head">
		<h3>| 나의 지원서 관리</h3><hr>
	</div>
	
	<div class="point_bbs_list">
		<form name="resuFrom">
			<table class="table" style="align: center;">
				<caption>나의 이력서 보관함 (${count}/5)</caption>
				<thead>
					<tr>
						<th width="50px"><input type="checkbox" name=chkAll id="chkAll" onclick="check();" /></th>
						<th width="150px">이력서 번호</th>
						<th width="50%">이력서</th>
						<th>최종작성일</th>
					</tr>
				</thead>
				<tr align="center">
				<tbody>
				<c:if test="${empty list}">
					<tr>
						<td colspan="4">작성된 이력서가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${list}">
					<tr align="center">
						<td width="50px"><input type="checkbox" name="resuNum" value="${dto.rNum}" style="width: 20px;" /></td>
						<td width="150px">${dto.rownum}</td>
						<td align="left" width="50%">
							<a href="<%=cp%>/member/applications/application?rNum=${dto.rNum}">이력서${dto.memo}</a>
						</td>
						<td>${dto.endWrite}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</form>
		
		<div style="text-align: right;">
			<button type="button" class="btn btn-default" onclick="created();">새 이력서 작성</button>
			<button type="button" class="btn btn-default" onclick="deleteCheck();">삭제</button>
		</div>
			
		<div class= "footer-bar">
			<div class="paging">
				${paging}
			</div>
		</div>
	</div>
</div>

<script>
function check() {
	var f = document.resuFrom;
	
	// 없을때
	if(f.resuNum==undefined){
		return;
	}
	
	// 한개일때
	if(f.resuNum.length==undefined){
		if(f.chkAll.checked)
			f.resuNum.checked = true;
		else
			f.resuNum.checked = false;
		return;
	}
		
	// 여러개일때
	for(var i=0;i<f.resuNum.length;i++){
		if(f.chkAll.checked)
			f.resuNum[i].checked = true;
		else
			f.resuNum[i].checked = false;
	}
}

function created() {
	if(${count<5}){
		location.href = "<%=cp%>/member/applications/created1";
	}else{
		alert("5개의 이력서가 이미 존재합니다.\n기존의 이력서를 삭제하시고 다시 시도해 주세요.");
	}
}

function deleteCheck(){
	var f = document.resuFrom;
	var cnt = 0;
	
	if(confirm('삭제하시겠습니까?')){
		// 한개일때
		if(f.resuNum.length==undefined){
			if(f.resuNum.checked)
				cnt++;
		}else{
			for(var i=0;i<f.resuNum.length;i++){
				if(f.resuNum[i].checked)
					cnt++;
			}
		}
		
		f.action = "<%=cp%>/member/applications/delete";
		f.submit();
	}
}
</script>