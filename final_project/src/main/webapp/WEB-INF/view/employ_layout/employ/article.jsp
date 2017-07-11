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

<style>
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

  </style>
  
<script type="text/javascript">
$(function() {
	/* ${member.userId} */
	<%-- $.ajax({
		type:"get"
		,data:"admin@a.com"
		,url:"<%=cp%>/employ/detailapplyForm"
		,success:function(data) {
			//resume List뿌려주면서 바뀌는부분
			
			//회원 이력서 정보 뿌려주는 부분
		}
		,error:
		
	});  --%>
});

</script>
<div id="title"class="text-center">
<h1>${employ.ceSubject}</h1>
</div>
<div class="text-right">
<h5>최종수정일 ${employ.modyTime} 조회수:58 </h5>
</div>
<hr>
<div style="text-align: center;">
모바일 앱 사용자 행동 분석 솔루션 유저해빗을 개발하여 서비스 중인 데이터 기술 스타트업입니다. 
<div class="text-right">

<button class="btn"><i class="glyphicon glyphicon-tags"></i> <span>스크랩</span></button>
<button class="btn" onclick="javascript:history.back();"><i class="glyphicon glyphicon-th-list"></i> <span>목록으로가기</span></button>
</div>

</div>
<hr>
<!-- 중앙정렬용 center-block  -->


<hr>
<div class="wrapper center-block" style="max-width: 980px; border-left:1px;border-right:1px">


<!-- 글내용  content -->
<div class="rows" style="min-height:2000px">

<div class="col-md-12">
마주하지 않은 상태에서 일을 진행했을 때 발생하는 문제를 줄이기 위한 규칙

아무리 좋은 시스템이 있더라도, 사람이 그것을 사용하는 과정에서 항상 어떤 문제가 발생하기 마련이다. 우리는 우리가 만든 시스템을 사용하면서 문제를 발견했고, 이를 줄일 수 있는 규칙들을 만들었다.

1. 어떤 일에 대한 가장 중요한 이슈를 초창기에 해결하는 문화

2. 목적과 대상을 명확히 지정하는 커뮤니케이션

문제 현상 : 대부분 커뮤니케이션이 아니므로, 대상을 정확히 지칭해서 이야기 하지 않는 경우, 그 대상이 스스로 답변을 해야 하는지 인지하지 못하는 현상이 발생한다. 이는 특히 업무 메신저의 공용 채널이나 팀 내 다수를 대상으로 발송하는 이메일, 많은 사람들이 엮여 있는 프로젝트 도구 항목에서 자주 발생한다.
해결을 위한 규칙 : 공용 채널 메시지나 다수의 수신인이 있는 이메일을 작성할 때 반드시 답변을 해야 하는 사람이 있거나 답변이 필요한 기한이 있다면 이를 명확히 언급한다. 대상이 답변을 줘야 하는 요소에 대하여 명확히 언급할 때는 각 항목에 대해서 ID를 할당해서 답변 대상이 답변하기 용이하도록 한다.
<hr>
</div>

	<div class="col-md-8">
	<pre>
	주요 업무
	
	- 석박사 채용 서비스, 리서처팜(researcherfarm.com)의 마케팅 및 영업
	- 바이럴 마케팅
	- 국내 학회를 대상으로 홍보 및 영업
	- 페이스북 페이지 및 그룹 홍보 및 관리
	- 리서처팜 커뮤니티 홍보 및 관리
	- 국내 대학교 및 석박사 인력 채용 기업 대상으로 홍보 및 영업
	</pre>
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
        <li><a href="#section3">기업상세정보</a></li>
        
        <div style="height:250px;text-align:center;border:1px solid lightgray;border-radius:4px;">
      	<h3>마케팅 & 세일즈 인턴/신입</h3>
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
	
	자격증
	-정보처리기사
	
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
				<h5>주소 : 서울특별시 영등포구 선유동2로 57 이레빌딩</h5>
				<div id="map" style="height:500px;background:gray;"></div>
		</div>
		
</div>


<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		     			<div class="modal-header" style="background:#5bc0de ;color:white;">
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					        <h4 class="modal-title"> 상세 온라인 입사지원</h4>
					      </div>
					      <div class="modal-body" style="text-align: center; height:700px;">
					        유커넥 - 개발팀 하드웨어·소프트웨어 정규직 채용<br>
							신입/경력 (년수무관) / 대학교졸업(4년) 이상 / 서울 / 3,400~3,600만원 / ~09.11 (월) 까지 - <a>채용정보 상세보기</a>
					        <hr>
					        <div>
					        	제출할 이력서를 선택해주세요
					      	<select id="resume">
					      	
					      	</select>
					        <br>
					        	<table class="table" style="margin:0 auto;">
							      	<tr><th>지원 분야</th><td id="subname">${employ. subname}</td></tr>
							      	<tr><th>고용 형태</th><td id="ceType">${employ.ceType}</td></tr>
							      	<tr><th>희망 연봉</th><td id="cePay">${employ.cePay } 만원</td></tr>
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
								      	<td id="subname"><input class="form-control" type="file"></td></tr>
						      		</table>
						      		
						      		
									<div style="float:right;">
										<button type="button" class="btn btn-info" style="margin-right:1px;" id="article">이력서 수정하기</button>
							        	<button type="button" class="btn btn-info" style="margin-right:1px;" id="apply">제출</button>
							        </div>
					      </div>
					      <div class="modal-footer" style="text-align: center" id="apply_result">
					      	
					      	
					      	
					      	
					      	

					        <button type="button" class="btn btn-default" data-dismiss="modal">채용정보 계속보기</button>
					        
					    </div>
		    </div>
		  </div>
		</div>





</div>