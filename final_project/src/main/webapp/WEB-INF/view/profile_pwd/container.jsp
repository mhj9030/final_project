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



				<form name="pwdform" class="form-horizontal pwd" method="post">
					

					<fieldset>


						<div class = "form-group">
						<img alt="사용자 확인" src="<%=cp%>/resources/image/security.png" style="">
						<p>사용자 확인을 위해 본인의 비밀번호를 다시 한번 입력해 주세요.</p>
						</div>
	
						<!-- Password input-->
						<div class="form-group">
							
							<input id="passwordinput" name="userpassword" type="password"
								placeholder="비밀번호" required="required" class="form-control input-md">

						</div>

					</fieldset>
					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-lg btn-block" onclick="sendOk();"><span class="glyphicon glyphicon-check"></span> 확인</button>
						<input type="hidden" name="mode" value="${mode}">
					</div>
					<p>${message }</p>
				</form>

			</div>
		</div>

	</div>

</div>

