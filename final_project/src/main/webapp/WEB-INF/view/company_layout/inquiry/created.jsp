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
		if(mode=="created"){
			f.cNum.value="${cNum}";
			f.page.value="${page}";
			f.action="<%=cp%>/company/inquiry/createdSubmit";
		}else if(mode=="update"){
			f.cqNum.value="${dto.cqNum}";
			f.page.value="${page}";
    		f.action="<%=cp%>/company/inquiry/update";
		}
    	else if(mode=="answer"){
    		f.cqNum.value="${dto.cqNum}";
    		f.cqQuestioner.value="${dto.cqQuestioner}";
    		f.page.value="${page}";
    		f.action="<%=cp%>/company/inquiry/answerSubmit";
    	}
    	
    	f.submit();
	}
</script>

<div class="inquiry-created-body">
	<div class="body-header">
		<h3>
			<c:if test="${mode=='created'}">| 문의하기</c:if>
			<c:if test="${mode=='answer'}">| 답변하기</c:if>
			<c:if test="${mode=='update'}">| 문의수정</c:if>
		</h3>
	</div>
	
	<form name="inquiryForm" method="post">
		<div>
				<table class="table">
					<tbody>
						<c:if test="${mode=='created'}">
							<tr>
								<td class="input_info">기업명</td>
								<td colspan="3">
									<input type="text" name="cName" value="${cName}" readonly="readonly">
								</td>
							</tr>
						</c:if>
						<tr>
							<td class="input_info">제목</td>
							<td colspan="3">
								<input type="text" name="cqSubject" value="${dto.cqSubject}" required="required">
							</td>
						</tr>

						<tr>
							<td class="input_info">내용</td>
							<td colspan="3">
								<c:if test="${mode=='created'}">
									<textarea id="content" name="cqContent" rows="15" style="width : 800px;">${dto.cqContent}</textarea>
								</c:if>
								<c:if test="${mode=='answer'}">
									<textarea id="content" name="cqContent" rows="15" style="width : 800px;">${dto.cqContent} RE : </textarea>
								</c:if>
								<c:if test="${mode=='update'}">
									<textarea id="content" name="cqContent" rows="15" style="width : 800px;">${dto.cqContent}</textarea>
								</c:if>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4" style="text-align: center;">
								<button type="button" class="btn btn-default" onclick="check();">확인 </button>
								<button type="reset" class="btn btn-default">다시입력</button>
								<c:if test="${mode=='created'}">
									<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/company/search/article?page=${page}&cNum=${cNum}';">취소</button> 
									<input type="hidden" name="cNum">
									<input type="hidden" name="page">
								</c:if>
								<c:if test="${mode=='answer'}">
									<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/company/inquiry'">취소</button> 
									<input type="hidden" name="cqNum">
									<input type="hidden" name="page">
									<input type="hidden" name="cqQuestioner">
								</c:if>
								<c:if test="${mode=='update'}">
									<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/company/inquiry'">취소</button> 
									<input type="hidden" name="cqNum">
									<input type="hidden" name="page">
								</c:if>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
	</form>
</div>