<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript" src="<%=cp%>/resources/js/jquery-3.1.0.min.js"></script>
<script>
	$(function(){
		$(".business-sub").hide();
		$(".service").show();
		
		$(".business-main").change(function(){
			var business_sub=$(this).find('option:selected').val();
			
			$(".business-sub").hide();
			$("."+business_sub).show();
		});
	});
	
	function check(){
		var f=document.companyForm;
		
		var mode="${mode}";
    	if(mode=="created")
    		f.action="<%=cp%>/company/created";
    	else if(mode=="update")
    		f.action="<%=cp%>/company/update";
    		
    	return true;
	}
</script>


<div class="created-body">
	<div class="page-header">
		<h1 align="left">
			| 기업등록 <small></small>
		</h1>
	</div>

	<form name="companyForm" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label>사업자 등록번호</label>
			<div class="row">
			  <div class="col-xs-2">
			    <input name="cSerial1" type="text" class="form-control">
			  </div>
			  <div class="col-xs-2">
			    <input name="cSerial2" type="text" class="form-control">
			  </div>
			  <div class="col-xs-3">
			    <input name="cSerial3" type="text" class="form-control">
			  </div>
			</div>
		</div>
		
  		<div class="form-group">
    		<label>기업명</label>
    		<input name="cName" type="text" class="form-control" placeholder="기업명">
  		</div>
  		
  		<div class="form-group">
    		<label>대표자명</label>
    		<input name="cCeo" type="text" class="form-control" placeholder="대표자명">
  		</div>
  		
  		<label>기업 형태</label>
  		<div class="form-group">
    		<label class="radio-inline">
			  <input type="radio" name="cSize" id="inlineRadio1" value="대기업" checked="checked"> 대기업
			</label>
			<label class="radio-inline">
			  <input type="radio" name="cSize" id="inlineRadio2" value="중소기업"> 중소기업
			</label>
			<label class="radio-inline">
			  <input type="radio" name="cSize" id="inlineRadio3" value="공공기관/공기업"> 공공기관/공기업
			</label>
			<label class="radio-inline">
			  <input type="radio" name="cSize" id="inlineRadio4" value="외국계기업"> 외국계기업
			</label>
  		</div>
  		
  		<label>업종</label>
  		<div class="business-title"><label>대분류</label><label>소분류</label></div>
  		<div class="form-group" style="height: 30px;">
    		<select class="business-main form-control">
			  <option value="service" selected="selected">서비스업</option>
			  <option value="production">제조/화학</option>
			  <option value="medical">의료/제약/복지</option>
			  <option value="sale">판매/유통</option>
			  <option value="education">교육업</option>
			  <option value="construction">건설업</option>
			  <option value="it">IT/통신</option>
			  <option value="design">미디어/디자인</option>
			  <option value="bank">은행/금융업</option>
			  <option value="a​gency">기관/협회</option>
			</select>

			<select id="subCode" name="subCode" class="business-sub service form-control">
			  <option value="1">호텔/여행/항공</option>
			  <option value="2">외식업/식음료</option>
			  <option value="3">공공기관/공기업</option>
			  <option value="4">웨딩/장례/이벤트</option>
			  <option value="5">뷰티/미용</option>
			  <option value="6">레저/스포츠/여가</option>
			  <option value="7">기타서비스업</option>
			</select>
			
			<select id="subCode" name="subCode" class="business-sub production form-control">
			  <option value="8">전기/전자/제어</option>
			  <option value="9">석유/화학/에너지</option>
			  <option value="10">섬유/의류</option>
			  <option value="11">농업/어업/광업</option>
			  <option value="12">기계/설비/자동차</option>
			  <option value="13">가구/목재/제지</option>
			  <option value="14">조선/항공/우주</option>
			  <option value="15">화장품/뷰티</option>
			  <option value="16">금속/철강</option>
			  <option value="17">생활용품/소비재</option>
			  <option value="18">기타제조업</option>
			</select>
			
			<select id="subCode" name="subCode" class="business-sub medical form-control">
			  <option value="19">의료</option>
			  <option value="20">제약</option>
			  <option value="21">사회복지</option>
			</select>
			
			<select id="subCode" name="subCode" class="business-sub sale form-control">
			  <option value="22">판매</option>
			  <option value="23">유통/무역</option>
			  <option value="24">운송/운수/물류</option>
			</select>
			
			<select id="subCode" name="subCode" class="business-sub education form-control">
			  <option value="25">초중고대학</option>
			  <option value="26">유아/유치원</option>
			  <option value="27">교재/학습지</option>
			  <option value="28">학원</option>
			  <option value="29">전문/기능학원</option>
			</select>
			
			<select id="subCode" name="subCode" class="business-sub construction form-control">
			  <option value="30">건설/건축/토목</option>
			  <option value="31">실내/인테리어</option>
			  <option value="32">환경/설비</option>
			  <option value="33">부동산/임대</option>
			</select>
			
			<select id="subCode" name="subCode" class="business-sub it form-control">
			  <option value="33">인터넷/컨텐츠</option>
			  <option value="34">쇼핑몰</option>
			  <option value="35">네트워크/통신</option>
			  <option value="36">모바일</option>
			  <option value="37">하드웨어</option>
			  <option value="38">소프트웨어</option>
			  <option value="39">정보보안</option>
			  <option value="40">IT컨설팅</option>
			  <option value="41">게임</option>
			</select>
			
			<select id="subCode" name="subCode" class="business-sub design form-control">
			  <option value="42">신문/잡지</option>
			  <option value="43">방송사/케이블</option>
			  <option value="44">연예/엔터테인먼트</option>
			  <option value="45">광고/홍보/전시</option>
			  <option value="46">영화/음악</option>
			  <option value="47">공연/문화</option>
			  <option value="48">출판/인쇄/사진</option>
			  <option value="49">캐릭터/애니메이션</option>
			  <option value="50">디자인/설계</option>
			</select>
			
			<select id="subCode" name="subCode" class="business-sub bank form-control">
			  <option value="51">은행/금융</option>
			  <option value="52">대출/캐피탈</option>
			  <option value="53">증권/보험</option>
			  <option value="54">기타금융</option>
			</select>
			
			<select id="subCode" name="subCode" class="business-sub a​gency form-control">
			  <option value="55">정부/공기업</option>
			  <option value="56">협회/단체</option>
			  <option value="57">법률/법무/특허</option>
			  <option value="58">세무/회계</option>
			</select>
  		</div>
  		
  		<div class="form-group">
    		<label>설립년도</label>
    		<input name="cCreated" type="date" class="form-control" placeholder="설립년도">
  		</div>
  		
  		<div class="form-group">
    		<label>사원수</label>
    		<input name="cPeople" type="number" class="form-control" placeholder="사원수">
  		</div>
  		
  		<div class="form-group">
    		<label>매출액</label>
    		<input name="cProfit" type="number" class="form-control" placeholder="매출액(단위 : 원)">
  		</div>
  		
  		<div class="form-group">
    		<label>기업소개</label>
    		<textarea name="cIntro" class="form-control" rows="3"></textarea>
  		</div>
  		
  		<div class="form-group">
    		<label>연락처</label>
    		<div class="row">
			  <div class="col-xs-2">
			    <select name="cTel1" class="form-control">
					<option value="">선 택</option>
					<option value="010" ${dto.tel1=="010" ? "selected='selected'" : ""}>010</option>
					<option value="011" ${dto.tel1=="011" ? "selected='selected'" : ""}>011</option>
					<option value="016" ${dto.tel1=="016" ? "selected='selected'" : ""}>016</option>
					<option value="017" ${dto.tel1=="017" ? "selected='selected'" : ""}>017</option>
					<option value="018" ${dto.tel1=="018" ? "selected='selected'" : ""}>018</option>
					<option value="019" ${dto.tel1=="019" ? "selected='selected'" : ""}>019</option>
				</select>
			  </div>
			  <div class="col-xs-2">
			    <input name="cTel2" type="text" class="form-control">
			  </div>
			  <div class="col-xs-2">
			    <input name="cTel3" type="text" class="form-control">
			  </div>
			</div>
  		</div>
  		
  		<div class="form-group">
    		<label>주소</label>
    		<input type="text" class="form-control" placeholder="주소">
  		</div>
  		
  		<div class="form-group">
    		<label>기업 로고 이미지</label>
    		<input name="upload" type="file">
  		</div>
  		
  		<div class="form-group">
    		<label>기업 배경 이미지</label>
    		<input name="upload" type="file">
  		</div>
  		
  		<button type="submit" class="btn btn-default">등록</button>
	</form>
</div>