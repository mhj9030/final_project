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

        str = f.content.value;
        if(!str || str=="<p>&nbsp;</p>") {
        	 alert("내용을 입력하세요. ");
            f.content.focus();
            return false;
        }

    	
    	
        var mode="${mode}";
        if(mode=="created")
    		f.action="<%=cp%>/community/free/created";
    	else if(mode=="update")
    		f.action="<%=cp%>/community/free/update";
    	else if(mode=="follow")
    		f.action="<%=cp%>/community/free/follow";		

       	
       	return true;
  }
</script>

<div class="created_form">
	<div>
		<h3>
		자유게시판  |  글올리기
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
								<input type="text" name="name" value="${sessionScope.member.userName}" readonly="readonly">
							</td>
						</tr>

						<tr>
							<td class="input_info">제목</td>
							<td colspan="3">
								<input type="text" name="subject" value="${dto.subject}" required="required">
							</td>
						</tr>

						<tr>
							<td class="input_info">내용</td>
							<td colspan="3">
								<textarea id="content" name="content" rows="15" style="width : 800px;">${dto.content}</textarea>
							</td>
						</tr>

						<tr>
							<td class="input_info">첨부파일</td>
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
						            	| <a href="<%=cp%>/community/free/deleteFile?frnum=${dto.frnum}&page=${page}">삭제</a>
						            </c:if>
						        </td>
						    </tr>
						</c:if>	
				
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4" style="text-align: center;">
								<button type="submit" class="btn btn-default">${mode=='update'?'수정완료':'등록하기'}</button>
								<button type="reset" class="btn btn-default">다시입력</button>
								<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/community/free';">${mode=='update'?'수정취소':'등록취소'}</button> 
								<c:if test="${mode=='follow'}">
                                      <input type="hidden" name="page" value="${page}">
                                      <input type="hidden" name="groupNum" value="${dto.groupNum}">
                                      <input type="hidden" name="orderNo" value="${dto.orderNo}">
                                      <input type="hidden" name="depth" value="${dto.depth}">
                                      <input type="hidden" name="parent" value="${dto.frnum}">
                                  </c:if>
                                  <c:if test="${mode=='update'}">
                                      <input type="hidden" name="page" value="${page}">
                                      <input type="hidden" name="frnum" value="${dto.frnum}">
                                  </c:if>
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
