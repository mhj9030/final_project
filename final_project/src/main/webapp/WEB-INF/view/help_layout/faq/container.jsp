<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<%
	String cp=request.getContextPath();
%>


<div class="list-body" align="center" style="overflow-x:hidden; overflow-y:auto;">
	<div class="notice_list_wrap" style="text-align: left ">
	<h3>| FAQ</h3>
	<p>
	궁금한 문의 사항을 확인 해 보세요.
	</p>    
</div>
	<div role="tabpanel">

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">회원가입·정보</a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">입사지원</a></li>
    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">채용정보</a></li>
    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">기타</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="home"><br><div>


		<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="heading11">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="true" aria-controls="collapse1">
          자동 로그아웃 현상이 자주 반복됩니다. 어떻게 하나요?
        </a>
      </h4>
    </div>
    <div id="collapse1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading11">
      <div class="panel-body">
        개인 정보 보안을 위하여 30분 이상 사이트 이용이 없는 경우 자동 로그아웃이 설정되어 있습니다. 이력서 등록/수정 중에는 이 점 유의해 주시기 바랍니다. 
<br>
또한 IE 6.0의 버그로 인하여 본의아닌 피해를 보고 계실수 있으므로 다음과 같이 조치 해 보시기 바랍니다. 
<br>
1. 다른 응용프로그램을 모두 닫으신 후 한 개의 익스플로러만 열어주세요. <br>
2. 도구 >인터넷옵션> 일반 에서 가운데 임시 인터넷 파일 부분의 [설정]을 클릭하셔서 저장된 페이지의 새버전확인을 [자동으로 ==> 페이지 열때마다]로 변경해 주세요. <br>
3. 도구 -> 인터넷 옵션 -> 보안설정에서 [기본 수준] 으로 선택하신 후 인터넷 옵션 -> 개인정보> 편집 -> jobkorea.co.kr 입력 -> 허용 버튼 클릭해 주세요. <br>
4. 임시 인터넷 파일의 [파일삭제]버튼을 클릭하셔서 캐쉬에 남은 페이지들을 모두 삭제해 주세요. <br>
<br>
또한 PC에 보안프로그램이나 방화벽이 설치되어 있는지 확인(사내 시스템관리자가 알고 있음) 해주시기 바랍니다. <br>
<br>
회사나 학교 PC는 방화벽이 설치되어 있을경우 일부기능을 이용하지 못하거나 접속이 어려울 수 있습니다. 
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="heading2">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse2" aria-expanded="false" aria-controls="collapse2">
          회원탈퇴는 어떻게 하나요?
        </a>
      </h4>
    </div>
    <div id="collapse2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading2">
      <div class="panel-body">
        잡코리아 회원탈퇴는 아래 절차에 따라 진행하실 수 있습니다. <br>
<br>
1단계. 회원 로그인 후 고객센터 [회원탈퇴 신청]을 클릭해 주세요. <br>
<br>
2단계. 탈퇴 전 유의 사항을 반드시 확인 하신 후 탈퇴 신청폼을 작성해 주세요. <br>
<br>
3단계. 탈퇴 신청이 완료되면 고객센터에서 확인 후 결과 처리를 통보해 드립니다. <br>
<br>
※ 통합아이디 활용으로 회원 탈퇴 시 잡코리아, 알바몬, HR파트너스, 데브잡, 캠퍼스몬, 잡부산의 회원 정보도 삭제되므로 신중히 고려하시기 접수해 주시기 바랍니다.
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="heading3">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse3" aria-expanded="false" aria-controls="collapse3">
          로그인이 안돼요. 어떻게 하나요?
        </a>
      </h4>
    </div>
    <div id="collapse3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading3">
      <div class="panel-body">
        로그인이 되지 않을 경우 회원님의 PC 설정상태를 확인해 주시기 바랍니다. <br>
