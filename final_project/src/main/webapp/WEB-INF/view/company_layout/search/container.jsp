<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>

<div>
	<div><h4>기업 정보</h4></div>
	<div>
		<div><h5>기업 검색</h5></div>
		
		<div class="btn-group">
  			<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
    			선택 <span class="caret"></span>
  			</button>
			<ul class="dropdown-menu" role="menu">
				<li><a href="#">기업명</a></li>
			    <li><a href="#">기업형태</a></li>
			    <li><a href="#">업종</a></li>
			</ul>
		</div>
		
		<div>
			<input type="text" placeholder="기업명 검색">
			<button type="submit">검색</button>
		</div>
		
		<div class="btn-group" role="group" aria-label="...">
			<button type="button" class="btn btn-default">Left</button>
			<button type="button" class="btn btn-default">Middle</button>
			<button type="button" class="btn btn-default">Right</button>
		</div>
		
		<div>
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
				<button type="button" class="btn btn-default">서비스업</button>
			    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
				    <span class="caret"></span>
				    <span class="sr-only">Toggle Dropdown</span>
			  	</button>
			  	<ul class="dropdown-menu" role="menu">
			    	<li><a href="#">전기/전자/제어</a></li>
			    	<li><a href="#">석유/화학/에너지</a></li>
			    	<li><a href="#">섬유/의류</a></li>
			    	<li><a href="#">뷰티/미용</a></li>
			    	<li><a href="#">레저/스포츠/여가</a></li>
			    	<li><a href="#">기타서비스업</a></li>
			    	<li><a href="#">기타서비스업</a></li>
			    	<li><a href="#">기타서비스업</a></li>
			    	<li><a href="#">기타서비스업</a></li>
			    	<li><a href="#">기타서비스업</a></li>
			    	<li><a href="#">기타서비스업</a></li>
			  	</ul>
			</div>
		</div>
	</div>
</div>









