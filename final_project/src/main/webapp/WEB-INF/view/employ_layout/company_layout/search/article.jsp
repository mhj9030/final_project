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
    		
    		<c:if test="${not empty dto.cCoverImage}">
				<img src="<%=cp%>/uploads/company/${dto.cCoverImage}"/>
			</c:if>
			<c:if test="${empty dto.cCoverImage}">
				<img src="<%=cp%>/resources/image/profile_img.jpg">
			</c:if>
		</div>

		<div class="cover-content">
			<div class="image">
				<c:if test="${not empty dto.cLogoImage}">
					<img width="80px" src="<%=cp%>/uploads/company/${dto.cLogoImage}">
				</c:if>
				<c:if test="${empty dto.cLogoImage}">
					<img width="80px" src="<%=cp%>/resources/image/profile_img.jpg">
				</c:if>
			</div>
			<h4>${dto.cName}</h4>
			<h5>${dto.maName} : ${dto.subName}</h5>
		</div>
	</div>
	
	<div class="content">
		<div class="basic">
			<div class="page-header">
				<div class="row">
					<div class="col-xs-5">
						<h1 align="left">| 기본 정보 <small></small></h1>
					</div>
					<div class="col-xs-7" style="margin-top: 30px; text-align: right;">
						<button class="btn btn-default" type="button">문의하기</button>
					</div>
				</div>
			</div>
			<table class="table table-condensed">
				<tbody>
					<tr align="center">
		  				<td class="active" width="100">대표자</td>
		  				<td width="100">${dto.cCeo}</td>
		  				<td class="active" width="100">설립년도</td>
		  				<td width="100">${dto.cCreated}</td>
		  			</tr>
		  			
		  			<tr align="center">
		  				<td class="active" width="100">기업형태</td>
		  				<td width="100">${dto.cSize}</td>
		  				<td class="active" width="100">사원수</td>
		  				<td width="100">${dto.cPeople}</td>
		  			</tr>
		  			
		  			<tr align="center">
		  				<td class="active" width="100">매출액</td>
		  				<td width="100">${dto.cProfit} 만원</td>
		  				<td class="active" width="100">업종</td>
		  				<td width="100">${dto.maName}</td>
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
				<p class="intro-content">${dto.cIntro}</p>
			</div>
		</div>
		
		<div class="location">
			<div class="page-header">
				<h1 align="left">
					| 기업 위치 <small></small>
				</h1>
			</div>
			<h5>주소 : ${dto.cAddress}</h5>
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
</script>