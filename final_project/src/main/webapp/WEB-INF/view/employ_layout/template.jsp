<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
    
 <%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>잡스퀘어 - 채용</title>


<!-- Bootstrap CSS -->
<link href="<%=cp%>/resources/css/bootstrap.min.css" rel="stylesheet">
<!-- Main_layout CSS -->
<link href="<%=cp%>/resources/custom_css/main_layout.css" rel="stylesheet">
<!-- Main_layout_footer CSS -->
<link href="<%=cp%>/resources/custom_css/main_layout_footer.css" rel="stylesheet">
<!-- Main_layout_container CSS -->
<link href="<%=cp%>/resources/custom_css/main_layout_container.css" rel="stylesheet">
<!-- Jquery 3.1.0 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
<!-- Bootstrap JS -->
<script src="<%=cp%>/resources/js/bootstrap.js" type="text/javascript"></script>
<!-- Profile_layout CSS -->
<link href="<%=cp%>/resources/custom_css/profile_layout.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gudea|Yellowtail" rel="stylesheet">


<!-- Profile JS -->
<script src="<%=cp%>/resources/js/profile.js" type="text/javascript"></script>
<!-- 알림창 JS -->
<script src="<%=cp%>/resources/js/sweetalert2.min.js" type="text/javascript"></script>
<!-- 로그인 JS -->
<script src="<%=cp%>/resources/js/login.js" type="text/javascript"></script>

</head>
<body>
    <tiles:insertAttribute name="headers"/>
	<tiles:insertAttribute name="sub_headers"/>
    <tiles:insertAttribute name="body"/>
    <tiles:insertAttribute name="footers"/>
</body>
<!-- 회원가입/로그인 모달 창 -->
<script type="text/javascript">
  $('#job-register').on('shown.bs.modal', function () {
  })
  
    $('#job-login').on('shown.bs.modal', function () {
  })
</script>
</html>