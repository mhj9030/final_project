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
<style type="text/css">
.blank{
 	height : 50px;
}

.wrap{
	width: 920px;
	margin: 0 auto;
}

.panel-title{
	line-height: 50px;
	font-size: 17px;
	color : black;
}

.panel-link{
	line-height: 50px;
	font-size: 10px;
	color : #ccc;
	text-decoration: none;
}

.panel-group{
	height: 320px; 
	border: 1px solid black;
		
}

.panel-group .group-img{
	height: 50%;
	background-image: url('<%=cp%>/resources/image/Desert.jpg');
	background-size: cover;
}

.panel-hire{
	height: 220px; 
	border: 1px solid black;
}

.panel-busi{
	height: 220px;
	border: 1px solid black;
}

.panel-news{
	height: 500px;
	border: 1px solid black;
}


</style>


</head>
<body>



<div class="header">
    <tiles:insertAttribute name="header"/>
</div>

<div class="body">
    <tiles:insertAttribute name="body"/>
</div>
</body>
<!-- 회원가입 모달 창 -->
<script type="text/javascript">
  $('#job-register').on('shown.bs.modal', function () {
    $('#myInput').focus()
  })
</script>
</html>