<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript">
function check(){
	 if( $("#che_16").is(':checked') ){
	        $("input[name=chk]").prop("checked", true);
	      }else{
	        $("input[name=chk]").prop("checked", false);
	      }
}

function selectDelRow() {
	var chk = document.getElementsByName("chk"); // 체크박스객체를 담는다
	var len = chk.length;    //체크박스의 전체 개수
	var checkRow = '';      //체크된 체크박스의 value를 담기위한 변수
	var checkCnt = 0;        //체크된 체크박스의 개수
	var checkLast = '';      //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
	var rowid = '';             //체크된 체크박스의 모든 value 값을 담는다
	var cnt = 0;                 

	for(var i=0; i<len; i++){
		if(chk[i].checked == true){
			checkCnt++;        //체크된 체크박스의 개수
			checkLast = i;     //체크된 체크박스의 인덱스
		}
	} 
	for(var i=0; i<=checkLast; i++){
		if(chk[i].checked == true){
			alert(chk[i].value);
		}
	}
	
}
</script>

<div class="tip_list_wrap">
		<h3>| 취업꿀팁</h3>
		<p>
			각 분야별 취업관련 정보를 공유하고 소통하는 게시판입니다.
		</p>
		<div class="row">
			<p class="row_header">분야 설정</p>
			<span class="row_header_tip">Tip. 체크된 분야의 관련 글만 보여집니다.</span><br>
			<form name="input_form">
	    		<input type="checkbox" id="che_1" name="chk" value="A"><label for="che_1" class="green">서비스업</label>
	    		<input type="checkbox" id="che_2" name="chk" value="B"><label for="che_2" class="green">제조/화학</label>
	    		<input type="checkbox" id="che_3" name="chk" value="C"><label for="che_3" class="green">의료/복지</label>
	    		<input type="checkbox" id="che_4" name="chk" value="D"><label for="che_4" class="green">판매/유통</label><br>
	    		<input type="checkbox" id="che_5" name="chk" value="E"><label for="che_5" class="green">교육업</label>
	    		<input type="checkbox" id="che_6" name="chk" value="F"><label for="che_6" class="green">건설업</label>
	    		<input type="checkbox" id="che_7" name="chk" value="G"><label for="che_7" class="green">IT/통신</label>
	    		<input type="checkbox" id="che_8" name="chk" value="H"><label for="che_8" class="green">미디어/디자인</label><br>
	    		<input type="checkbox" id="che_9" name="chk" value="I"><label for="che_9" class="green">은행/금융업</label>
	    		<input type="checkbox" id="che_10" name="chk" value="J"><label for="che_10" class="green">기관/협회</label>
	    		<input type="checkbox" id="che_11" name="chk" value="K"><label for="che_11" class="green">직장인</label>
	    		<input type="checkbox" id="che_12" name="chk" value="L"><label for="che_12" class="green">공무원</label><br>
	    		<input type="checkbox" id="che_13" name="chk" value="M"><label for="che_13" class="green">취준생</label>
	    		<input type="checkbox" id="che_14" name="chk" value="N"><label for="che_14" class="green">알바생</label>
	    		<input type="checkbox" id="che_15" name="chk" value="O"><label for="che_15" class="green">기타</label>
	    		<input type="checkbox" id="che_16" name="chk" value="P" onclick="check();"><label for="che_16" class="green">전체</label>
    		</form>
    		<button onclick="selectDelRow();">1</button>
		</div>
		
		<div class="list-body" align="center">
			<div>
				<div align="right">1개(1/10 페이지)</div>

				<table class="table table-hover">
					<thead>
						<tr>
							<th width="110">말머리</th>
							<th width="60">번호</th>
							<th>제목</th>
							<th width="100">작성자</th>
							<th width="100">작성일</th>
							<th width="60">조회수</th>
							<th width="60">추천수</th>
						</tr>
					</thead>

					<tbody>
						<tr align="center">
							<td>미디어/디자인</td>
							<td>1</td>
							<td align="left"><a href="#">공무원 소식1</a></td>
							<td>관리자</td>
							<td>2017-06-27</td>
							<td>0</td>
							<td>0</td>
						</tr>
						<tr align="center">
							<td>IT/통신</td>
							<td>2</td>
							<td align="left"><a href="#">공무원 소식2</a></td>
							<td>관리자</td>
							<td>2017-06-27</td>
							<td>0</td>
							<td>0</td>
						</tr>
					</tbody>
				</table>

				<div>
					<div>1 2 3</div>
				</div>

				<div class= "footer-bar" >
					<div class = "foorter-bar-refresh">
						<button type="button" class="btn btn-default btn-sm wbtn" onclick="#">새로고침</button>
					</div>
					<div class = "footer-search-bar">
						<form name="searchForm" method="post" class="form-inline">
							<select class="form-control input-sm" name="searchKey">
								<option value="subject">제목</option>
								<option value="userName">작성자</option>
								<option value="content">내용</option>
								<option value="created">등록일</option>
							</select> <input type="text" class="form-control input-sm input-search"
								name="searchValue">
							<button type="button" class="btn btn-info btn-sm btn-search" onclick="searchList();">
								검색
							</button>
						</form>
					</div>
					<div class = "footer-bar-submit">
						<button type="button" class="btn btn-default"
							onclick="#">
							 글쓰기
						</button>
					</div>
				</div>
			</div>
	</div>
</div>