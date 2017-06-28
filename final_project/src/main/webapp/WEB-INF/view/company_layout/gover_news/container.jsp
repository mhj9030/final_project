<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>

<div class="list-body" align="center">
	<div class="page-header">
  		<h1 align="left">| 공무원 소식 <small></small></h1>
	</div>
	
	<div>
		<div align="right">1개(1/10 페이지)</div>

		<table class="table table-hover">
			<thead>
				<tr>
					<th width="60">번호</th>
					<th>제목</th>
					<th width="100">작성자</th>
					<th width="100">작성일</th>
					<th width="60">조회수</th>
				</tr>
			</thead>
			
			<tbody>
				<tr align="center">
					<td>1</td>
					<td align="left">
						<a href="#">공무원 소식1</a>
					</td>
					<td>관리자</td>
					<td>2017-06-27</td>
					<td>0</td>
				</tr>
				<tr align="center">
					<td>2</td>
					<td align="left">
						<a href="#">공무원 소식2</a>
					</td>
					<td>관리자</td>
					<td>2017-06-27</td>
					<td>0</td>
				</tr>
			</tbody>
		</table>
		
		<div>
			<div>1 2 3</div>
		</div>
		
		<table class="list-comp">
			<tr>
				<td align="left" width="100">
		        	<button class="btn btn-default" type="button" class="btn" onclick="javascript:location.href='<%=cp%>/company/gover_news';">새로고침</button>
		    	</td>
		    	
		    	<td align="center">
		    		<div class="list-search">
		    			<form name="searchForm" action="" method="post">
			    			<select name="searchKey" class="list-searchList" style="float: left;">
						    	<option value="subject">제목</option> 
						        <option value="userName">작성자</option>
						        <option value="content">내용</option>
						        <option value="created">등록일</option>
				           	</select>
				            
				            <div class="input-group" style="float: left;">
		      					<input type="text" class="form-control" placeholder="">
							    <span class="input-group-btn">
							    	<button class="btn btn-default" type="button">검색</button>
							    </span>
							</div>
		    			</form>
		    		</div>
		    	</td>
		    	
		    	<td align="right" width="100">
		          	<button class="btn btn-default" type="button" onclick="javascript:location.href='<%=cp%>/company/gover_news/created';">글올리기</button>
		      	</td>
		    </tr>
		</table>
	</div>
</div>
