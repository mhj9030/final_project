<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">
.imgLayout{
	width: 200px;
	height: 230px;
	padding: 5px 5px 5px;
	margin: 5px;
	border: 1px solid #D5D5D5;
	float: left;
}

.subject {
     width:190px;
     height:90px;
     line-height:25px;
     margin:5px auto 0px;
     border-top: 1px solid #D5D5D5;
     display: inline-block;
     white-space:nowrap;
     overflow:hidden;
     text-overflow:ellipsis;
     cursor: pointer;
     text-align: center;
}
</style>

<script type="text/javascript">
function searchList() {
		var f=document.searchForm;
		f.action="<%=cp%>/photo/list";
		f.submit();
}

function article(num) {
	var url="${articleUrl}&num="+num;
	location.href=url;
}
</script>


<div class="list-body" align="center">
 
	<div class="notice_list_wrap" style="text-align: left ">
	<h3>| 이벤트<small style="font-family: 'Gudea', sans-serif; letter-spacing: 3px; margin-left: 5px; font-size: 16px; font-weight: bold; color: #6d6b6b;">Event</small></h3>
	<hr>
	<p>
	
	</p>    
</div>
    
    <div style="max-width:660px; margin: 0px auto;">
<c:if test="${dataCount!=0 }">    
        <div style="clear: both; height: 30px; line-height: 30px;">
            <div style="float: left;">${dataCount}개(${page}/${total_page} 페이지)</div>
            <div style="float: right;">&nbsp;</div>
        </div>
        
        <div style="clear: both;">
    <c:forEach var="dto" items="${list}" varStatus="status">
                 <c:if test="${status.index==0}">
                       <c:out value="<div style='clear: both; max-width:660px; margin: 0px auto;'>" escapeXml="false"/>
                 </c:if>
                 <c:if test="${status.index!=0 && status.index%3==0}">
                        <c:out value="</div><div style='clear: both; max-width:660px; margin: 0px auto;'>" escapeXml="false"/>
                 </c:if>
			      <div class="imgLayout">
	                     <img src="<%=cp%>/uploads/event/${dto.imageFilename}" style="width: 190px; height: 120px;" border="0">
			             <span class="subject" onclick="javascript:article('${dto.evtNum}');" >
			                   ${dto.subject}
			             </span>
			       </div>
    </c:forEach>

    <c:set var="n" value="${list.size()}"/>
    <c:if test="${n>0&&n%3!=0}">
		        <c:forEach var="i" begin="${n%3+1}" end="3" step="1">
			             <div class="imgLayout">&nbsp;</div>
		        </c:forEach>
    </c:if>
	
    <c:if test="${n!=0 }">
		       <c:out value="</div>" escapeXml="false"/>
    </c:if>
        </div>
</c:if>

        <div class="paging" style="text-align: center; min-height: 50px; line-height: 50px;">
            <c:if test="${dataCount==0 }">
                  등록된 게시물이 없습니다.
            </c:if>
            <c:if test="${dataCount!=0 }">
                ${paging}
            </c:if>
        </div>        
        
        <table class="list-comp">
        		
		    	<c:if test="${sessionScope.member.userId=='admin'}">
        		<td align="right" width="100">
        		    <button class="btn btn-default" type="button" onclick="javascript:location.href='<%=cp%>/help_layout/event/created';">글올리기</button>
        		    </td>
        		</c:if>
        		
        </table>
        
    </div>
    
</div>