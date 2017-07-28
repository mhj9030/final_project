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
<title>잡스퀘어 - 커뮤니티</title>


<!-- 소제목 글꼴 -->
<link href="https://fonts.googleapis.com/css?family=Gudea|Yellowtail" rel="stylesheet">
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


<!-- 본인의 css영역 -->
<!-- community_group_list CSS -->
<link href="<%=cp%>/resources/custom_css/community/community_group_list.css" rel="stylesheet">
<!-- community_review_list CSS -->
<link href="<%=cp%>/resources/custom_css/community/community_review_list.css" rel="stylesheet">
<!-- community_news_list CSS -->
<link href="<%=cp%>/resources/custom_css/community/community_news_list.css" rel="stylesheet">
<!-- community_tip_list CSS -->
<link href="<%=cp%>/resources/custom_css/community/community_tip_list.css" rel="stylesheet">
<!-- community_recommend_list CSS -->
<link href="<%=cp%>/resources/custom_css/community/community_recommend_list.css" rel="stylesheet">
<!-- community_free_list CSS -->
<link href="<%=cp%>/resources/custom_css/community/community_free_list.css" rel="stylesheet">
<!-- community_photo_list CSS -->
<link href="<%=cp%>/resources/custom_css/community/community_photo_list.css" rel="stylesheet">
<!-- article_form CSS -->
<link href="<%=cp%>/resources/custom_css/community/community_article.css" rel="stylesheet">
<!-- reply_form CSS -->
<link href="<%=cp%>/resources/custom_css/community/community_reply.css" rel="stylesheet">
<!-- recommend_article_form CSS -->
<link href="<%=cp%>/resources/custom_css/community/community_recommend_article.css" rel="stylesheet">
<!-- community_group_mylist -->
<link href="<%=cp%>/resources/custom_css/community/community_group_mylist.css" rel="stylesheet">
<!-- group_article_form CSS -->
<link href="<%=cp%>/resources/custom_css/community/community_group_article.css" rel="stylesheet">


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