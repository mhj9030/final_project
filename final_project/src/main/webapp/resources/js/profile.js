/*!
로그인 스크립트
 */

	function getProfile(mid) {

		alert(mid);
		f.action = "/final_project/member/login_check";
		return true;
	}
	
	function profileMenu(actions, userid) {
		var f = document.profileaction

		if(actions === 'mypage'){
			location.href="/final_project/profile?id="+userid;
			return true;
		}else if (actions === 'pwd'){
			location.href="/final_project/profile/pwd";
			return true;
		}
		
		return true;
		
	}