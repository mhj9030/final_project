<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>
<!-- Bootstrap CSS -->

<link href="/final_project/resources/css/bootstrap.min.css" rel="stylesheet">

<!-- 중앙정렬용 center-block  -->
<div class="wrapper center-block" style="max-width: 980px;">

<div id="title"class="text-center">
<h1>제목</h1>
</div>
<div class="text-right">
<h5>날짜 2017-06-27 조회수:58 추천:15</h5>
</div>
<hr>

<!-- 글내용  content -->
<div id="content">
<pre style="white-space: pre-wrap; background:white;">
마주하지 않은 상태에서 일을 진행했을 때 발생하는 문제를 줄이기 위한 규칙

아무리 좋은 시스템이 있더라도, 사람이 그것을 사용하는 과정에서 항상 어떤 문제가 발생하기 마련이다. 우리는 우리가 만든 시스템을 사용하면서 문제를 발견했고, 이를 줄일 수 있는 규칙들을 만들었다.

1. 어떤 일에 대한 가장 중요한 이슈를 초창기에 해결하는 문화

문제 현상 : 특히 제품 개발에서, 방향을 결정할 수 있는 중요한 이슈들이 초창기에 결정되지 않으면, 결과물 불확실성이 커지는 현상이 발생한다. 이것은 거의 모든 회사 조직이 고민하는 문제이긴 하나, 비대면 커뮤니케이션 상황에서는 이 문제가 특히 부각될 가능성이 높다. 서로 마주치며 현상을 파악하고 의견을 주고받을 수 있는 기회가 현저히 적기 때문이다.
해결을 위한 규칙 : 기획 문서건 디자인 파일이건 초기 개발 버전이건, 구체적인 내용을 파악할 수 있는 초기 버전을 최대한 빨리 구성원들에게 보여주려고 노력한다. 이 결과물을 공유할 때, 결과물의 질도 물론 중요하지만, ‘시간에 결과물을 맞춘다’는 관점을 유지한다.
2. 목적과 대상을 명확히 지정하는 커뮤니케이션

문제 현상 : 대부분 대면 커뮤니케이션이 아니므로, 대상을 정확히 지칭해서 이야기 하지 않는 경우, 그 대상이 스스로 답변을 해야 하는지 인지하지 못하는 현상이 발생한다. 이는 특히 업무 메신저의 공용 채널이나 팀 내 다수를 대상으로 발송하는 이메일, 많은 사람들이 엮여 있는 프로젝트 도구 항목에서 자주 발생한다.
해결을 위한 규칙 : 공용 채널 메시지나 다수의 수신인이 있는 이메일을 작성할 때 반드시 답변을 해야 하는 사람이 있거나 답변이 필요한 기한이 있다면 이를 명확히 언급한다. 대상이 답변을 줘야 하는 요소에 대하여 명확히 언급할 때는 각 항목에 대해서 ID를 할당해서 답변 대상이 답변하기 용이하도록 한다.
</pre>
</div>
<hr>





<!-- 댓글용 text-center -->
<div class="text-center">
	<div class="row" >
		<!-- 첫번째댓글 -->
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
		
		<!-- 두번째댓글 -->
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
	
	<!-- 답글 및 버튼 -->
	<div class="row">
	<h3>답글남기기</h3>

			<textarea class="form-control" rows="4" placeholder="남기시오 답글">
			
			</textarea>
			<hr>
			<button style="float: left;" class="btn">답글등록</button>
			
			
			
			<button style="float: right;" class="btn">목록</button>
	</div>
	
	
		
	
</div>

</div>