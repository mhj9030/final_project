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
		<h3>| 이력서 작성</h3><hr>
	</div>
	<div id="resume_div">
		<table class="table table-bordered" style="align-text: center;">
			<caption>▶ 인적사항</caption>
			<tr>
				<td rowspan="4" width="120px">
					<img src="" width="110px" height="140px" /><br><br>
					<button type="button" class="btn btn-xs">기본</button>
					<button type="button" class="btn btn-xs">올리기</button>
					<!-- <input type="file" class="btn btn-xs" value="올리기" /> -->
				</td>
				<td width="80px">이름</td>
				<td width="230px"><input type="text" class="form-control input-sm" value="${sessionScope.member.userName}" /></td>
				<td width="80px">영어</td>
				<td colspan="3"><input type="text" class="form-control input-sm" /></td>
			</tr>
			<tr>
				<td>생년월인</td>
				<td>${mList.mbirth} ( ${mList.age}세)</td>
				<td>폰번호</td>
				<td colspan="3"><input type="tel" class="form-control input-sm" placeholder="Enter phone" /></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" class="form-control input-sm" value="${mList.mid}" /></td>
				<td>성별</td>
				<td width="80px">${mList.mgender}</td>
				<td width="90px">병역</td>
				<td><input type="text" class="form-control input-sm" /></td>
			</tr>
			<tr>
				<td>주소</td>
				<td colspan="5">
					<input type="text" class="form-control input-sm" placeholder="기본주소" /><br>
					<input type="text" class="form-control input-sm" placeholder="상세주소" />
				</td>
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
				<td>회사명</td>
				<td>직무</td>
				<td>직급</td>
			</tr>
		<c:if test="${empty coList}">
			<tr>
				<td colspan="3">해당사항없음</td>
			</tr>
		</c:if>
		<c:if test="${not empty coList}">
		<c:forEach var="dto" items="${coList}">
			<tr>
				<td>${dto.school}</td>
				<td>${dto.major}</td>
				<td>${dto.termState}</td>
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
				<td>${dto.expState}</td>
			</tr>
		</c:forEach>
		</c:if>
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
				<td colspan="3">
				<button type="button" class="btn btn-default" aria-label="Left Align">
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
					추가하기
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
				<td colspan="2"><button type="button" class="btn btn-default" aria-label="Left Align">
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>추가하기
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
					<button type="button" class="btn btn-default" aria-label="Left Align">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>추가하기
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
			<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/point/creates'">등록</button>
			<button type="button" class="btn btn-default" onclick="javascript:history.back();">취소</button>
		</div>
	</div>
</div>