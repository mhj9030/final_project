<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp=request.getContextPath();
%>
<script>
	$(function(){
		$(document).on("click", "input[name=order]" ,function(){
			var f=document.searchForm;
			var ceNum=f.ceNum.value;
			var ceSubject=f.ceSubject.value;
			var order=$(this).val();
			
			searchList(ceNum, ceSubject, order);
		});
	});

	function searchList(ceNum, ceSubject, order){
		$("#employ-subject").html(ceSubject);
		
		var f=document.searchForm;
		f.ceNum.value=ceNum;
		f.ceSubject.value=ceSubject;
		
		var url="<%=cp%>/company/applicant/list";
		var query="ceNum="+ceNum+"&order="+order;
		
		$.ajax({
			type:"POST",
			url:url,
			data:query,
			dataType:"JSON",
			success:function(data){
				var dataCount=data.dataCount;	
				var paging=data.paging;
				
				var out="<div class='list-header' style='margin-top: 30px;'>";
				out+="<div align='left' style='float: left;'><h4>전체 지원자("+dataCount+"명)</h4></div>";
				out+="	<div class='chk_info' align='right'>";
				out+="		<input type='radio' name='order' value='recent'> 최신순";
				out+="		<input type='radio' name='order' value='name'> 이름순";
				out+="	</div>";
				out+="</div>";
				
				if(dataCount!=0){
					for(var idx=0; idx<data.list.length; idx++){
						var proPhoto=data.list[idx].proPhoto;
						var mName=data.list[idx].mName;
						var mGender=data.list[idx].mGender;
						var proIntro=data.list[idx].proIntro;
						var mId=data.list[idx].mId;
						var rNum=data.list[idx].rNum;
						
						out+="<div class='list-item'>";
						out+="	<div class='item-image'>";
						if(proPhoto!=null){
							out+="<img width='80px' src='<%=cp%>/uploads/profile/"+proPhoto+"'>";
						} else{
							out+="<img width='80px' src='<%=cp%>/resources/image/profile_img.jpg'>";
						}
						out+="	</div>";
						out+="	<div class='item-content'>";
						out+="		<div class='content-name' style='margin-top: 5px; margin-bottom: 7px;'>";
						out+="			<strong>"+mName+"</strong><span> "+mGender+"</span>";
						out+="		</div>";
						out+="		<div class='content-info' align='right'>";
						out+="			<span class='label label-primary'><a href='<%=cp%>/profile?id="+mId+"'><span class='glyphicon glyphicon-user'></span> 프로필 보기</a></span>";
						out+="			&nbsp;&nbsp;<span class='label label-primary'><a href='<%=cp%>/member/applications/application?rNum="+rNum+"'><span class='glyphicon glyphicon-list-alt'></span> 이력서 보기</a></span>";
						out+="		</div>";
						if(proIntro!=null){
							out+="<div class='content-intro'>"+proIntro+"</div>";
						} else{
							out+="<div class='content-intro'>자기소개가 없습니다.</div>";
						}
						out+="		<div class='content-email'><h5>"+mId+"</h5></div></div>";
						out+="	</div>";
					}
				}
				out+="<div class='page'>";
				out+="	<div>"+paging+"</div>";
				out+="</div>";
				
				$("#listApplicant").html(out);
				
				$("input:radio[name=order]:radio[value="+order+"]").prop("checked", true);
			}
		});
	}
</script>
<div class="applicant-list-body" align="center">
	<div class="body-header">
		<h3 align="left">
			| 지원자 현황 
			<small style="font-family: 'Gudea', sans-serif; letter-spacing: 3px; margin-left: 5px; font-size: 16px; font-weight: bold; color: #6d6b6b;">
				Applicant
			</small>
		</h3>
		<hr>
	</div>
	
	<div class="search" style="width: 800px; height: 34px;">
		<div class="row">
			<div class="col-xs-2">
				<div class="btn-group">
				  	<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
				    	채용 선택 <span class="caret"></span>
				  	</button>
					<ul class="dropdown-menu" role="menu">
						<c:if test="${empty listEmploy}">
							<li><a href="#">진행 중인 채용 정보가 없습니다</a></li>
						</c:if>
						<c:forEach var="dto" items="${listEmploy}">
							<li><a href="#" onclick="searchList('${dto.ceNum}', '${dto.ceSubject}', 'recent'); return false">${dto.ceSubject}</a></li>
							
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="col-xs-10" style="text-align: left">
				<div class="search-content" style="margin-top: 7px;">
					<span id="employ-subject">원하는 채용 정보를 선택하세요.</span>
				</div>
			</div>
		</div>
	</div>
	
	<form name="searchForm" action="" method="post">
		<input type="hidden" name="ceNum">
		<input type="hidden" name="ceSubject">
	</form>
	
	<div id="listApplicant" class="list"></div>
</div>
