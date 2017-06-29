<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript" src="<%=cp%>/resources/js/jquery-3.1.0.min.js"></script>

<script type="text/javascript">
	$(function(){
		$(".name, .size, .type").hide();
		$(".name").show();
	});
	
	function select_search(content){
		$(".name, .size, .type").hide();
		$("."+content).show();
	}
	
</script>

<div class="list-body" align="center">
	<div class="page-header">
		<h1 align="left">
			| 기업검색 <small></small>
		</h1>
	</div>
	
	<div class="search">
		<div class="search-header" align="left"><h4>검색 조건</h4></div>
		<div class="search-select">
			<div class="btn-group">
	  			<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
	    			선택 <span class="caret"></span>
	  			</button>
				<ul class="dropdown-menu" role="menu">
					<li><a href="#" onclick="select_search('name'); return false">기업명</a></li>
				    <li><a href="#" onclick="select_search('size'); return false">기업형태</a></li>
				    <li><a href="#" onclick="select_search('type'); return false">업종</a></li>
				</ul>
			</div>
		</div>
		
		<div class="search-content">
			<div class="name">
				<input class="form-control" type="text" placeholder="기업명 검색">
				<button type="submit" class="btn btn-info">검색</button>
			</div>
			
			<div class="size">
				<div class="btn-group" role="group" aria-label="...">
					<button type="button" class="btn btn-default">대기업</button>
					<button type="button" class="btn btn-default">중소기업</button>
					<button type="button" class="btn btn-default">공공기관/공기업</button>
				</div>
			</div>
			
			<div class="type">		
				<div class="btn-group">
					<button type="button" class="btn btn-default">서비스업</button>
				    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
					    <span class="caret"></span>
					    <span class="sr-only">Toggle Dropdown</span>
				  	</button>
				  	<ul class="dropdown-menu" role="menu">
				    	<li><a href="#">호텔/여행/항공</a></li>
				    	<li><a href="#">외식업/식음료</a></li>
				    	<li><a href="#">웨딩/장례/이벤트</a></li>
				    	<li><a href="#">뷰티/미용</a></li>
				    	<li><a href="#">레저/스포츠/여가</a></li>
				    	<li><a href="#">기타서비스업</a></li>
				  	</ul>
				</div>
				
				<div class="btn-group">
					<button type="button" class="btn btn-default">제조/화학</button>
				    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
					    <span class="caret"></span>
					    <span class="sr-only">Toggle Dropdown</span>
				  	</button>
				  	<ul class="dropdown-menu" role="menu">
				    	<li><a href="#">전기/전자/제어</a></li>
				    	<li><a href="#">석유/화학/에너지</a></li>
				    	<li><a href="#">섬유/의류</a></li>
				    	<li><a href="#">농업/어업/광업</a></li>
				    	<li><a href="#">기계/설비/자동차</a></li>
				    	<li><a href="#">가구/목재/제지</a></li>
				    	<li><a href="#">조선/항공/우주</a></li>
				    	<li><a href="#">화장품/뷰티</a></li>
				    	<li><a href="#">금속/철강</a></li>
				    	<li><a href="#">생활용품/소비재</a></li>
				    	<li><a href="#">기타제조업</a></li>
				  	</ul>
				</div>
				
				<div class="btn-group">
					<button type="button" class="btn btn-default">의료/제약/복지</button>
				    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
					    <span class="caret"></span>
					    <span class="sr-only">Toggle Dropdown</span>
				  	</button>
				  	<ul class="dropdown-menu" role="menu">
				    	<li><a href="#">의료</a></li>
				    	<li><a href="#">제약</a></li>
				    	<li><a href="#">사회복지</a></li> 
				  	</ul>
				</div>
				
				<div class="btn-group">
					<button type="button" class="btn btn-default">판매/유통</button>
				    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
					    <span class="caret"></span>
					    <span class="sr-only">Toggle Dropdown</span>
				  	</button>
				  	<ul class="dropdown-menu" role="menu">
				    	<li><a href="#">판매</a></li>
				    	<li><a href="#">유통/무역</a></li>
				    	<li><a href="#">운송/운수/물류</a></li> 
				  	</ul>
				</div>
				
				<div class="btn-group">
					<button type="button" class="btn btn-default">교육업</button>
				    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
					    <span class="caret"></span>
					    <span class="sr-only">Toggle Dropdown</span>
				  	</button>
				  	<ul class="dropdown-menu" role="menu">
				    	<li><a href="#">초중고대학</a></li>
				    	<li><a href="#">유아/유치원</a></li>
				    	<li><a href="#">교재/학습지</a></li>
				    	<li><a href="#">학원</a></li> 
				    	<li><a href="#">전문/기능학원</a></li> 
				  	</ul>
				</div>
				
				<div class="btn-group">
					<button type="button" class="btn btn-default">건설업</button>
				    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
					    <span class="caret"></span>
					    <span class="sr-only">Toggle Dropdown</span>
				  	</button>
				  	<ul class="dropdown-menu" role="menu">
				    	<li><a href="#">건설/건축/토목</a></li>
				    	<li><a href="#">실내/인테리어</a></li>
				    	<li><a href="#">환경/설비</a></li>
				    	<li><a href="#">부동산/임대</a></li> 
				  	</ul>
				</div>
				
				<div class="btn-group">
					<button type="button" class="btn btn-default">IT/통신</button>
				    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
					    <span class="caret"></span>
					    <span class="sr-only">Toggle Dropdown</span>
				  	</button>
				  	<ul class="dropdown-menu" role="menu">
				    	<li><a href="#">인터넷/컨텐츠</a></li>
				    	<li><a href="#">쇼핑몰</a></li>
				    	<li><a href="#">네트워크/통신</a></li>
				    	<li><a href="#">하드웨어</a></li>
				    	<li><a href="#">소프트웨어</a></li> 
				    	<li><a href="#">정보보안</a></li> 
				    	<li><a href="#">IT컨설팅</a></li> 
				    	<li><a href="#">게임</a></li> 
				  	</ul>
				</div>
				
				<div class="btn-group">
					<button type="button" class="btn btn-default">미디어/디자인</button>
				    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
					    <span class="caret"></span>
					    <span class="sr-only">Toggle Dropdown</span>
				  	</button>
				  	<ul class="dropdown-menu" role="menu">
				    	<li><a href="#">신문/잡지</a></li>
				    	<li><a href="#">방송사/케이블</a></li>
				    	<li><a href="#">연예/엔터테인먼트</a></li>
				    	<li><a href="#">광고/홍보/전시</a></li>
				    	<li><a href="#">영화/음악</a></li> 
				    	<li><a href="#">공연/문화</a></li> 
				    	<li><a href="#">출판/인쇄/사진</a></li> 
				    	<li><a href="#">캐릭터/애니메이션</a></li> 
				    	<li><a href="#">디자인/설계</a></li> 
				  	</ul>
				</div>
				
				<div class="btn-group">
					<button type="button" class="btn btn-default">은행/금융업</button>
				    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
					    <span class="caret"></span>
					    <span class="sr-only">Toggle Dropdown</span>
				  	</button>
				  	<ul class="dropdown-menu" role="menu">
				    	<li><a href="#">은행/금융</a></li>
				    	<li><a href="#">대출/캐피탈</a></li>
				    	<li><a href="#">증권/보험</a></li>
				    	<li><a href="#">기타금융</a></li>
				  	</ul>
				</div>
				
				<div class="btn-group">
					<button type="button" class="btn btn-default">기관/협회</button>
				    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
					    <span class="caret"></span>
					    <span class="sr-only">Toggle Dropdown</span>
				  	</button>
				  	<ul class="dropdown-menu" role="menu">
				    	<li><a href="#">정부/공기업</a></li>
				    	<li><a href="#">협회/단체</a></li>
				    	<li><a href="#">법률/법무/특허</a></li>
				    	<li><a href="#">세무/회계</a></li>
				  	</ul>
				</div>
			</div>
		</div>
		
		<div class="search-reset">
			<button class="btn btn-default" type="button" onclick="javascript:location.href='<%=cp%>/company/search';">새로고침</button>
		</div>
	</div>
	
	<div class="list">
		<div class="list-header">
			<div class="subject" align="left"><h4>전체 기업(142)</h4></div>
			<div class="chk_info" align="right">
				<input type="radio" name="chk_info" value="" checked="checked"> 최신순
				<input type="radio" name="chk_info" value=""> 인기순
			</div>
		</div>
	
		<div class="list-item">
			<div class="item-image">
				<img src="<%=cp%>/resources/image/Desert.jpg">
			</div>
			<div class="item-content">
				<div class="content-name">
					<h4><a href="<%=cp%>/company/search/article">KH정보교육원</a></h4>
				</div>
				<div class="content-intro"><h5>최고의 교육원!!!!!</h5></div>
				<div class="content-type"><h5>교육업 : 전문/기능학원</h5></div>
			</div>
		</div>
	</div>
</div>









