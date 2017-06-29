/*!
회원가입 스크립트
 */


function getUsername() {
	var firstname = $("#id_first_name").val().trim();
	var lastname = $("#id_last_name").val().trim();
	
	var mname = firstname+lastname;

	 $("#mname").val(mname);
}

	// 사용자 이메일 중복검사
	function userEmailCheckl() {
		var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/; // 이메일 정규식 체크
		var mid = $("#m_email").val();  // 이메일 벨류값 가져오기
		
		if(regex.test(mid) === false) {  
		    alert("잘못된 이메일 형식입니다.");  
		    return false;  
		} else {  
		}  

		var url ="/final_project/member/userEmailCheck";
		var query = "mid="+mid;
		
		$.ajax({
			type:"POST",
			url:url,
			data:query,
			dataType:"JSON",
			success:function(data){
				var state=data.state;
				if(state=="true"){
					alert(mid+" 아이디는 사용가능합니다"); 
				}else{
					alert(mid+" 아이디는 사용불가능 합니다"); 
					$("#m_email").val("");
				}
			}
		});
	}


	function register() {
		var f = document.memberRegister;
		f.action = "/final_project/member/register";
		return true;
	}