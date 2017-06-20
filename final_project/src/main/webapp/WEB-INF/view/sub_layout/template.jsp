<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
	// String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+cp;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    
    <!-- SUB CSS -->
    <link rel="stylesheet" href="<%=cp%>/resources/custom_css/sub_layout.css">
    
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="<%=cp%>/resources/css/bootstrap.min.css">
 
</head>

<body>
    <div style="height: 100%; background-color: black;">
        <video id="video1" height="100%" autoplay="autoplay">
            <source src="<%=cp%>/resources/video/submain.mp4"> </video>
            
<div class="container">

      <form class="form-signin">
        <h2 class="form-signin-heading">사이트 이름 로그인</h2>
        <label for="inputEmail" class="sr-only">E-mail</label>
        <input type="email" id="inputEmail" class="form-control" placeholder="E-mail" required="" autofocus="">
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="">


		<div class = "footer-login"></div>
		<span>회원이 아니신가요?</span> 
        <button class="sub-layout-btn" type="submit">로그인</button>
      </form>

    </div>
        
        
    </div>
</body>

</html>