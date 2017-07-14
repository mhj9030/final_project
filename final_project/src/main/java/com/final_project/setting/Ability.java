package com.final_project.setting;

public class Ability {

	// 학력부분
	private String termstart; // 입학년도
	private String school; // 학교
	private String major;
	private String termend; // 졸업년도
	private String termstate; // 재학상태
	private String memo; // 간단설명
	private String mid; // 사용자 아이디

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getTermstart() {
		return termstart;
	}

	public void setTermstart(String termstart) {
		this.termstart = termstart;
	}

	public String getTermend() {
		return termend;
	}

	public void setTermend(String termend) {
		this.termend = termend;
	}

	public String getTermstate() {
		return termstate;
	}

	public void setTermstate(String termstate) {
		this.termstate = termstate;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

}
