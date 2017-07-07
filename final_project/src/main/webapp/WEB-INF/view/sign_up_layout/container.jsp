<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
%>

<script>
$(function() {
	var mode = "${mode}";
	if(mode =="registerComplet"){
		swal(
				  '가입을 환영합니다!',
				  '이제 등록한 아이디로 로그인 할 수 있습니다.',
				  'success'
				)
	} 
});


</script>



<div class="container">


<div class="row">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<form name = "memberRegister" method="post" onsubmit="return register();">
			<h4>잡 스퀘어 회원가입 </h4>
			<p>지금 가입하고 비즈니스와 커리어를 성장시킬 수 있는 다양한 기회들을 만나보세요!</p>
			<hr class="colorgraph">
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
                        <input type="text" name="firstname" id="id_first_name" class="form-control input" placeholder="성" required="required">
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="text" name="lastname" id="id_last_name" onchange="getUsername();" class="form-control input" placeholder="이름" required="required">
						<input type="hidden" id = "mname" name="mname" value="">
					</div>
				</div>
			</div>
			<div class="form-group">
				<input type="email" name="mid" id="m_email" class="form-control input" onchange="userEmailCheckl();" placeholder="E-mail" required="required">
			</div>
			
						
				
					<div class="form-group">
                         <input type="password" name="mpwd" id="password1" class="form-control input" placeholder="비밀번호" required="required">
					</div>
				

		
			

					
								<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
                        <input type="text" class="form-control docs-date" id = "mbirth" name="mbirth" data-toggle="datepicker" placeholder="생년월일" readonly="readonly">
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						               <label class="radio-inline">
  <input type="radio" name="mgender" id="inlineRadio1" value="남"> 남성
</label>
<label class="radio-inline">
  <input type="radio" name="mgender" id="inlineRadio2" value="여"> 여성
</label>
					</div>
				</div>
			</div>

			<div class="form-group">
			회원가입시 잡스퀘어 <a href="#" data-toggle="modal" data-target="#t_and_c_m">이용약관, 개인정보취급방침</a>을
                읽고 이해하셨으며 해당 내용에 동의하신 것이 됩니다.	 
				</div>
			
			<hr class="colorgraph">
			<div class="row">
				<div class="col-xs-12 col-md-6">
				<button class ="btn btn-success btn-block btn-lg">회원가입</button>
				</div>
			</div>
		</form>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="t_and_c_m" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">Terms & Conditions</h4>
			</div>
			<div class="modal-body">
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">I Agree</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</div>

