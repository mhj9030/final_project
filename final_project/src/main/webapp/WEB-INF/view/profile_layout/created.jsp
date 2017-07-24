<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>
<script>
	function changePhoto(html, $target){
		if (html.files && html.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $target.css('display', '');
	            $target.html('<img src="' + e.target.result + '" border="0" alt="" />');
	        }
	        reader.readAsDataURL(html.files[0]);
	    } else{
	    	$target.html('<img src="/final_project/resources/image/profile_img.jpg" border="0" alt="" />');
	    	$("#profile-photo-input").val("");
	    }
	}
	
	function updateProfile(){
		var f=document.profileForm;
		
		f.action="<%=cp%>/profile/update";
		f.submit();
	}
</script>

<div class="profile-created-body">
	<div class="body-header">
		<h3>
			| 프로필 수정
			<small style="font-family: 'Gudea', sans-serif; letter-spacing: 3px; margin-left: 5px; font-size: 16px; font-weight: bold; color: #6d6b6b;">
				Profile Update
			</small>
		</h3>
		<hr>
	</div>
	
	<form name="profileForm" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label>프로필 사진</label>
			<div id="profile-image" class="profile-image">
				<c:if test="${not empty dto.proPhoto}">
					<img class="profile-image" src="<%=cp%>/uploads/profile/${dto.proPhoto}" alt="">
				</c:if>
				<c:if test="${empty dto.proPhoto}">
					<img class="profile-image" src="/final_project/resources/image/profile_img.jpg" alt="">
				</c:if>
			</div>
			
			<div class="profile-image-delete">
				<a href="#" onclick="changePhoto(this, $('#profile-image')); return false">
					<span class="glyphicon glyphicon-remove"></span>삭제
				</a>
			</div>
			<div>
				<label>사진변경</label>
				<input id="profile-photo-input" name="upload" type="file" onchange="changePhoto(this, $('#profile-image'));">
			</div>
		</div>
	
		<div class="form-group">
			<label>자기소개</label>
			<textarea name="proIntro" class="profile-intro" rows="5">${dto.proIntro}</textarea>
		</div>
		<button type="button" class="btn btn-default" onclick="updateProfile();">수정</button>
		<input type="hidden" name="mid" value="${dto.mid}">
	</form>
</div>



