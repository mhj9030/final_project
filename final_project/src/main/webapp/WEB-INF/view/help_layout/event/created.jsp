<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
   String cp = request.getContextPath();
%>



<script type="text/javascript">
  function check() {
        var f = document.photoForm;

    	var str = f.subject.value;
        if(!str) {
            f.subject.focus();
            return false;
        }

    	str = f.content.value;
        if(!str) {
            f.content.focus();
            return false;
        }

        var mode="${mode}";
    	if(mode=="created"||mode=="update" && f.upload.value!="") {
    		if(! /(\.gif|\.jpg|\.png|\.jpeg)$/i.test(f.upload.value)) {
    			alert('이미지 파일만 가능합니다. !!!');
    			f.upload.focus();
    			return false;
    		}
    	}
        
    	if(mode=="created")
    		f.action="<%=cp%>/photo/created";
    	else if(mode=="update")
    		f.action="<%=cp%>/photo/update";

        return true;
 }
 
  function imageViewer(img) {
		var preViewer = $("#imageViewModal .modal-body");
		var s="<img src='"+img+"' width='570' height='450'>";
		preViewer.html(s);
	  
		$('#imageViewModal').modal('show');
  }
  
</script>

<div class="created_form">
	<div>
		<h3>
		 |  글올리기
		</h3>
	</div>
    
    
    <div>
        <form name="boardForm" method="post" onsubmit="return check();" enctype="multipart/form-data">
            <div>
                <table class="table table-hover">
                    <tbody>
                        <tr>
                            <td class="input_info">작성자명</td>
                            <td colspan="3">
                               ${sessionScope.member.userName}
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
                            <textarea name="content" class="form-control" rows="7" required="required">${dto.content}</textarea>
                            </td>
                        </tr>
                        
                        
                        <tr>
                            <td class="input_info">이미지</td>
                            <td colspan="3">
                                <input type="file" name="upload">
                            </td>
                        </tr>
                        
					<c:if test="${mode=='update'}">
                        <tr>
                            <td>등록이미지</td>
                            <td colspan="3">
                                <img src="<%=cp%>/uploads/event/${dto.imageFilename}"
				                 width="30" height="30" border="0"
				                 onclick="imageViewer('<%=cp%>/uploads/photo/${dto.imageFilename}');"
				                 style="cursor: pointer;">
                            </td>
                        </tr>
					</c:if>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="4" style="text-align: center; padding-top: 15px;">
                                  <button type="submit" > 확인</button>
                                  <button type="button" onclick="javascript: history.back();">취소</button>
                                  
                                  <c:if test="${mode=='update'}">
                                      <input type="hidden" name="num" value="${dto.evtNum}">
                                      <input type="hidden" name="userId" value="${dto.mId}">
                                      <input type="hidden" name="imageFilename" value="${dto.imageFilename}">
                                      <input type="hidden" name="page" value="${page}">
                                  </c:if>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </form>
    </div>
</div>

<div class="modal fade" id="imageViewModal" tabindex="-1" role="dialog" aria-labelledby="imageViewModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="imageViewModalLabel" style="font-family: 나눔고딕, 맑은 고딕, sans-serif; font-weight: bold;">등록 이미지</h4>
      </div>
      <div class="modal-body"></div>
    </div>
  </div>
</div>
