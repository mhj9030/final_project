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
            <li role="presentation" class="${search}"><a href="<%=cp%>/company/search">기업검색</a></li>
            <li role="presentation" class="${created}">
            	<c:if test="${empty sessionScope.member.cSerial}">
            		<a href="<%=cp%>/company/created">기업등록</a>
            	</c:if>
            	<c:if test="${not empty sessionScope.member.cSerial}">
            		<a href="<%=cp%>/company/update">기업정보수정</a>
            	</c:if>           	
            </li>
            <li role="presentation" class="${employ}"><a href="<%=cp%>/company/employ">채용관리</a></li>
            <li role="presentation" class="${applicant}"><a href="<%=cp%>/company/applicant">지원자현황</a></li>
            <li role="presentation" class="${inquiry}"><a href="<%=cp%>/company/inquiry">기업문의</a></li>
            <li role="presentation" class="${gover_news}"><a href="<%=cp%>/company/gover_news">공무원소식</a></li>
            <li role="presentation" class="${gover_job}"><a href="<%=cp%>/company/gover_job">공무원직무소개</a></li>
        </ul>
    </div>
</div>
