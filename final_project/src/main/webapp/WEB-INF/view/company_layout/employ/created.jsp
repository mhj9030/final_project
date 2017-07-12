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
		$("input[name=upload]").hide();
		
		$("#resumeForm").change(function(){
			var resumeForm=$(this).find('option:selected').val();
			
			if(resumeForm=="기본"){
				$("input[name=upload]").hide();
			} else if(resumeForm=="첨부"){
				$("input[name=upload]").show();
			}
		});
		
		$("select[name=subCode]").hide();
		$("select[id=subCode1]").show();
		
		$("#maCode").change(function(){
			var maCode=$(this).find('option:selected').val();
			
			$("select[name=subCode]").hide();
			$("select[name=subCode]").attr("disabled", "disabled");

			$("select[id=subCode"+maCode+"]").show();
			$("select[id=subCode"+maCode+"]").removeAttr("disabled");
		});
		
		if("${mode}"=="update"){
			$("#ceType").val("${dto.ceType}").attr("selected", "selected");
			$("#atCode").val("${dto.atCode}").attr("selected", "selected");
			
			$(".sub-form-control").hide();
			$("select[name=subCode]").attr("disabled", "disabled");
			
			$("#ceType").val("${dto.ceType}").attr("selected", "selected");
		}
	});

	function check(){
		var f=document.employForm;
		
		var mode="${mode}";
		if(mode=="created") {
			f.action="<%=cp%>/company/employ/created";
		} else if(mode=="update") {
			f.action="<%=cp%>/company/employ/update";
		}
		
		f.submit();
	}
