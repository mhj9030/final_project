<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
function check(){
	 if( $("#che_16").is(':checked') ){
	        $("input[name=chk]").prop("checked", true);
	       
	      }else{
	        $("input[name=chk]").prop("checked", false);
	      }
	 
	 selectDelRow();
}


function selectDelRow() {
	var chk = document.getElementsByName("chk"); // 체크박스객체를 담는다
	var len = chk.length;    //체크박스의 전체 개수
	var cnt = 0;      //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
	
	for(var i=0; i<len; i++){
		if(chk[i].checked == true){
			cnt++;
		}
	} 
	
	if(cnt==0) {
		$("#list-body1").html("");
		return;
	}
	
	listPage(1);
	
}

function listPage(page){
		var url = "<%=cp%>/community/tip/listTypes";
		var query = $("form[name=input_form]").serialize();
		query+="&pageNo="+page;
			
		$.ajax({
			type:"post"
			,url:url
			,data:query
			,success:function(data) {
				$("#list-body1").html(data);
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

function articleTip(jtnum, page){
	var url = "<%=cp%>/community/tip/article";
	
	var query = $("form[name=input_form]").serialize();
	query+="&jtnum="+jtnum+"&pageNo="+page;
	
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,success:function(data) {
			$("#list-body1").html(data);
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

function login() {
	location.href="<%=cp%>/submain";
}

</script>


<div class="tip_list_wrap">
		<h3>| 취업꿀팁</h3>
		<p>
			각 분야별 취업관련 정보를 공유하고 소통하는 게시판입니다.
		</p>
		<div class="row rowlist">
			<p class="row_header">분야 설정</p>
			<span class="row_header_tip">Tip. 체크된 분야의 관련 글만 보여집니다.</span><br>
			<form name="input_form">
	    		<input type="checkbox" id="che_1" name="chk" value="서비스업" onchange="selectDelRow()"><label for="che_1" class="green">서비스업</label>
	    		<input type="checkbox" id="che_2" name="chk" value="제조/화학" onchange="selectDelRow()"><label for="che_2" class="green">제조/화학</label>
	    		<input type="checkbox" id="che_3" name="chk" value="의료/복지" onchange="selectDelRow()"><label for="che_3" class="green">의료/복지</label>
	    		<input type="checkbox" id="che_4" name="chk" value="판매/유통" onchange="selectDelRow()"><label for="che_4" class="green">판매/유통</label><br>
	    		<input type="checkbox" id="che_5" name="chk" value="교육업" onchange="selectDelRow()"><label for="che_5" class="green">교육업</label>
	    		<input type="checkbox" id="che_6" name="chk" value="건설업" onchange="selectDelRow()"><label for="che_6" class="green">건설업</label>
	    		<input type="checkbox" id="che_7" name="chk" value="IT/통신" onchange="selectDelRow()"><label for="che_7" class="green">IT/통신</label>
	    		<input type="checkbox" id="che_8" name="chk" value="미디어/디자인" onchange="selectDelRow()"><label for="che_8" class="green">미디어/디자인</label><br>
	    		<input type="checkbox" id="che_9" name="chk" value="은행/금융업" onchange="selectDelRow()"><label for="che_9" class="green">은행/금융업</label>
	    		<input type="checkbox" id="che_10" name="chk" value="기관/협회" onchange="selectDelRow()"><label for="che_10" class="green">기관/협회</label>
	    		<input type="checkbox" id="che_11" name="chk" value="직장인" onchange="selectDelRow()"><label for="che_11" class="green">직장인</label>
	    		<input type="checkbox" id="che_12" name="chk" value="공무원" onchange="selectDelRow()"><label for="che_12" class="green">공무원</label><br>
	    		<input type="checkbox" id="che_13" name="chk" value="취준생" onchange="selectDelRow()"><label for="che_13" class="green">취준생</label>
	    		<input type="checkbox" id="che_14" name="chk" value="알바생" onchange="selectDelRow()"><label for="che_14" class="green">알바생</label>
	    		<input type="checkbox" id="che_15" name="chk" value="기타" onchange="selectDelRow()"><label for="che_15" class="green">기타</label>
	    		<input type="checkbox" id="che_16" name="chkall" value="" onclick="check();"><label for="che_16" class="green">전체</label>
    		</form>
		</div>
		
		<div class="list-body1" id="list-body1" align="center"></div>
</div>