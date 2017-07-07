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

<!-- 중앙정렬용 center-block  -->
<div class="wrapper center-block" style="max-width: 980px;">

<div id="title"class="text-center">
<h2>한국형사정책연구원 제12차 채용공고</h2>
</div>
<div class="text-right">
<h5>날짜 2017-06-27 조회수:58 추천:15</h5>
</div>

<!-- 글내용  content -->
<div id="jumbotron">

	<table class="table table-condensed">
		<tr>
			<td>기관명</td><td>한국형사정책연구원</td><td>분류</td><td>행정지원인력</td>
		</tr>
		<tr>
			<td>등록일</td><td>2017-06-28</td><td>마감일</td><td>2017-07-05</td>
		</tr>
		<tr>
			<td>인턴연구원</td><td>2</td><td>채용인원</td><td>3 명</td>
		</tr>
		<tr class="active">
			<td>원문링크</td><td><a href="https://www.kic.re.kr/news/recruit/hire/Read.jsp?paramNttID=9776&paramPage=1">[클릭]</a></td><td></td><td></td>
		</tr>
	</table>
</div>

<pre style="white-space: pre-wrap;">
국무총리 산하 한국형사정책연구원은「정부출연연구기관 등의 설립·운영 및 육성에 관한 법률」에 의하여 설립된 정부출연연구기관으로서 국가의 형사정책수립과 범죄방지에 이바지 할 유능하고 성실한 인재를 아래와 같이 모집합니다.

2017년 6월 28일 
한국형사정책연구원장
</pre>






	<hr>
	
	<!-- 답글 및 버튼 -->
	<div class="row">
	
			<hr>
			
			
			
			
			<button type="button" style="float: right;" class="btn" onclick="<%=cp%>/employ/gov">목록</button>
	</div>
	
	
		
	


</div>