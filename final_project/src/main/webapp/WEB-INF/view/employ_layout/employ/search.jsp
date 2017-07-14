<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>
<!-- Bootstrap CSS -->
<link href="/final_project/resources/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
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
.target:after {content:''; position:absolute; width:10px; height:px; border: 10px solid white;}
.target a { padding:10px; padding:0;width:100px;border-radius:20px;}
.target.go:after {border-color:transparent lightgray transparent transparent;reft:100px;position:absolute;left:225px}
</style>

<script type="text/javascript">


$(function() {
	listPage(1);

/*채용정보 분류별 검색*/
//1차직종
$("#location > a").click(function() {
	alert("d");
	if($(this).attr("id")=='j') {
		$("#sub_class").append("<option value="+$(this).attr("id").substring(1)+">"+ $(this).attr("id").substring(1)+"</option>");
		$("#sub_class option:select").val("");
	}
});




$("#job > div > a").mouseenter(function() {
	$("#job > div > a").parent().attr("class","target");
	$("#location").html("");
	$("#location").attr("style","height:424px;border:3px solid lightgray;padding:20px;");
		$(this).parent().attr("class","target go");
		
		//2차직종
		var macode = $(this).parent().attr("id");
		var subname = new Array();
		var subcode = new Array();
		<c:forEach items="${sjlist}" var="Employ">
			if('j${Employ.macode}'==macode){
			subcode.push("${Employ.subcode}");
			subname.push("${Employ.subname}");
			}
		</c:forEach>

		for (var i = 0; i < subname.length; i++) {
			$("#location").append("<a id='j'>"+ subname[i]+"</a><br>");
		}
		
		//2차업종
		var macode = $(this).parent().attr("id");
		var subname = new Array();
		var subcode = new Array();
		<c:forEach items="${sblist}" var="Employ">
			if('b${Employ.macode}'==macode){
			subcode.push("${Employ.subcode}");
			subname.push("${Employ.subname}");
			}
		</c:forEach>
		
		for (var i = 0; i < subname.length; i++) {
			$("#location").append("<a id='b'>"+ subname[i]+"</a><br>");
		}
	});

	$("#location").mouseleave(function() {
		var out="";
			out+="<a>서울특별시</a><br>";
			out+="<a>광주광역시</a><br>";
			out+="<a>대전광역시</a><br>";
			out+="<a>부산광역시</a><br>";
			out+="<a>인천광역시</a><br>";
			out+="<a>경기도</a><br>";
			out+="<a>경상남도/경상북도</a><br>";
			out+="<a>충청남도/충청북도</a><br>";
			out+="<a>전라남도/전라북도</a><br>";
			out+="<a>강원도</a><br>";
			out+="<a>제주특별자치도</a><br>";
			
		$("#location").html(out);
		$("#location").attr("style","height:424px;border-right:1px solid #F5F5F5;padding:20px;");
		$("#job > div > a").parent().attr("class","target");
	});
	
 	
	
	
/* 채용정보 상세검색 */

/* 업종 선택*/
$("#main_bu_class").change(function() {
	$("#sub_bu_class option").remove();
	//main_bu_class의 value값과 sblist의 mvalue값이 같은걸 저기에 넣어준다.
		//선택된 인덱스를 골라준다.	
			var macode = $("#main_bu_class option:selected").val();
			var subname = new Array();
			var subcode = new Array();
			<c:forEach items="${sblist}" var="Employ">
				if(${Employ.macode}==macode){
				subcode.push("${Employ.subcode}");
				subname.push("${Employ.subname}");
				}
			</c:forEach>

			for (var i = 0; i < subname.length; i++) {
				$("#sub_bu_class").append("<option value="+subname[i]+">"+ subname[i]+"</option>");
			}
});
/*직종선택*/
$("#main_class").change(function() {
	$("#sub_class option").remove();
	//main_bu_class의 value값과 sblist의 mvalue값이 같은걸 저기에 넣어준다.
		//선택된 인덱스를 골라준다.	
			var macode = $("#main_class option:selected").val();
			var subname = new Array();
			var subcode = new Array();
			<c:forEach items="${sjlist}" var="Employ">
				if(${Employ.macode}==macode){
				subcode.push("${Employ.subcode}");
				subname.push("${Employ.subname}");
				}
			</c:forEach>

			for (var i = 0; i < subname.length; i++) {
				$("#sub_class").append("<option value="+subname[i]+">"+ subname[i]+"</option>");
			}
});
/*근무조건*/


	
/*연봉 부분*/
	
	//기본적으로startpay select에 넣어놓는값
	var s = "";
	for(var i=15; i<=99; i++) {
		s+="<option value='"+i*100+"'>"+i*100+"만원</option>"
	}
	$("#startpay").html(s);
	//sbar + mbar + ebar =100이다. sbar 가  0이면 +1더해서 100만원  sbar만큼 빼서 mbar가 99여야한다.
	//sbar가 10 ebar가 10이면 sbar은 2500만원 (10) ebar은 3500만원 (10) mbar은 20뺴서 80이다.
	var sbar;
	var mbar;
	var ebar;
	//startpay가 변경되면
	$("#startpay").change(function() {
		sbar = $("#startpay option").index($("#startpay option:selected"))+15;
		
		startp=$("#startpay option:selected").text();
		
		$("#startw").text(startp);
		
		mbar = (100-sbar);
		
		
		//바 수정
		$("#startbar").width(sbar+'%');
		$("#middlebar").width(mbar+'%');
	
		
		var e = "";
		for(var i=$("#startpay option").index($("#startpay option:selected"))+16; i<=99; i++) {
			e+="<option value='"+i*100+"'>"+i*100+"만원</option>"
		}
		e+="<option value='100000000'>1억</option>"
		$("#endpay").html(e);
		$("#middlebar").width(mbar+'%');
		
		
		listPage(page);
	});
	
	//endpay가 변경되면
	$("#endpay").change(function() {
		 //1500만원부터 +10 해주면 15뺀다음 인덱스+1만큼더하면된다.
		
		 
		endp=$("#endpay option:selected").text();
		
		$("#endw").text(endp); 
		 
		mbar = $("#endpay option").index($("#endpay option:selected"))+1;
		ebar =  100-(sbar+mbar);
		
		if($("#endpay option").index($("#endpay option:selected"))>65) {
			mbar=65;
			ebar=35-sbar;
		}
		
		$("#middlebar").width(mbar+'%');
		$("#endbar").width(ebar+'%');
		$("#listEmploy").html("");
		listPage(1);
	});
	
	
	
	
	/* 검색,키워드 추가부분 */
	$("#cePrefere").change(function() {
		listPage(1);
	});
	$("#ceType").change(function() {
		listPage(1);
	});
	$("#ability").change(function() {
		listPage(1);
	});
	$("#license").change(function() {
		listPage(1);
	});
	$("#sub_class").change(function() {
		listPage(1);
	});
	$("#s_date").change(function() {
		listPage(1);
	});
	$("#e_date").change(function() {
		listPage(1);
	});
	$("#cePlace").change(function() {
		listPage(1);
	});
	$("#search").keyup(function() {
		listPage(1);
	});
	
});

