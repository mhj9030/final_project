<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>

<div class="page_body">
	<div class="page_head">
		<h3>| 포인트 복권</h3><hr>
	</div>

	<div id="pointEvent">
		<div>
			500포인트로 최대 5000포인트까지!<br><br>
			<div id="randImg" style="width: 100%; height: 250px;">
				<a href="#" onclick="random()"><img src="" width="450px" height="200px"></a>
			</div>
		</div>
		<div>
			<br><br>
			※ 주의사항<br>
			매일 한번만 뽑을 수 있습니다.
			포인트는 100 ~ 6000 포인트 사이로 나옵니다.
		</div>
	</div>
</div>

<script>
function random(){
	var url = "<%=cp%>/point/saveEvent/randomPoint";
	
	$.ajax({
		type: "get",
		url: url,
		data: "",
		dataType: "json",
		success: function(data) {
			print(data);
		},
		error: function(e){
			console.log(e)
		}
	});
}

function print(data) {
	var out = "";
	
	if(data.point.length!=0){
		out += "<br><br><br><br>축하합니다.<br><br>" + data.point + "포인트에 당첨되셨습니다~";
	}
	
	$('#randImg').html(out);
}
</script>