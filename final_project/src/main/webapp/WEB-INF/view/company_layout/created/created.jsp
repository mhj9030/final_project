<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript" src="<%=cp%>/resources/js/jquery-3.1.0.min.js"></script>
<script>
	$(function(){
		$(".business-sub").hide();
		$(".service").show();
		
		if("${mode}"=="update"){
			$("#cSerial1").attr("readonly", "readonly");
			$("#cSerial2").attr("readonly", "readonly");
			$("#cSerial3").attr("readonly", "readonly");
			
			$("#cSize[value='${dto.cSize}']").attr("checked", true);
			
			$(".business-sub").hide();
			$("select[name=subCode]").attr("disabled", "disabled");
			
			if("${dto.maName}"=="서비스업"){
				$("#maName").val("service").attr("selected", "selected");
				$("#service").show();
				$("#service").val("${dto.subCode}");
				$("#service").removeAttr("disabled");
			} else if("${dto.maName}"=="제조/화학"){
				$("#maName").val("production").attr("selected", "selected");
				$("#production").show();
				$("#production").val("${dto.subCode}");
				$("#production").removeAttr("disabled");
			} else if("${dto.maName}"=="의료/제약/복지"){
				$("#maName").val("medical").attr("selected", "selected");
				$("#medical").show();
				$("#medical").val("${dto.subCode}");
				$("#medical").removeAttr("disabled");
			} else if("${dto.maName}"=="판매/유통"){
				$("#maName").val("sale").attr("selected", "selected");
				$("#sale").show();
				$("#sale").val("${dto.subCode}");
				$("#sale").removeAttr("disabled");
			} else if("${dto.maName}"=="교육업"){
				$("#maName").val("education").attr("selected", "selected");
				$("#education").show();
				$("#education").val("${dto.subCode}");
				$("#education").removeAttr("disabled");
			} else if("${dto.maName}"=="건설업"){
				$("#maName").val("construction").attr("selected", "selected");
				$("#construction").show();
				$("#construction").val("${dto.subCode}");
				$("#construction").removeAttr("disabled");
			} else if("${dto.maName}"=="IT/통신"){
				$("#maName").val("it").attr("selected", "selected");
				$("#it").show();
				$("#it").val("${dto.subCode}");
				$("#it").removeAttr("disabled");
			} else if("${dto.maName}"=="미디어/디자인"){
				$("#maName").val("design").attr("selected", "selected");
				$("#design").show();
				$("#design").val("${dto.subCode}");
				$("#design").removeAttr("disabled");
			} else if("${dto.maName}"=="은행/금융업"){
				$("#maName").val("bank").attr("selected", "selected");
				$("#bank").show();
				$("#bank").val("${dto.subCode}");
				$("#bank").removeAttr("disabled");
			} else if("${dto.maName}"=="기관/협회"){
				$("#maName").val("production").attr("selected", "selected");
				$("#a​gency").show();
				$("#a​gency").val("${dto.subCode}");
				$("#a​gency").removeAttr("disabled");
			}
		}
		
		$(".business-main").change(function(){
			var business_sub=$(this).find('option:selected').val();
			
			$(".business-sub").hide();
			$("select[name=subCode]").attr("disabled", "disabled");

			$("."+business_sub).show();
			$("."+business_sub).removeAttr("disabled");
		});
	});
	
	function check(){
		var f=document.companyForm;
		
		var mode="${mode}";
    	if(mode=="created")
    		f.action="<%=cp%>/company/created";
    	else if(mode=="update")
    		f.action="<%=cp%>/company/update";
    		
    	f.submit();
	}
	
	function serialCheck(){
		var cSerial1=$("#serial1").val();
		var cSerial2=$("#serial2").val();
		var cSerial3=$("#serial3").val();
		
		var cSerial=cSerial1+"-"+cSerial2+"-"+cSerial3;	
		
		var url="<%=cp%>/company/serialCheck";
		var query="serial="+cSerial
		$.ajax({
			type:"post",
			url:url,
			data:query,
			dataType:"JSON",
			success:function(data){
				var passed=data.passed;
				
				if(passed=="true"){
					var str="<span style='color:blue; font-weight:bold;'>"+cSerial+"</span> 사용 가능한 번호입니다.";
				} else{
					var str="<span style='color:red; font-weight: bold;'>"+cSerial+"</span> 이미 등록된 번호입니다.";
					$(".serial-help-block").html(str);
					$("#serial1").val("");
					$("#serial2").val("");
					$("#serial3").val("");
					$("#serial1").focus();
				}
			}
		});
	}
