<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
%>


<div>
	<form name="company_form">
		<c:if test="${not empty list}">
			<div style="overflow-y: scroll; height: 200px;">
				<c:forEach var="dto" items="${list}">
					<div style="font-weight: bold; margin: 10px;">
						<input type="radio" name="companyNum" value="${dto.cNum}">${dto.cName}
						<input type="hidden" name="companyName${dto.cNum}" value="${dto.cName}">
					</div>
				</c:forEach>
			</div>
		</c:if>
		<c:if test="${empty list}">
			<span style="color:red;">찾는 기업은 등록되어 있지 않습니다.</span>
		</c:if>
	</form>
</div>