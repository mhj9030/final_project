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
            <li role="presentation" class="on"><a href="/@maryjune778">내 프로필</a></li>
            <li role="presentation" class=""><a href="/@maryjune778/friends">내 친구들</a></li>
            <li role="presentation" class=""><a href="/@maryjune778/find-friends">친구 찾기 </a></li>
            <li role="presentation" class=""><a href="/@maryjune778/activities">활동로그</a></li>
            <li role="presentation" class=""><a href="/@maryjune778/notifications">알림 </a></li>
            <li role="presentation" class=""><a href="/@maryjune778/applications">지원서 관리</a></li>
        </ul>
    </div>
</div>