<br>
<br>
1. 쿠키 등 검색 기록을 삭제해 주세요. <br>
(1) 브라우저 실행 > 도구 > 인터넷 옵션 > 일반 > 검색 기록 > [삭제] 클릭해 주세요. <br>
(2) 맨 위 [즐겨찾기 웹 사이트 데이터 보존]을 제외하고 모든 항목에 체크한 후 아래 [삭제] 버튼 클릭해 주세요. <br>
(3) 검색 기록 삭제가 완료되면 인터넷 옵션 창의 [확인] 버튼을 클릭하세요. <br>
(4) 띄워놓았던 인터넷 브라우저를 모두 닫고 새로 인터넷 브라우저를 열어 잡코리아 로그인을 해주세요. <br>
<br>
2. 보안 수정 재설정 <br>
(1) 브라우저 실행 > 도구 > 인터넷 옵션 > 보안 > 인터넷 메뉴를 클릭하고, 보안 수준을 [기본 수준] 클릭해 주세요. <br>
(2) 신뢰할 수 있는 사이트 > 사이트 버튼 클릭 후 [*.jobkorea.co.kr]을 추가하여 등록해 주세요. <br>
(3) 인터넷 옵션 창의 [확인] 버튼을 클릭하세요. <br>
(4) 띄워놓았던 인터넷 브라우저를 모두 닫고 새로 인터넷 브라우저를 열어 잡코리아 로그인을 해주세요. <br>
<br>
3. 제한된 사이트에서 해지 <br>
(1) 브라우저 실행 > 도구 > 인터넷 옵션 > 보안 > 제한된 사이트 클릭하고 [사이트] 버튼을 클릭해 주세요. <br>
(2) 제한된 사이트로 잡코리아가 등록되어 있다면, 선택하신 후 우측의 [제거] 버튼을 클릭해 주세요. <br>
(3) 인터넷 옵션 창의 [확인] 버튼을 클릭하세요. <br>
(4) 띄워놓았던 인터넷 브라우저를 모두 닫고 새로 인터넷 브라우저를 열어 잡코리아 로그인을 해주세요. <br>
<br>
<br>
위 항목에 해당하지 않는 경우 잡코리아 고객센터로 문의주시면 확인 후 안내 드리도록 하겠습니다. <br>
<br>
[잡코리아 고객센터] <br>
· ☎: 1588-9350 <br>
· E-mail: helpdesk@jobkorea.co.kr 전화를 주시거나 메일로 내용을 보내주시기 바랍니다.<br>
      </div>
    </div>
  </div>
   <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="heading4">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse4" aria-expanded="true" aria-controls="collapse4">
          자동 로그아웃 현상이 자주 반복됩니다. 어떻게 하나요?
        </a>
      </h4>
    </div>
    <div id="collapse4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading4">
      <div class="panel-body">
        개인 정보 보안을 위하여 30분 이상 사이트 이용이 없는 경우 자동 로그아웃이 설정되어 있습니다. 이력서 등록/수정 중에는 이 점 유의해 주시기 바랍니다. 
<br>
또한 IE 6.0의 버그로 인하여 본의아닌 피해를 보고 계실수 있으므로 다음과 같이 조치 해 보시기 바랍니다. 
<br>
1. 다른 응용프로그램을 모두 닫으신 후 한 개의 익스플로러만 열어주세요. <br>
2. 도구 >인터넷옵션> 일반 에서 가운데 임시 인터넷 파일 부분의 [설정]을 클릭하셔서 저장된 페이지의 새버전확인을 [자동으로 ==> 페이지 열때마다]로 변경해 주세요. <br>
3. 도구 -> 인터넷 옵션 -> 보안설정에서 [기본 수준] 으로 선택하신 후 인터넷 옵션 -> 개인정보> 편집 -> jobkorea.co.kr 입력 -> 허용 버튼 클릭해 주세요. <br>
4. 임시 인터넷 파일의 [파일삭제]버튼을 클릭하셔서 캐쉬에 남은 페이지들을 모두 삭제해 주세요. <br>
<br>
또한 PC에 보안프로그램이나 방화벽이 설치되어 있는지 확인(사내 시스템관리자가 알고 있음) 해주시기 바랍니다. <br>
<br>
회사나 학교 PC는 방화벽이 설치되어 있을경우 일부기능을 이용하지 못하거나 접속이 어려울 수 있습니다. 
      </div>
    </div>
  </div>
  
  
   <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="heading5">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse5" aria-expanded="true" aria-controls="collapse5">
          회원정보 중에 생년월일과 성별이 잘못 기입되었습니다. 어떻게 하나요?
        </a>
      </h4>
    </div>
    <div id="collapse5" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading5">
      <div class="panel-body">
        등록된 생년월일과 성별을 수정하실 수 없을 경우, 고객센터로 문의 주시면 간단한 본인 확인 후 안내해 드리도록 하겠습니다. <br>
