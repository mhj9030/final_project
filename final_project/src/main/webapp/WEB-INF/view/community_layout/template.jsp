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
<!-- Main_layout_footer CSS -->
<link href="<%=cp%>/resources/custom_css/main_layout_footer.css" rel="stylesheet">
<!-- Jquery 3.1.0 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
<!-- Bootstrap JS -->
<script src="<%=cp%>/resources/js/bootstrap.js" type="text/javascript"></script>
<!-- Profile_layout CSS -->
<link href="<%=cp%>/resources/custom_css/profile_layout.css" rel="stylesheet">
<!-- smart edit -->
<script type="text/javascript" src="<%=cp%>/resources/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- created_form CSS -->
<link href="<%=cp%>/resources/custom_css/created_form.css" rel="stylesheet">
<!-- list_form CSS -->
<link href="<%=cp%>/resources/custom_css/list_form.css" rel="stylesheet">



<!-- 본인의 css영역 -->
<!-- community_group_list CSS -->
<link href="<%=cp%>/resources/custom_css/community_group_list.css" rel="stylesheet">
<!-- community_review_list CSS -->
<link href="<%=cp%>/resources/custom_css/community_review_list.css" rel="stylesheet">
<!-- community_news_list CSS -->
<link href="<%=cp%>/resources/custom_css/community_news_list.css" rel="stylesheet">
<!-- community_tip_list CSS -->
<link href="<%=cp%>/resources/custom_css/community_tip_list.css" rel="stylesheet">
<!-- community_recommend_list CSS -->
<link href="<%=cp%>/resources/custom_css/community_recommend_list.css" rel="stylesheet">
<!-- community_free_list CSS -->
<link href="<%=cp%>/resources/custom_css/community_free_list.css" rel="stylesheet">
<!-- community_photo_list CSS -->
<link href="<%=cp%>/resources/custom_css/community_photo_list.css" rel="stylesheet">
<!-- article_form CSS -->
<link href="<%=cp%>/resources/custom_css/community_article.css" rel="stylesheet">
<!-- reply_form CSS -->
<link href="<%=cp%>/resources/custom_css/community_reply.css" rel="stylesheet">

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