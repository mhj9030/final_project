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
        f.action = "<%=cp%>/help_layout/claim/${mode}";
          
          return true;
  }
</script>

<div class="created_form">
	<div>
		<h3>
		 |  문의하기
		</h3>
	</div>

	<div>
		<form name="boardForm" method="post" onsubmit="return submitContents(this);" enctype="multipart/form-data">
			<div>
				<table class="table table-hover">
					<tbody>
						
					
						<tr>
							<td class="input_info">작성자명</td>
							<td colspan="3">
								${sessionScope.member.mName}
							</td>
						</tr>
						
						<tr>
							<td class="input_info">분류</td>
							<td colspan="3">
								<input type="radio" name="category" value="이력서문의" ${dto.category=="이력서문의"?"checked='checked'":""}  style="width:30px;">이력서 문의
								<input type="radio" name="category" value="입사지원문의" ${dto.category=="입사지원문의"?"checked='checked'":""}  style="width:30px;">입사지원문의
								<input type="radio" name="category" value="검색문의" ${dto.category=="검색문의"?"checked='checked'":""}  style="width:30px;">검색문의
								<input type="radio" name="category" value="신고(불량기업)" ${dto.category=="신고(불량기업)"?"checked='checked'":""}  style="width:30px;">신고(불량기업)<br>
								<input type="radio" name="category" value="신고(서비스오류)" ${dto.category=="신고(서비스오류)"?"checked='checked'":""}  style="width:30px;">신고(서비스오류)
								<input type="radio" name="category" value="공고문의" ${dto.category=="공고문의"?"checked='checked'":""}  style="width:30px;">공고문의
								<input type="radio" name="category" value="제안사항" ${dto.category=="제안사항"?"checked='checked'":""}  style="width:30px;">제안사항
								<input type="radio" name="category" value="수정요청" ${dto.category=="수정요청"?"checked='checked'":""}  style="width:30px;">수정요청
								<input type="radio" name="category" value="기타" ${dto.category=="기타"?"checked='checked'":""}  style="width:30px;">기타
							</td>
						</tr>
						
						
						
						
						
						
						<tr>
							<td class="input_info">제목</td>
							<td colspan="3">
								<input type="text" name="subject" value="" required="required"> 
							</td>
						</tr>

						<tr>
							<td class="input_info">내용</td>
							<td colspan="3">
								<textarea id="content" name="content" rows="15" style="width : 800px;"></textarea>
							</td>
						</tr>

						<tr>
							<td class="input_info">첨부</td>
							<td colspan="3">
								<input type="file" name="upload">
							</td>
						</tr>

				
					</tbody>
					
					
					<tfoot>
						<tr>
							<td colspan="4" style="text-align: center;">
								<button>확인 </button>
								
								<button type="button" onclick="">취소</button> 
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
			elClickedObj.form.submit();
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
