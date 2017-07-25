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
            <li role="presentation" class="${notice}"><a href="<%=cp%>/help_layout/notice/list">공지사항</a></li>
            <li role="presentation" class="${faq}"><a href="<%=cp%>/help/faq">자주묻는질문</a></li>
            <li role="presentation" class="${qa}"><a href="<%=cp%>/help_layout/qa/list">질문과답변</a></li>
            <li role="presentation" class="${claim}"><a href="<%=cp%>/help_layout/claim/list">문의하기</a></li>
            <li role="presentation" class="${event}"><a href="<%=cp%>/help_layout/event/list">이벤트</a></li>
            <li role="presentation" class="${survey}"><a href="<%=cp%>/help/survey">설문</a></li>
        </ul>
    </div>
</div>
