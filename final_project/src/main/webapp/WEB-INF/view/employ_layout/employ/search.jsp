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


<script type="text/javascript">


$(function() {
	
	$("#collapseOne").hide();
	listPage(1);
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
		
		
		listPage(1);
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
	
});








function listPage(page) {
	var url="<%=cp%>/employ/list";
	var query = $('form[name=employForm]').serialize();

	ajaxHTML(url,"get",query);
}

function ajaxHTML(url, type, query) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,success:function(data) {
			
			var out="";
			
			out="데이터 개수 : " + data.celist.length;
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
				
				
				out+="<div class='row'>";
				out+="<div class='col-md-12'>";
				out+="<div class='col-md-2 center-block' >";
				out+="<img src='<%=cp%>/resources/image/profile_img.jpg' alt='<%=cp%>/resources/image/profile_img.jpg' class='img-responsive' style='max-height: 100px; margin:auto;'>";
				out+="<div class='container'><a href='C.cSerial'>회사명 "+cName+"</a></div>";
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
				out+="<div class='col-md-2'>";
				out+="등록일 "+ceStart+" 마감일 "+ ceEnd +"<br>";
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
			
			
			if($.trim(data)=="error") {
				listPage(1);
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
  			<h1>전체 채용정보</h1><hr>
  			
  			<div class="col-md-3" style="border-left: 5px solid #F5F5F5">
	  			지역별<br><br><br><br><br>
	  		</div>	
  			<div class="col-md-3" style="border-left: 5px solid #F5F5F5">
	  			직종별<br><br><br><br><br>
	  		</div>
	  		<div class="col-md-3" style="border-left: 5px solid #F5F5F5">
	  			업종별<br><br><br><br><br>
	  		</div>
  			<div class="col-md-3" style="border-left: 5px solid #F5F5F5">
	  			기업별<br><br><br><br><br>
	  		</div>
	  		<br>
	  		<div class="col-md-3" style="border-left: 5px solid #F5F5F5">
	  			학력별<br><br><br><br><br>
	  		</div>	
  			<div class="col-md-3" style="border-left: 5px solid #F5F5F5">
	  			연봉별<br><br><br><br><br>
	  		</div>
	  		<div class="col-md-3" style="border-left: 5px solid #F5F5F5">
	  			우대조건별<br><br><br><br><br>
	  		</div>
  			<div class="col-md-3" style="border-left: 5px solid #F5F5F5">
	  			상세조건별<br><br><br><br><br>
	  		</div>
	  		
	  		
  			</div>
	  		
  	</div>	
	
	
	<div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          	채용정보 상세검색
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
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
									<select class="form-control">
									  <option>지역</option>
									  <option>서울</option>
									  <option>경기</option>
									  <option>인천</option>
									  <option>대전</option>
									  <option>강원</option>
									  <option>제주</option>
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
					  <input type="text" class="form-control" placeholder="검색키워드">
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
				모든채용 (9)
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
								지원자격 ability
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
	
	<div class="row">
		<div class="col-md-12 text-center">
			<ul class="pagination">
			  <li><a href="#">1</a></li>
			  <li style="background:#5BC0DE;color:white; "><a href="#">2</a></li>
			  <li><a href="#">3</a></li>
			  <li><a href="#">4</a></li>
			  <li><a href="#">5</a></li>
			</ul>
		</div>
	
	</div>	
	
</div>