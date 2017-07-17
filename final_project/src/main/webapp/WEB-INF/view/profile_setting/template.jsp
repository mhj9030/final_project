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

<!-- Bootstrap-Tags-inputs CSS -->
<link href="<%=cp%>/resources/css/bootstrap-tagsinput.css" rel="stylesheet">

<!-- Main_layout CSS -->
<link href="<%=cp%>/resources/custom_css/main_layout.css" rel="stylesheet">

<!-- Main_layout_footer CSS -->
<link href="<%=cp%>/resources/custom_css/main_layout_footer.css" rel="stylesheet">

   <!-- 알림창 JS -->
  <script src="<%=cp%>/resources/js/sweetalert2.min.js" type="text/javascript"></script>
  
    <!-- 알림창 CSS -->
  <link rel="stylesheet" href="<%=cp%>/resources/css/sweetalert2.min.css">

<!-- Profile_layout CSS -->
<link href="<%=cp%>/resources/custom_css/profile_layout.css" rel="stylesheet">

<!-- Jquery 3.1.0 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>

<!-- datepicker JS -->
<script src="<%=cp%>/resources/js/datepicker.js" type="text/javascript"></script>

<!-- Bootstrap JS -->
<script src="<%=cp%>/resources/js/bootstrap.js" type="text/javascript"></script>

<!-- bootstrap-tagsinput.min JS -->
<script src="<%=cp%>/resources/js/bootstrap-tagsinput.min.js" type="text/javascript"></script>

<!-- Setting JS -->
<script src="<%=cp%>/resources/js/setting.js" type="text/javascript"></script>

<!-- Profile JS -->
<script src="<%=cp%>/resources/js/profile.js" type="text/javascript"></script>

  <!-- datepicker CSS -->
  <link rel="stylesheet" href="<%=cp%>/resources/css/datepicker.min.css">

<!-- Font Awesome CSS -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">





</head>
<body>





    <tiles:insertAttribute name="headers"/>

	
	
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

<script type="text/javascript">
$('[data-toggle="datepicker"]').datepicker();
</script>
</html>