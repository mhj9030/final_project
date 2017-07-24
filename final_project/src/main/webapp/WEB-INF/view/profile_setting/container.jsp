<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
    function sendOk() {
        var f = document.pwdform;
        f.action = "<%=cp%>/profile/pwd";
        f.submit();
    }
</script>
<script>
    $(function () {
        var mode = "${mode}";
        if (mode == "completed") {
            swal('', '등록되었습니다!', 'success')
        }
    });
</script>
<div class="contents">
    <div class="wrap">
        <div class="span3 well setting"> 
	        <a href="#aboutModal" data-toggle="modal" data-target="#myModal">
	        	<c:if test="${empty dto.proPhoto}">
	        		<img src="<%=cp%>/resources/image/profile_img.jpg" name="aboutme" width="140" height="140" class="img-circle">
	        	</c:if>
	        	<c:if test="${not empty dto.proPhoto}">
	        		<img src="<%=cp%>/uploads/profile/${dto.proPhoto}" name="aboutme" width="140" height="140" class="img-circle">
	        	</c:if>
	        </a>
            <h3>${dto.mname } <small> ${dto.mgender }</small></h3>
            <div class="row"> <em>
        	<c:if test="${empty dto.proIntro }">
                                             자기 소개가 없습니다.
 											</c:if>
 											
 											<c:if test="${!empty dto.proIntro }">
                                             ${dto.proIntro }
 											</c:if>
        </em> </div>
        	<div align="right">
	        	<a href="<%=cp%>/profile/update?id=${member.userId}">
		            <span class="glyphicon glyphicon-cog"></span>프로필 수정
		        </a>
	        </div>
                    <script>
            $("#skil").tagsinput("destroy");
            </script>
           <div class="row"> <span><strong>전문분야: </strong></span> <c:if test="${empty dto.expertise }">등록된 전문 분야가 없습니다</c:if> <c:if test="${not empty dto.expertise }"><input type="text" id="skil" value="${dto.expertise}" data-role="tagsinput" disabled="disabled"></c:if> </div>
        </div>
        <div class="main all">
            <section class="section_box">
                <div class="panel-head">
                    <h3 class="panel-title">계정설정 <small>프로필 완성도를 높여 본인의 프로필을 꾸며보세요.</small></h3> </div>
                <div class="panel panel-default">
                    <div class="panel-body panel-view shadow">
                        <ul class="list-unstyled list list4 list-overflow-x clearfix">
                            <li role="presentation">
                                <a href="#section_careers" data-toggle="collapse" data-target="#career" aria-expanded="false" aria-controls="collapseExample">
                                    <div class="panel panel-info panel-colorful-cus">
                                        <div class="pad-all text-center"> <i class="fa fa-building-o" aria-hidden="true"></i> <span class="text-2x text-thin">경력</span>
                                            <p class="bo">경력 추가하기</p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li role="presentation">
                                <a href="#section_careers" data-toggle="collapse" data-target="#project" aria-expanded="false">
                                    <div class="panel panel-info panel-colorful-cus">
                                        <div class="pad-all text-center"> <i class="fa fa-suitcase" aria-hidden="true"></i> <span class="text-2x text-thin">프로젝트</span>
                                            <p class="bo">프로젝트 추가하기</p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li role="presentation">
                                <a href="#section_careers" data-toggle="collapse" data-target="#school" aria-expanded="false">
                                    <div class="panel panel-info panel-colorful-cus">
                                        <div class="pad-all text-center"> <i class="fa fa-university" aria-hidden="true"></i> <span class="text-2x text-thin">학교</span>
                                            <p class="bo">학교 추가</p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li role="presentation">
                                <a href="#section_careers" data-toggle="collapse" data-target="#specialty" aria-expanded="false">
                                    <div class="panel panel-info panel-colorful-cus">
                                        <div class="pad-all text-center"> <i class="fa fa-building-o" aria-hidden="true"></i> <span class="text-2x text-thin">대표 전문 분야</span>
                                            <p class="bo">대표 전문 분야 추가</p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li role="presentation">
                                <a href="#section_careers" data-toggle="collapse" data-target="#mypassword" aria-expanded="false">
                                    <div class="panel panel-info panel-colorful-cus">
                                        <div class="pad-all text-center"> <i class="fa fa-building-o" aria-hidden="true"></i> <span class="text-2x text-thin">비밀번호 관리</span>
                                            <p class="bo">비밀번호 변경</p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li role="presentation">
                                <a href="#section_careers" data-toggle="collapse" data-target="#otp" aria-expanded="false">
                                    <div class="panel panel-info panel-colorful-cus">
                                        <div class="pad-all text-center"> <i class="fa fa-building-o" aria-hidden="true"></i> <span class="text-2x text-thin">OTP</span>
                                            <p class="bo">OTP 적용</p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </section>
        </div>
        <div class="collapse" id="career" aria-expanded="false">
            <div class="well">
                <div id="collapse_career" class="panel-body panel-form shadow collapse in" aria-expanded="true">
                    <form name="submitcareer" method="post" class="form form-horizontal experience">
                        <fieldset>
                            <div class="form-group guided_action">
                                <label for="id_company_name_" class="col-sm-3 control-label">* 기업명</label>
                                <div class="col-sm-9">
                                    <div class="input-group inline auto">
                                        <input type="text" name="company" placeholder="기업명" required="" class="autocomplete company form-control ui-autocomplete-input"> <span class="ic ic-icon ic-search icon-rt"></span> </div>
                                </div>
                            </div>
                            <div class="form-group guided_action">
                                <label for="id_job_title_" class="col-sm-3 control-label">* 역할</label>
                                <div class="col-sm-9">
                                    <div class="input-group inline auto">
                                        <input type="text" id="id_job_title_" name="part" placeholder="역할" required="required" class="autocomplete jobtitle form-control ui-autocomplete-input"> <span class="ic ic-icon ic-search icon-rt"></span> </div>
                                    <input type="hidden" name="job_title" value="" class="form-control reset"> </div>
                            </div>
                            <div class="form-group guided_action career_date">
                                <label for="id_start_date_" class="col-sm-3 control-label">재직 기간</label>
                                <div class="col-sm-9">
                                    <div class="date inline from">
                                        <input type="text" class="form-control inline" id="mbirth" name="carstart" data-toggle="datepicker" placeholder="입사날짜" readonly="readonly"> </div>
                                    <div class="date inline to">
                                        <input type="text" class="form-control inline" id="mbirth" name="carend" data-toggle="datepicker" placeholder="퇴사날짜" readonly="readonly">
                                        <input type="checkbox" name="is_current"> 재직 중 </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="id_overview" class="col-sm-3 control-label">간단 설명</label>
                                <div class="col-sm-9">
                                    <textarea cols="40" id="id_description" name="memo" rows="2" placeholder="간단 설명" class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="form-group button">
                                <div class="col-sm-offset-3 col-sm-9">
                                    <div class="clearfix form-error"></div>
                                    <button type="submit" class="btn btn-primary add" onclick="return insertcarrer();">추가</button>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
        <div class="collapse" id="project" aria-expanded="false">
            <div class="well">
                            <div id="collapse_career" class="panel-body panel-form shadow collapse in" aria-expanded="true">
                    <form name="submitcareer" method="post" class="form form-horizontal experience">
                        <fieldset>
                            <div class="form-group guided_action">
                                <label for="id_company_name_" class="col-sm-3 control-label">* 프로젝트 이름</label>
                                <div class="col-sm-9">
                                    <div class="input-group inline auto">
                                        <input type="text" name="prname" placeholder="프로젝트" required="required" class="autocomplete company form-control ui-autocomplete-input"> <span class="ic ic-icon ic-search icon-rt"></span> </div>
                                </div>
                            </div>
                            <div class="form-group guided_action">
                                <label for="id_job_title_" class="col-sm-3 control-label">* 역할</label>
                                <div class="col-sm-9">
                                    <div class="input-group inline auto">
                                        <input type="text" id="id_job_title_" name="part" placeholder="역할" required="required" class="autocomplete jobtitle form-control ui-autocomplete-input"> <span class="ic ic-icon ic-search icon-rt"></span> </div>
                                    <input type="hidden" name="job_title" value="" class="form-control reset"> </div>
                            </div>
                            <div class="form-group guided_action career_date">
                                <label for="id_start_date_" class="col-sm-3 control-label">참여 기간</label>
                                <div class="col-sm-9">
                                    <div class="date inline from">
                                        <input type="text" class="form-control inline" id="mbirth" name="expstartyear" data-toggle="datepicker" placeholder="시작년도" readonly="readonly"> </div>
                                    <div class="date inline to">
                                        <input type="text" class="form-control inline" id="mbirth" name="expendyear" data-toggle="datepicker" placeholder="종료날짜" readonly="readonly">
                                        <input type="checkbox" value = "진행중" name="expstate"> 진행 중 </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="id_overview" class="col-sm-3 control-label">간단 설명</label>
                                <div class="col-sm-9">
                                    <textarea cols="40" id="id_description" name="memo" rows="2" placeholder="간단 설명" class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="form-group button">
                                <div class="col-sm-offset-3 col-sm-9">
                                    <div class="clearfix form-error"></div>
                                    <button type="submit" class="btn btn-primary add" onclick="return insertcarrer();">추가</button>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
        <div class="collapse" id="school" aria-expanded="false">
            <div class="well">
                <div id="collapse_career" class="panel-body panel-form shadow collapse in" aria-expanded="true">
                    <form name="submitability" method="post" class="form form-horizontal experience">
                        <fieldset>
                            <div class="form-group guided_action">
                                <label for="id_company_name_" class="col-sm-3 control-label">* 학교</label>
                                <div class="col-sm-9">
                                    <div class="input-group inline auto">
                                        <input type="text" name="school" placeholder="학교" required="required" class="autocomplete company form-control ui-autocomplete-input"> <span class="ic ic-icon ic-search icon-rt"></span> </div>
                                </div>
                            </div>
                            <div class="form-group guided_action">
                                <label for="id_job_title_" class="col-sm-3 control-label">* 전공</label>
                                <div class="col-sm-9">
                                    <div class="input-group inline auto">
                                        <input type="text" id="id_job_title_" name="major" placeholder="전공" required="required" class="autocomplete jobtitle form-control ui-autocomplete-input"> <span class="ic ic-icon ic-search icon-rt"></span> </div>
                                </div>
                            </div>
                            <div class="form-group guided_action career_date">
                                <label for="id_start_date_" class="col-sm-3 control-label">재직 기간</label>
                                <div class="col-sm-9">
                                    <div class="date inline from">
                                        <input type="text" class="form-control inline" maxlength="4" name="termstart" placeholder="입학년도"> </div>
                                    <div class="date inline to">
                                        <input type="text" class="form-control inline" maxlength="4" name="termend" placeholder="졸업년도">
                                        <select name="termstate" class="form-control inline">
                                            <option value="졸업">졸업</option>
                                            <option value="재학">재학</option>
                                            <option value="휴학">휴학</option>
                                            <option value="중퇴">중퇴</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="id_overview" class="col-sm-3 control-label">간단 설명</label>
                                <div class="col-sm-9">
                                    <textarea cols="40" id="id_description" name="memo" rows="2" placeholder="간단 설명" class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="form-group button">
                                <div class="col-sm-offset-3 col-sm-9">
                                    <div class="clearfix form-error"></div>
                                    <button type="submit" class="btn btn-primary add" onclick="return insertAbility();">추가</button>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
        <div class="collapse" id="specialty" aria-expanded="false">
            <div class="well">
                               <form name="submitExpertise" method="post" class="form form-horizontal experience">
                        <fieldset>
                            <div class="form-group guided_action career_date">
                            <div class="alert alert-warning" role="alert">태그는 최대 6개 까지만 등록 할 수 있으며 한개의 태그당 최대 12글자를 입력 할 수 있습니다.</div>             
                                <label for="id_start_date_" class="col-sm-3 control-label">전문분야</label>
                                <div class="col-sm-9">
                                    <div class="date inline from">
                                    
                                       <input type="text"  name = "expertise" id="expertise" value="${dto.expertise}" data-role="tagsinput">
                                         </div>
                                         <script >
                                         $("#expertise").tagsinput({
                                        	 	maxTags: 6, // 최대 태그 갯수
                                        	 	maxChars: 12, // 한개의 태그에 최대 글자수
                                        	 	trimValue: true // 태그 공백 제거
                                         });
                                         </script>
                                </div>
                            </div>
                            <div class="form-group button">
                                <div class="col-sm-offset-3 col-sm-9">
                                    <div class="clearfix form-error"></div>
                                    
                                </div>
                            </div>
                        </fieldset>
                        <input type="submit" class="btn btn-primary add" value="수정완료" onclick="return insertExpertise();">
                    </form>
                    
            </div>
        </div>
        <div class="collapse" id="mypassword" aria-expanded="false">
            <div class="well"> 비밀번호 관리 </div>
        </div>
        <div class="collapse" id="otp" aria-expanded="false">
            <div class="well"> OTP </div>
        </div>
    </div>
</div>
