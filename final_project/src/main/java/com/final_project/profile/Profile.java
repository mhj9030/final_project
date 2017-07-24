package com.final_project.profile;

import org.springframework.web.multipart.MultipartFile;

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
	private String proIntro; // 자기소개

	// 전문 분야
	private String expertise;       
	private String eid;
	
	private MultipartFile upload;

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

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

}