<br>
[잡코리아 고객센터] <br>
· ☎: 1588-9350 <br>
· E-mail: helpdesk@jobkorea.co.kr<br> 
      </div>
    </div>
  </div>
  
  <!---------------------------------------------- 추가------------------------------------------------------- -->
  
  
  
  
  
  
  <!---------------------------------------------- 추가------------------------------------------------------- -->
</div>

		</div></div>
    <div role="tabpanel" class="tab-pane" id="profile"><br><div>


		<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="heading6">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse6" aria-expanded="true" aria-controls="collapse6">
          상세 온라인 입사지원은 어디에서 할 수 있나요?
        </a>
      </h4>
    </div>
    <div id="collapse6" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading6">
      <div class="panel-body">
        상세 입사지원은 퀵 입사지원이 가능한 공고는 <br>
1. 지원할 채용공고의 [퀵 온라인 입사지원] 버튼 클릭 <br>
2. 개인회원으로 로그인 <br>
3. 퀵 온라인 입사지원 창 하단의 [상세 온라인 입사지원]을 클릭하면 됩니다. <br>
<br>
 지원자 자유 이력서 또는 자사양식으로만 온라인 접수를 받는 공고는 <br>
채용공고에서 [온라인 입사지원] 버튼을 클릭하면 상세 온라인 입사지원으로 바로 연결됩니다.<br> 
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="heading7">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse7" aria-expanded="false" aria-controls="collapse7">
          면접제의 입사요청 e-mail을 보낸 기업을 확인할 수 있나요?
        </a>
      </h4>
    </div>
    <div id="collapse7" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading7">
      <div class="panel-body">
        면접제의·입사요청은 기본이력서가 공개중인 경우에만 제의를 받을 수 있으며 <br>
인사담당자가 보낸 메일의 내용을 확인하고 답장을 보내며, 보낸 답장의 내용을 확인할 수 있습니다. <br>
해당 내용은 발송일로부터 최대 3개월까지만 확인 가능합니다. <br>
<br>
또한 면접제의·입사요청은 회원님의 e-메일로도 동시에 발송되므로, 회원님의 개인 메일함에서도 확인이 가능합니다. <br>
<br>
면접제의·입사요청 e-메일 발송 기업은 아래에서 확인 가능합니다. <br>
· 면접제의·입사요청 기업: HOME > 개인회원 > 입사지원 관리 > 면접제의·입사요청 기업<br>
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="heading8">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse8" aria-expanded="false" aria-controls="collapse8">
          고용안정센터에 취업활동 확인서를 제출해야 하는데 취업활동 증명자료를 받을 수 있을까요?
        </a>
      </h4>
    </div>
    <div id="collapse8" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading8">
      <div class="panel-body">
<br>
잡코리아 온라인 입사지원 시스템을 이용하여 채용공고에 입사지원을 한 경우, 모든 입사지원 내역을 취업활동증명서로 발급 받을 수 있으며 발급비용은 무료입니다. <br>
<br>
아래의 내용에 유의하여 신청하시면 됩니다. <br>
<br>
1. 최근 90일 이내의 입사지원 내역만 조회/발급이 가능. <br>
<br>
잡코리아에서는 90일 이전의 입사지원 내역을 보관하지 않으며, 90일 이전의 취업활동증명서는 효력이 없습니다. 실업급여 등의 목적이 아닌 개인적 취업활동 내역을 관리하실 분은 90일 이전에 별도의 기록을 해 두시기 바랍니다. <br>
<br>
2. 잡코리아 온라인 입사지원 시스템을 통한 입사지원만 발급 가능. <br>
<br>
홈페이지, 우편, FAX, 방문접수를 통해 입사지원을 한 경우 잡코리아가 아닌 해당 기업에 발급을 요청해야 합니다. 이는 잡코리아의 시스템에 기록이 남지 않는 개인적 활동으로 분류되기 때문에 잡코리아가 취업활동에 대한 증명을 해드릴 수가 없습니다. 또한, 비회원 입사지원으로 입사지원 한경우도 마찬가지로 개인적 활동으로 분류되어 취업활동 증명이 되지 않으니 유의 하시기 바랍니다. <br>
<br>
3. 지원취소/입사지원 내역 삭제 등은 발급 불가. <br>
<br>
입사지원 후 지원을 취소하거나 입사지원 내역을 삭제한 경우 취업활동증명서 발급이 불가능 합니다. 잡코리아 취업활동증명서는 개인의 입사지원 내역을 근거로 취업활동증명서를 발급하는데 이에 대한 근거자료가 취소/삭제의 경우로 사라진다면 발급이 되지 않습니다. <br>
<br>
취업활동 증명서 발급과 절차에 대한 자세한 설명은 취업활동증명서에서 보다 쉽게 이해하실 수 있습니다. <br>
<br>
* 취업활동증명서 : http://www.jobkorea.co.kr/service/user/tool/applycert<br>      </div>
    </div>
  </div>
   <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="heading9">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse9" aria-expanded="true" aria-controls="collapse9">
          입사지원을 하였는데 아직 미열람 상태입니다. 미열람이 무엇인가요?
        </a>
      </h4>
    </div>
    <div id="collapse9" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading9">
      <div class="panel-body">
        온라인 입사지원을 한 경우 해당 기업·서치펌·파견대행 기업은 잡코리아의 온라인 채용관리 시스템의 온라인 인재관리에서 지원자의 이력서의 이력서를 확인하게 되며, 개인회원은 이력서 열람여부를 실시간으로 확인할 수 있습니다. <br>
