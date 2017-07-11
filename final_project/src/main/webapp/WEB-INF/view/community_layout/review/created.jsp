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
        
        if(!str || str=="<p>&nbsp;</p>") {
        	 alert("내용을 입력하세요. ");
            f.content.focus();
            return false;
        }

    	
       	f.action = "<%=cp%>/community/reivew/created";
       	
       	return true;
  }
</script>

<div class="created_form">
	
	
	<div>
		<h3>
		면접후기  | 글올리기
		</h3>
	</div>

	<div>
		<form name="boardForm" method="post" onsubmit="return submitContents(this);" enctype="multipart/form-data" autocomplete="on">
			<div>
				<table class="table">
					<tbody>
						<tr>
							<td class="input_info">작성자명</td>
							<td colspan="3">
								<input type="text" name="name" value="" required="required">
							</td>
						</tr>

						<tr>
							<td class="input_info">제목</td>
							<td colspan="3">
								<input type="text" name="subject" value="" required="required">
							</td>
						</tr>
						
						<tr>
							<td class="input_info">기업명</td>
							<td colspan="3">
								<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">
									면접 본 기업 찾기
								</button>
							</td>
						</tr>

						<tr>
							<td class="input_info">내용</td>
							<td colspan="3">
								<textarea id="content" name="content" rows="15" style="width : 800px;">
								</textarea>
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
								<button type="submit">확인 </button>
								<button type="button" onclick="">취소</button> 
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</form>
	</div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">기업찾기</h4>
      </div>
      <div class="modal-body">
        <input type="text"><button onclick="searchCompany();">1</button>
        <div id="company-list"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">선택</button>
      </div>
    </div>
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
			oEditors.getById["content"].exec("PASTE_HTML",
					["꼭 다 기입하지 않으셔도 되지만 성심껏 기입해주세요!!!<br><br>Q1.기업명?<br>-<br><br>Q2.지원시기는?<br>-<br><br>Q3.어떤 준비를 했나요?<br>-<br><br>Q4.가장 기억의 남는 질문은?<br>-<br><br>Q5.합격했다면 그 비결은?<br>-<br><br>Q6.앞으로의 계획?<br>-<br><br>"]);
			setDefaultFont();
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
		var nFontSize = 11;
		oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
	}
</script>
