<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
	// String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+cp;
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구인구직 사이트</title>

<!-- SUB CSS -->
<link rel="stylesheet"
	href="<%=cp%>/resources/custom_css/sub_layout.css">

<!-- Font Awesome CSS CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>

	<div id="content-bg">




		<div class="content-form-right">
			<div class="sub-layout-title">
				<h3>가입하기</h3>
				<h4>항상 지금처럼 무료로 즐기실 수 있습니다.</h4>
			</div>
			
			<input type="text" placeholder="성" class="created-firstname" required="required"> <input type="text" placeholder="이름" class="created-firstname"> 
			<input type="email" placeholder="Email" class="created-email" required="required">
			
			<input type="password" placeholder="비밀번호" class="created-password" required="required">


			<h3>생일</h3>
		</div>

		<div class="content-form-left"></div>






	</div>



</body>
</html>