</script>
<div class="created-body">
	<div class="page-header">
		<h1 align="left">
			${mode=='update'?'| 채용수정':'| 채용등록'} <small></small>
		</h1>
	</div>
	
	<form name="employForm" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label>제목</label>
			<input name="ceSubject" type="text" class="form-control" placeholder="제목" value="${dto.ceSubject}">
		</div>

		<div class="form-group">
			<label>고용 인원수</label>
			<input name="cePeople" type="number" class="form-control" placeholder="인원수" value="${dto.cePeople}">
		</div>
		
		<div class="form-group">
			<label>고용 형태</label>
			<select id="ceType" name="ceType" class="form-control" style="width: 150px;">
			  <option value="정규직" selected="selected">정규직</option>
			  <option value="계약직">계약직</option>
			  <option value="인턴직">인턴직</option>
			  <option value="시간제">시간제</option>
			  <option value="파견직">파견직</option>
			</select>
		</div>
		
		<div class="form-group">
    		<label>시작일</label>
    		<input name="ceStart" type="date" class="form-control" placeholder="시작일" value="${dto.ceStart}">
  		</div>
  		
  		<div class="form-group">
    		<label>마감일</label>
    		<input name="ceEnd" type="date" class="form-control" placeholder="마감일" value="${dto.ceEnd}">
  		</div>
  		
  		<div class="form-group">
    		<label>연봉</label>
    		<div class="row">
    			<div class="col-xs-2">
    				<input name="cePayMin" type="number" class="form-control" placeholder="최소" value="${dto.cePayMin}" style="margin-right: 50px;">
    			</div>
    			<div class="col-xs-2">
    				<input name="cePayMax" type="number" class="form-control" placeholder="최대" value="${dto.cePayMax}">
    			</div>
    		</div>
  		</div>
  		
  		<div class="form-group">
	  		<label>직종</label>
	  		<div class="title-form-control"><label>대분류</label><label>소분류</label></div>
	  		<div class="form-group" style="height: 30px;">
	    		<select id="maCode" name="maCode" class="form-control main-form-control">
				  <option value="1" selected="selected">경영/사무</option>
				  <option value="2">마케팅/무역/유통</option>
				  <option value="3">영업/고객상담</option>
				  <option value="4">IT/인터넷</option>
				  <option value="5">연구개발/설계</option>
				  <option value="6">생산/제조</option>
				  <option value="7">전문/특수직</option>
				  <option value="8">디자인</option>
				  <option value="9">미디어</option>
				</select>
	
				<select id="subCode1" name="subCode" class="form-control sub-form-control">
				  <option value="1">기획/전략/경영</option>
				  <option value="2">사무/총무/법무</option>
				  <option value="3">인사/노무/교육</option>
				  <option value="4">경리/회계/결산</option>
				  <option value="5">재무/세무/IR</option>
				  <option value="6">비서/인포메이션</option>
				  <option value="7">사무보조/문서작성</option>
				</select>
				
				<select id="subCode2" name="subCode" class="form-control sub-form-control">
				  <option value="8">마케팅/광고</option>
				  <option value="9">유통/물류/재고</option>
				  <option value="10">홍보/PR</option>
				  <option value="11">무역/해외영업</option>
				  <option value="12">구매/자재</option>
				  <option value="13">배송/운전/택배</option>
				  <option value="14">상품기획/MD</option>
				</select>
				
				<select id="subCode3" name="subCode" class="form-control sub-form-control">
				  <option value="15">제품/서비스영업</option>
				  <option value="16">금융/보험영업</option>
				  <option value="17">광고영업</option>
				  <option value="18">기술영업</option>
				  <option value="19">영업관리/지원</option>
				  <option value="20">법인영업</option>
				  <option value="21">채권/심사</option>
				  <option value="22">판매/캐셔/매장관리</option>
				  <option value="23">이벤트/웨딩/나레이터</option>
				  <option value="24">단순홍보/회원관리</option>
				  <option value="25">교육상담/학원관리</option>
				  <option value="26">아웃바운드TM</option>
				  <option value="27">고객센터/인바운드/CS</option>
				  <option value="28">부동산/창업</option>
				</select>
				
				<select id="subCode4" name="subCode" class="form-control sub-form-control">
				  <option value="29">QA/테스터/검증</option>
				  <option value="30">네트워크/서버/보안/DBA</option>
				  <option value="31">웹기획/웹마케팅/PM</option>
				  <option value="32">웹프로그래머</option>
				  <option value="33">응용프로그래머</option>
				  <option value="34">시스템프로그래머</option>
				  <option value="35">SE/시스템분석/설계</option>
				  <option value="36">웹디자인</option>
				  <option value="37">HTML/웹표준/컨텐츠관리</option>
				  <option value="38">웹사이트운영</option>
				  <option value="39">IT/디자인/컴퓨터강사</option>
				</select>
				
				<select id="subCode5" name="subCode" class="form-control sub-form-control">
				  <option value="40">자동차/조선/기계</option>
				  <option value="41">반도체/디스플레이</option>
				  <option value="42">화학/에너지/환경/식품</option>
				  <option value="43">전기/전자/제어</option>
				  <option value="44">기계설계/CAD·CAM</option>
				  <option value="45">통신기술/네트워크구축</option>
				  <option value="46">건설/설계/인테리어</option>
				</select>
				
				<select id="subCode6" name="subCode" class="form-control sub-form-control">
				  <option value="47">생산관리/공정관리/품질관리</option>
				  <option value="48">생산/제조/설비/조립</option>
				  <option value="49">포장/가공/검사</option>
				  <option value="50">설치/정비/A/S</option>
				  <option value="51">시공/현장/공무</option>
				  <option value="52">시설/빌딩/안전</option>
				</select>
				
				<select id="subCode7" name="subCode" class="form-control sub-form-control">
				  <option value="53">경영분석/컨설턴트</option>
				  <option value="54">리서치/통계/사서</option>
				  <option value="55">외국어/번역/통역</option>
				  <option value="56">법률/특허/상표</option>
				  <option value="57">회계/세무</option>
				  <option value="58">보안/경비/경호</option>
				  <option value="59">의사/약사/간호사</option>
				  <option value="60">중고등교사/강사</option>
				  <option value="61">초등/유치원/보육교사</option>
				  <option value="62">외국어/자격증/기술강사</option>
				  <option value="63">IT/디자인/학원강사</option>
				  <option value="64">뷰티미용/애완/스포츠</option>
				  <option value="65">요리/영양/제과제빵</option>
				  <option value="66">학습지/방문교사</option>
				  <option value="67">사회복지/요양보호/자원봉사</option>
				  <option value="68">노무/헤드헌터/직업상담</option>
				</select>
				
				<select id="subCode8" name="subCode" class="form-control sub-form-control">
				  <option value="69">그래픽디자인/CG</option>
				  <option value="70">출판/편집디자인</option>
				  <option value="71">제품/산업디자인</option>
				  <option value="72">캐릭터/애니메이션</option>
				  <option value="73">광고/시각디자인</option>
				  <option value="74">건축/인테리어디자인</option>
				  <option value="75">의류/패션/잡화디자인</option>
				</select>
				
				<select id="subCode9" name="subCode" class="form-control sub-form-control">
				  <option value="76">연출/제작/PD</option>
				  <option value="77">아나운서/리포터/성우</option>
				  <option value="78">영상/카메라/촬영</option>
				  <option value="79">기자</option>
				  <option value="80">작가/시나리오</option>
				  <option value="81">연예/매니저</option>
				  <option value="82">음악/음향</option>
				  <option value="83">광고제작/카피</option>
				  <option value="84">무대/스텝/오퍼레이터</option>
				</select>
	  		</div>
  		</div>
  		
  		<div class="form-group">
  			<label>학력</label>
  			<select id="atCode" name="atCode" class="form-control" style="width: 150px;">
  				<option value="1">고졸</option>
			 	<option value="2">대졸</option>
			 	<option value="3">대학원졸</option>
  			</select>
  		</div>
  		
  		<div class="form-group" style="clear: both;">
    		<label>우대사항</label>
    		<textarea name="cePrefere" class="form-control" rows="5">${dto.cePrefere}</textarea>
  		</div>
  		
  		<div class="form-group">
    		<label>비고</label>
    		<textarea name="ceEtc" class="form-control" rows="5">${dto.ceEtc}</textarea>
  		</div>
  		
  		<div class="form-group">
    		<label>근무지</label><br>
    		<div class="row">
    			<div class="col-xs-10">
    				<input name="cePlace" type="text" class="form-control" id="sample5_address" placeholder="근무지" readonly="readonly" value="${dto.cePlace}">
    			</div>
    			<div class="col-xs-2">
    				<input type="button" class="btn btn-default" onclick="sample5_execDaumPostcode()" value="주소 검색">
    			</div>
    		</div>
			<div id="map" style="width:300px;height:300px;margin-top:10px;"></div>
  		</div>
  		
  		<div class="form-group">
  			<label>이력서 선택</label>
  			<select id="resumeForm" name="resumeForm" class="form-control" style="width: 150px;">
  				<option value="기본" selected="selected">기본</option>
			 	<option value="첨부">첨부</option>
  			</select>
  		</div>
  		
  		<div class="form-group">
  			<input name="upload" type="file" value="등록파일">
  		</div>
  		
  		<button type="button" class="btn btn-default" onclick="check();">등록</button>
		<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/company/employ';">돌아가기</button>
	</form>
</div>

<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
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
	    geocoder.addr2coord('${dto.cePlace}', function(status, result) {

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
	                content: '<div style="width:150px;text-align:center;padding:6px 0;"></div>'
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