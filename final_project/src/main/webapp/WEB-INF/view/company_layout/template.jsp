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
<title>잡스퀘어 - 기업</title>


<!-- Bootstrap CSS -->
<link href="<%=cp%>/resources/css/bootstrap.min.css" rel="stylesheet">
<!-- Main_layout CSS -->
<link href="<%=cp%>/resources/custom_css/main_layout.css" rel="stylesheet">
<!-- Main_layout_footer CSS -->
<link href="<%=cp%>/resources/custom_css/main_layout_footer.css" rel="stylesheet">
<!-- Jquery 3.1.0 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
<!-- Bootstrap JS -->
<script src="<%=cp%>/resources/js/bootstrap.js" type="text/javascript"></script>
<!-- Profile_layout CSS -->
<link href="<%=cp%>/resources/custom_css/profile_layout.css" rel="stylesheet">
<!-- list_form CSS -->
<link href="<%=cp%>/resources/custom_css/list_form.css" rel="stylesheet">
<!-- 알림창 CSS -->
<link rel="stylesheet" href="<%=cp%>/resources/css/sweetalert2.min.css">
<!-- 알림창 JS -->
<script src="<%=cp%>/resources/js/sweetalert2.min.js" type="text/javascript"></script>
<!-- 로그인 JS -->
<script src="<%=cp%>/resources/js/login.js" type="text/javascript"></script>
<!-- Profile_layout CSS -->
<link href="<%=cp%>/resources/custom_css/profile_layout.css" rel="stylesheet">
<!-- Font Awesome CSS -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<!-- Profile JS -->
<script src="<%=cp%>/resources/js/profile.js" type="text/javascript"></script>
<!-- 글꼴 -->
<link href="https://fonts.googleapis.com/css?family=Gudea|Yellowtail" rel="stylesheet">

<!-- company 전용 CSS -->
<!-- company_search_list.css -->
<link href="<%=cp%>/resources/custom_css/company_search_list.css" rel="stylesheet">
<!-- company_search_article.css -->
<link href="<%=cp%>/resources/custom_css/company_search_article.css" rel="stylesheet">
<!-- company_created.css -->
<link href="<%=cp%>/resources/custom_css/company_created.css" rel="stylesheet">
<!-- company_employ_list.css -->
<link href="<%=cp%>/resources/custom_css/company_employ_list.css" rel="stylesheet">
<!-- company_applicant_list.css -->
<link href="<%=cp%>/resources/custom_css/company_applicant_list.css" rel="stylesheet">
<!-- company_employ_created.css -->
<link href="<%=cp%>/resources/custom_css/company_employ_created.css" rel="stylesheet">
<!-- created_form.css -->
<link href="<%=cp%>/resources/custom_css/created_form.css" rel="stylesheet">
<!-- company_inquiry_list.css -->
<link href="<%=cp%>/resources/custom_css/company_inquiry_list.css" rel="stylesheet">
<!-- company_inquiry_article.css -->
<link href="<%=cp%>/resources/custom_css/company_inquiry_article.css" rel="stylesheet">
<!-- company_inquiry_created.css -->
<link href="<%=cp%>/resources/custom_css/company_inquiry_created.css" rel="stylesheet">
<!-- company_goverNews_list.css -->
<link href="<%=cp%>/resources/custom_css/company_goverNews_list.css" rel="stylesheet">
<!-- company_goverNews_created.css -->
<link href="<%=cp%>/resources/custom_css/company_goverNews_created.css" rel="stylesheet">
<!-- company_goverNews_article.css -->
<link href="<%=cp%>/resources/custom_css/company_goverNews_article.css" rel="stylesheet">

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