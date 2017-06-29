<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>

<div class="created-body">
	<div class="page-header">
		<h1 align="left">
			| 기업등록 <small></small>
		</h1>
	</div>

	<form method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label>사업자 등록번호</label>
			<div class="row">
			  <div class="col-xs-2">
			    <input type="text" class="form-control">
			  </div>
			  <div class="col-xs-2">
			    <input type="text" class="form-control">
			  </div>
			  <div class="col-xs-3">
			    <input type="text" class="form-control">
			  </div>
			</div>
		</div>
		
  		<div class="form-group">
    		<label>기업명</label>
    		<input type="text" class="form-control" placeholder="기업명">
  		</div>
  		
  		<div class="form-group">
    		<label>대표자명</label>
    		<input type="text" class="form-control" placeholder="대표자명">
  		</div>
  		
  		<label>기업 형태</label>
  		<div class="form-group">
    		<label class="radio-inline">
			  <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> 대기업
			</label>
			<label class="radio-inline">
			  <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> 중소기업
			</label>
			<label class="radio-inline">
			  <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3"> 공공기관/공기업
			</label>
			<label class="radio-inline">
			  <input type="radio" name="inlineRadioOptions" id="inlineRadio4" value="option4"> 외국계 기업
			</label>
  		</div>
  		
  		<label>업종</label>
  		<div class="form-group">
    		<select class="business main form-control">
			  <option>서비스업</option>
			  <option>제조/화학</option>
			  <option>의료/제약/복지</option>
			  <option>교육업</option>
			  <option>건설업</option>
			  <option>IT/통신</option>
			  <option>미디어/디자인</option>
			  <option>은행/금융업</option>
			  <option>기관/협회</option>
			</select>
			
			<select class="business sub form-control">
			  <option>호텔/여행/항공</option>
			  <option>외식업/식음료</option>
			  <option>공공기관/공기업</option>
			  <option>웨딩/장례/이벤트</option>
			  <option>뷰티/미용</option>
			  <option>레저/스포츠/여가</option>
			  <option>기타서비스업</option>
			</select>
			
			<select class="business sub form-control">
			  <option>전기/전자/제어</option>
			  <option>석유/화학/에너지</option>
			  <option>섬유/의류</option>
			  <option>농업/어업/광업</option>
			  <option>기계/설비/자동차</option>
			  <option>가구/목재/제지</option>
			  <option>조선/항공/우주</option>
			  <option>화장품/뷰티</option>
			  <option>금속/철강</option>
			  <option>생활용품/소비재</option>
			  <option>기타제조업</option>
			</select>
			
			<select class="business sub form-control">
			  <option>대기업</option>
			  <option>중소기업</option>
			  <option>공공기관/공기업</option>
			  <option>외국계 기업</option>
			</select>
			
			<select class="business sub form-control">
			  <option>의료</option>
			  <option>제약</option>
			  <option>사회복지</option>
			</select>
			
			<select class="business sub form-control">
			  <option>판매</option>
			  <option>유통/무역</option>
			  <option>운송/운수/물류</option>
			</select>
			
			<select class="business sub form-control">
			  <option>초중고대학</option>
			  <option>유아/유치원</option>
			  <option>교재/학습지</option>
			  <option>학원</option>
			  <option>전문/기능학원</option>
			</select>
			
			<select class="business sub form-control">
			  <option>건설/건축/토목</option>
			  <option>실내/인테리어</option>
			  <option>환경/설비</option>
			  <option>부동산/임대</option>
			</select>
			
			<select class="business sub form-control">
			  <option>인터넷/컨텐츠</option>
			  <option>쇼핑몰</option>
			  <option>네트워크/통신</option>
			  <option>모바일</option>
			  <option>하드웨어</option>
			  <option>소프트웨어</option>
			  <option>정보보안</option>
			  <option>IT컨설팅</option>
			  <option>게임</option>
			</select>
			
			<select class="business sub form-control">
			  <option>신문/잡지</option>
			  <option>방송사/케이블</option>
			  <option>연예/엔터테인먼트</option>
			  <option>광고/홍보/전시</option>
			  <option>영화/음악</option>
			  <option>공연/문화</option>
			  <option>출판/인쇄/사진</option>
			  <option>캐릭터/애니메이션</option>
			  <option>디자인/설계</option>
			</select>
			
			<select class="business sub form-control">
			  <option>은행/금융</option>
			  <option>대출/캐피탈</option>
			  <option>증권/보험</option>
			  <option>기타금융</option>
			</select>
			
			<select class="business sub form-control">
			  <option>정부/공기업</option>
			  <option>협회/단체</option>
			  <option>법률/법무/특허</option>
			  <option>세무/회계</option>
			</select>
  		</div>
  		
  		<div class="form-group" style="clear: both;">
    		<label for="exampleInputFile">파일 업로드</label>
    		<input type="file" id="exampleInputFile">
  		</div>
  		<div class="checkbox">
    		<label>
      			<input type="checkbox"> 입력을 기억합니다
    		</label>
  		</div>
  		<button type="submit" class="btn btn-default">제출</button>
	</form>
</div>