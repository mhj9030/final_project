package com.final_project.profile;

public class Profile {

	// 멤버 테이블 정보
	private String mid;
	private String mname;
	private String mbirth;
	private String mgender;
	private String mcreated;
	private String mpwd;

	// 프로필 테이블 정보
	private String proPhoto;
	private String proCover;
	private String proIntro; // 자기소개

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
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

	public String getMcreated() {
		return mcreated;
	}

	public void setMcreated(String mcreated) {
		this.mcreated = mcreated;
	}

	public String getProPhoto() {
		return proPhoto;
	}

	public void setProPhoto(String proPhoto) {
		this.proPhoto = proPhoto;
	}

	public String getProCover() {
		return proCover;
	}

	public void setProCover(String proCover) {
		this.proCover = proCover;
	}

	public String getProIntro() {
		return proIntro;
	}

	public void setProIntro(String proIntro) {
		this.proIntro = proIntro;
	}

	public String getMpwd() {
		return mpwd;
	}

	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}

}
