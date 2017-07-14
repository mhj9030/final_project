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
     height:50px;
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
 
	<div class="page-header">
  		<h1 align="left">| 이벤트 <small></small></h1>
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
        
        <div style="clear: both;">
        		<div style="float: left; width: 20%; min-width: 85px;">
        		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/photo/list';">새로고침</button>
        		</div>
        		<div class="list-search">
		    			<form name="searchForm" action="" method="post">
			    			<select name="searchKey" class="list-searchList" style="float: left;">
						    	<option value="subject">제목</option> 
						        <option value="userName">작성자</option>
						        <option value="content">내용</option>
						        <option value="created">등록일</option>
				           	</select>
				            
				            <div class="input-group" style="float: left;">
		      					<input type="text" class="form-control" placeholder="">
							    <span class="input-group-btn">
							    	<button class="btn btn-default" type="button">검색</button>
							    </span>
							</div>
		    			</form>
		    		</div>
        		<div style="float: left; width: 20%; min-width: 85px; text-align: right;">
        		    <button class="btn btn-default" type="button" onclick="javascript:location.href='<%=cp%>/help_layout/event/created';">글올리기</button>
        		</div>
        </div>
        
    </div>
    
</div>