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

<div class="myInquiry-list-body">
	<h3>
		 이력서 열람<small style="font-family: 'Gudea', sans-serif; letter-spacing: 3px; margin-left: 5px; font-size: 16px; font-weight: bold; color: #6d6b6b;">Read Resume</small>
	</h3><hr>
	
	<div id="resume_div">
		<table class="table table-bordered">
			<caption>
				▶ 인적사항
				<input type="hidden" name="rNum" value="${rDto.rNum}" /> 
				( <c:if test="${rDto.resumeType==1}">공개</c:if><c:if test="${rDto.resumeType==0}">비공개</c:if> 이력서 )
			</caption>
			<tr>
				<td rowspan="4" width="120px">
					<div id="imgdiv" style="border: 2px solid #cccccc; width: 114px; height: 144px;">
						<c:if test="${empty rDto.rPhoto}">
							<img src="<%=cp%>/resources/image/profile_img.jpg" style="width: 110px; height: 140px;" />
						</c:if>
						<c:if test="${not empty rDto.rPhoto}">
							<img src="<%=cp%>/uploads/resume/${rDto.rPhoto}"  style="width: 110px; height: 140px;"/>
						</c:if>
					</div>
				</td>
				<td width="80px">이름</td>
				<td width="230px">${rDto.rName}</td>
				<td width="80px">영어</td>
				<td colspan="3">${rDto.engName}</td>
			</tr>
			<tr>
				<td>생년월인</td>
				<td>${rDto.mbirth} ( ${rDto.age}세)</td>
				<td>폰번호</td>
				<td colspan="3">${rDto.phone}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${rDto.eMail}</td>
				<td>성별</td>
				<td width="80px">${rDto.mgender}</td>
				<td width="90px">병역</td>
				<td>${rDto.army}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td colspan="5">
					${rDto.addr}<br>
					${rDto.addr2}
				</td>
			</tr>
		</table>
		
		<table class="table table-bordered">
			<tr>
				<td>지원분야</td>
				<td>${rDto.apply}</td>
				<td>희망연봉</td>
				<td>${rDto.pay}</td>
			</tr>
		</table>
		
		<div style="text-align: right;">
			<c:if test="${sessionScope.member.userId==rDto.mId}">
				<button type="button" class="btn btn-default" onclick="updateForm(1)">기본사항 수정</button>
			</c:if>
		</div>
		
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
		
		<div style="text-align: right;">
			<c:if test="${sessionScope.member.userId==rDto.mId}">
				<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/profile/pwd'">계정설정</button>
			</c:if>
		</div>
		
		<table id="license" class="table" style="height: 60px;">
			<caption>▶ 자격증</caption>
			<tr>
				<td>자격증명</td>
				<td>취득일</td>
				<td>발급기관</td>
			</tr>
		<c:if test="${empty licenseList}">
			<tr>
				<td colspan="3">해당사항없음</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${licenseList}">
			<tr>
				<td>${dto.license}</td>
				<td>${dto.expStart}</td>
				<td>${dto.liGC}</td>
			</tr>
		</c:forEach>
		</table>
		
		<table id="language" class="table" style="height: 60px;">
			<caption>▶ 외국어 점수</caption>
			<tr>
				<td>외국어시험명</td>
				<td>외국어 점수</td>
			</tr>
		<c:if test="${empty languageList}">
			<tr>
				<td colspan="2">해당사항없음</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${languageList}">
			<tr>
				<td>${dto.language}</td>
				<td>${dto.laScore}</td>
			</tr>
		</c:forEach>
		</table>
		
		<table id="award" class="table" style="height: 60px;">
			<caption>▶ 수상</caption>
			<tr>
				<td>개최</td>
				<td>수상명</td>
				<td>수상일</td>
			</tr>
		<c:if test="${empty awardList}">
			<tr>
				<td colspan="3">해당사항없음</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${awardList}">
			<tr>
				<td>${dto.awAgency}</td>
				<td>${dto.awSector}</td>
				<td>${dto.awDate}</td>
			</tr>
		</c:forEach>
		</table>
		
		<div style="text-align: right;">
			<c:if test="${sessionScope.member.userId==rDto.mId}">
				<button type="button" class="btn btn-default" onclick="updateForm(2)">추가 사항 수정</button>
			</c:if>
		</div>
		
		<table id="intro" class="table">
			<caption>▶ 자기소개</caption>
			<tr height="100px">
				<td>${iDto.intro1}</td>
			</tr>
		</table>
		
		<table class="table">
			<caption>▶ 지원동기</caption>
			<tr height="100px">
				<td>${iDto.intro2}</td>
			</tr>
		</table>
		
		<table class="table">
			<caption>▶ 성장배경</caption>
			<tr height="100px">
				<td>${iDto.intro3}</td>
			</tr>
		</table>
		
		<table class="table">
			<caption>▶ ???</caption>
			<tr>
				<td>${iDto.intro4}</td>
			</tr>
		</table>
		
		<c:if test="${sessionScope.member.userId==rDto.mId}">
			<div style="text-align: right;">
				<button type="button" class="btn btn-default" onclick="updateForm(3)">자기소개 수정</button>
			</div>
		</c:if>
		
		<hr>
	</div>.
	<c:if test="${sessionScope.member.userId==rDto.mId}">
		<div class= "footer-bar">
			<div style="text-align: right;">
				<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/member/applications/list'">목록</button>
			</div>
		</div>
	</c:if>
	<c:if test="${sessionScope.member.userId!=rDto.mId}">
		<div class= "footer-bar">
			<div style="text-align: right;">
				<button type="button" class="btn btn-default" onclick="history.back();">목록</button>
			</div>
		</div>
	</c:if>
</div>

<script>
function updateForm(num) {
	location.href = "<%=cp%>/member/applications/update" + num + "?rNum=${rDto.rNum}";
}
</script>