<br>
미열람은 아직 해당 인사담당자가 이력서를 열람하지 않은 상태를 말하며, 지원 이후 이력서 열람에 관한 문의는 해당 기업으로 해주시기 바랍니다.<br> 
      </div>
    </div>
  </div>
  
  
   <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="heading10">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse10" aria-expanded="true" aria-controls="collapse10">
          온라인 입사지원 및 e-mail 입사지원의 횟수는 몇회까지인가요?
        </a>
      </h4>
    </div>
    <div id="collapse10" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading10">
      <div class="panel-body">
        온라인 입사지원 및 e-메일 입사지원은 동일한 채용공고에 대해 <br>
최대 3회까지 가능합니다. <br>
<br>
입사지원 후 지원취소를 하지 않은 경우는 최근 입사지원일 기준 15일 이후 입사재지원 가능하며 지원취소를 한 경우에는 입사지원일에 상관없이 재지원이 가능합니다. <br>
<br>
* 온라인 입사지원 = 퀵 온라인 입사지원 + 상세 온라인 입사지원 <br>
<br>
추가적인 문의는 고객센터 유선 또는 e-메일로 접수해 주시면 안내해 드리도록 하겠습니다. <br>
<br>
[잡코리아 고객센터] <br>
· ☎: 1588-9350 <br>
· E-mail: helpdesk@jobkorea.co.kr<br> 
      </div>
    </div>
  </div>
  
  <!---------------------------------------------- 추가------------------------------------------------------- -->
  
  
  
  
  
  
  <!---------------------------------------------- 추가------------------------------------------------------- -->
</div>

		</div></div>
    
    
    
    
    
    
    <div role="tabpanel" class="tab-pane" id="messages"><br><div>


		<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="heading11">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse11" aria-expanded="true" aria-controls="collapse11">
          마감일이 지난 채용정보를 확인할 수 있나요?
        </a>
      </h4>
    </div>
    <div id="collapse11" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading11">
      <div class="panel-body">
        개인 정보 보안을 위하여 30분 이상 사이트 이용이 없는 경우 자동 로그아웃이 설정되어 있습니다. 이력서 등록/수정 중에는 이 점 유의해 주시기 바랍니다. 
<br>
또한 IE 6.0의 버그로 인하여 본의아닌 피해를 보고 계실수 있으므로 다음과 같이 조치 해 보시기 바랍니다. 
<br>
1. 다른 응용프로그램을 모두 닫으신 후 한 개의 익스플로러만 열어주세요. <br>
2. 도구 >인터넷옵션> 일반 에서 가운데 임시 인터넷 파일 부분의 [설정]을 클릭하셔서 저장된 페이지의 새버전확인을 [자동으로 ==> 페이지 열때마다]로 변경해 주세요. <br>
3. 도구 -> 인터넷 옵션 -> 보안설정에서 [기본 수준] 으로 선택하신 후 인터넷 옵션 -> 개인정보> 편집 -> jobkorea.co.kr 입력 -> 허용 버튼 클릭해 주세요. <br>
4. 임시 인터넷 파일의 [파일삭제]버튼을 클릭하셔서 캐쉬에 남은 페이지들을 모두 삭제해 주세요. <br>
<br>
또한 PC에 보안프로그램이나 방화벽이 설치되어 있는지 확인(사내 시스템관리자가 알고 있음) 해주시기 바랍니다. <br>
<br>
회사나 학교 PC는 방화벽이 설치되어 있을경우 일부기능을 이용하지 못하거나 접속이 어려울 수 있습니다. 
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="heading12">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse12" aria-expanded="false" aria-controls="collapse12">
          기업명으로 채용정보나 기업정보를 검색할 수 있나요?
        </a>
      </h4>
    </div>
    <div id="collapse12" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading12">
      <div class="panel-body">
        잡코리아 회원탈퇴는 아래 절차에 따라 진행하실 수 있습니다. <br>
