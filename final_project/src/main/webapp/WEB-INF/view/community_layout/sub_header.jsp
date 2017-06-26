<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>

<div class="wrap_wide cmenu">
    <div class="wrap">
		<ul class="nav nav-pills" role="tablist">
            <li role="presentation" class="${review}"><a href="<%=cp%>/community/review">면접후기</a></li>
            <li role="presentation" class="${group}"><a href="<%=cp%>/community/group">그룹</a></li>
            <li role="presentation" class="${news}"><a href="<%=cp%>/community/news">취업뉴스</a></li>
            <li role="presentation" class="${tip}"><a href="<%=cp%>/community/tip">취업꿀팁</a></li>
            <li role="presentation" class="${recommend}"><a href="<%=cp%>/community/recommend">기업 추천 게시판</a></li>
            <li role="presentation" class="${free}"><a href="<%=cp%>/community/free">자유게시판</a></li>
            <li role="presentation" class="${photo}"><a href="<%=cp%>/community/photo">포토갤러리</a></li>
        </ul>
    </div>
</div>
