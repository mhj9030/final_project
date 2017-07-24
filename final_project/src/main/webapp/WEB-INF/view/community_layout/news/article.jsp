<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
	function deleteNews() {
		  var jbnum = "${dto.jbnum}";
		  var page = "${page}";
		  var type = "${type}";
		  var query = "jbnum="+jbnum+"&page="+page+"&type="+type;
		  var url = "<%=cp%>/community/news/delete?" + query;
	
		  if(confirm("위 자료를 삭제 하시 겠습니까 ? "))
		  	location.href=url;
	}

	function updateNews() {
		  var jbnum = "${dto.jbnum}";
		  var page = "${page}";
		  var type = "${type}";
		  var query = "jbnum="+jbnum+"&page="+page;
		  var url = "<%=cp%>/community/news/update?" + query;
		  location.href=url;
		
	
	}
</script>

<script type="text/javascript">
function login() {
	location.href="<%=cp%>/submain";
}

$(function(){
	countLikeNews(${dto.jbnum});
});



// 게시물 공감 개수
function countLikeNews(jbnum) {
	var url="<%=cp%>/community/news/countLikeNews";
	var query="jbnum="+jbnum;
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			var count=data.countLikeNews;
			
			$("#countLikeNews").html(count);
		}
		,beforeSend : function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	  	,error : function(jqXHR) {
	        if (jqXHR.status == 401) {
	        	 console.log(jqXHR);
	        } else if (jqXHR.status == 403) {
	            login();
	        } else {
	        	 console.log(jqXHR.responseText);
	        }
	    }
	});
}


function sendLikeNews(jbnum) {
	var uid="${sessionScope.member.userId}";
	if(! uid) {
		login();
		return;
	}

	msg="게시물에 공감하십니까 ?";
	if(! confirm(msg))
		return;
	
	var query="jbnum="+jbnum;
	$.ajax({
		type:"post"
		,url:"<%=cp%>/community/news/insertLikeNews"
		,data:query
		,dataType:"json"
		,success:function(data) {
			var state=data.state;
			if(state=="true") {
				countLikeNews(jbnum);
			} else if(state=="false") {
				alert("좋아요는 한번만 가능합니다. !!!");
			}
		}
		,beforeSend : function(jqXHR) {
	          jqXHR.setRequestHeader("AJAX", true);
	      }
	    ,error : function(jqXHR) {
	          if (jqXHR.status == 401) {
	          	 console.log(jqXHR);
	          } else if (jqXHR.status == 403) {
	              login();
	          } else {
	          	 console.log(jqXHR.responseText);
	          }
	      }
	 });
}
</script>