<br>
1단계. 회원 로그인 후 고객센터 [회원탈퇴 신청]을 클릭해 주세요. <br>
<br>
2단계. 탈퇴 전 유의 사항을 반드시 확인 하신 후 탈퇴 신청폼을 작성해 주세요. <br>
<br>
3단계. 탈퇴 신청이 완료되면 고객센터에서 확인 후 결과 처리를 통보해 드립니다. <br>
<br>
※ 통합아이디 활용으로 회원 탈퇴 시 잡코리아, 알바몬, HR파트너스, 데브잡, 캠퍼스몬, 잡부산의 회원 정보도 삭제되므로 신중히 고려하시기 접수해 주시기 바랍니다.
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="heading13">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse13" aria-expanded="false" aria-controls="collapse13">
          지역이나 나이등의 조건으로 채용정보를 검색할 수는 없나요?
        </a>
      </h4>
    </div>
    <div id="collapse13" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading13">
      <div class="panel-body">
        로그인이 되지 않을 경우 회원님의 PC 설정상태를 확인해 주시기 바랍니다. <br>
<br>
<br>
1. 쿠키 등 검색 기록을 삭제해 주세요. <br>
(1) 브라우저 실행 > 도구 > 인터넷 옵션 > 일반 > 검색 기록 > [삭제] 클릭해 주세요. <br>
(2) 맨 위 [즐겨찾기 웹 사이트 데이터 보존]을 제외하고 모든 항목에 체크한 후 아래 [삭제] 버튼 클릭해 주세요. <br>
(3) 검색 기록 삭제가 완료되면 인터넷 옵션 창의 [확인] 버튼을 클릭하세요. <br>
(4) 띄워놓았던 인터넷 브라우저를 모두 닫고 새로 인터넷 브라우저를 열어 잡코리아 로그인을 해주세요. <br>
<br>
2. 보안 수정 재설정 <br>
(1) 브라우저 실행 > 도구 > 인터넷 옵션 > 보안 > 인터넷 메뉴를 클릭하고, 보안 수준을 [기본 수준] 클릭해 주세요. <br>
(2) 신뢰할 수 있는 사이트 > 사이트 버튼 클릭 후 [*.jobkorea.co.kr]을 추가하여 등록해 주세요. <br>
(3) 인터넷 옵션 창의 [확인] 버튼을 클릭하세요. <br>
(4) 띄워놓았던 인터넷 브라우저를 모두 닫고 새로 인터넷 브라우저를 열어 잡코리아 로그인을 해주세요. <br>
<br>
3. 제한된 사이트에서 해지 <br>
(1) 브라우저 실행 > 도구 > 인터넷 옵션 > 보안 > 제한된 사이트 클릭하고 [사이트] 버튼을 클릭해 주세요. <br>
(2) 제한된 사이트로 잡코리아가 등록되어 있다면, 선택하신 후 우측의 [제거] 버튼을 클릭해 주세요. <br>
(3) 인터넷 옵션 창의 [확인] 버튼을 클릭하세요. <br>
(4) 띄워놓았던 인터넷 브라우저를 모두 닫고 새로 인터넷 브라우저를 열어 잡코리아 로그인을 해주세요. <br>
<br>
<br>
위 항목에 해당하지 않는 경우 잡코리아 고객센터로 문의주시면 확인 후 안내 드리도록 하겠습니다. <br>
<br>
[잡코리아 고객센터] <br>
· ☎: 1588-9350 <br>
· E-mail: helpdesk@jobkorea.co.kr 전화를 주시거나 메일로 내용을 보내주시기 바랍니다.<br>
      </div>
    </div>
  </div>
   <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="heading14">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse14" aria-expanded="true" aria-controls="collapse14">
          채용공고를 오늘 마감되는 공고부터 볼 수 없나요?
        </a>
      </h4>
    </div>
    <div id="collapse14" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading14">
      <div class="panel-body">
        개인 정보 보안을 위하여 30분 이상 사이트 이용이 없는 경우 자동 로그아웃이 설정되어 있습니다. 이력서 등록/수정 중에는 이 점 유의해 주시기 바랍니다. 
