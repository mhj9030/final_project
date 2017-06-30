<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>
<div class="photo_list_wrap">
	<h3>| 포토갤러리</h3>
	<p>
		자유롭게 사진을 공유할 수 있습니다.
	</p>
	<div class="photo_list_subwrap">
		<c:forEach var="d" begin="1" end="6" step="1" >
			<div class="photo_list">
				<div class="photo_list_btns">
					<button class="btn btn-default btn-sm">1</button>
					<button class="btn btn-default btn-sm">1</button>
					<button class="btn btn-default btn-sm">1</button>
				</div>
				<div class="photo_list_img">
					<img src="<%=cp%>/resources/image/Desert.jpg">
				</div>
				<div class="photo_list_subject">
					덥다 더워!
				</div>
				<div class="photo_list_create">
					김민혁 | 2017-06-29
				</div>
			</div>
			<c:if test="${d==3}">
			<br>
			</c:if>
		</c:forEach>
	</div>
</div>