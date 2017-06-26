<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
   String cp = request.getContextPath();
%>



<div id="wrap">
    <div id="content">
        <div class="page profile">
            <div class="wrap_wide cmenu">
                <div class="wrap">
                    <ul class="nav nav-pills" role="tablist">
                        <li role="presentation" class="on"><a href="/@maryjune778">내 프로필</a></li>
                        <li role="presentation" class=""><a href="/@maryjune778/friends">내 친구들</a></li>
                        <li role="presentation" class=""><a href="/@maryjune778/find-friends">친구 찾기 </a></li>
                        <li role="presentation" class=""><a href="/@maryjune778/activities">활동로그</a></li>
                        <li role="presentation" class=""><a href="/@maryjune778/notifications">알림 </a></li>
                        <li role="presentation" class=""><a href="/@maryjune778/applications">지원서 관리</a></li>
                    </ul>
                </div>
            </div>
            <div class="wrap_wide section cover">
                <div id="cover_image" class="image">
                    <div class="in"></div>
                </div>
            </div>
            <div class="wrap_wide ontop shadow">
                <div class="wrap">
                    <div class="main all">
                        <section class="section summary">
                            <div class="user_thumb">
                                <div class="preview"> <img id="profile_image_preview" src="<%=cp %>/resources/image/profile_img.jpg" alt="" class="img img-center"> </div>
                                <div class="icontrol show">
                                    <form method="post" action="/api/users/80085/image" enctype="multipart/form-data" class="form-inline media">
                                        <input type="hidden" name="csrfmiddlewaretoken" value="7zomLBLnaZb58TwSGINUPY6k8JQiITNn">
                                        <button type="button" id="id_profile_image_btn" class="btn btn-xs btn-default">프로필 이미지 변경</button>
                                        <input type="file" id="id_profile_image_file" name="image" accept="image/x-png, image/gif, image/jpeg" class="form-control" style="width:100%;height:100%;"> </form>
                                </div>
                            </div>
                            <div id="user_info" class="section user_info">
                                <div class="name clearfix">
                                    <p class="job_title"> </p>
                                    <h2 class="break">
                                <strong>사용자 이름</strong><span> 남 / 여 </span>
 
                                
                            </h2> </div>
                            </div>
                            <div id="user_status" class="user_status" data-url="/api/users/80085/role/template">

                                <div id="role_state" class="role text-center">
                                    <p id="role_state_is_seek_job" class="hide" style="display:inline;margin:0 5px;">구직중</p>
                                    <p id="role_state_is_freelancer" class="hide" style="display:inline;margin:0 5px;">프리랜서</p>
                                </div>
                                <div class="btns">
                                    <button type="button" data-toggle="modal" data-target="#jobModal" class="btn btn-xs btn-default">분야/구직 설정</button>
                                </div>
 
                            </div>
                            <div id="user_overview" class="section overview">
                                <div class="tab-content set">
                                    <div id="overview_view" class="panel-inline media tab-pane active">
                                        <div class="panel-body overview">
                                            <div id="overview_view_text" class="overview"> 아직 자기소개가 없습니다.
 
                                            </div>
                                        </div>
                                    </div>
                                    <form id="overview_form" action="/api/users/80085/overview" method="put" class="form user_overview clearfix tab-pane" data-target="#overview_view_text">
                                        <label for="id_overview">자기소개</label>
                                        <div class="form-group">
                                            <textarea id="id_overview" name="overview" data-origin="" rows="4" maxlength="200" placeholder="자기소개" class="form-control"></textarea>
                                        </div>
                                        <div class="pull-left"> <small class="help-block">(<var id="id_overview_length">0</var>/200)</small> </div>
                                        <div class="pull-right">
                                            <button type="button" class="btn btn-link back" data-toggle="tab" data-target="#overview_view">취소</button>
                                            <button type="submit" class="btn btn-primary save" data-ing="저장중" data-done="저장" data-retry="재요청" data-target="#overview_view">저장</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div id="section_highlights" class="section highlights" data-url="/api/users/80085/highlight/template">
                                <dl id="id_highlights_text" class="highlights"> </dl>
                                <div class="modal fade" id="highlightsModal">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="ic ic-icon ic-close"></span></button>
                                                <h4 class="modal-title">하이라이트 설정</h4> </div>
                                            <div class="modal-body">
                                                <div id="user_highlights" class="section highlights">
                                                    <div class="panel">
                                                        <div class="panel-body highlights">
                                                            <h4>하이라이트</h4>
                                                            <ul class="list-unstyled clearfix exp"> </ul>
                                                        </div>
                                                        <div style="margin-top:20px;margin-left:4px;">모든 항목이 선택되었습니다.</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" data-dismiss="modal" class="btn btn-primary">완료</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <section id="section_stats" class="section stats" data-url="/api/users/80085/stat/template">
                            <div class="stats">
                                <dl class="dl clearfix"> </dl>
                            </div>
                        </section>
                        <section id="section_actions" class="section actions">
                            <div class="panel panel-box">
                                <div class="panel-head sr-only">
                                    <h3 class="panel-title">프로필 관리</h3> </div>
                                <div class="panel-body">
                                    <div class="clearfix">
                                        <div class="pull-left"> <span class="friends">내 친구 0, 내 프로필 방문자 15</span> </div>
                                        <div class="pull-right">
                                            <div class="btn-group pull-left preview">
                                                <button type="button" class="btn btn-default dropdown-toggle edit" data-toggle="dropdown" aria-expanded="false"> 프로필 미리보기 <span class="caret"></span> <span class="sr-only">메뉴 더보기</span> </button>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li><a href="/@maryjune778/preview?type=0">전체공개</a></li>
                                                    <li><a href="/@maryjune778/preview?type=1">로켓펀치 회원</a></li>
                                                    <li><a href="/@maryjune778/preview?type=2">친구</a></li>
                                                </ul>
                                            </div>
                                            <div class="pull-left reference">
                                                <button type="button" data-toggle="modal" data-target="#referenceModal" class="btn btn-primary">추천서 부탁하기</button>
                                            </div>
                                            <div class="pull-left share">
                                                <div id="share_wrap" data-title="김준서" >
                                                    <div id="id_share" data-obj="profile">
                                                        <div class="dropdown share">
                                                            <button type="button" id="share_toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-url="/api/users/80085/share_increase" class="btn btn-info"><span class="ic ic-icon ic-ellipsis_h" style="font-size:16px;color:white;"></span></button>
                                                            <ul class="dropdown-menu clearfix" role="menu">
                                                                <li>
                                                                    <button type="button" id="btn_collection_add" data-toggle="popover" data-target="#template_collection_add" data-url="/api/collections?user_id=80085" data-html="true" data-placement="bottom" class="btn" data-original-title="" title="">내 컬렉션에 추가</button>
                                                                </li>
                                                                <li>
                                                                    <button type="button" id="share_facebook" class="btn btn-icon"> <span class="ic ic-icon ic-sns_facebook"></span> <span class="ic-text">페이스북 공유</span> </button>
                                                                </li>
                                                                <li>
                                                                    <button type="button" id="share_twitter" data-text="#스타트업 #프로필" class="btn btn-icon"> <span class="ic ic-icon ic-sns_twitter"></span> <span class="ic-text">트위터 공유</span> </button>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div id="template_collection_add" class="" style="display:none;">
                                                        <div class="panel panel-in">
                                                            <div class="panel-head">
                                                                <h3 class="panel-title">컬렉션을 선택해주세요.</h3></div>
                                                            <div class="panel-body">
                                                                <ul id="my_collection_list" data-empty="회원님의 컬렉션을 만들 수 있습니다." class="list-unstyled">
                                                                    <li>회원님의 컬렉션을 만들 수 있습니다.</li>
                                                                </ul>
                                                            </div>
                                                            <div class="panel-footer text-right">
                                                                <button type="button" data-toggle="modal" data-target="#collectionFormModal" class="btn btn-xs btn-primary">컬렉션 등록</button>
                                                            </div>
                                                        </div>
                                                        <div class="popover-close">
                                                            <button type="button" aria-label="Close" class="btn btn-icon close"><span class="ic ic-icon ic-close"></span><span class="sr-only">내 컬렉션 레이어 닫기</span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>

<div class="wrap_wide cmenu">
    <div class="wrap">
<ul class="nav nav-pills" role="tablist">
            <li role="presentation"><a href="/@maryjune778">내 프로필</a></li>
            <li role="presentation"><a href="/@maryjune778/friends">내 친구들</a></li>
            <li role="presentation"><a href="/@maryjune778/find-friends">친구 찾기 </a></li>
            <li role="presentation"><a href="/@maryjune778/activities">활동로그</a></li>
            <li role="presentation"><a href="/@maryjune778/notifications">알림 </a></li>
            <li role="presentation"><a href="/@maryjune778/applications">지원서 관리</a></li>
        </ul>

    </div>
</div>