<br>
또한 IE 6.0의 버그로 인하여 본의아닌 피해를 보고 계실수 있으므로 다음과 같이 조치 해 보시기 바랍니다. 
<br>
1. 다른 응용프로그램을 모두 닫으신 후 한 개의 익스플로러만 열어주세요. <br>
2. 도구 >인터넷옵션> 일반 에서 가운데 임시 인터넷 파일 부분의 [설정]을 클릭하셔서 저장된 페이지의 새버전확인을 [자동으로 ==> 페이지 열때마다]로 변경해 주세요. <br>
3. 도구 -> 인터넷 옵션 -> 보안설정에서 [기본 수준] 으로 선택하신 후 인터넷 옵션 -> 개인정보> 편집 -> jobkorea.co.kr 입력 -> 허용 버튼 클릭해 주세요. <br>
4. 임시 인터넷 파일의 [파일삭제]버튼을 클릭하셔서 캐쉬에 남은 페이지들을 모두 삭제해 주세요. <br>
<br>
또한 PC에 보안프로그램이나 방화벽이 설치되어 있는지 확인(사내 시스템관리자가 알고 있음) 해주시기 바랍니다. <br>
<br>
회사나 학교 PC는 방화벽이 설치되어 있을경우 일부기능을 이용하지 못하거나 접속이 어려울 수 있습니다. 
      </div>
    </div>
  </div>
  
  
   <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="heading15">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse15" aria-expanded="true" aria-controls="collapse15">
          스크랩한 채용정보는 무엇인가요?
        </a>
      </h4>
    </div>
    <div id="collapse15" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading15">
      <div class="panel-body">
        개인 정보 보안을 위하여 30분 이상 사이트 이용이 없는 경우 자동 로그아웃이 설정되어 있습니다. 이력서 등록/수정 중에는 이 점 유의해 주시기 바랍니다. 
<br>
또한 IE 6.0의 버그로 인하여 본의아닌 피해를 보고 계실수 있으므로 다음과 같이 조치 해 보시기 바랍니다. 
<br>
1. 다른 응용프로그램을 모두 닫으신 후 한 개의 익스플로러만 열어주세요. <br>
2. 도구 >인터넷옵션> 일반 에서 가운데 임시 인터넷 파일 부분의 [설정]을 클릭하셔서 저장된 페이지의 새버전확인을 [자동으로 ==> 페이지 열때마다]로 변경해 주세요. <br>
3. 도구 -> 인터넷 옵션 -> 보안설정에서 [기본 수준] 으로 선택하신 후 인터넷 옵션 -> 개인정보> 편집 -> jobkorea.co.kr 입력 -> 허용 버튼 클릭해 주세요. <br>
4. 임시 인터넷 파일의 [파일삭제]버튼을 클릭하셔서 캐쉬에 남은 페이지들을 모두 삭제해 주세요. <br>
<br>
또한 PC에 보안프로그램이나 방화벽이 설치되어 있는지 확인(사내 시스템관리자가 알고 있음) 해주시기 바랍니다. <br>
<br>
회사나 학교 PC는 방화벽이 설치되어 있을경우 일부기능을 이용하지 못하거나 접속이 어려울 수 있습니다. 
      </div>
    </div>
  </div>
  
  <!---------------------------------------------- 추가------------------------------------------------------- -->
  
  
  
  
  
  
  <!---------------------------------------------- 추가------------------------------------------------------- -->
</div>

		</div></div>
    <div role="tabpanel" class="tab-pane" id="settings"><br><div>


		<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="heading16">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse16" aria-expanded="true" aria-controls="collapse16">
          이벤트에 당첨되었다고 하는데, 어떻게 하나요?
        </a>
      </h4>
    </div>
    <div id="collapse16" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading16">
      <div class="panel-body">
        개인 정보 보안을 위하여 30분 이상 사이트 이용이 없는 경우 자동 로그아웃이 설정되어 있습니다. 이력서 등록/수정 중에는 이 점 유의해 주시기 바랍니다. 
