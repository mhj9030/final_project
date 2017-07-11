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
            <li role="presentation" class="${company}"><a href="<%=cp%>/employ/main">기업채용정보</a></li>
            <li role="presentation" class="${gov}"><a href="<%=cp%>/employ/gov">공무원채용정보</a></li>
        </ul>
    </div>
</div>
