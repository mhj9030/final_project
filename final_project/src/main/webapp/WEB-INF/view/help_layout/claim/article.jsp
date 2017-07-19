<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>

<script>
$(function(){
	  listPage(1);
});

function listPage(page) {
	  var url="<%=cp%>/claim/listReply";
	  var claimNum=${param.num};
	  
	  // text/html
	  $.post(url, {claimNum:claimNum, pageNo:page}, function(data){
		  $("#listReply").html(data);
	  });
}


function sendReply() {
	  var claimNum="${dto.claimNum}";
	  var content=$("#replyContent").val().trim();
	  if(! content) {
		  $("#replyContent").focus();
		  return;
	  }
	  //var query=$("form[name=replyForm]").serialize();
	  var query="claimNum="+claimNum;
	  query+="&replyAnswer="+encodeURIComponent(content);
	  
	  $.ajax({
		  type:"post"
		  ,url:"<%=cp%>/claim/createdReply"
		  ,data:query
		  ,dataType:"json"
		  ,success:function(data) {
			  var state=data.state;
			  $("#replyContent").val("");
			  
			  if(state=="true") {
				  listPage(1);
			  } else if(state=="false") {
				  alert("댓글을 추가하지 못했습니다.");
			  }
		  }
		  ,beforeSend : function(e){
			  e.setRequestHeader("AJAX",true);
		  }
		  ,error:function(e) {
			  if(e.status==403){
				  location.href="<%=cp%>/member/login";
			  }
			  console.log(e.responseText);
		  }
	  });
	  
}



</script>

<!-- 중앙정렬용 center-block  -->
<div class="wrapper center-block" style="max-width: 980px;">

<div id="title"class="text-center">
<h1>${dto.subject}</h1>
</div>
<div class="text-right">
<h5>${dto.created} ${dto.hitCount}</h5>
</div>
<hr>

<!-- 글내용  content -->
<div id="content">
<pre style="white-space: pre-wrap; background:white;">
 ${dto.content}
</pre>
</div>
<hr>


<div class= "footer-bar">
			<div style="text-align: right;">
				<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/help_layout/claim/list'">목록</button>
			<c:if test="${sessionScope.member.userId==dto.mId || sessionScope.member.userId=='admin@a.com'}">
				<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/claim/update?num=${dto.claimNum}&page=${page}'">수정</button>
				<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/claim/delete?num=${dto.claimNum}'">삭제</button>
			</c:if>
			</div>
	</div>


	<div>
	<c:if test="${sessionScope.member.userId=='admin@a.com'}">
            <table style='width: 100%; margin: 15px auto 0px; border-spacing: 0px;'>
            <tr height='30'> 
	            <td align='left'>
	            	<span style='font-weight: bold;' >댓글쓰기</span><span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span>
	            </td>
            </tr>
            <tr>
               <td style='padding:5px 5px 0px;'>
                    <textarea id='replyContent' class='boxTA' style='width:99%; height: 70px;'></textarea>
                </td>
            </tr>
            <tr>
               <td align='right'>
                    <button type='button' class='btn btn-default' onclick='sendReply();'>댓글 등록</button>
                </td>
            </tr>
            </table>
       </c:if>
            
            <div id="listReply"></div>
 	 </div>




</div>