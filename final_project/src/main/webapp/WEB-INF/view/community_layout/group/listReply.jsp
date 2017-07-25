<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
%>
<c:if test="${replyCount!=0}">
<table class="table community_reply_table">
<tr>
    <td colspan="2">
       <div class="community_reply_info">
           <div>
           		<span>댓글 ${dataCount}개</span> <span>[댓글 목록, ${pageNo}/${total_page} 페이지]</span>
           </div>
       </div>
    </td>
</tr>

<c:forEach var="vo" items="${list}">
    <tr class="community_reply_top_tr">
       <td class="community_reply_name">
           <span ><b>${vo.mName}</b></span>
        </td>
       <td class="community_reply_created">
           	<span>${vo.created}</span> |
		   	<c:if test="${sessionScope.member.userId==vo.mId || sessionScope.member.userId=='admin'}">		   
          		<a onclick='deleteReply("${vo.replyNum}", "${pageNo}");'>삭제</a>
		   	</c:if>		   
			<c:if test="${sessionScope.member.userId!=vo.mId && sessionScope.member.userId!='admin'}">		   
			          <a href='#'>신고</a>
			</c:if>	
		</td>
	</tr>
	<tr>
		<td colspan="2" class="community_reply_content">
			<div>${vo.content}</div>
		</td>
	</tr>
			    
	<tr>
    	<td colspan="2">
        	<button type='button' class='btn btn-default btnReplyAnswerLayout' data-replyNum='${vo.replyNum}'>답글
        		<span id="answerCount${vo.replyNum}">${vo.answerCount}</span>
        	</button>
        </td>
    </tr>

    <tr class="replyAnswer">
        <td colspan="2">
            <div id='listReplyAnswer${vo.replyNum}' ></div>
            <div style="padding: 10px 10px; height: 110px;">
              <div style='float: left; width:5%;'>└</div>
			  <div style='float: left; width:80%;'>
                   <textarea id='answerContent${vo.replyNum}' cols='73' rows='5'></textarea>
              </div>
              <div style='float: left; width:15%;'>
              	<button type='button' class='btn btn-default answerbtn' onclick='sendReplyAnswer(${vo.replyNum});'>답글 등록</button>
              </div>	
            </div>
        </td>
    </tr>
    
</c:forEach>

     <tr height="40">
         <td colspan='2' style="text-align: center;">
              ${paging}
         </td>
     </tr>
</table>
</c:if>