<br>
또한 IE 6.0의 버그로 인하여 본의아닌 피해를 보고 계실수 있으므로 다음과 같이 조치 해 보시기 바랍니다. 
<br>
1. 다른 응용프로그램을 모두 닫으신 후 한 개의 익스플로러만 열어주세요. <br>
2. 도구 >인터넷옵션> 일반 에서 가운데 임시 인터넷 파일 부분의 [설정]을 클릭하셔서 저장된 페이지의 새버전확인을 [자동으로 ==> 페이지 열때마다]로 변경해 주세요. <br>
3. 도구 -> 인터넷 옵션 -> 보안설정에서 [기본 수준] 으로 선택하신 후 인터넷 옵션 -> 개인정보> 편집 -> jobkorea.co.kr 입력 -> 허용 버튼 클릭해 주세요. <br>
4. 임시 인터넷 파일의 [파일삭제]버튼을 클릭하셔서 캐쉬에 남은 페이지들을 모두 삭제해 주세요. <br>
<br>
또한 PC에 보안프로그램이나 방화벽이 설치되어 있는지 확인(사내 시스템관리자가 알고 있음) 해주시기 바랍니다. <br>
<br>
회사나 학교 PC는 방화벽이 설치되어 있을경우 일부기능을 이용하지 못하거나 접속이 어려울 수 있습니다. 
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="heading17">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse17" aria-expanded="false" aria-controls="collapse17">
          이벤트 상품은 언제 배송되나요?
        </a>
      </h4>
    </div>
    <div id="collapse17" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading17">
      <div class="panel-body">
        잡코리아 회원탈퇴는 아래 절차에 따라 진행하실 수 있습니다. <br>
<br>
1단계. 회원 로그인 후 고객센터 [회원탈퇴 신청]을 클릭해 주세요. <br>
<br>
2단계. 탈퇴 전 유의 사항을 반드시 확인 하신 후 탈퇴 신청폼을 작성해 주세요. <br>
<br>
3단계. 탈퇴 신청이 완료되면 고객센터에서 확인 후 결과 처리를 통보해 드립니다. <br>
<br>
※ 통합아이디 활용으로 회원 탈퇴 시 잡코리아, 알바몬, HR파트너스, 데브잡, 캠퍼스몬, 잡부산의 회원 정보도 삭제되므로 신중히 고려하시기 접수해 주시기 바랍니다.
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="heading18">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse18" aria-expanded="false" aria-controls="collapse18">
          등록한 연봉정보를 수정하거나 삭제하고 싶은데 어떻게 해야 하나요?
        </a>
      </h4>
    </div>
    <div id="collapse18" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading18">
      <div class="panel-body">
        로그인이 되지 않을 경우 회원님의 PC 설정상태를 확인해 주시기 바랍니다. <br>
<br>
<br>
1. 쿠키 등 검색 기록을 삭제해 주세요. <br>
(1) 브라우저 실행 > 도구 > 인터넷 옵션 > 일반 > 검색 기록 > [삭제] 클릭해 주세요. <br>
(2) 맨 위 [즐겨찾기 웹 사이트 데이터 보존]을 제외하고 모든 항목에 체크한 후 아래 [삭제] 버튼 클릭해 주세요. <br>
(3) 검색 기록 삭제가 완료되면 인터넷 옵션 창의 [확인] 버튼을 클릭하세요. <br>
(4) 띄워놓았던 인터넷 브라우저를 모두 닫고 새로 인터넷 브라우저를 열어 잡코리아 로그인을 해주세요. <br>
<br>
2. 보안 수정 재설정 <br>
(1) 브라우저 실행 > 도구 > 인터넷 옵션 > 보안 > 인터넷 메뉴를 클릭하고, 보안 수준을 [기본 수준] 클릭해 주세요. <br>
(2) 신뢰할 수 있는 사이트 > 사이트 버튼 클릭 후 [*.jobkorea.co.kr]을 추가하여 등록해 주세요. <br>
(3) 인터넷 옵션 창의 [확인] 버튼을 클릭하세요. <br>
(4) 띄워놓았던 인터넷 브라우저를 모두 닫고 새로 인터넷 브라우저를 열어 잡코리아 로그인을 해주세요. <br>
<br>
3. 제한된 사이트에서 해지 <br>
(1) 브라우저 실행 > 도구 > 인터넷 옵션 > 보안 > 제한된 사이트 클릭하고 [사이트] 버튼을 클릭해 주세요. <br>
(2) 제한된 사이트로 잡코리아가 등록되어 있다면, 선택하신 후 우측의 [제거] 버튼을 클릭해 주세요. <br>
(3) 인터넷 옵션 창의 [확인] 버튼을 클릭하세요. <br>
(4) 띄워놓았던 인터넷 브라우저를 모두 닫고 새로 인터넷 브라우저를 열어 잡코리아 로그인을 해주세요. <br>
<br>
<br>
위 항목에 해당하지 않는 경우 잡코리아 고객센터로 문의주시면 확인 후 안내 드리도록 하겠습니다. <br>
<br>
[잡코리아 고객센터] <br>
· ☎: 1588-9350 <br>
· E-mail: helpdesk@jobkorea.co.kr 전화를 주시거나 메일로 내용을 보내주시기 바랍니다.<br>
      </div>
    </div>
  </div>
   <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="heading19">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse19" aria-expanded="true" aria-controls="collapse19">
          연봉정보를 등록하면 어떤 혜택이 있나요?
        </a>
      </h4>
    </div>
    <div id="collapse19" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading19">
      <div class="panel-body">
        개인 정보 보안을 위하여 30분 이상 사이트 이용이 없는 경우 자동 로그아웃이 설정되어 있습니다. 이력서 등록/수정 중에는 이 점 유의해 주시기 바랍니다. 