</script>


<div class="created-body">
	<div class="page-header">
		<h1 align="left">
			${mode=='update'?'| 기업정보수정':'| 기업등록'}
		</h1>
	</div>

	<form name="companyForm" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label>사업자 등록번호</label>
			<div class="row">
			  <div class="col-xs-2">
			    <input id="cSerial1" name="cSerial1" type="text" class="form-control" value="${dto.cSerial1}">
			  </div>
			  <div class="col-xs-2">
			    <input id="cSerial2" name="cSerial2" type="text" class="form-control" value="${dto.cSerial2}">
			  </div>
			  <div class="col-xs-3">
			    <input id="cSerial3" name="cSerial3" type="text" class="form-control" value="${dto.cSerial3}">
			  </div>
			  <p class=serial-help-block></p>
			</div>
		</div>
		
  		<div class="form-group">
    		<label>기업명</label>
    		<input name="cName" type="text" class="form-control" placeholder="기업명" value="${dto.cName}">
  		</div>
  		
  		<div class="form-group">
    		<label>대표자명</label>
    		<input name="cCeo" type="text" class="form-control" placeholder="대표자명" value="${dto.cCeo}">
  		</div>
  		
  		<label>기업 형태</label>
  		<div class="form-group">
    		<label class="radio-inline">
			  <input type="radio" name="cSize" id="cSize" value="대기업" checked="checked"> 대기업
			</label>
			<label class="radio-inline">
			  <input type="radio" name="cSize" id="cSize" value="중소기업"> 중소기업
			</label>
			<label class="radio-inline">
			  <input type="radio" name="cSize" id="cSize" value="공공기관/공기업"> 공공기관/공기업
			</label>
			<label class="radio-inline">
			  <input type="radio" name="cSize" id="cSize" value="외국계기업"> 외국계기업
			</label>
  		</div>
  		
  		<label>업종</label>
  		<div class="business-title"><label>대분류</label><label>소분류</label></div>
  		<div class="form-group" style="height: 30px;">
    		<select id="maName" class="business-main form-control">
			  <option value="service" selected="selected">서비스업</option>
			  <option value="production">제조/화학</option>
			  <option value="medical">의료/제약/복지</option>
			  <option value="sale">판매/유통</option>
			  <option value="education">교육업</option>
			  <option value="construction">건설업</option>
			  <option value="it">IT/통신</option>
			  <option value="design">미디어/디자인</option>
			  <option value="bank">은행/금융업</option>
			  <option value="a​gency">기관/협회</option>
			</select>

			<select id="service" name="subCode" class="business-sub service form-control">
			  <option value="1">호텔/여행/항공</option>
			  <option value="2">외식업/식음료</option>
			  <option value="3">웨딩/장례/이벤트</option>
			  <option value="4">뷰티/미용</option>
			  <option value="5">레저/스포츠/여가</option>
			  <option value="6">기타서비스업</option>
			</select>
			
			<select id="production" name="subCode" class="business-sub production form-control">
			  <option value="7">전기/전자/제어</option>
			  <option value="8">석유/화학/에너지</option>
			  <option value="9">섬유/의류</option>
			  <option value="10">농업/어업/광업</option>
			  <option value="11">기계/설비/자동차</option>
			  <option value="12">가구/목재/제지</option>
			  <option value="13">조선/항공/우주</option>
			  <option value="14">화장품/뷰티</option>
			  <option value="15">금속/철강</option>
			  <option value="16">생활용품/소비재</option>
			  <option value="17">기타제조업</option>
			</select>
			
			<select id="medical" name="subCode" class="business-sub medical form-control">
			  <option value="18">의료</option>
			  <option value="19">제약</option>
			  <option value="20">사회복지</option>
			</select>
			
			<select id="sale" name="subCode" class="business-sub sale form-control">
			  <option value="21">판매</option>
			  <option value="22">유통/무역</option>
			  <option value="23">운송/운수/물류</option>
			</select>
			
			<select id="education" name="subCode" class="business-sub education form-control">
			  <option value="24">초중고대학</option>
			  <option value="25">유아/유치원</option>
			  <option value="26">교재/학습지</option>
			  <option value="27">학원</option>
			  <option value="28">전문/기능학원</option>
			</select>
			
			<select id="construction" name="subCode" class="business-sub construction form-control">
			  <option value="29">건설/건축/토목</option>
			  <option value="30">실내/인테리어</option>
			  <option value="31">환경/설비</option>
			  <option value="32">부동산/임대</option>
			</select>
			
			<select id="it" name="subCode" class="business-sub it form-control">
			  <option value="33">인터넷/컨텐츠</option>
			  <option value="34">쇼핑몰</option>
			  <option value="35">네트워크/통신</option>
			  <option value="36">모바일</option>
			  <option value="37">하드웨어</option>
			  <option value="38">소프트웨어</option>
			  <option value="39">정보보안</option>
			  <option value="40">IT컨설팅</option>
			  <option value="41">게임</option>
			</select>
			
			<select id="design" name="subCode" class="business-sub design form-control">
			  <option value="42">신문/잡지</option>
			  <option value="43">방송사/케이블</option>
			  <option value="44">연예/엔터테인먼트</option>
			  <option value="45">광고/홍보/전시</option>
			  <option value="46">영화/음악</option>
			  <option value="47">공연/문화</option>
			  <option value="48">출판/인쇄/사진</option>
			  <option value="49">캐릭터/애니메이션</option>
			  <option value="50">디자인/설계</option>
			</select>
			
			<select id="bank" name="subCode" class="business-sub bank form-control">
			  <option value="51">은행/금융</option>
			  <option value="52">대출/캐피탈</option>
			  <option value="53">증권/보험</option>
			  <option value="54">기타금융</option>
			</select>
			
			<select id="a​gency" name="subCode" class="business-sub a​gency form-control">
			  <option value="55">정부/공기업</option>
			  <option value="56">협회/단체</option>
			  <option value="57">법률/법무/특허</option>
			  <option value="58">세무/회계</option>
			</select>
  		</div>
  		
  		<div class="form-group">
    		<label>설립년도</label>
    		<input name="cCreated" type="date" class="form-control" placeholder="설립년도" value="${dto.cCreated}">
  		</div>
  		
  		<div class="form-group">
    		<label>사원수</label>
    		<input name="cPeople" type="number" class="form-control" placeholder="사원수" value="${dto.cPeople}">
  		</div>
  		
  		<div class="form-group">
    		<label>매출액</label>
    		<input name="cProfit" type="number" class="form-control" placeholder="매출액(단위 : 만원)" value="${dto.cProfit}">
  		</div>
  		
  		<div class="form-group">
    		<label>간단한 소개말</label>
    		<input name="cDescription" type="text" class="form-control" placeholder="간단한 소개말" value="${dto.cDescription}">
  		</div>
  		
  		<div class="form-group">
    		<label>기업소개</label>
    		<textarea name="cIntro" class="form-control" rows="3">${dto.cIntro}</textarea>
  		</div>
  		
  		<div class="form-group">
    		<label>연락처</label>
    		<div class="row">
			  <div class="col-xs-2">
			  	<input name="cTel1" type="text" class="form-control" value="${dto.cTel1}">
			  </div>
			  <div class="col-xs-2">
			    <input name="cTel2" type="text" class="form-control" value="${dto.cTel2}">
			  </div>
			  <div class="col-xs-2">
			    <input name="cTel3" type="text" class="form-control" value="${dto.cTel3}">
			  </div>
			</div>
  		</div>
  		
  		<div class="form-group">
    		<label>주소</label><br>
    		<div class="row">
    			<div class="col-xs-10">
    				<input name="cAddress" type="text" class="form-control" id="sample5_address" placeholder="주소" readonly="readonly" value="${dto.cAddress}">
    			</div>
    			<div class="col-xs-2">
    				<input type="button" class="btn btn-default" onclick="sample5_execDaumPostcode()" value="주소 검색">
    			</div>
    		</div>
			<div id="map" style="width:300px;height:300px;margin-top:10px;"></div>
  		</div>
  		
  		<div class="form-group">
    		<label>기업 로고 이미지</label>
    		
    		<div class="row">
    			<div class="col-xs-3">
    				<input name="upload" type="file" value="등록파일">
    			</div>
				
				<div class="col-xs-2 original-filename">
		    		<c:if test="${mode=='update'}">
		    			<c:if test="${not empty dto.cLogoOriginalFilename}">
		    				<span>등록파일 : ${dto.cLogoOriginalFilename}</span>
		    				<%-- <a href="<%=cp%>/company/deleteFile?cNum=${dto.cNum}">삭제</a> --%>
		    			</c:if>
		    		</c:if>
	    		</div>
    		</div>
  		</div>
  		
  		<div class="form-group">
    		<label>기업 배경 이미지</label>
    		
    		<div class="row">
    			<div class="col-xs-3">
    				<input name="upload" type="file">
    			</div>
    			
    			<div class="col-xs-2 original-filename">
		    		<c:if test="${mode=='update'}">
		    			<c:if test="${not empty dto.cCoverOriginalFilename}">
		    				<span>등록파일 : ${dto.cCoverOriginalFilename}</span>
		    				<%-- <a href="<%=cp%>/company/deleteFile?cNum=${dto.cNum}">삭제</a> --%>
		    			</c:if>
		    		</c:if>
		    	</div>
    		</div>
  		</div>
  		
  		<button type="button" class="btn btn-default" onclick="check();">등록</button>
  		<c:if test="${mode=='update'}">
			<input type="hidden" name="cLogoImage" value="${dto.cLogoImage}">        	
			<input type="hidden" name="cCoverImage" value="${dto.cCoverImage}">
			<input type="hidden" name="cLogoOriginalFilename" value="${dto.cLogoOriginalFilename}">        	
			<input type="hidden" name="cCoverOriginalFilename" value="${dto.cCoverOriginalFilename}">
		</c:if>
	</form>
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//apis.daum.net/maps/maps3.js?apikey=ac8d0f9810c74bf05979f5efc0168e40&libraries=services"></script>
<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

	    //지도를 미리 생성
	    var map = new daum.maps.Map(mapContainer, mapOption);
	    //주소-좌표 변환 객체를 생성
	    var geocoder = new daum.maps.services.Geocoder();
	    //마커를 미리 생성
	    var marker = new daum.maps.Marker({
	        position: new daum.maps.LatLng(37.537187, 127.005476),
	        map: map
	    });
	
	 	// 주소로 좌표를 검색합니다
	    geocoder.addr2coord('${dto.cAddress}', function(status, result) {

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
	                content: '<div style="width:150px;text-align:center;padding:6px 0;">${dto.cName}</div>'
	            });
	            infowindow.open(map, marker);

	            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	            map.setCenter(coords);
	        } 
	    }); 
	    
	    function sample5_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = data.address; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수
	
	                // 기본 주소가 도로명 타입일때 조합한다.
	                if(data.addressType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }
	
	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("sample5_address").value = fullAddr;
	                
	                // 주소로 좌표를 검색
	                geocoder.addr2coord(data.address, function(status, result) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {
	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
	                        // 지도를 보여준다.
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        // 지도 중심을 변경한다.
	                        map.setCenter(coords);
	                        // 마커를 결과값으로 받은 위치로 옮긴다.
	                        marker.setPosition(coords)
	                    }
	                });
	            }
	        }).open();
	    }
</script>