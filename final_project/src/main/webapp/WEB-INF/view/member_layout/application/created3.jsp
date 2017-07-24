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
	<div class="page_head">
		<h3>
			<c:if test="${mode!='update'}">
			| 이력서 작성 
			(1단계 > 2단계 > <b>3단계</b>)
			</c:if>
			<c:if test="${mode=='update'}">
			| 이력서 작성 
			(1단계 > 2단계 > <b>3단계</b>)
			</c:if>
		</h3><hr>
	</div>
	<form name="resume_detail2" method="post">
		<div id="resume_div">
			<input type="hidden" name="rNum" value="${rNum}" />
			<table id="intro" class="table">
				<caption>▶ 자기소개</caption>
				<tr height="100px">
					<td><textarea name="intro1" rows="7" cols="100">${iDto.intro1}</textarea></td>
				</tr>
			</table>
			
			<table class="table">
				<caption>▶ 지원동기</caption>
				<tr height="100px">
					<td><textarea name="intro2" rows="7" cols="100">${iDto.intro2}</textarea></td>
				</tr>
			</table>
			
			<table class="table">
				<caption>▶ 성장배경</caption>
				<tr height="100px">
					<td><textarea name="intro3" rows="7" cols="100">${iDto.intro3}</textarea></td>
				</tr>
			</table>
			
			<table class="table">
				<caption>▶ ???</caption>
				<tr>
					<td><textarea name="intro4" rows="7" cols="100">${iDto.intro4}</textarea></td>
				</tr>
			</table>
			<hr>
		</div>
		<div class= "footer-bar">
			<div style="text-align: right;">
				<button type="button" class="btn btn-info" onclick="check()">
					<c:if test="${mode!='update'}">
						자기소개 등록
					</c:if>
					<c:if test="${mode=='update'}">
						자기소개 수정
					</c:if>
				</button>
				<button type="button" class="btn btn-default" onclick="javascript:history.back();">취소</button>
				<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/member/applications/list'">이력서 목록</button>
			</div>
		</div>
	</form>
</div>

<script>
function check() {
	var f = document.resume_detail2;
	
	if(f.intro1.value==""){
		alert("자기소개 작성");
		f.intro1.focus();
		return false;
	}
	
	if(f.intro2.value==""){
		alert("지원동기");
		f.intro2.focus();
		return false;
	}
	
	if(f.intro3.value==""){
		alert("성장배경");
		f.intro3.focus();
		return false;
	}
	
	if(f.intro4.value==""){
		alert("???");
		f.intro4.focus();
		return false;
	}
	
	if(${mode=='update'}){
		f.action='<%=cp%>/member/applications/update3';
	}else{
		f.action='<%=cp%>/member/applications/created3';
	}
	
	f.submit();
}
</script>