<br>
또한 IE 6.0의 버그로 인하여 본의아닌 피해를 보고 계실수 있으므로 다음과 같이 조치 해 보시기 바랍니다. 
<br>
1. 다른 응용프로그램을 모두 닫으신 후 한 개의 익스플로러만 열어주세요. <br>
2. 도구 >인터넷옵션> 일반 에서 가운데 임시 인터넷 파일 부분의 [설정]을 클릭하셔서 저장된 페이지의 새버전확인을 [자동으로 ==> 페이지 열때마다]로 변경해 주세요. <br>
3. 도구 -> 인터넷 옵션 -> 보안설정에서 [기본 수준] 으로 선택하신 후 인터넷 옵션 -> 개인정보> 편집 -> jobkorea.co.kr 입력 -> 허용 버튼 클릭해 주세요. <br>
4. 임시 인터넷 파일의 [파일삭제]버튼을 클릭하셔서 캐쉬에 남은 페이지들을 모두 삭제해 주세요. <br>
<br>
또한 PC에 보안프로그램이나 방화벽이 설치되어 있는지 확인(사내 시스템관리자가 알고 있음) 해주시기 바랍니다. <br>
<br>
회사나 학교 PC는 방화벽이 설치되어 있을경우 일부기능을 이용하지 못하거나 접속이 어려울 수 있습니다. 
      </div>
    </div>
  </div>
  
  
   <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="heading20">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse20" aria-expanded="true" aria-controls="collapse20">
          자동 로그아웃 현상이 자주 반복됩니다. 어떻게 하나요?
        </a>
      </h4>
    </div>
    <div id="collapse20" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading20">
      <div class="panel-body">
        개인 정보 보안을 위하여 30분 이상 사이트 이용이 없는 경우 자동 로그아웃이 설정되어 있습니다. 이력서 등록/수정 중에는 이 점 유의해 주시기 바랍니다. 
<br>
또한 IE 6.0의 버그로 인하여 본의아닌 피해를 보고 계실수 있으므로 다음과 같이 조치 해 보시기 바랍니다. 
<br>
1. 다른 응용프로그램을 모두 닫으신 후 한 개의 익스플로러만 열어주세요. <br>
2. 도구 >인터넷옵션> 일반 에서 가운데 임시 인터넷 파일 부분의 [설정]을 클릭하셔서 저장된 페이지의 새버전확인을 [자동으로 ==> 페이지 열때마다]로 변경해 주세요. <br>
3. 도구 -> 인터넷 옵션 -> 보안설정에서 [기본 수준] 으로 선택하신 후 인터넷 옵션 -> 개인정보> 편집 -> jobkorea.co.kr 입력 -> 허용 버튼 클릭해 주세요. <br>
4. 임시 인터넷 파일의 [파일삭제]버튼을 클릭하셔서 캐쉬에 남은 페이지들을 모두 삭제해 주세요. <br>
<br>
또한 PC에 보안프로그램이나 방화벽이 설치되어 있는지 확인(사내 시스템관리자가 알고 있음) 해주시기 바랍니다. <br>
<br>
회사나 학교 PC는 방화벽이 설치되어 있을경우 일부기능을 이용하지 못하거나 접속이 어려울 수 있습니다. 
      </div>
    </div>
  </div>
  
  <!---------------------------------------------- 추가--------------------------------------------------------->
  
  
  
  
  
  
  <!---------------------------------------------- 추가--------------------------------------------------------->
</div>

		</div></div>
  </div>

</div>
	
	
	
		
		
	</div>

