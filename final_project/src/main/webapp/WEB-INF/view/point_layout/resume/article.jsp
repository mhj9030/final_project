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
		<h3>| 인재검색</h3><hr>
	</div>
	<div id="resume_div">
		<table class="table">
			<caption>인적사항</caption>
			<tr>
				<td rowspan="4">사진</td>
				<td>이름</td>
				<td>홍길동${dto.rName}</td>
				<td>영어</td>
				<td>...${dto.engName}</td>
			</tr>
			<tr>
				<td>생년월인</td>
				<td>1990. 10. 10${dto.brith}</td>
				<td>폰번호</td>
				<td>010 - 1234 - 5678${dto.phone}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>.${dto.email}</td>
				<td>병역</td>
				<td>.${dto.army}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td colspan="3">.${dto.addr}<br>.${dto.addr2}</td>
			</tr>
		</table>
		
		<table id="license" class="table" style="height: 60px;">
			<caption>자격증</caption>
			<tr>
				<td>자격증명</td>
				<td>취득일</td>
				<td>발급기관</td>
			</tr>
			<tr>
				<td>정보처리기사</td>
				<td>2017.05.08</td>
				<td>한국산업인력공단</td>
			</tr>
		</table>
		
		<table id="license" class="table" style="height: 60px;">
			<caption>외국어 점수</caption>
			<tr>
				<td>외국어시험명</td>
				<td>외국어 점수</td>
			</tr>
			<tr>
				<td>토익</td>
				<td>700</td>
			</tr>
		</table>
		
		<table id="license" class="table" style="height: 60px;">
			<caption>경력</caption>
			<tr>
				<td>회사명</td>
				<td>직무</td>
				<td>직급</td>
			</tr>
			<tr>
				<td>kh정보교육원</td>
				<td>상담</td>
				<td>팀장</td>
			</tr>
		</table>
		
		<table id="license" class="table" style="height: 60px;">
			<caption>수상</caption>
			<tr>
				<td>대회명</td>
				<td>수상명</td>
			</tr>
			<tr>
				<td>~대회</td>
				<td>대상</td>
			</tr>
		</table>
		
		<table id="intro" class="table">
			<caption>자기소개</caption>
			<tr height="100px">
				<td>.${dto.intro1}</td>
			</tr>
		</table>
		
		<table class="table">
			<caption>지원동기</caption>
			<tr height="100px">
				<td>.${dto.intro2}</td>
			</tr>
		</table>
		
		<table class="table">
			<caption>성장배경</caption>
			<tr height="100px">
				<td>.${dto.intro3}</td>
			</tr>
		</table>
		
		<table class="table">
			<caption>???</caption>
			<tr>
				<td>.${dto.intro4}</td>
			</tr>
		</table>
		<hr>
	</div>
	<div class= "footer-bar">
		<div style="text-align: right;">
			<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/talent/main'">목록</button>
		</div>
	</div>
</div>