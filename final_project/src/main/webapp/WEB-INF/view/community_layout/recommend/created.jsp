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
        var mode = "${mode}";
        
        var str = f.subject.value;
        if(!str) {
            alert("제목을 입력하세요. ");
            f.subject.focus();
            return false;
        }

        
        var str = f.content.value;
        if(!str || str=="<p>&nbsp;</p>") {
        	 alert("내용을 입력하세요. ");
            f.content.focus();
            return false;
        }
        
        var str = $("input[type=radio][name=grade]:checked").val();
        if(!str) {
       	 alert("평점을 입력하세요. ");
           f.content.focus();
           return false;
       }
		
        
        if(mode=='created'){
	       	f.action = "<%=cp%>/community/recommend/created";
        }else if(mode=='update'){
        	f.action = "<%=cp%>/community/recommend/update";
        }    	
       	
       	return true;
  }
 
</script>

<div class="created_form">
	
	
	<div>
		<h3>
		기업 추천 게시판  | 후기쓰기
		</h3>
	</div>

	<div>
		<form name="boardForm" method="post" onsubmit="return submitContents(this);" enctype="multipart/form-data" autocomplete="on">
		<c:if test="${mode=='created'}">
			<input type="hidden" name="page" value="${page}">
			<input type="hidden" name="cNum" value="${dto.cNum}">
		</c:if>
			<div>
				<table class="table">
					<tbody>
						<tr>
							<td class="input_info">기업명</td>
							<td colspan="3">
								<c:if test="${mode=='created'}">
									${dto.cName}
								</c:if>
								<c:if test="${mode=='update'}">
									${vo.cName}
								</c:if>
							</td>
						</tr>
						
						<tr>
							<td class="input_info">작성자명</td>
							<td colspan="3">
								<input type="text" name="name" value="${sessionScope.member.userName}" required="required">
							</td>
						</tr>

						<tr>
							<td class="input_info">제목</td>
							<td colspan="3">
								<input type="text" name="subject" value="${vo.subject}" required="required">
							</td>
						</tr>
						<tr>
							<td class="input_info">나의 점수?</td>
							<td colspan="3">
								<input style="width: 15px;" type="radio" name="grade" value="5"> <span style="font-weight: 900;">5점</span>
								<input style="width: 15px;" type="radio" name="grade" value="4"> <span style="font-weight: 800;">4점</span>
								<input style="width: 15px;" type="radio" name="grade" value="3"> <span style="font-weight: 700;">3점</span>
								<input style="width: 15px;" type="radio" name="grade" value="2"> <span style="font-weight: 600;">2점</span>
								<input style="width: 15px;" type="radio" name="grade" value="1"> <span style="font-weight: 500;">1점</span>
							</td>
						</tr>
						
						<tr>
							<td class="input_info">내용</td>
							<td colspan="3">
								<textarea id="content" name="content" rows="15" style="width : 800px;" required="required">
									${vo.content}
								</textarea>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4" style="text-align: center;">
								<button class="btn btn-default" type="submit">${mode=='update'?'수정완료':'등록하기'}</button>
								<button class="btn btn-default" type="reset">다시 입력</button>
								<button class="btn btn-default" type="button" onclick="javascript:location.href='<%=cp%>/community/recommend?${query}'">${mode=='update'?'수정취소':'등록취소'}</button> 
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
			<c:if test="${mode=='update'}">
				<input type="hidden" name="cNum" value="${vo.cNum}">
				<input type="hidden" name="gcNum" value="${vo.gcNum}">
			</c:if>
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
			var mode = "${mode}";				
			if(mode=="created"){
				//예제 코드
				setDefaultFont();
				oEditors.getById["content"].exec("PASTE_HTML",
						["아래의 질문에 대한 답변을 기입해주세요!!!<br><br>Q1.기업의 장점?<br>-<br><br>Q2.기업의 단점?<br>-<br><br>Q3.이 기업을 추천하시나요?[기업에 대한 생각을 써주세요^^*]<br>-<br><br>"]);
				
			}
			
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
