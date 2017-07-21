<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>
<!-- Bootstrap CSS -->
<!-- <link href="/final_project/resources/css/bootstrap.min.css" rel="stylesheet"> -->
<style type="text/css">
h3{
   margin-top: 40px;
}
/* 즉시지원버튼 */
  .apply {
	background-color:#5bc0de;
	-webkit-border-top-left-radius:0px;
	-moz-border-radius-topleft:0px;
	border-top-left-radius:0px;
	-webkit-border-top-right-radius:0px;
	-moz-border-radius-topright:0px;
	border-top-right-radius:0px;
	-webkit-border-bottom-right-radius:0px;
	-moz-border-radius-bottomright:0px;
	border-bottom-right-radius:0px;
	-webkit-border-bottom-left-radius:0px;
	-moz-border-radius-bottomleft:0px;
	border-bottom-left-radius:0px;
	text-indent:0px;
	display:inline-block;
	color:#ffffff;
	font-family:Arial;
	font-size:17px;
	font-weight:normal;
	font-style:normal;
	height:35px;
	line-height:35px;
	width:80px;
	text-decoration:none;
	text-align:center;
	text-shadow:0px 0px 50px #528ecc;
}.apply:hover {
	background-color:#378de5;
	color:#ffffff;
	text-decoration:none;
}.apply:active {
	background-color:#5bc0de;
	color:#ffffff;
	text-decoration:none;
	position:relative;
	top:1px;
}

.col-md-3 a {
color:#666666;
}
</style>

<script type="text/javascript">


$(function() {
	listPage(1);

/*채용정보 분류별 검색*/
//상세검색과 연결

});


function imageError(image) {
	image.src="<%=cp%>/resources/image/profile_img.jpg";
}


function listPage(page) {
	var url="<%=cp%>/scrap/list";
	var query = $('form[name=employForm]').serialize();
	query +="&page="+page;
	ajaxHTML(url,"get",query);
}

function ajaxHTML(url, type, query) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			
			var out="";
			

			//받아온것 ceNum, ceSubject, ability, ceType, ceStart, ceEnd, cSerial, cName, cLogoimage
			for(var idx=0; idx<data.celist.length; idx++) {
				var ceNum=data.celist[idx].ceNum;
				var ceSubject=data.celist[idx].ceSubject;
				var cName=data.celist[idx].cName;
				var ability=data.celist[idx].ability;
				var ceType=data.celist[idx].ceType;
				var ceStart=data.celist[idx].ceStart;
				var ceEnd=data.celist[idx].ceEnd;
				var cSerial=data.celist[idx].cSerial;
				var cLogoimage=data.celist[idx].cLogoimage;
				var cNum = data.celist[idx].cNum;
				
				
				out+="<div class='row'>";
				out+="<div class='col-md-12'>";
				out+="<div class='col-md-2 center-block' >";
				out+="<img src='<%=cp%>/uploads/company/"+cLogoimage+"' onError='imageError(this);' class='img-responsive' style='max-height: 100px; margin:auto;'>";
				out+="<div class='container'><a href='<%=cp%>/company/search/article?page=1&cNum="+cNum+"'>회사명 "+cName+"</a></div>";
				out+="</div>";
				out+="<div class='col-md-4'>";
				out+="<a href='<%=cp%>/employ/article?ceNum="+ceNum+"'>"+ceSubject+"</a>";
				out+="</div>";
				out+="<div class='col-md-2'>";
				out+="지원자격 "+ability;
				out+="</div>";
				out+="<div class='col-md-2'> ";
				out+="근무조건 "+ceType;
				out+="</div>";
				out+="<div class='col-md-2' style='text-align:center;'>";
				out+="등록일 "+ceStart+" 마감일 "+ ceEnd +"<br><br>   <a class='apply' onclick='javascript:loadSimpleInfo("+ceNum+")' data-toggle='modal' data-target='.bs-example-modal-sm'>즉시지원</a>";
				out+="</div>";
				out+="</div>";
				out+="</div>";
				out+="<hr>";

			}
			out = out.substring(0,out.length-11);
			out+="<hr>";
			out+="<div class='col-md-12 text-center'>"+data.paging+"</div>";
			out+="</div>";
			
			
			if($.trim(data)=="error") {
				listPage(page);
				return;
			}
			$("#listEmploy").html(out);
		}
		,beforeSend : function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	  	,error : function(jqXHR) {
	        if (jqXHR.status == 401) {
	        	 console.log(jqXHR);
	        } else if (jqXHR.status == 403) {
	            location.href="<%=cp%>/member/login";
	        } else {
	        	 console.log(jqXHR.responseText);
	        }
	    }
	});
}



