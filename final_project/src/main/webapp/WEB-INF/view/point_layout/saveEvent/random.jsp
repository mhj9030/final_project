<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>

<div class="page_body">
	<h3>
		| 포인트 복권 
		<small style="font-family: 'Gudea', sans-serif; letter-spacing: 3px; margin-left: 5px; font-size: 16px; font-weight: bold; color: #6d6b6b;">Point Event</small>
	</h3><hr>

	<!-- 나의 포인트 -->
	<div style="height: 50px; text-align: center; font-size: 7;">
		<b>${sessionScope.member.userName}</b> 님의 사용가능한 포인트는 <b>${point.mypoint}</b> 포인트입니다.
	</div>
	
	<div id="pointEvent" class="pointEvent">
		<div>
			<font size="4px">500</font>포인트로 최대  
			<font size="5px">6000</font>포인트까지!
		</div>
		<div class="randImg">
			<div><img src="<%=cp%>/resources/image/point_coin.jpg" height="150px"></div>
			<div id="scratch" class="scratch">
				<br>매일 하루에 한번!
				<br>0포인트는 없다!
				<br>100% 당첨!
				<button type="button" onclick="random()">여기를 눌러주세요</button>
			</div>
		</div>
	</div>
	<div>
		<br><br>
		※ 주의사항<br>
		- 매일 한번만 뽑을 수 있습니다.<br>
		- 포인트는 100 ~ 6000 포인트 사이로 나옵니다.
	</div>
</div>

<script>
function random(){
	if(500<=${point.mypoint}){
		var url = "<%=cp%>/point/saveEvent/randomPoint";
		
		$.ajax({
			type: "get",
			url: url,
			data: "",
			dataType: "json",
			success: function(data) {
				if(data.state=='2'){
					alert("오늘은 이미 참가하셨습니다.\n내일 다시 참가해주세요.");
					//$('#scratch').html("오늘은 이미 참가하셨습니다.<br>내일 다시 참가해주세요.").css("padding", "35px;");
				}else if(data.state=='1'){
					print(data);
				}else{
					alert("포인트가 부족합니다.");
					//$('#scratch').html("포인트가 부족합니다.");
				}
			},
			error: function(e){
				console.log(e)
			}
		});
	}else{
		alert("포인트가 부족합니다.");
		//$('#scratch').html("포인트가 부족합니다.");
	}
}

function print(data) {
	var out = "<br>";
	
	if(data.point.length!=0){
		if(data.point>500){
			out += '축하합니다!';
			out += '<input type="text" readOnly="readOnly" value="' + data.point + ' 포인트에 당첨!~" />';
		}else{
			out += '아쉽지만<br>내일 다시 도전해 주세요!';
			out += '<input type="text" readOnly="readOnly" value="' + data.point + ' 포인트에 당첨!" />';
		}
	}
	
	$('#scratch').html(out);
	
}
</script>