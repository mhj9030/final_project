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
  
  function countGroup(){
	  var mId="${sessionScope.member.userId}";
  	  var query="mId="+mId;
  	  $.ajax({
  			type:"post"
  			,url: "<%=cp%>/community/group/createdLimit"
  			,data:query
  			,dataType:"json"
  			,success:function(data) {
  				var state=data.state;
  				if(state=="true") {
  					check();
  				} else if(state=="false") {
  					alert("3개를 초과하여 그룹에 소속하거나 만들 수 없습니다.");
  					return;
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

  function check() {
	  	var f = document.boardForm;
        var mode = "${mode}";
        
        var str = f.groupName.value;
        if(!str) {
            alert("그룹명을 입력하세요. ");
            f.groupName.focus();
            return;
        }
        
        if(mode=='created'){
	       	f.action = "<%=cp%>/community/group/created";
        }else if(mode=='update'){
        	f.action = "<%=cp%>/community/group/update";
        }  
        
        
        f.submit();
        
  }
  
  function nameCheck(){
		var groupName = $("#groupName").val();
		var query = "groupName="+groupName;
		
		$.ajax({
            type :"POST"
            ,url : "<%=cp%>/community/group/groupNameCheck"
            ,data: query
            ,success : function(data) {
                var state = data.state;
                
            	if (state=="true") {
                    $("#checkMsg").html("사용 가능한 그룹이름입니다.");
                    $("#checkMsg").css("color","blue");
                } else {
                    $("#checkMsg").html("사용 불가능한 그룹이름입니다.");
                    $("#checkMsg").css("color","red");
                }
            }
        });
  }
  
  
 
</script>
	
<script type="text/javascript">
attachFile = {
        idx:0,
        add:function(){ // 파일필드 추가
            var o = this;
            var idx = o.idx;
            var div = document.createElement('div');
            
            div.style.marginTop = '3px';
            div.id = 'groupTag' + o.idx;
 
            var file = document.all ? document.createElement('<input name="text">') : document.createElement('input');
            file.type = 'text';
            file.name = 'groupTag';
            file.id = 'groupTag' + o.idx;
 
            var btn = document.createElement('input');
            btn.type = 'button';
            btn.value = '삭제';
           	btn.className = 'btn btn-xs btn-success';
           	btn.width = '100px';
            btn.onclick = function(){o.del(idx)}
            btn.style.marginLeft = '4px';
 
            div.appendChild(file);
            div.appendChild(btn);
            document.getElementById('attachDiv').appendChild(div);
 
            o.idx++;
        },
        del:function(idx){ // 파일필드 삭제
            if(document.getElementById('groupTag' + idx).value != '' && !confirm('삭제 하시겠습니까?')){
                return;
            }
            document.getElementById('attachDiv').removeChild(document.getElementById('groupTag' + idx));
        }
    }
</script>

<div class="group_list_wrap">
	<h3>| 그룹 <small style="font-family: 'Gudea', sans-serif; letter-spacing: 3px; margin-left: 5px; font-size: 16px; font-weight: bold; color: #6d6b6b;">Group</small></h3>
	<hr>
	<p>
		하나의 목적을 가지는 다양한 그룹을 만들어 보세요. 친목을 나누고 좋은 정보를 공유할 수 있습니다.
	</p>

	<ul class="nav nav-tabs">
		<li role="presentation"><a style="cursor: pointer;"
			href="javascript:location.href='<%=cp%>/community/group'">그룹리스트</a></li>
		<li role="presentation"><a
			style="cursor: pointer;"
			href="javascript:location.href='<%=cp%>/community/group/mylist'">나의
				그룹</a></li>
		<li role="presentation" class="active"><a style="cursor: pointer;"
			href="javascript:location.href='<%=cp%>/community/group/created'">그룹
				만들기</a></li>
	</ul>
	<div>
		<form name="boardForm" method="post" onsubmit="check();" enctype="multipart/form-data">
			<div>
				<table class="table groupCreated">
					<tbody>
						<tr>
							<td class="input_info">그룹명</td>
							<td colspan="3">
								<input type="text" id="groupName" name="groupName" value="" onkeyup="nameCheck();">
								<small id="checkMsg"></small>
							</td>
						</tr>
						
						<tr>
							<td class="input_info">그룹장</td>
							<td colspan="3">
								<input type="text" id="mName" name="mName" value="${sessionScope.member.userName}">
								<input type="hidden" id="mId" value="${sessionScope.member.userId}">
							</td>
						</tr>

						<tr>
							<td class="input_info" style="vertical-align: inherit;">그룹태그</td>
							<td colspan="3">
								<div id="attachDiv">
									<input type="text" name="groupTag">
									<a style="cursor: pointer; margin-left: 400px;" class="btn btn-xs btn-success" onclick="attachFile.add()">추가</a>
								</div>
							</td>
						</tr>

						<tr>
							<td class="input_info">그룹대표사진</td>
							<td colspan="3">
								<input type="file" name="upload" accept=".gif, .jpg, .png, .jpeg">
							</td>
						</tr>
						
						<tr>
							<td class="input_info">그룹소개글</td>
							<td>
								<textarea name="groupInfo" rows="5" cols="60"></textarea>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4" style="text-align: center;">
								<button class="btn btn-default" type="button" onclick="countGroup();">등록하기</button>
								<button class="btn btn-default" type="reset">다시 입력</button>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</form>
	</div>
</div>