</script>


<div class="wrap" style="max-width:800px;">
	<div class="jumbotron"> 
	</div>
		
	
  		
  	
  	<div class="row">
  			<div class="col-md-12">
  			<h3>|스크랩한 채용정보</h3><hr style="margin-bottom: 0">	
	  		</div>
	  		<br>
  	</div>	
	
	
	
  
 
	<div></div>
	<div>&nbsp;</div>

	
	모든채용 (${dataCount })
		<div class="col-md-12" style="background: #5BC0DE;border-radius: 3px;padding: 20px;margin: 20px 0;color:white;max-height:15px;text-align: center;border-left-width: 5px solid #337AB7;">
			<div class="col-md-2">
				스크랩일
			</div>
			<div class="col-md-3">
				회사명
			</div>
			<div class="col-md-3">
				제목
			</div>
			<div class="col-md-2">
				마감일
			</div>
			<div class="col-md-2">
				지원하기
			</div>
			
		</div>
	
	
	<!-- 채용정보 -->
	<!-- 검색을 누르면 ajax로 페이지가 바뀌어야한다. -->
	<!-- 페이징으로한다. -->
	<!-- 일단은 모든페이지 다나오게 한다.(listPage) 나오는정보 회사명 기업로고 제목 시작일 마감일-->
	<div class="callout" style="padding: 20px;margin: 20px 0;border: 1px solid #eee; border-left-width: 5px;border-radius: 3px;">
		
		<div id="listEmploy"><!-- ajax나오는id -->
					<!-- 받아온것 ceNum, ceSubject, ability, ceType, ceStart, ceEnd, C.cSerial, cName, cLogoimage -->
					<!-- 채용정보 한세트 -->
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-2 center-block" > 
							<div class="container"><a href="C.cSerial">스크랩일</a></div>
						</div>
						<div class="col-md-3"> 				
								<a href="ceNum">회사명</a>
						</div>
						<div class="col-md-3"> 				
								제목
						</div>
						<div class="col-md-2"> 				
								마감일
						</div>
						<div class="col-md-2">	
								<a style="background: #5BC0DE;border-radius: 3px;color:white;list-style: none;font-size:20px;">지원하기</a>
						</div>
					</div>
					
					
				</div>
				
				<hr>
			
		
		
		</div> 
		
		
		
		
		
		
		
	
	</div>	
	

	
	<!-- 즉시지원 모달 -->
	

		<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-sm">
		    <div class="modal-content">
		     			<div class="modal-header" style="background:#5bc0de ;color:white;">
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					        <div id="cName">삼성전자</div><h4 class="modal-title">빠른 온라인 입사지원</h4>
					      </div>
					      <div class="modal-body" style="text-align: center; height:200px;">
					        
					        <div><br>
					        	<table style="margin:0 auto;">
							      	<tr><th>채용 분야</th><td id="subname">${employ. subname}</td></tr>
							      	<tr><th>고용 형태</th><td id="ceType1">${employ.ceType}</td></tr>
							      	<tr><th>연봉</th><td id="cePay">${employ.cePay } 만원</td></tr>
							      	<tr><th>시작일</th><td id="ceStart">${employ.ceStart}</td></tr>
							      	<tr><th>마감일</th><td id="ceEnd">${employ.ceEnd}</td></tr>
						      	</table> 
						      	<br>
									<div style="float:right;">
										<button type="button" class="btn btn-info" style="margin-right:1px;" id="article">상세보기</button>
										<button class="btn btn-info"><i class="glyphicon glyphicon-tags"></i> <span>스크랩</span></button>
									</div>
							</div>
					        
					      </div>
					      <div class="modal-footer" style="text-align: center" id="apply_result">
					      	제출할 이력서를 선택해주세요
					      	<select id="resume">
					      	
					      	</select>
					      	
					      	<button type="button" class="btn btn-info" style="margin-right:1px;" id="apply">제출</button>
					      	
					      	
					        <hr>
					        <button type="button" class="btn btn-default" data-dismiss="modal">채용정보 계속보기</button>
					        
					    </div>
		    </div>
		  </div>
		</div>
</div>