<script type="text/javascript">
	$(function(){
		listPage(1);		
	});

	function listPage(page){
		var url = "<%=cp%>/community/news/listReply";
		var jbnum = "${dto.jbnum}";
		
		// text/html
		$.post(url, {jbnum:jbnum, pageNo:page}, function(data){
			$("#listReply").html(data);
		});
	}
	
	function sendReply(){
		var jbnum = "${dto.jbnum}";
		var content = $("#replyContent").val().trim();
		if(! content){
			$("#replyContent").focus();
			return;
		}
		
		var query = "jbnum="+jbnum;
		query += "&content="+content;
		query += "&answer=0";
		
		$.ajax({
			type:"post"
			,url:"<%=cp%>/community/news/insertReply"
			,data:query
			,dataType:"json"
			,success:function(data) {
				var state = data.state;
				$("#replyContent").val("");
				
				if(state=="true"){
					listPage(1);
					
				}else if(state=="false"){
					alert("댓글을 추가하지 못했습니다.");
				}else if(state=="loginFail"){
					location.href="<%=cp%>/submain";
				}
			}
			,beforeSend: function(e){
				e.setRequestHeader("AJXA", true);
			}
			,error:function(e){
				if(e.status==403){
					location.href = "<%=cp%>/submain";
					return;
				}
				console.log(e.responseText);	
			}
		});
	}
	
	function listAnswer(answer) {
		var listReplyAnswerId="#listReplyAnswer"+answer;
		
		var url="<%=cp%>/community/news/listReplyAnswer";
		var query="answer="+answer+"&tmp="+new Date().getTime();
		$.ajax({
			type:"get"
			,url:url
			,data:query
			,success:function(data) {
				$(listReplyAnswerId).html(data);
			}
			,beforeSend : function(jqXHR) {
		        jqXHR.setRequestHeader("AJAX", true);
		    }
		  	,error : function(jqXHR) {
		        if (jqXHR.status == 401) {
		        	 console.log(jqXHR);
		        } else if (jqXHR.status == 403) {
		             login();
		        } else {
		        	 console.log(jqXHR.responseText);
		        }
		    }
		});
	}
	
	function deleteReply(replyNum, page) {
		var uid="${sessionScope.member.userId}";
		if(! uid) {
			login();
			return;
		}
		
		if(confirm("게시물을 삭제하시겠습니까 ? ")) {	
			var url="<%=cp%>/community/news/deleteReply";
			var query="replyNum="+replyNum+"&mode=reply";
			$.ajax({
				type:"post"
				,url:url
				,data:query
				,dataType:"json"
				,success:function(data) {
					// var state=data.state;
					listPage(page);
				}
				,beforeSend : function(jqXHR) {
			        jqXHR.setRequestHeader("AJAX", true);
			    }
			  	,error : function(jqXHR) {
			        if (jqXHR.status == 401) {
			        	 console.log(jqXHR);
			        } else if (jqXHR.status == 403) {
			             login();
			        } else {
			        	 console.log(jqXHR.responseText);
			        }
			    }
			});
		}
	}

	//답글 버튼(댓글별 답글 등록폼 및 답글리스트)
	$(function(){
		// $(".btnReplyAnswerLayout").click(function(){
		$("body").on("click", ".btnReplyAnswerLayout", function(){
			var $trReplyAnswer = $(this).parent().parent().next();
			var $answerList = $trReplyAnswer.children().children().eq(0);
			
			var isVisible = $trReplyAnswer.is(':visible');
			var replyNum = $(this).attr("data-replyNum");
				
			if(isVisible) {
				$trReplyAnswer.hide();
			} else {
				$trReplyAnswer.show();
	            
				// 답글 리스트
				listAnswer(replyNum);
				// 답글 개수
				countAnswer(replyNum);
			}
		});
	});

	// 댓글별 답글 등록
	function sendReplyAnswer(replyNum) {
		var uid="${sessionScope.member.userId}";
		if(! uid) {
			login();
			return;
		}
		
		var jbnum="${dto.jbnum}";
		var content=$("#answerContent"+replyNum).val().trim();
		if(! content) {
			$("#answerContent"+replyNum).focus();
			return;
		}
		
		var query="jbnum="+jbnum;
		query+="&content="+encodeURIComponent(content);
		query+="&answer="+replyNum;	
		
		$.ajax({
			type:"post"
			,url:"<%=cp%>/community/news/insertReply"
			,data:query
			,dataType:"json"
			,success:function(data) {
				$("#answerContent"+replyNum).val("");
				
				var state=data.state;
				if(state=="true") {
					listAnswer(replyNum);
					countAnswer(replyNum);
				} else if(state=="false") {
					alert("답글을 등록하지 못했습니다. !!!");
				}
			}
			,beforeSend : function(jqXHR) {
		        jqXHR.setRequestHeader("AJAX", true);
		    }
		  	,error : function(jqXHR) {
		        if (jqXHR.status == 401) {
		        	 console.log(jqXHR);
		        } else if (jqXHR.status == 403) {
		             login();
		        } else {
		        	 console.log(jqXHR.responseText);
		        }
		    }
		});
	}

	// 댓글별 답글 개수
	function countAnswer(answer) {
		var url="<%=cp%>/community/news/replyCountAnswer";
		var query="answer="+answer;
		$.ajax({
			type:"post"
			,url:url
			,data:query
			,dataType:"json"
			,success:function(data) {
				var count=data.count;
				var answerCountId="#answerCount"+answer;
				
				$(answerCountId).html(count);
			}
			,beforeSend : function(jqXHR) {
		        jqXHR.setRequestHeader("AJAX", true);
		    }
		  	,error : function(jqXHR) {
		        if (jqXHR.status == 401) {
		        	 console.log(jqXHR);
		        } else if (jqXHR.status == 403) {
		             login();
		        } else {
		        	 console.log(jqXHR.responseText);
		        }
		    }
		});
	}

	// 댓글별 답글 삭제
	function deleteReplyAnswer(replyNum, answer) {
		var uid="${sessionScope.member.userId}";
		if(! uid) {
			login();
			return;
		}
		
		if(confirm("게시물을 삭제하시겠습니까 ? ")) {	
			var url="<%=cp%>/community/news/deleteReply";
			var query="replyNum="+replyNum+"&mode=answer";
			$.ajax({
				type:"post"
				,url:url
				,data:query
				,dataType:"json"
				,success:function(data) {
					// var state=data.state;
				    listAnswer(answer);
				    countAnswer(answer);
				}
				,beforeSend : function(jqXHR) {
			        jqXHR.setRequestHeader("AJAX", true);
			    }
			  	,error : function(jqXHR) {
			        if (jqXHR.status == 401) {
			        	 console.log(jqXHR);
			        } else if (jqXHR.status == 403) {
			             login();
			        } else {
			        	 console.log(jqXHR.responseText);
			        }
			    }
			});
		}
	}
	
