<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
%>

<div class="body-container" style="width: 800px; height: 650px; margin: 0px auto; text-align: center;">
     <img alt="" src="<%=cp%>/resources/image/img_permission.gif" style="width: 800px; height: 550px">
 
     <button class="btn btn-default btn-lg" onclick="javascript:location.href='<%=cp%>/main'" style="color: white; background-color: #2d3c4b; border-color: #2d3c4b;">
     	메인 화면으로 이동
     </button>
</div>