<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>
<style>
body{
background: white;
}
  /* Note: Try to remove the following lines to see the effect of CSS positioning */
  .affix {
  		top:0;
      width:296.65px;
  }
  .nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li.active>a:hover {
 	background:#5bc0de;
 	color:white;
  }
  .nav-pills>li>a {
  	color:black;
  }
  th {
  color:gray;
  margin-right:10px;
  }
h3{
   margin-top: 40px;
}

  </style>
  
<script type="text/javascript">
$(function() {
	var resumeList = new Array();
	$("#resume").change(function () {
		var num = $("#resume option:selected").index();
		
		$("#apply").html(resumeList[num].apply);
		$("#pay").html(resumeList[num].pay);
		$("#caddress").html(resumeList[num].hopelocation);
		$("#email").html(resumeList[num].email);
		$("#phone").html(resumeList[num].phone);
		$("#address").html(resumeList[num].addr+resumeList[num].addr2);
		
	});
	/* ${member.userId} */
	$.ajax({
		type:"get"
		,data:"ceNum=${param.ceNum}"
		,url:"<%=cp%>/employ/detailapplyForm"
		,success:function(data) {
			resumeList = data.resumeList;
			//resume List뿌려주면서 바뀌는부분
			for(var i=0; i<=data.resumeList.length; i++) {
				if(data.resumeList[i]!=undefined && data.resumeList[i].rNum!=undefined)
					$("#resume").append("<option value='"+data.resumeList[i].rNum+"'>"+data.resumeList[i].rName+"</option>");
			}
			
			
			//회원 이력서 정보 뿌려주는 부분 subname, ceType, cePay, caddress
			$("#apply").html(data.resumeList[0].apply);
			$("#pay").html(data.resumeList[0].pay);
			$("#caddress").html(data.resumeList[0].hopelocation);
			$("#email").html(data.resumeList[0].email);
			$("#phone").html(data.resumeList[0].phone);
			$("#address").html(data.resumeList[0].addr+data.resumeList[0].addr2);
		}
		
	});
	
	
	$("#scrap").click(function() {
		var ceNum = ${param.ceNum}
		$.ajax({
			type:"post"
			,data:"ceNum="+ceNum
			,url:"<%=cp%>/employ/scrap"
			,success:function(data) {
				
			
				if(data==0) {
				
					$("#scrap_result").html("<h5>이미 스크랩한 정보입니다.</h5><br><a>나의 스크랩 바로가기</a>");
					
				}	else {
					$("#scrap_result").html("<h5>스크랩이 완료되었습니다.</h5><br><a>나의 스크랩 바로가기</a>");
				}
			}
			
		});
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

function scrap() {
	var ceNum = ${param.ceNum};
	$.ajax({
		type:"get"
		,data:"ceNum=${param.ceNum}"
		,url:"<%=cp%>/employ/scrap"
		,success:function(data) {
			
		
			if(data==1) {
				alert("스크랩성공");
			}	
		}
		
	});
}
</script>
<div id="title"class="text-center">
<h1>${employ.ceSubject}</h1>
</div>
<div class="text-right">
<h5>최종수정일 ${employ.modyTime} 조회수:58 </h5>
</div>
<hr>
<div style="text-align: center;">
${employ.cIntro}
<div class="text-right">


<button class="btn" data-toggle='modal' data-target='.bs-example-modal-sm'><i class="glyphicon glyphicon-tags"></i> <span>스크랩</span></button>
<button class="btn" onclick="javascript:history.back();"><i class="glyphicon glyphicon-th-list"></i> <span>목록으로가기</span></button>

</div>

</div>
<hr>
<!-- 중앙정렬용 center-block  -->


<hr>
<div class="wrapper center-block" style="max-width: 800px; border-left:1px;border-right:1px">


<!-- 글내용  content -->
<div class="rows" style="min-height:2000px">

<div class="col-md-12">
ㅇ 입사지원서의 작성 내용이 사실과 다르거나 제출하신 서류가 허위일 경우 합격이 취소될 수 있습니다. <br>
ㅇ 제출하신 서류는 요청시 반납 가능합니다 (단, 시스템 내 접수된 건은 삭제만 가능) <br>
ㅇ 지원 및 전형에 관한 자세한 문의사항은 담당자에게 문의부탁드립니다.
     (메일을 통해 문의 주시면 빠른 답변 가능합니다)
<hr>
</div>

	<div class="col-md-8">
	<pre>주요 업무	
- 석박사 채용 서비스, 리서처팜(researcherfarm.com)의 마케팅 및 영업
- 바이럴 마케팅
- 국내 학회를 대상으로 홍보 및 영업
- 페이스북 페이지 및 그룹 홍보 및 관리
- 리서처팜 커뮤니티 홍보 및 관리
- 국내 대학교 및 석박사 인력 채용 기업 대상으로 홍보 및 영업</pre>
	<hr>
	<pre>
	채용 상세
	
	고용인원
	${employ.cePeople }
	■ 자격 요건
	- 3개월 이상 근무 가능하신 분
	- 인센티브 제도를 이해하는 분
	- 기본 급여 + 인센티브로 급여가 지급됩니다
	</pre>
	</div>

	<div class="col-md-4">
		<ul class="nav nav-pills nav-stacked" data-spy="affix" data-offset-top="528">
        <li class="active"><a data-toggle='modal' data-target='.bs-example-modal-lg'>지원하기</a></li>
        <li><a href="#section2">연락하기</a></li>
        <li><a href="<%=cp%>/company/search/article?page=1&cNum=${employ.cNum}">기업상세정보</a></li>
        
        <div style="height:250px;text-align:center;border:1px solid lightgray;border-radius:4px;">
      	<h3>${employ.ceSubject}</h3>
      	<hr>
      	<table style="margin:0 auto;">
      	<tr><th>채용 분야</th><td>${employ. subname}</td></tr>
      	<tr><th>고용 형태</th><td>${employ.ceType}</td></tr>
      	<tr><th>연봉</th><td>${employ.cePay } 만원</td></tr>
      	<tr><th>시작일</th><td>${employ.ceStart}</td></tr>
      	<tr><th>마감일</th><td>${employ.ceEnd}</td></tr>
      	</table>
      	</div>
      	
      </ul>
      	
		</div>
		
		<div class="col-md-8">
	<pre>
	우대사항
	- ${employ.cePrefere}
	
	학력
	- ${employ.ability}
	
	기술(비고)
	-${employ.ceETC }
	</pre>
	<hr>
	</div>
	
		<div class="col-md-8">
			<div class="page-header">
					<h1 align="left">
						| 기업 위치 <small></small>
					</h1>
				</div>
				<h5>주소 : ${employ.cAddress}</h5>
				<div id="map" style="height:500px;"></div>
		</div>
		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=ac8d0f9810c74bf05979f5efc0168e40&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addr2coord('${employ.cAddress}', function(status, result) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${employ.cName}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
</div>


<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		     			<div class="modal-header" style="background:#5bc0de ;color:white;">
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					        <h4 class="modal-title"> 상세 온라인 입사지원</h4>
					      </div>
					      <div class="modal-body" style="text-align: center; height:700px;">
					        ${employ.ceSubject}<br>
							${employ.ceType} / ${employ.ability} 이상 / ${employ.cePlace } / ${employ.cePay } 만원 / ~${employ.ceEnd} 까지 - <a>채용정보 상세보기</a>
					        <hr>
					        <div>
					        	제출할 이력서를 선택해주세요
					      	<select id="resume">
					      	
					      	</select>
					        <br>
					        	<table class="table" style="margin:0 auto;">
							      	<tr><th>지원 분야</th><td id="apply">${employ. subname}</td></tr>
							      	<tr><th>희망 연봉</th><td id="pay">${employ.cePay } 만원</td></tr>
							      	<tr><th>희망 근무지</th><td id="caddress">${employ.ceStart}</td></tr>
						      	</table> 
						      	<br>
								
							</div>
							
									
						      		
						      		
						      		<h3 style="text-align: left;">연락처 확인</h3>
						      		<table class="table" style="margin:0 auto;">
								      	<tr><th>이메일</th><td id="email">${employ.ceType}</td></tr>
								      	<tr><th>휴대폰</th><td id="phone">${employ.ceType}</td></tr>
								      	<tr><th>주소</th><td id="address">${employ.ceType}</td></tr>
						      		</table>
						      		
						      		<h3 style="text-align: left;">파일첨부</h3>
									<table class="table" style="margin:0 auto;">
								      	<tr><th style="line-height:34px;">파일명</th>
								      	<td id="subname"><input class="form-control" type="file" multiple="multiple"></td></tr>
						      		</table>
						      		
						      		
									<div style="float:right;">
										<button type="button" class="btn btn-info" style="margin-right:1px;" id="article">이력서 수정하기</button>
							        	<button type="button" class="btn btn-info" style="margin-right:1px;" id="apply" onclick="apply(${param.ceNum})">제출</button>
							        </div>
					      </div>
					      <div class="modal-footer" style="text-align: center" id="apply_result">
					        <button type="button" class="btn btn-default" data-dismiss="modal">채용정보 계속보기</button>
					    </div>
		    </div>
		  </div>
		</div>
		
		
		<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-sm">
		    <div class="modal-content">
		     			<div class="modal-header" style="background:#5bc0de ;color:white;">
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					        <h4 class="modal-title">채용정보(${employ.ceSubject}) 북마크</h4>
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
										<button class="btn btn-info" id="scrap"><i class="glyphicon glyphicon-tags" ></i> <span>스크랩</span></button>
									</div>
							</div>
					        
					      </div>
					      <div class="modal-footer" style="text-align: center" id="scrap_result">
					      	
					      	스크랩하세요
					      	
					        <hr>
					        <button type="button" class="btn btn-default" data-dismiss="modal">채용정보 계속보기</button>
					        
					    </div>
		    </div>
		  </div>
		</div>





</div>