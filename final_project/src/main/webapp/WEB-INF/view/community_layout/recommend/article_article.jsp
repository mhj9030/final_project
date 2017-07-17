<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
%>
	<div class="recommend_article_info_nameandContent">
		<div class="recommend_article_info_name">
			${dto.mName}님의 기업 후기 입니다.<small style="font-size: 10px; margin-left: 80px; cursor: pointer;" onclick="hideInfo(${dto.gcNum});">▲ 접기</small>
		</div>
		<div class="recommend_article_info_content" style="">
			${dto.content}
		</div>
		<div id="listReply"></div>
	</div>