function apply(ceNum) {
	var rNum = $("#resume option:selected").val();
	var url="<%=cp%>/employ/apply?ceNum="+ceNum+"&rNum="+rNum;
	
	$.ajax({
		type:"GET"
		,url:url
		,success:function(data) {
			
			if(data==0) {	        
		        $("#apply_result").html("<h5>이미 입사지원한 공고입니다.</h5><br><a>입사지원현황 바로가기</a><hr><button type='button' class='btn btn-default' data-dismiss='modal'>채용정보 계속보기</button>");
			} else {

		        $("#apply_result").html("<h5>입사지원이 완료되었습니다.</h5><br><a>입사지원현황 바로가기</a><hr><button type='button' class='btn btn-default' data-dismiss='modal'>채용정보 계속보기</button>");
			}
		}
		,error : function() {
			$("#apply_result").html("<h5>이미 입사지원한 공고입니다.</h5><br><a>입사지원현황 바로가기</a><hr><button type='button' class='btn btn-default' data-dismiss='modal'>채용정보 계속보기</button>");
		}
		
	})
}

function loadSimpleInfo(ceNum) {
	$("#apply_result").html("제출할 이력서를 선택해주세요<select id='resume'></select><br><button type='button' class='btn btn-info' style='margin-right:1px;' id='apply'>제출</button><hr><button type='button' class='btn btn-default' data-dismiss='modal'>채용정보 계속보기</button>");
	$("#resume option").remove();
	var url="<%=cp%>/employ/applyForm?ceNum="+ceNum;
	$.ajax({
		type:"GET"
		,url:url
		,success:function(data) {
			$("#subname").text(data.employ.subname);
			$("#ceType1").text(data.employ.ceType);
			$("#ceStart").text(data.employ.ceStart);
			$("#ceEnd").text(data.employ.ceEnd);
			$("#ceNum").text(data.employ.ceNum);
			$("#cePay").text(data.employ.cePay);
			$("#cName").text(data.employ.cName);
			$("#article").attr("onclick","location.href='<%=cp%>/employ/article?ceNum="+ceNum+"'");
			
			$("#apply").attr("onclick","apply("+ceNum+");");
	
			for(var i=0; i<=data.resumeList.length; i++) {
				if(data.resumeList[i]!=undefined && data.resumeList[i].rNum!=undefined)
					$("#resume").append("<option value='"+data.resumeList[i].rNum+"'>"+data.resumeList[i].rName+"</option>");
			}
			


		}
		,error : function(jqXHR) {
			
	        if (jqXHR.status == 401) {
	        	 console.log(jqXHR);
	        } else if (jqXHR.status == 403) {
	        } else {
	        	 console.log(jqXHR.responseText);
	        }
	    }
	});
	
	
	
}

