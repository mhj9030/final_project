<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>


<div class="article-body" align="center">
	<div class="cover">
		<div class="cover-back">
    		<img src="<%=cp%>/resources/image/Desert.jpg"/>
		</div>

		<div class="cover-content">
			<div class="image">
				<img src="<%=cp%>/resources/image/google.jpeg">
			</div>
			<h4>KH정보교육원</h4>
			<h5>교육업 : 전문/기능학원</h5>
		</div>
	</div>
	
	<div class="content">
		<div class="basic">
			<div class="page-header">
				<h1 align="left">
					| 기본 정보 <small></small>
				</h1>
			</div>
			<table class="table table-condensed">
				<tbody>
					<tr align="center">
		  				<td class="active" width="100">대표자</td>
		  				<td width="100">홍길동</td>
		  				<td class="active" width="100">설립년도</td>
		  				<td width="100">2017-01-01</td>
		  			</tr>
		  			
		  			<tr align="center">
		  				<td class="active" width="100">기업형태</td>
		  				<td width="100">대기업</td>
		  				<td class="active" width="100">사원수</td>
		  				<td width="100">1,000명</td>
		  			</tr>
		  			
		  			<tr align="center">
		  				<td class="active" width="100">매출액</td>
		  				<td width="100">1,000억원</td>
		  				<td class="active" width="100">업종</td>
		  				<td width="100">교육업</td>
		  			</tr>
				</tbody>
			</table>
		</div>
		
		<div class="intro">
			<div class="page-header">
				<h1 align="left">
					| 기업 소개 <small></small>
				</h1>
			</div>
			
			<div class="intro-body">
				1998년에 개원한 KH정보교육원은 실업자 재취업 교육을 통해서 실업극복과 경제 활성화에 기여했고, IT교육의 새로운 기준을 제시했습니다.
				이를 바탕으로 다양한 교육산업을 추진하였으며, 현재 NCS기반의 직업교육을 통해 지식과 기술을 갖춘 능력 중심의 인재를 양성하기 위한 시스템을 구축하였습니다.
				KH정보교육원은 최적의 교육환경을 통해 인간중심의 기술인력을 양성하고, NCS기반의 실무중심 교과과정 및 다양한 취업지원 시스템과 산학협력 활동을 시행하고 있습니다.
				최고의 IT전문가가 되고 싶다면, KH정보교육원의 문을 두드리십시오.
				KH가 함께 도와드리겠습니다.
				KH정보교육원은 대한민국의 IT기술과 변화를 선도할 전문교육기관으로 거듭나기 위해 교육의 새로운 패러다임을 제시합니다.
			</div>
		</div>
		
		<div class="location">
			<div class="page-header">
				<h1 align="left">
					| 기업 위치 <small></small>
				</h1>
			</div>
			<h5>주소 : 서울특별시 영등포구 선유동2로 57 이레빌딩</h5>
			<div id="map"></div>
		</div>
	</div>
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
geocoder.addr2coord('서울특별시 영등포구 선유동2로 57 이레빌딩', function(status, result) {

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
            content: '<div style="width:150px;text-align:center;padding:6px 0;">KH정보교육원</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>