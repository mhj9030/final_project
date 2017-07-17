package com.final_project.setting;

public class Expertise {

	// 전문분야
	private String eid; // 사용자 아이디
	private String expertise; // 전문분야

	private String created; // 업데이트 날짜

	public String getEid() {
		return eid;
	}

	public void setEid(String eid) {
		this.eid = eid;
	}

	public String getExpertise() {
		return expertise;
	}

	public void setExpertise(String expertise) {
		this.expertise = expertise;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

}