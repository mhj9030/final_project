package com.final_project.setting;

public class Project {

	private String prnum; // 프로젝트 번호
	private String prname; // 프로젝트 이름

	private String expstartyear; // 시작년도
	private String expendyear; // 종료년도
	private String expstartmonth; // 시작월
	private String expendmontth;// 종료월

	private String memo; // 간단 설명

	private String mid; // 사용자 아이디;
	
	private String expstate; //진행중 상태
	
	

	public String getExpstate() {
		return expstate;
	}

	public void setExpstate(String expstate) {
		this.expstate = expstate;
	}

	public String getPrnum() {
		return prnum;
	}

	public void setPrnum(String prnum) {
		this.prnum = prnum;
	}

	public String getPrname() {
		return prname;
	}

	public void setPrname(String prname) {
		this.prname = prname;
	}

	public String getExpstartyear() {
		return expstartyear;
	}

	public void setExpstartyear(String expstartyear) {
		this.expstartyear = expstartyear;
	}

	public String getExpendyear() {
		return expendyear;
	}

	public void setExpendyear(String expendyear) {
		this.expendyear = expendyear;
	}

	public String getExpstartmonth() {
		return expstartmonth;
	}

	public void setExpstartmonth(String expstartmonth) {
		this.expstartmonth = expstartmonth;
	}

	public String getExpendmontth() {
		return expendmontth;
	}

	public void setExpendmontth(String expendmontth) {
		this.expendmontth = expendmontth;
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