<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>

<div class="page_body .container-fluid ">
	<div class="page_head">
		<h3>| 이력서 열람</h3><hr>
	</div>
	<div id="resume_div">
		<table class="table">
			<caption>▶ 인적사항</caption>
			<tr>
				<td rowspan="4">
					<img src="" width="110px" height="140px" />
				</td>
				<td>이름</td>
				<td>${introList.rName}</td>
				<td>영어</td>
				<td>${introList.engName}</td>
			</tr>
			<tr>
				<td>생년월인</td>
				<td>${introList.mBirth}</td>
				<td>폰번호</td>
				<td>${introList.phone}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${introList.email}</td>
				<td>병역</td>
				<td>${introList.army}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td colspan="3">${introList.addr}<br>${introList.addr2}</td>
			</tr>
		</table>
		
		<table id="academy" class="table" style="height: 60px;">
			<caption>▶ 학력</caption>
			<tr>
				<td>학교명</td>
				<td>재학기간</td>
				<td>비고</td>
			</tr>
		<c:if test="${empty abilityList}">
			<tr>
				<td colspan="3">해당사항없음</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${abilityList}">
			<tr>
				<td>${dto.acName}</td>
				<td>${dto.termtime}</td>
				<td>${dto.memo}</td>
			</tr>
		</c:forEach>
		</table>
		
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
		
		<table id="career" class="table" style="height: 60px;">
			<caption>▶ 경력</caption>
			<tr>
				<td>회사명</td>
				<td>직무</td>
				<td>직급</td>
			</tr>
		<c:if test="${empty careerList}">
			<tr>
				<td colspan="3">해당사항없음</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${careerList}">
			<tr>
				<td>${dto.company}</td>
				<td>${dto.part}</td>
				<td>${dto.memo}</td>
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
		
		<table id="project" class="table" style="height: 60px;">
			<caption>▶ 프로젝트</caption>
			<tr>
				<td>자격증명</td>
				<td>취득일</td>
				<td>발급기관</td>
			</tr>
		<c:if test="${empty projectList}">
			<tr>
				<td colspan="3">해당사항없음</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${projectList}">
			<tr>
				<td>${dto.prName}</td>
				<td>${dto.expStart} ~ ${dto.expEnd}</td>
				<td>${dto.memo}</td>
			</tr>
		</c:forEach>
		</table>
		
		<table id="intro" class="table">
			<caption>▶ 자기소개</caption>
			<tr height="100px">
				<td>${introList.intro1}</td>
			</tr>
		</table>
		
		<table class="table">
			<caption>▶ 지원동기</caption>
			<tr height="100px">
				<td>${introList.intro2}</td>
			</tr>
		</table>
		
		<table class="table">
			<caption>▶ 성장배경</caption>
			<tr height="100px">
				<td>${introList.intro3}</td>
			</tr>
		</table>
		
		<table class="table">
			<caption>▶ ???</caption>
			<tr>
				<td>${introList.intro4}</td>
			</tr>
		</table>
		<hr>
	</div>
	<div class= "footer-bar">
		<div style="text-align: right;">
			<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/talent/main?page=${page}'">목록</button>
		</div>
	</div>
</div>