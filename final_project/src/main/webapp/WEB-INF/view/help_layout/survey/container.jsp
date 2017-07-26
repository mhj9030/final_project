<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>
<div class="created_form" style="overflow-x:hidden; overflow-y:auto;">
	<div>
		<h3>|  설문조사<small style="font-family: 'Gudea', sans-serif; letter-spacing: 3px; margin-left: 5px; font-size: 16px; font-weight: bold; color: #6d6b6b;">Survey</small></h3>
	</div>

	<div >
		<form name="boardForm" method="post" onsubmit="return submitContents(this);" enctype="multipart/form-data">
			<div>
				<table class="table table-hover">
					<tbody>
						
					
						<tr>
							<td colspan="3">
								1. 본 설문은 대학생을 대상으로 진행됩니다. 귀하는 대학생이신가요?<br>
								
							<input type="radio" name="category" value="그렇다" ${dto.category=="그렇다"?"checked='checked'":""}  style="width:30px;" required="required">그렇다
								<input type="radio" name="category" value="아니다" ${dto.category=="아니다"?"checked='checked'":""}  style="width:30px;"  required="required">아니다
							</td>
						</tr>
						
						<tr>
							<td colspan="3">
								2. 귀하는 최근 열대야를 체감하고 있나요?<br>
								<input type="radio" name="category" value="그렇다" ${dto.category=="그렇다"?"checked='checked'":""}  style="width:30px;" required="required">그렇다
								<input type="radio" name="category" value="아니다" ${dto.category=="아니다"?"checked='checked'":""}  style="width:30px;" required="required">아니다
								
							</td>
						</tr>
						<tr>
							<td colspan="3">
								3. 열대야로 인한 수면시간 변화가 있나요?<br>
								<input type="radio" name="category" value="그렇다" ${dto.category=="그렇다"?"checked='checked'":""}  style="width:30px;" required="required">수면시간이 늘었다
								<input type="radio" name="category" value="아니다" ${dto.category=="아니다"?"checked='checked'":""}  style="width:30px;" required="required">수면시간이 줄었다
								<input type="radio" name="category" value="아니다" ${dto.category=="아니다"?"checked='checked'":""}  style="width:30px;" required="required">큰 변화없다
								
							</td>
						</tr>
						<tr>
							<td colspan="3">
								4. 귀하는 더위로 인한 수면 부족으로 나타나는 열대야증후군을 겪고 있나요?<br>
								<input type="radio" name="category" value="그렇다" ${dto.category=="그렇다"?"checked='checked'":""}  style="width:30px;" required="required">그렇다
								<input type="radio" name="category" value="아니다" ${dto.category=="아니다"?"checked='checked'":""}  style="width:30px;" required="required">아니다
								
							</td>
						</tr>
						<tr>
							<td colspan="3">
								4-1. 다음 중 어떤 증상이 있나요?<br>
								<input type="checkbox" name="category" value="그렇다" ${dto.category=="그렇다"?"checked='checked'":""}  style="width:30px;" required="required">집중력 저하<br>
								<input type="checkbox" name="category" value="아니다" ${dto.category=="아니다"?"checked='checked'":""}  style="width:30px;" required="required">두통, 어지러움<br>
								<input type="checkbox" name="category" value="아니다" ${dto.category=="아니다"?"checked='checked'":""}  style="width:30px;" required="required">무기력증<br>
								<input type="checkbox" name="category" value="아니다" ${dto.category=="아니다"?"checked='checked'":""}  style="width:30px;" required="required">불면증 등 수면장애<br>
								<input type="checkbox" name="category" value="아니다" ${dto.category=="아니다"?"checked='checked'":""}  style="width:30px;" required="required">기타<input type="text">
								
							</td>
						</tr>
						<tr>
							<td colspan="3">
								4-2. 열대야증후군이 아르바이트 근무에 지장을 주나요?<br>
								<input type="radio" name="category" value="그렇다" ${dto.category=="그렇다"?"checked='checked'":""}  style="width:30px;" required="required">그렇다
								<input type="radio" name="category" value="아니다" ${dto.category=="아니다"?"checked='checked'":""}  style="width:30px;" required="required">아니다
								
							</td>
						</tr>
						<tr>
							<td colspan="3">
								4-3. 아르바이트를 하며 어떤 영향을 받았나요?<br>
								<input type="radio" name="category" value="그렇다" ${dto.category=="그렇다"?"checked='checked'":""}  style="width:30px;" required="required">진상손님 갑질에 평소보다 스트레스를 많이 받았다<br>
								<input type="radio" name="category" value="아니다" ${dto.category=="아니다"?"checked='checked'":""}  style="width:30px;" required="required">신경이 날카로워져 동료와 마찰이 증가했다<br>
								<input type="radio" name="category" value="아니다" ${dto.category=="아니다"?"checked='checked'":""}  style="width:30px;" required="required">메뉴 혼동 등 집중력이 떨어져 실수가 늘었다<br>
								<input type="radio" name="category" value="아니다" ${dto.category=="아니다"?"checked='checked'":""}  style="width:30px;" required="required">무기력하고 쉽게 피로감을 느꼈다<br>
								<input type="checkbox" name="category" value="아니다" ${dto.category=="아니다"?"checked='checked'":""}  style="width:30px;" required="required">기타<input type="text">
								
							</td>
						</tr>
						<tr>
							<td colspan="3">
								귀하의 성별을 선택해 주세요<br>
								<input type="radio" name="category" value="그렇다" ${dto.category=="그렇다"?"checked='checked'":""}  style="width:30px;" required="required">남자
								<input type="radio" name="category" value="아니다" ${dto.category=="아니다"?"checked='checked'":""}  style="width:30px;" required="required">여자
								
							</td>
						</tr>
						<tr>
							<td colspan="3">
								귀하의 연령대를 선택해 주세요<br>
								<input type="radio" name="category" value="그렇다" ${dto.category=="그렇다"?"checked='checked'":""}  style="width:30px;" required="required">20대<br>
								<input type="radio" name="category" value="아니다" ${dto.category=="아니다"?"checked='checked'":""}  style="width:30px;" required="required">30대<br>
								<input type="radio" name="category" value="아니다" ${dto.category=="아니다"?"checked='checked'":""}  style="width:30px;" required="required">40대 이상
								
							</td>
						</tr>
						
						
				
					</tbody>
					
					
					<tfoot>
						<tr>
							<td colspan="4" style="text-align: center;">
								<button>제출 </button>
								
								<button type="button" onclick="javascript: history.back();">취소</button>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</form>
	</div>
</div>