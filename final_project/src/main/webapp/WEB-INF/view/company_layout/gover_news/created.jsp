<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>
<script>
	function check(){
		var f=document.goverNewsForm;
		
		var str=f.gnSubject.value;
		if(!str){
			alert("제목을 입력하세요. ");
            f.gnSubject.focus();
            return false;
		}
		
		str=f.gnContent.value;
		if(!str || str=="<p>&nbsp;</p>") {
        	alert("내용을 입력하세요. ");
            f.gnContent.focus();
            return false;
        }

		var mode="${mode}";
		if(mode=="created"){
			f.action="<%=cp%>/company/gover_news/created";
		}else if(mode=="update"){
    		f.action="<%=cp%>/company/gover_news/update";
		}
    	
    	f.submit();
	}
</script>

<div class="goverNews-created-body">
	<div class="body-header">
		<h3 align="left">
			| 공무원 소식 
			<small style="font-family: 'Gudea', sans-serif; letter-spacing: 3px; margin-left: 5px; font-size: 16px; font-weight: bold; color: #6d6b6b;">
				Government Employee News
			</small>
		</h3>
		<hr>
	</div>
	
	<form name="goverNewsForm" method="post">
		<div>
				<table class="table">
					<tbody>
						<tr>
							<td class="input_info">제목</td>
							<td colspan="3">
								<input type="text" name="gnSubject" value="${dto.gnSubject}" required="required">
							</td>
						</tr>

						<tr>
							<td class="input_info">내용</td>
							<td colspan="3">
								<textarea id="content" name="gnContent" rows="15" style="width : 800px;">${dto.gnContent}</textarea>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4" style="text-align: center;">
								<button type="button" class="btn btn-default" onclick="check();">확인 </button>
								<button type="reset" class="btn btn-default">다시입력</button>
								<c:if test="${mode=='update'}">
									<input type="hidden" name="gnNum" value="${dto.gnNum}">
									<input type="hidden" name="page" value="${page}">
								</c:if>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
	</form>
</div>