</script>


<div class="community_article_wrap">
	<h3>
		취업뉴스 <small style="font-family: 'Gudea', sans-serif; letter-spacing: 3px; margin-left: 5px; font-size: 16px; font-weight: bold; color: #6d6b6b;">Member's Comments</small>
	</h3>
	
	<table class="table">
		<tr>
			<td colspan="2" class="article_subject">${dto.subject}</td>
		</tr>
		<tr>
			<td class="article_create">이름 : ${dto.mName}</td>
			<td class="article_hitCount">${dto.created} | 조회 ${dto.hitCount}</td>
		</tr>
		<tr>
			<td colspan="2" class="article_content">${dto.content}</td>
		</tr>
		<tr>
			<td class="article_pre"> ◀이전글 
				<c:if test="${not empty preReadDto}">
			    	<a href="<%=cp%>/community/news/article?${query}&jbnum=${preReadDto.jbnum}">${preReadDto.subject}</a>
			    </c:if>
			</td>
			<td class="article_next">
				<c:if test="${not empty nextReadDto}">
			    	<a href="<%=cp%>/community/news/article?${query}&jbnum=${nextReadDto.jbnum}">${nextReadDto.subject}</a>
			    </c:if>
				 다음글▶  
			</td>
		</tr>
		<tr>
			<td colspan="2"><span onclick="sendLikeNews(${dto.jbnum});" class="btn btn-block btn-danger"><span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;<span id="countLikeNews">${countLikeNews}</span></span></td>
		</tr>
	</table>
	
	<div class="article_btns">
		<c:if test="${sessionScope.member.userName=='관리자'}">
			<button class="btn btn-warning" onclick="updateNews();">수정</button>
			<button class="btn btn-warning" onclick="deleteNews();">삭제</button>
		</c:if>
		<button class="btn btn-default" onclick="javascript:location.href='<%=cp%>/community/news?${query}'">목록</button>
		<button class="btn btn-default" onclick="javascript:location.href='<%=cp%>/community/news'">최신목록</button>
	</div>
	
	<div class="article_reply_wrap">
		<textarea id='replyContent' rows="4" cols="90"></textarea>
		<button class="btn btn-default" onclick='sendReply();'>댓글달기</button>
	</div>
	
	<div id="listReply" class="community_listReply"></div>
</div>