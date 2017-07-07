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
$(function(){
	listPage(1);
	
	
	/* 업종 select에 넣을값 : 차후 db로대체? */
	$("#company_main").click(function() {
		if($("#company_main option").index($("#company_main option:selected"))==0) {
			$("#company_sub").html("<option>호텔/여행/항공</option><option>외식업/식음료</option><option>웨딩/장례/이벤트</option><option>뷰티/미용</option><option>레저/스포츠/여가</option><option>기타서비스업</option>");
		} else if($("#company_main option").index($("#company_main option:selected"))==1) {
			$("#company_sub").html("<option>전기/전자/제어</option><option>석유/화학/에너지</option><option>섬유/의류</option><option>농업/어업/광업</option><option>기계/설비/자동차</option><option>가구/목재/제지</option>");
		} else if($("#company_main option").index($("#company_main option:selected"))==2) {
			$("#company_sub").html("<option>의료</option><option>제약</option><option>사회복지</option>");
		} else {
			$("#company_sub").html("<option>아</option><option>직</option><option>안</option><option>만</option><option>듬</option><option>^오^</option>");
		}
			
	});
	
	/*연봉 시작값,끝값 option, progressbar*/
	
	//기본적으로startpay select에 넣어놓는값
	var s = "";
	for(var i=15; i<=99; i++) {
		s+="<option>"+i*100+"만원</option>"
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
			e+="<option>"+i*100+"만원</option>"
		}
		e+="<option>1억</option>"
		$("#endpay").html(e);
		$("#middlebar").width(mbar+'%');
		
		
		
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
		
	});
});

function listPage(page) {
	var url="<%=cp%>/ajax/ajax";
	$.ajax({
	    type: "get",
	    url : url,
	    dataType : "xml",
	    success: function(data) {
	        var s="";
	        $(data).find("item").each(function(){
	        	var item = $(this);
	        	var DFullName = $(item).find("DFullName").text();
	        	s+="<option>"+DFullName+"</option>";
	        });
	        
	         $("#listDept").html("<select>"+s+"</select>");	        
	    },
		  error : function(e) {
			  $("#listDept").html("실패");	
		}
	});
	
	
}


</script>


<div class="wrap">
	
	
	<div class="row blank">
		<div class="col-md-11">
			<h4 class="panel-title">채용 정보 검색</h4>
		</div>
		<div class="col-md-1">
			<a class="panel-link" href="#">더보기</a>
		</div>
	</div> 
	
	<div class="row">
		
	  <div class="col-md-12">
		  
				 <div class="col-md-3">
				 <select class="form-control" id="company_main">
					  <option>서비스업</option>
					  <option>제조/화학</option>
					  <option>의료/제약/복지</option>
					  <option>판매/유통</option>
					  <option>교육업</option>
					  <option>건설업</option>
					  <option>IT/통신</option>
					  <option>미디어/디자인</option>
					  <option>은행/금융업</option>
					  <option>기관/협회</option>
				</select>
				</div>
				<div class="col-md-3">
				<select class="form-control"  id="company_sub">
					  <option>1차분류선택</option>
				</select>
				</div>
				<div class="col-md-3">
				 <select class="form-control" id="listDept">
					  <option>기관구분</option>
					  <option>2</option>
				</select>
				
				</div>
				<div class="col-md-3">
					<select class="form-control">
					  <option>지역</option>
					  <option>서울특별시</option>
					  <option>부산광역시</option>
					  <option>대구광역시</option>
					  <option>광주광역시</option>
					  <option>전라도</option>
					  <option>경상도</option>
					  <option>제주도</option>
					  <option>강원도</option>
					  <option>충청도</option>
					  <option>기타(해외등)</option>
					</select>
				</div>
				<hr>
				
		
	</div>
	
	<div class="col-md-12">
		  	
				<div class="col-md-3">
				 <select class="form-control">
					  <option>고용형태</option>
					  <option>2</option>
				</select>
				
				</div>
				<div class="col-md-3">
					<select class="form-control">
					  <option>학력</option>
					  <option>2</option>
				</select>
				</div>
				<div class="col-md-3">
					 <input type="date" class="form-control" placeholder="시작일">
				
				</div>
				<div class="col-md-3">
					<input type="date" class="form-control" placeholder="마감일">
				</div>
				<hr>
		
	</div>
	
	<div class="col-md-12">
		
		<div class="col-md-3">
			<select class="form-control" id="startpay">
					  <option>연봉시작값</option>
					  <option></option>
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
			<select class="form-control" id="endpay">
					  <option>연봉끝값</option>
					  <option></option>
			</select>
		</div>
	</div>
	<hr>
	<!-- 셀렉트까지 -->  
	
	  <div class="col-md-12">
	  <input type="text" class="form-control" placeholder="검색해라자슥아">
	  </div>
	  
	  
	</div>
	
	
	<div class="row blank">
		<div class="col-md-11">
			<h4 class="panel-title">모든 채용 정보 (2479)</h4>
		</div>
		<div class="col-md-1">
			<a class="panel-link" href="#">더보기</a>
		</div>
	</div> 
	
	<!-- 채용정보 -->
	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          <div class="row" >
				<!-- 첫번째댓글 -->
				<div class="col-md-12">
					<div class="col-md-2 center-block"> 
						<img src="/final_project/resources/image/Desert.jpg" class="img-circle img-responsive">
						
					</div>
					<div class="col-md-10" style="text-align:left;"> 				
						<div id="cName"><h3>디투어<small>(Detour)</small></h3></div>
						<div id="cIntro">소상공인 O2O 플랫폼 서비스 회사 </div>
						<hr>
						내생각이 반영된다 (UI/UX 디자이너 모십니다)2,000 - 3,500만원 / 신입, 경력
					</div>
				</div>
			</div>
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
       		<%-- <a href="<%=cp%>/employ/gov/article">기업정보</a> --%>
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          Collapsible Group Item #2
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          Collapsible Group Item #3
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
      </div>
    </div>
  </div>
</div>
	
</div>