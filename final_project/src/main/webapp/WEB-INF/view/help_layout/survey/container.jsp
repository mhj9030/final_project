<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>
<div class="created_form">
	<div>
		<h3>
		 |  설문조사
		</h3>
	</div>

	<div>
		<form name="boardForm" method="post" onsubmit="return submitContents(this);" enctype="multipart/form-data">
			<div>
				<table class="table table-hover">
					<tbody>
						
					
						<tr>
							<td colspan="3">
								*본 설문은 대학생을 대상으로 진행됩니다. 귀하는 대학생이신가요?<br>
								
							<input type="radio" name="category" value="그렇다" ${dto.category=="그렇다"?"checked='checked'":""}  style="width:30px;" required="required">그렇다
								<input type="radio" name="category" value="아니다" ${dto.category=="아니다"?"checked='checked'":""}  style="width:30px;"  required="required">아니다
							</td>
						</tr>
						
						<tr>
							<td colspan="3">
								1. 귀하는 2017년 2학기에 등록하실 예정입니까?<br>
								<input type="radio" name="category" value="그렇다" ${dto.category=="그렇다"?"checked='checked'":""}  style="width:30px;" required="required">그렇다
								<input type="radio" name="category" value="아니다" ${dto.category=="아니다"?"checked='checked'":""}  style="width:30px;" required="required">아니다
								
							</td>
						</tr>
						
				
					</tbody>
					
					
					<tfoot>
						<tr>
							<td colspan="4" style="text-align: center;">
								<button>확인 </button>
								
								<button type="button" onclick="javascript: history.back();">취소</button>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</form>
	</div>
</div>