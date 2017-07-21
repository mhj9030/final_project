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
	border-radius: 5px;
	width: 100px;
}
</style>

<script>
$(document).ready(function () {
	$('#exampleInputFile').change(function(e) {
		var upload = document.getElementById('exampleInputFile');
		var imgdiv = document.getElementById('imgdiv');
		
		e.preventDefault();
	
		var file = upload.files[0], reader = new FileReader();
		reader.onload = function(event) {
			var img = new Image();
			img.src = event.target.result;
			img.width = 110;
			img.height = 140;
			imgdiv.innerHTML = '';
			imgdiv.appendChild(img);
		};
		reader.readAsDataURL(file);
	
		return false;
	});
});

function check(){
	var f = document.member_detail;
	
	if(f.rName==""){
		alert("이름 작성");
		f.rName.focus();
		return false;
	}
	
	if(f.engName.value==""){
		alert("이름 작성");
		f.engName.focus();
		return false;
	}
	
	if(f.phone.value==""){
		alert("폰번호 작성");
		f.phone.focus();
		return false;
	}
	
	if(f.addr.value==""){
		alert("주소 작성");
		f.addr.focus();
		return false;
	}
	
	if(f.addr2.value==""){
		alert("주소 작성");
		f.addr2.focus();
		return false;
	}
	
	f.action = "<%=cp%>/member/applications/created_ok";
	f.submit();
}
</script>

<div class="page_body .container-fluid ">
	<div class="page_head">
		<h3>
			| 이력서 작성 
			(<b>1단계</b> > 2단계)
		</h3><hr>
	</div>
	
	<form name="member_detail" method="post">
		<div id="resume_div">
			<table class="table table-bordered">
				<caption>▶ 인적사항</caption>
				<tr>
					<td rowspan="4" width="120px">
						<div id="imgdiv" style="border: 2px solid #cccccc; width: 114px; height: 144px;"></div>
						<div class="input-group file-class">
							<label for="exampleInputFile">사진 업로드</label>
							<input type="file" id="exampleInputFile" name="resumeImg" class="hidden">
						</div>
					</td>
					<td width="80px">이름</td>
					<td width="230px"><input type="text" name="rName" class="form-control input-sm" value="${sessionScope.member.userName}" /></td>
					<td width="80px">영어</td>
					<td colspan="3"><input type="text" name="engName" class="form-control input-sm" /></td>
				</tr>
				<tr>
					<td>생년월인</td>
					<td>${mList.mbirth} ( ${mList.age}세)</td>
					<td>폰번호</td>
					<td colspan="3"><input type="tel" name="phone" class="form-control input-sm" placeholder="핸드폰 번호" /></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="eMail" class="form-control input-sm" value="${mList.mid}" /></td>
					<td>성별</td>
					<td width="80px">${mList.mgender}</td>
					<td width="90px">병역</td>
					<td>
						<select name="army" class="form-control">
							<option value="면제" selected="selected">면제</option>
							<option value="군필">군필</option>
							<option value="미필">미필</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td colspan="5">
						<input type="text" name="addr" class="form-control input-sm" placeholder="기본주소" /><br>
						<input type="text" name="addr2" class="form-control input-sm" placeholder="상세주소" />
					</td>
				</tr>
			</table>
			
			<table class="table table-bordered">
				<tr>
					<td>지원분야</td>
					<td>
						<select name="apply" id="mainCode" class="form-control">
							<option value="미선택" selected="selected">대분류</option>
						<c:forEach var="dto" items="${mainType}">
							<option value="${dto.mainName}">${dto.mainName}</option>
						</c:forEach>
						</select>
					</td>
					<td>페이</td>
					<td><input type="text" name="pay" class="form-control input-sm" value="회사 내규에 따름" /></td>
				</tr>
			</table>
		
			<table id="academy" class="table" style="height: 60px;">
				<caption>▶ 학력 (학력은 이력서에서 수정이 불가능 합니다.)</caption>
				<tr>
					<td>재학기간</td>
					<td>학교명</td>
					<td>전공</td>
					<td>상태</td>
				</tr>
			<c:if test="${empty acList}">
				<tr>
					<td colspan="4">해당사항없음</td>
				</tr>
			</c:if>
			<c:if test="${not empty acList}">
			<c:forEach var="dto" items="${acList}">
				<tr>
					<td>${dto.termStart} ~ ${dto.termEnd}</td>
					<td>${dto.school}</td>
					<td>${dto.major}</td>
					<td>${dto.termState}</td>
				</tr>
			</c:forEach>
			</c:if>
			</table>
			
			<table id="career" class="table" style="height: 60px;">
				<caption>▶ 경력 (경력은 이력서에서 수정이 불가능 합니다.)</caption>
				<tr>
					<td>재직기간</td>
					<td>회사명</td>
					<td>직무</td>
					<td>직급</td>
				</tr>
			<c:if test="${empty coList}">
				<tr>
					<td colspan="4">해당사항없음</td>
				</tr>
			</c:if>
			<c:if test="${not empty coList}">
			<c:forEach var="dto" items="${coList}">
				<tr>
					<td>${dto.carStart} ~ ${dto.carEnd}</td>
					<td>${dto.company}</td>
					<td>${dto.part}</td>
					<td>
						${dto.memo}
						<input type="hidden" name="mcNum" value="${dto.mcNum}" />
					</td>
				</tr>
			</c:forEach>
			</c:if>
			</table>
			
			<table id="project" class="table" style="height: 60px;">
				<caption>▶ 프로젝트 (프로젝트는 이력서에서 수정이 불가능 합니다.)</caption>
				<tr>
					<td>기간</td>
					<td>프로젝트명</td>
					<td>상태</td>
				</tr>
			<c:if test="${empty proList}">
				<tr>
					<td colspan="3">해당사항없음</td>
				</tr>
			</c:if>
			<c:if test="${not empty proList}">
			<c:forEach var="dto" items="${proList}">
				<tr>
					<td>${dto.expStartYear}.${dto.expStartMonth} ~ ${dto.expEndYear}.${dto.expEndMonth}</td>
					<td>${dto.prName}</td>
					<td>
						${dto.expState}
						<input type="hidden" name="prNum" value="${dto.prNum}" />
					</td>
				</tr>
			</c:forEach>
			</c:if>
			</table>
		</div><br><hr><br><br>
		
		<div class= "footer-bar">
			<div style="text-align: right;">
				* 자격증, 어학점수, 수상 경력 및 자기소개는 다음 단계에서 쓸 수 있습니다. 
				<button type="button" class="btn btn-info" onclick="check();">저장하고 추가 정보 입력</button>
				<button type="reset" class="btn btn-default">다시 입력</button>
				<button type="button" class="btn btn-default" onclick="javascript:history.back();">취소</button>
			</div>
		</div>
	</form>
</div>