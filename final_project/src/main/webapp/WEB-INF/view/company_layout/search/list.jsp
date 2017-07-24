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
		var searchKey="${searchKey}";
		
		$(".name, .size, .type").hide();
		if(searchKey=="cName")
			$(".name").show();
		else if(searchKey=="cSize")
			$(".size").show();
		else
			$(".type").show();
		
		$("input:radio[name=order]:radio[value=${order}]").prop("checked", true);
	});
	
	function select_search(content){
		$(".name, .size, .type").hide();
		$("."+content).show();
	}
	
	$(function(){
		$("input[name=order]").change(function(){
			var f=document.searchForm;
			var order=$(this).val();
	
			var searchKey="${searchKey}";
			var searchValue="${searchValue}";
				
			f.searchKey.value=searchKey;
			f.searchValue.value=searchValue;
			f.order.value=order;
			
			f.action="${listUrl}";
			f.submit();
		});
	});
	
	
	function searchList(searchKey, searchValue, order){
		var f=document.searchForm;
		var order=$("input[name=order]:checked").val();
		
		if(searchValue=="cName"){
			searchValue=$("#cName").val();
		}
		
		f.searchKey.value=searchKey;
		f.searchValue.value=searchValue;
		f.order.value=order;
		
		f.action="${listUrl}";
		f.submit();
	}	
</script>

