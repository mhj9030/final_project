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
            <li role="presentation" class="${main}"><a href="<%=cp%>/point/main">포인트소개</a></li>
            <li role="presentation" class="${mypoint}"><a href="<%=cp%>/point/mypoint">나의포인트</a></li>
            <li role="presentation" class="${market}"><a href="<%=cp%>/point/market">포인트마켓</a></li>
            <li role="presentation" class="${storagy}"><a href="<%=cp%>/point/storagy">이력서보관함</a></li>
            <li role="presentation" class="${saveEvent}"><a href="<%=cp%>/point/saveEvent">포인트복권</a></li>
        </ul>
    </div>
</div>