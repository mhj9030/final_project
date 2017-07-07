<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>
<!-- Bootstrap CSS -->
<!-- <link href="/final_project/resources/css/bootstrap.min.css" rel="stylesheet"> -->

<!-- 중앙정렬용 center-block  -->
<script type="text/javascript">
function deleteNotice() {
	 <c:if test="${sessionScope.member.mId=='admin@a.com' || sessionScope.member.mId==dto.mId}"> 
	  var num = "${dto.num}";
	  var page = "${page}";
	  var query = "num="+num+"&page="+page;
	  var url = "<%=cp%>/help_layout/notice/delete?" + query;

	  if(confirm("위 자료를 삭제 하시 겠습니까 ? "))
	  	location.href=url;
	 </c:if>     
	  <c:if test="${sessionScope.member.mId!='admin' && sessionScope.member.mId!=dto.mId}">
	  alert("게시물을 삭제할 수  없습니다.");
	</c:if>
	}
</script>


<div class="wrapper center-block" style="max-width: 980px;">

<div id="title"class="text-center">
<h2>${dto.subject}</h2>
</div>
<div class="text-right">
<h5>${dto.created} ${dto.hitCount}</h5>
</div>
<hr>

<!-- 글내용  content -->
<div id="content">
<pre style="white-space: pre-wrap; background:white;">
 ${dto.content}
</pre>
</div>
<hr>
<%-- <c:if test="${sessionScope.member.mId==dto.mId || sessionScope.member.mId=='admin@a.com'}">				    
	          <button type="button" class="btn" onclick="deleteNotice();">삭제</button>
</c:if> --%>
<button type="button" class="btn" onclick="deleteNotice();">삭제</button>





<!-- 댓글용 text-center -->
<!-- <div class="text-center">
	<div class="row" >
		첫번째댓글
		<div class="col-md-12">
			<div class="col-md-2 center-block" > 
				<img src="/final_project/resources/image/profile_img.jpg" class="img-circle img-responsive" style="max-height: 100px; margin:auto;">
				<h5>Minhee Cho</h5>
			</div>
			<div class="col-md-10"> 				
<pre style="white-space: pre-wrap; text-align: left;height:135px;">서울대 재학 시절 창업 동아리 활동을 통해 사업에 눈을 뜨고, 2005년 첫 창업을 했습니다. 
곰플레이어로 유명한 그래텍에서 일한 후, 2011년 두 번째 회사를 시작, 한국 최초의 스타트업 네트워킹 플랫폼 로켓펀치를 만들었습니다. 
디지털 시대를 선도하기 위한 인문-과학-예술 혁신 학교 '건명원’ 2기이며, 2002년부터 꾸준히 수련을 하고 있는 검도인 입니다.</pre>
			</div>
		</div>
		
		두번째댓글
		<div class="col-md-12">
			<div class="col-md-2" > 
				<img src="/final_project/resources/image/profile_img.jpg" class="img-circle img-responsive" style="max-height: 100px; margin:auto;">
				<h5>God Damn</h5>
			</div>
			<div class="col-md-10"> 
				
<pre style="white-space: pre-wrap; text-align: left;height:135px;">
내가 답변을 해야 한다고 지칭된 이슈에 대하여는 24시간 내에 답변을 하도록 노력한다. 
내가 어떤 이슈에 대하여 ‘의견이 없거나, 동의하는 상태’라도 확인했다는 메시지는 전달한다.
인키움(인사담당자, 인키움)님은 인사의 전문가입니다.
(주)인키움은 HRD 분야의 컨설팅, 교육서비스, 콘텐츠개발, 교육운영, HRD 솔루션 구축 등의 HRD Total Service를 제공하고 국내 최고의 강소기업입니다.</pre>
			</div>
		</div>
	</div>
	
	<hr>
	
	답글 및 버튼
	<div class="row">
	<h3>답글남기기</h3>

			<textarea class="form-control" rows="4" placeholder="남기시오 답글">
			
			</textarea>
			<hr>
			<button style="float: left;" class="btn">답글등록</button>
			
			
			
			<button style="float: right;" class="btn">목록</button>
	</div>
	
	
		
	
</div> -->

</div>