<div class="search-list-body" align="center">
	<div class="body-header">
		<h3 align="left">| 기업검색
			<small style="font-family: 'Gudea', sans-serif; letter-spacing: 3px; margin-left: 5px; font-size: 16px; font-weight: bold; color: #6d6b6b;">
				Company Search
			</small>
		</h3>
		<hr>
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
					<input id="cName" class="form-control" type="text" placeholder="기업명 검색">
					<button type="button" class="btn btn-info" onclick="searchList('cName', 'cName')">검색</button>
				</div>
				
				<div class="size">
					<div class="btn-group" role="group" aria-label="...">
						<button type="button" class="btn btn-default" onclick="searchList('cSize', '대기업')">대기업</button>
						<button type="button" class="btn btn-default" onclick="searchList('cSize', '중소기업')">중소기업</button>
						<button type="button" class="btn btn-default" onclick="searchList('cSize', '공공기관/공기업')">공공기관/공기업</button>
						<button type="button" class="btn btn-default" onclick="searchList('cSize', '외국계기업')">외국계기업</button>
					</div>
				</div>
				
				<div class="type">		
					<div class="btn-group">
						<button type="button" class="btn btn-default" onclick="searchList('maName', '서비스업')">서비스업</button>
					    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
						    <span class="caret"></span>
						    <span class="sr-only">Toggle Dropdown</span>
					  	</button>
					  	<ul class="dropdown-menu" role="menu">
					    	<li><a href="#" onclick="searchList('subName', '호텔/여행/항공'); return false">호텔/여행/항공</a></li>
					    	<li><a href="#" onclick="searchList('subName', '외식업/식음료'); return false">외식업/식음료</a></li>
					    	<li><a href="#" onclick="searchList('subName', '웨딩/장례/이벤트'); return false">웨딩/장례/이벤트</a></li>
					    	<li><a href="#" onclick="searchList('subName', '뷰티/미용'); return false">뷰티/미용</a></li>
					    	<li><a href="#" onclick="searchList('subName', '레저/스포츠/여가'); return false">레저/스포츠/여가</a></li>
					    	<li><a href="#" onclick="searchList('subName', '기타서비스업'); return false">기타서비스업</a></li>
					  	</ul>
					</div>
					
					<div class="btn-group">
						<button type="button" class="btn btn-default" onclick="searchList('maName', '제조/화학')">제조/화학</button>
					    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
						    <span class="caret"></span>
						    <span class="sr-only">Toggle Dropdown</span>
					  	</button>
					  	<ul class="dropdown-menu" role="menu">
					    	<li><a href="#" onclick="searchList('subName', '전기/전자/제어'); return false">전기/전자/제어</a></li>
					    	<li><a href="#" onclick="searchList('subName', '석유/화학/에너지'); return false">석유/화학/에너지</a></li>
					    	<li><a href="#" onclick="searchList('subName', '섬유/의류'); return false">섬유/의류</a></li>
					    	<li><a href="#" onclick="searchList('subName', '농업/어업/광업'); return false">농업/어업/광업</a></li>
					    	<li><a href="#" onclick="searchList('subName', '기계/설비/자동차'); return false">기계/설비/자동차</a></li>
					    	<li><a href="#" onclick="searchList('subName', '가구/목재/제지'); return false">가구/목재/제지</a></li>
					    	<li><a href="#" onclick="searchList('subName', '조선/항공/우주'); return false">조선/항공/우주</a></li>
					    	<li><a href="#" onclick="searchList('subName', '화장품/뷰티'); return false">화장품/뷰티</a></li>
					    	<li><a href="#" onclick="searchList('subName', '금속/철강'); return false">금속/철강</a></li>
					    	<li><a href="#" onclick="searchList('subName', '생활용품/소비재'); return false">생활용품/소비재</a></li>
					    	<li><a href="#" onclick="searchList('subName', '기타제조업'); return false">기타제조업</a></li>
					  	</ul>
					</div>
					
					<div class="btn-group">
						<button type="button" class="btn btn-default" onclick="searchList('maName', '의료/제약/복지')">의료/제약/복지</button>
					    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
						    <span class="caret"></span>
						    <span class="sr-only">Toggle Dropdown</span>
					  	</button>
					  	<ul class="dropdown-menu" role="menu">
					    	<li><a href="#" onclick="searchList('subName', '의료'); return false">의료</a></li>
					    	<li><a href="#" onclick="searchList('subName', '제약'); return false">제약</a></li>
					    	<li><a href="#" onclick="searchList('subName', '사회복지'); return false">사회복지</a></li> 
					  	</ul>
					</div>
					
					<div class="btn-group">
						<button type="button" class="btn btn-default" onclick="searchList('maName', '판매/유통')">판매/유통</button>
					    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
						    <span class="caret"></span>
						    <span class="sr-only">Toggle Dropdown</span>
					  	</button>
					  	<ul class="dropdown-menu" role="menu">
					    	<li><a href="#" onclick="searchList('subName', '판매'); return false">판매</a></li>
					    	<li><a href="#" onclick="searchList('subName', '유통/무역'); return false">유통/무역</a></li>
					    	<li><a href="#" onclick="searchList('subName', '운송/운수/물류'); return false">운송/운수/물류</a></li> 
					  	</ul>
					</div>
					
					<div class="btn-group">
						<button type="button" class="btn btn-default" onclick="searchList('maName', '교육업')">교육업</button>
					    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
						    <span class="caret"></span>
						    <span class="sr-only">Toggle Dropdown</span>
					  	</button>
					  	<ul class="dropdown-menu" role="menu">
					    	<li><a href="#" onclick="searchList('subName', '초중고대학'); return false">초중고대학</a></li>
					    	<li><a href="#" onclick="searchList('subName', '유아/유치원'); return false">유아/유치원</a></li>
					    	<li><a href="#" onclick="searchList('subName', '교재/학습지'); return false">교재/학습지</a></li>
					    	<li><a href="#" onclick="searchList('subName', '학원'); return false">학원</a></li> 
					    	<li><a href="#" onclick="searchList('subName', '전문/기능학원'); return false">전문/기능학원</a></li> 
					  	</ul>
					</div>
					
					<div class="btn-group">
						<button type="button" class="btn btn-default" onclick="searchList('maName', '건설업')">건설업</button>
					    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
						    <span class="caret"></span>
						    <span class="sr-only">Toggle Dropdown</span>
					  	</button>
					  	<ul class="dropdown-menu" role="menu">
					    	<li><a href="#" onclick="searchList('subName', '건설/건축/토목'); return false">건설/건축/토목</a></li>
					    	<li><a href="#" onclick="searchList('subName', '실내/인테리어'); return false">실내/인테리어</a></li>
					    	<li><a href="#" onclick="searchList('subName', '환경/설비'); return false">환경/설비</a></li>
					    	<li><a href="#" onclick="searchList('subName', '부동산/임대'); return false">부동산/임대</a></li> 
					  	</ul>
					</div>
					
					<div class="btn-group">
						<button type="button" class="btn btn-default" onclick="searchList('maName', 'IT/통신')">IT/통신</button>
					    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
						    <span class="caret"></span>
						    <span class="sr-only">Toggle Dropdown</span>
					  	</button>
					  	<ul class="dropdown-menu" role="menu">
					    	<li><a href="#" onclick="searchList('subName', '인터넷/컨텐츠'); return false">인터넷/컨텐츠</a></li>
					    	<li><a href="#" onclick="searchList('subName', '쇼핑몰'); return false">쇼핑몰</a></li>
					    	<li><a href="#" onclick="searchList('subName', '네트워크/통신'); return false">네트워크/통신</a></li>
					    	<li><a href="#" onclick="searchList('subName', '모바일'); return false">모바일</a></li>
					    	<li><a href="#" onclick="searchList('subName', '하드웨어'); return false">하드웨어</a></li>
					    	<li><a href="#" onclick="searchList('subName', '소프트웨어'); return false">소프트웨어</a></li> 
					    	<li><a href="#" onclick="searchList('subName', '정보보안'); return false">정보보안</a></li> 
					    	<li><a href="#" onclick="searchList('subName', 'IT컨설팅'); return false">IT컨설팅</a></li> 
					    	<li><a href="#" onclick="searchList('subName', '게임'); return false">게임</a></li> 
					  	</ul>
					</div>
					
					<div class="btn-group">
						<button type="button" class="btn btn-default" onclick="searchList('maName', '미디어/디자인')">미디어/디자인</button>
					    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
						    <span class="caret"></span>
						    <span class="sr-only">Toggle Dropdown</span>
					  	</button>
					  	<ul class="dropdown-menu" role="menu">
					    	<li><a href="#" onclick="searchList('subName', '신문/잡지'); return false">신문/잡지</a></li>
					    	<li><a href="#" onclick="searchList('subName', '방송사/케이블'); return false">방송사/케이블</a></li>
					    	<li><a href="#" onclick="searchList('subName', '연예/엔터테인먼트'); return false">연예/엔터테인먼트</a></li>
					    	<li><a href="#" onclick="searchList('subName', '광고/홍보/전시'); return false">광고/홍보/전시</a></li>
					    	<li><a href="#" onclick="searchList('subName', '영화/음악'); return false">영화/음악</a></li> 
					    	<li><a href="#" onclick="searchList('subName', '공연/문화'); return false">공연/문화</a></li> 
					    	<li><a href="#" onclick="searchList('subName', '출판/인쇄/사진'); return false">출판/인쇄/사진</a></li> 
					    	<li><a href="#" onclick="searchList('subName', '캐릭터/애니메이션'); return false">캐릭터/애니메이션</a></li> 
					    	<li><a href="#" onclick="searchList('subName', '디자인/설계'); return false">디자인/설계</a></li> 
					  	</ul>
					</div>
					
					<div class="btn-group">
						<button type="button" class="btn btn-default" onclick="searchList('maName', '은행/금융업')">은행/금융업</button>
					    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
						    <span class="caret"></span>
						    <span class="sr-only">Toggle Dropdown</span>
					  	</button>
					  	<ul class="dropdown-menu" role="menu">
					    	<li><a href="#" onclick="searchList('subName', '은행/금융'); return false">은행/금융</a></li>
					    	<li><a href="#" onclick="searchList('subName', '대출/캐피탈'); return false">대출/캐피탈</a></li>
					    	<li><a href="#" onclick="searchList('subName', '증권/보험'); return false">증권/보험</a></li>
					    	<li><a href="#" onclick="searchList('subName', '기타금융'); return false">기타금융</a></li>
					  	</ul>
					</div>
					
					<div class="btn-group">
						<button type="button" class="btn btn-default" onclick="searchList('maName', '기관/협회')">기관/협회</button>
					    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
						    <span class="caret"></span>
						    <span class="sr-only">Toggle Dropdown</span>
					  	</button>
					  	<ul class="dropdown-menu" role="menu">
					    	<li><a href="#" onclick="searchList('subName', '정부/공기업'); return false">정부/공기업</a></li>
					    	<li><a href="#" onclick="searchList('subName', '협회/단체'); return false">협회/단체</a></li>
					    	<li><a href="#" onclick="searchList('subName', '법률/법무/특허'); return false">법률/법무/특허</a></li>
					    	<li><a href="#" onclick="searchList('subName', '세무/회계'); return false">세무/회계</a></li>
					  	</ul>
					</div>
				</div>
			</div>
			<div class="search-reset">
				<button class="btn btn-default" type="button" onclick="javascript:location.href='<%=cp%>/company/search';">새로고침</button>
			</div>
		</div>
		
	<form name="searchForm" action="" method="post">
       <input type="hidden" name="searchKey">		
       <input type="hidden" name="searchValue">		
       <input type="hidden" name="order">
	</form>
	
	<div class="list">
		<div class="list-header">
			<div class="subject" align="left">
				<c:if test="${empty searchValue}">
					<h4>전체 기업(${dataCount})</h4>
				</c:if>
				<c:if test="${not empty searchValue}">
					<h4>검색 결과(${dataCount})</h4>
				</c:if>
			</div>
			<div class="chk_info" align="right">
				<input type="radio" name="order" value="recent" checked="checked"> 최신순
				<input type="radio" name="order" value="employ"> 채용진행순
			</div>
		</div>
		
		<c:forEach var="dto" items="${list}">
			<div class="list-item">
				<div class="item-image">
					<c:if test="${not empty dto.cLogoImage}">
						<img width="80px" src="<%=cp%>/uploads/company/${dto.cLogoImage}">
					</c:if>
					<c:if test="${empty dto.cLogoImage}">
						<img width="80px" src="<%=cp%>/resources/image/profile_img.jpg">
					</c:if>
				</div>
				<div class="item-content">
					<div class="content-name">
						<h4><a href="${articleUrl}&cNum=${dto.cNum}">${dto.cName}</a></h4>
					</div>
					<div class="content-employ" align="right">
							<c:if test="${dto.employ_cnt>0}">
								<a href="<%=cp%>/employ/main">채용진행 : ${dto.employ_cnt}</a>
							</c:if>
						</div>
					<div class="content-intro"><h5>${dto.cDescription}</h5></div>
					<div class="content-type"><h5>${dto.maName} : ${dto.subName}</h5></div>
				</div>
			</div>
		</c:forEach>
		<div class="page">
			<div>${paging}</div>
		</div>
	</div>
</div>









