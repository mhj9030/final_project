<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>

<style>
.marketDiv{
	clean;
	//border: 1px solid black;
	float:left;
	text-align: center;
	width: 300px;
	height: 300px;
}
</style>

<div class="list_wrap">
	<h3>| 포인트 마켓</h3>
	
	<!-- 나의 포인트 -->
	<div style="height: 100px; text-align: center; font-size: 7;">
		<b>${userName}</b> 님의 사용가능한 포인트 <b>${point.mypoint}</b> 원
	</div>
	<div>
		<div class="marketDiv">
			<img src="" width="150px" height="150px" /><br>
			지원분야<br>
			직종<br>
			<!-- 열람횟수<br> -->
			<button>-3000p</button>
		</div>
		<div class="marketDiv">
			<img src="" width="150px" height="150px" /><br>
			지원분야<br>
			직종<br>
			<!-- 열람횟수<br> -->
			<button>-3000p</button>
		</div>
		<div class="marketDiv">
			<img src="" width="150px" height="150px" /><br>
			지원분야<br>
			직종<br>
			<!-- 열람횟수<br> -->
			<button>-3000p</button>
		</div>
		<div class="marketDiv">
			<img src="" width="150px" height="150px" /><br>
			지원분야<br>
			직종<br>
			<!-- 열람횟수<br> -->
			<button>-3000p</button>
		</div>
		<div class="marketDiv">
			<img src="" width="150px" height="150px" /><br>
			지원분야<br>
			직종<br>
			<!-- 열람횟수<br> -->
			<button>-3000p</button>
		</div>
		<div class="marketDiv">
			<img src="" width="150px" height="150px" /><br>
			지원분야<br>
			직종<br>
			<!-- 열람횟수<br> -->
			<button>-3000p</button>
		</div>
	</div>
</div>