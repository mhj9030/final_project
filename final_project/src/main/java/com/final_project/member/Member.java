package com.final_project.member;

public class Member {

	// 회원가입 변수
	private String mid; // 사용자 아이디
	private String mpwd; // 사용자 비밀번호
	private String firstname; // 첫번째 사용자 이름
	private String lastname; // 두번째 사용자 이름
	private String mname; // 사용자 이름
	private String mbirth; // 사용자 생일
	private String mgender; // 사용자 성별
	private String cSerial; // 사업자등록번호(기업등록을 했을 때, 생성)
	
	private String authority;

	public String getMid() {
		return mid;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpwd() {
		return mpwd;
	}

	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMbirth() {
		return mbirth;
	}

	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}

	public String getMgender() {
		return mgender;
	}

	public void setMgender(String mgender) {
		this.mgender = mgender;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public String getcSerial() {
		return cSerial;
	}

	public void setcSerial(String cSerial) {
		this.cSerial = cSerial;
	}
}