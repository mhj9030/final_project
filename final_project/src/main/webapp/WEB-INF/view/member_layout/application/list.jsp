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
		<h3>| 나의 지원서 관리</h3><hr>
	</div>
	
	<div class="point_bbs_list">
		<table class="table" style="align: center;">
			<thead>
				<tr>
					<th width="30px"><input type="checkbox" name=chkAll id="chkAll" onclick="check();" /></th>
					<th width="150px">이력서 번호</th>
					<th>이력서 메모</th>
					<th width="150px">작성일</th>
				</tr>
			</thead>
			<tr align="center">
					<td><input type="checkbox" name="evtNum" value="" /></td>
					<td>1</td>
					<td align="left">
						<a href="<%=cp%>/member/applications/application?num=${dto.poNum}&page=${page}">지원서1</a>
					</td>
					<td>2017-07-19</td>
				</tr>
			<tbody>
				<c:forEach var="dto" items="${list}">
				<tr align="center">
					<td><input type="checkbox" value="${dto.poNum}" style="width: 20px;" /></td>
					<td>${dto.poNum}</td>
					<td align="left">
						<a href="<%=cp%>/point/main/article?num=${dto.poNum}&page=${page}">${dto.subject}</a>
					</td>
					<td>${dto.created}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div style="text-align: right;">
			<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/member/applications/created'">새 이력서 작성</button>
			<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/member/applications/created'">삭제</button>
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
	var ef = document.eventForm;
	
	// 없을때
	if(ef.evtNum==undefined){
		return;
	}
	
	// 한개일때
	if(ef.evtNum.length==undefined){
		if(ef.chkAll.checked)
			ef.evtNum.checked = true;
		else
			ef.evtNum.checked = false;
		return;
	}
		
	// 여러개일때
	for(var i=0;i<ef.evtNum.length;i++){
		if(ef.chkAll.checked)
			ef.evtNum[i].checked = true;
		else
			ef.evtNum[i].checked = false;
	}
}

function deleteCheck(){
	var ef = document.eventForm;
	var cnt = 0;
	
	if(confirm('삭제하시겠습니까?')){
		// 한개일때
		if(ef.evtNum.length==undefined){
			if(ef.evtNum.checked)
				cnt++;
		}else{
			for(var i=0;i<ef.evtNum.length;i++){
				if(ef.evtNum[i].checked)
					cnt++;
			}
		}
		
		ef.action = "<%=cp%>/event/delete.do";
		ef.submit();
	}
}
</script>