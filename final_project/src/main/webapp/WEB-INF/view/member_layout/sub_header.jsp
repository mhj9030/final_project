<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
   String cp = request.getContextPath();
%>

<div class="wrap_wide cmenu">
	<div class="wrap">
		<ul class="nav nav-pills" role="tablist">
			<li role="presentation" class="on"><a href="<%=cp%>/profile?mid=${member.userId }">내 프로필</a></li>
			<li role="presentation" class=""><a href="<%=cp%>/member/scrap">채용스크랩</a></li>
			<li role="presentation" class=""><a href="<%=cp%>/member/applications/list">지원서 관리</a></li>
			<li role="presentation" class=""><a href="<%=cp%>/member/myInquiry">나의 문의 내역</a></li>
		</ul>
	</div>
</div>