function imageError(image) {
	image.src="<%=cp%>/resources/image/profile_img.jpg";
}


function listPage(page) {
	var url="<%=cp%>/employ/list";
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
				
				
				
				
				/* <div class="row">
				<div class="col-md-12">
					<div class="col-md-2 center-block" > 
						<img src="/final_project/resources/image/cLogoimage" alt="/final_project/resources/image/profile_img.jpg" class="img-responsive" style="max-height: 100px; margin:auto;">
						<div class="container"><a href="C.cSerial">회사명 cName</a></div>
					</div>
					<div class="col-md-4"> 				
							<a href="ceNum">제목 ceSubject</a>
					</div>
					<div class="col-md-2"> 				
							지원자격 ability
					</div>
					<div class="col-md-2"> 				
							근무조건 ceType
					</div>
					<div class="col-md-2">
							등록일ceStart 마감일 ceEnd <br>		
							<!-- <a style="background: #5BC0DE;border-radius: 3px;color:white;list-style: none;font-size:20px;">지원하기</a> -->
					</div>
				</div>
			</div>
			
			<hr> */
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


<div class="wrap">
	<div class="jumbotron">
  
	</div>
		
	
  		
  	
  		<div class="row">
  			<div class="col-md-12">
  			<h3>|전체 채용정보</h3><hr style="margin-bottom: 0">
	  			<div class="col-md-3"  style="background:#F5F5F5; font-weight:900; height:30px; width:25%;">
		  			<span style="line-height:30px">직무/산업별 ＞</span>
		  		</div>	
	  			<div class="col-md-3" style="background:#F5F5F5; font-weight:900; height:30px; width:25%">
		  			<span style="line-height:30px">지역별 ＞</span>
		  		</div>
		  		<div class="col-md-3" style="background:#F5F5F5; font-weight:900; height:30px; width:25%" >
		  			<span style="line-height:30px">분류별 ＞</span>
		  		</div>
	  			<div class="col-md-3" style="background:#F5F5F5; font-weight:900; height:30px; width:25%" >
		  			<span style="line-height:30px">기업별 ＞</span>
		  		</div>
	  		</div>
	  		<div class="col-md-12" style="height:424px">
	  			<div class="col-md-3" style="height:424px;border-right:1px solid #F5F5F5;border-left:1px solid #F5F5F5;padding:20px;padding-top:0;" id="job" class="target go">
	  				<strong>직무별(직종)</strong><br>
	  				  
					  <c:forEach var="dto" items="${mjlist}">
					  <div class="targe" id="j${dto.macode}"><a>${dto.maname}</a></div>
					  </c:forEach>
	  				<strong>산업별(업종)</strong><br>
	  				<c:forEach var="dto" items="${mblist}">
					  	<div class="targe" id="b${dto.macode}"><a >${dto.maname}</a></div>
					  </c:forEach>
	  				
	  			</div>
	  			<div class="col-md-3" style="height:424px;border-right:1px solid #F5F5F5;padding:20px;" id="location">
	  			<a>서울특별시</a><br>
	  			<a>광주광역시</a><br>
	  			<a>대전광역시</a><br>
	  			<a>부산광역시</a><br>
	  			<a>인천광역시</a><br>
	  			<a>경기도</a><br>
	  			<a>경상남도/경상북도</a><br>
	  			<a>충청남도/충청북도</a><br>
	  			<a>전라남도/전라북도</a><br>
	  			<a>강원도</a><br>
	  			<a>제주특별자치도</a><br>
	  			</div>
	  			<div class="col-md-3" style="height:424px;border-right:1px solid #F5F5F5;padding:20px;"  id="ETC">
	  			<strong>근무조건</strong><br>
	  			<c:forEach var="dto" items="${ceTlist}">
		  	 			<a id="${dto.ceType}">${dto.ceType}</a><br>
				</c:forEach>
	  			<br>
	  			<strong>자격증</strong><br>
	  			<c:forEach var="dto" items="${lclist}">
	  					<a id="${dto.license}">${dto.license}</a><br>
				</c:forEach>
				<br>
	  			<strong>우대사항</strong><br>
	  			<c:forEach var="dto" items="${cePlist}">
	  				<a id="${dto.cePrefere}">${dto.cePrefere}</a><br>
			    </c:forEach>
	  			</div>
	  			<div class="col-md-3" style="height:424px;border-right:1px solid #F5F5F5;padding:20px;"id="com">
	  			<a>삼성전자</a><br>
	  			<a>로켓펀치</a><br>
	  			<a>KH정보교육원</a><br>
	  			</div>
	  		</div>
	  		<br>
	  		
	  		
  			
	  		
  	</div>	
	
	
	<div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          	채용정보 상세검색
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
      <form name="employForm" id="employForm">
	      <div class="panel-body">
	       			<!-- 채용정보 상세검색 -->
					<div class="row blank">
						<div class="col-md-11">
							<h4 class="panel-title">채용정보 상세검색</h4>
						</div>
						<div class="col-md-1">
							<a class="panel-link" href="#">더보기</a>
						</div>
					</div> 
					
					<div class="row">
						
					  <div class="col-md-12">
						  	<div style="width: 100%; height: 50px; border: 1px solid white;">
								 <div class="col-md-3">
									 <select class="form-control" id="main_bu_class">
										  <option>1차업종</option>
										  <c:forEach var="dto" items="${mblist}">
										  <option value="${dto.macode}">${dto.maname}</option>
										  </c:forEach>
									</select>
								</div>
								<div class="col-md-3">
								<select class="form-control" id="sub_bu_class">
									  <option>2차업종</option>
									  
								</select>
								</div>
								<div class="col-md-3">
								 <select class="form-control" name="ceType" id="ceType">
									  <option>근무조건</option>
									  <c:forEach var="dto" items="${ceTlist}">
										  <option value="${dto.ceType}">${dto.ceType}</option>
									  </c:forEach>
								</select>
								
								</div>
								<div class="col-md-3">
									<select class="form-control" id="cePlace" name="cePlace">
									  <option>지역</option>
									  <option value="서울">서울</option>
									  <option value="경기">경기</option>
									  <option value="인천">인천</option>
									  <option value="대전">대전</option>
									  <option value="강원">강원</option>
									  <option value="제주">제주</option>
									</select>
								</div>
								
						</div>
					</div>
					
					<div class="col-md-12">
						  	<div style="width: 100%; height: 50px; border: 1px solid white;">
								 <div class="col-md-3">
									 <select class="form-control" id="main_class">
										  <option>1차직종</option>
										  <c:forEach var="dto" items="${mjlist}">
										  <option value="${dto.macode}">${dto.maname}</option>
										  </c:forEach>
									</select>
								</div>
								<div class="col-md-3">
								<select class="form-control" id="sub_class" name="subname">
									  <option>2차직종</option>
									  
								</select>
								</div>
								<div class="col-md-3">
								 <select class="form-control" name="license" id="license">
									  <option>자격증</option>
									  <c:forEach var="dto" items="${lclist}">
										  <option value="${dto.license}">${dto.license}</option>
									  </c:forEach>
								</select>
								
								</div>
								<div class="col-md-3">
									<select class="form-control" name="ability" id="ability">
									  <option>학력</option>
									  <c:forEach var="dto" items="${lalist}">
										  <option value="${dto.ability}">${dto.ability}</option>
									  </c:forEach>
									</select>
								</div>
								
						</div>
					</div>
					
					
					
					<div class="col-md-12">
						
						<div class="col-md-3">
							<select class="form-control" id="startpay" name="startpay">
									  <option value="0">연봉시작값</option>
							</select>
						</div>
								
						<div class="col-md-6">
							<div class="progress" style="height:34px;">
							
								<div class="progress-bar progress-bar-info" role="progressbar"
								   style="width:30%; line-height: 34px;" id="startbar">
								    <strong id="startw">최소 1000만</strong>
						  		</div>
					  		
							
								<div class="progress-bar progress-bar-info" role="progressbar"
								   style="width:40%; line-height: 34px; background: white;" id="middlebar">
								    
						  		</div>
					  		
					  	
								<div class="progress-bar progress-bar-info" role="progressbar"
								  style="width:30%; line-height: 34px;" id="endbar">
								    <strong id="endw">최대 3000만</strong>
						  		</div>
					  		</div>
						</div>
						
						<div class="col-md-3">
							<select class="form-control" id="endpay" name="endpay">
									  <option value="100000000">연봉끝값</option>
							</select>
						</div>
					</div>
					<hr>
					
					
					
					
					<!-- 셀렉트까지 -->  
					<div class="col-md-12" style="height:50px;">
					  <div class="col-md-3">
					  	<select class="form-control" name="cePrefere" id="cePrefere">
									  <option>우대사항</option>
									  <c:forEach var="dto" items="${cePlist}">
										  <option value="${dto.cePrefere}">${dto.cePrefere}</option>
									  </c:forEach>
						</select>
					  </div>
					  
					  <div class="col-md-3">
					  
					  <input type="date" placeholder="등록일" class="form-control" style="max-width:215px; margin-right: 3px; height:34px;" title="시작일을 선택하세요"  id="s_date" name="sdate">
					  </div>
					  <div class="col-md-3">
					  <input type="date" placeholder="마감일" class="form-control" style="max-width:215px; height:34px;" title="마지막일을 선택하세요"  id="e_date" name="edate"> 
				
					  </div>
					  
					  <div class="col-md-3">
					  <input type="text" class="form-control" placeholder="검색키워드:회사,제목" value="" id="search" name="search">
					  </div>
					</div>
					
					
					
					<div class="col-md-12">
						<div class="col-md-12">
					 		<textarea class="form-control" rows="" cols="" placeholder="추가된 키워드"></textarea>
						</div>
					</div>
					 
					</div>
					<!-- 채용정보 상세검색 끝 -->
	      </div>
      </form>
    </div>
  </div>
  
	
	<br><br><br><br><br>

	
	
	<!-- <div id="map" style="width:500px;height:400px; margin:0 auto;"></div>
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=62cc987fbf7da110fe84da069a0a96c7"></script>
	<script>

	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new daum.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴

	</script> -->
	
	
		<div class="col-md-12" style="background: #5BC0DE;border-radius: 3px;padding: 20px;margin: 20px 0;color:white;max-height:15px;text-align: center;border-left-width: 5px solid #337AB7;">
			<div class="col-md-2">
				모든채용 (${dataCount })
			</div>
			<div class="col-md-4">
				제목
			</div>
			<div class="col-md-2">
				지원자격
			</div>
			<div class="col-md-2">
				근무조건
			</div>
			<div class="col-md-2">
				마감일 등록일
			</div>
		</div>
	
	
	<!-- 채용정보 -->
	<!-- 검색을 누르면 ajax로 페이지가 바뀌어야한다. -->
	<!-- 페이징으로한다. -->
	<!-- 일단은 모든페이지 다나오게 한다.(listPage) 나오는정보 회사명 기업로고 제목 시작일 마감일-->
	<div class="callout" style="padding: 20px;margin: 20px 0;border: 1px solid #eee; border-left-width: 5px;border-radius: 3px;">
		
		<div id="listEmploy"><!-- ajax나오는id -->
					<!-- 받아온것 ceNum, ceSubject, ability, ceType, ceStart, ceEnd, C.cSerial, cName, cLogoimage -->
					<!-- <!-- 채용정보 한세트 -->
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-2 center-block" > 
							<img src="/final_project/resources/image/profile_img.jpg" alt="/final_project/resources/image/profile_img.jpg" class="img-responsive" style="max-height: 100px; margin:auto;">
							<div class="container"><a href="C.cSerial">회사명 cName</a></div>
						</div>
						<div class="col-md-4"> 				
								<a href="ceNum">제목 ceSubject</a>
						</div>
						<div class="col-md-2"> 				
								지원자격1 ability
						</div>
						<div class="col-md-2"> 				
								근무조건 ceType
						</div>
						<div class="col-md-2">
								등록일ceStart 마감일 ceEnd <br>		
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