<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
%>


<script type="text/javascript">
	function sendOk() {
        var f = document.pwdform;

        f.action = "<%=cp%>/profile/pwd";
        f.submit();
	}
</script>

<div id="wrap">
	<div id="content">


		<div class="contents">
			<div class="wrap2">



				

			</div>
		</div>

	</div>

</div>

