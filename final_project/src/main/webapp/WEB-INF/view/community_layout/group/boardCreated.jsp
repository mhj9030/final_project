<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
if(typeof String.prototype.trim !== 'function') {
    String.prototype.trim = function() {
        var TRIM_PATTERN = /(^\s*)|(\s*$)/g;
        return this.replace(TRIM_PATTERN, "");
    };
  }

  function check() {
        var f = document.boardForm;
 		
    	var str = f.subject.value;
        if(!str) {
            alert("제목을 입력하세요. ");
            f.subject.focus();
            return false;
        }
       
        var mode="${mode}";
        if(mode=="created")
    		f.action="<%=cp%>/community/group/boardCreated";
    	else if(mode=="update"){
    		f.action="<%=cp%>/community/group/boardUpdate";
    	}
    		
       	return true;
  }
</script>

<div class="created_form">
	<div>
		<h3>
		그룹<small style="font-family: 'Gudea', sans-serif; letter-spacing: 3px; margin-left: 5px; font-size: 16px; font-weight: bold; color: #6d6b6b;">Writing</small>
		</h3>
	</div>

	<div>
		<form name="boardForm" method="post" onsubmit="return submitContents(this);" enctype="multipart/form-data">
			<div>
				<table class="table">
					<tbody>
						<tr>
							<td class="input_info">작성자명</td>
							<td colspan="3">
								<input type="text" name="mName" value="${sessionScope.member.userName}" readonly="readonly">
							</td>
						</tr>

						<tr>
							<td class="input_info">제목</td>
							<td colspan="3">
								<input type="text" name="subject" value="${dto.subject}" required="required">
							</td>
						</tr>
						
						<tr>
							<td class="input_info">파일첨부</td>
							<td colspan="3">
								<input type="file" name="upload">
							</td>
							
						</tr>
						<c:if test="${mode=='update'}" >
							<tr height="40" style="border-bottom: 1px solid #cccccc;">
						    	<td width="100" style="text-align: center;">기존파일</td>
						        <td style="padding-left:10px;">
						        	${dto.originalFilename}
						            <c:if test="${not empty dto.originalFilename}">
						            	| <a href="">삭제</a>
						            </c:if>
						        </td>
						    </tr>
						</c:if>
				
						<tr>
							<td class="input_info">내용</td>
							<td colspan="3">
								<textarea id="content" name="content" rows="15" style="width : 800px;">${dto.content}</textarea>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4" style="text-align: center;">
								<button type="submit" class="btn btn-default">${mode=='update'?'수정완료':'등록하기'}</button>
								<button type="reset" class="btn btn-default">다시입력</button>
								<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/community/group/article?groupNum=${groupNum}';">${mode=='update'?'수정취소':'등록취소'}</button> 
								 <c:if test="${mode=='update'}">
						         	 <input type="hidden" name="gbNum" value="${dto.gbNum}">
						         	 <input type="hidden" name="saveFilename" value="${dto.saveFilename}">
						         	 <input type="hidden" name="originalFilename" value="${dto.originalFilename}">
						        	<input type="hidden" name="page" value="${page}">
						        </c:if>
						        <input type="hidden" name="groupNum" value="${groupNum}"> 
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</form>
	</div>
</div>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content",
	sSkinURI: "<%=cp%>/resources/se/SmartEditor2Skin.html",
		htParams : {
			bUseToolbar : true,
			fOnBeforeUnload : function() {
				//alert("아싸!");
			}
		}, //boolean
		fOnAppLoad : function() {
			//예제 코드
			//oEditors.getById["content"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator : "createSEditor2"
	});

	function pasteHTML() {
		var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
		oEditors.getById["content"].exec("PASTE_HTML", [ sHTML ]);
	}

	function showHTML() {
		var sHTML = oEditors.getById["content"].getIR();
		alert(sHTML);
	}

	function submitContents(elClickedObj) {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.

		// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.

		try {
			// elClickedObj.form.submit();
			return check();
		} catch (e) {
		}
	}

	function setDefaultFont() {
		var sDefaultFont = '돋움';
		var nFontSize = 24;
		oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
	}
</script>
