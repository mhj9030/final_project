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
<title>사이트 타이틀</title>

<!-- Bootstrap CSS -->
<link href="<%=cp%>/resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Main_layout CSS -->
<link href="<%=cp%>/resources/custom_css/main_layout.css" rel="stylesheet">

  <!-- Jquery 3.1.0 -->
  <script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>

  <!-- Bootstrap JS -->
  <script src="<%=cp%>/resources/js/bootstrap.js" type="text/javascript"></script>




</head>
<body>

<div class="header">
    <tiles:insertAttribute name="header"/>
</div>

</body>
<!-- 회원가입 모달 창 -->
<script type="text/javascript">
  $('#job-register').on('shown.bs.modal', function () {
    $('#myInput').focus()
  })
</script>
</html>