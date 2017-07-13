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
		var f=document.inquiryForm;
		
		var str=f.cqSubject.value;
		if(!str){
			alert("제목을 입력하세요. ");
            f.cqSubject.focus();
            return false;
		}
		
		str=f.cqContent.value;
		if(!str || str=="<p>&nbsp;</p>") {
        	alert("내용을 입력하세요. ");
            f.cqContent.focus();
            return false;
        }
		
		var mode="${mode}";
		if(mode=="created")
    		f.action="<%=cp%>/company/inquiry/created";
    	else if(mode=="update")
    		f.action="<%=cp%>/company/inquiry/update";
    	
    	f.submit();
	}
</script>

<div class="created_form">
	<div>
		<h3>
			| 문의하기
		</h3>
	</div>
	
	<form name="inquiryForm" method="post">
		<div>
				<table class="table">
					<tbody>
						<tr>
							<td class="input_info">기업명</td>
							<td colspan="3">
								<input type="text" name="name" value="" readonly="readonly">
							</td>
						</tr>

						<tr>
							<td class="input_info">제목</td>
							<td colspan="3">
								<input type="text" name="cqSubject" value="${dto.subject}" required="required">
							</td>
						</tr>

						<tr>
							<td class="input_info">내용</td>
							<td colspan="3">
								<textarea id="content" name="cqContent" rows="15" style="width : 800px;">${dto.content}</textarea>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4" style="text-align: center;">
								<button type="button" class="btn btn-default" onclick="check();">확인 </button>
								<button type="reset" class="btn btn-default">다시입력</button>
								<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/company/search/article?page=1&cNum=28';">취소</button> 
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
	</form>
</div>