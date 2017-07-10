package com.final_project.talent;

public class Talent {
	// 분류
	private int mainCode, subCode;
	private String mainName, subName;
	// 인재 리스트
	private int rNum;
	private String mId, rName, rPhoto, subTypes, apply;
	// 자기소개
	private String intro1, intro2, intro3, intro4;
	
	public int getMainCode() {
		return mainCode;
	}
	public void setMainCode(int mainCode) {
		this.mainCode = mainCode;
	}
	public int getSubCode() {
		return subCode;
	}
	public void setSubCode(int subCode) {
		this.subCode = subCode;
	}
	public String getMainName() {
		return mainName;
	}
	public void setMainName(String mainName) {
		this.mainName = mainName;
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getrName() {
		return rName;
	}
	public void setrName(String rName) {
		this.rName = rName;
	}
	public String getrPhoto() {
		return rPhoto;
	}
	public void setrPhoto(String rPhoto) {
		this.rPhoto = rPhoto;
	}
	public String getSubTypes() {
		return subTypes;
	}
	public void setSubTypes(String subTypes) {
		this.subTypes = subTypes;
	}
	public String getApply() {
		return apply;
	}
	public void setApply(String apply) {
		this.apply = apply;
	}
	public String getIntro1() {
		return intro1;
	}
	public void setIntro1(String intro1) {
		this.intro1 = intro1;
	}
	public String getIntro2() {
		return intro2;
	}
	public void setIntro2(String intro2) {
		this.intro2 = intro2;
	}
	public String getIntro3() {
		return intro3;
	}
	public void setIntro3(String intro3) {
		this.intro3 = intro3;
	}
	public String getIntro4() {
		return intro4;
	}
	public void setIntro4(String intro4) {
		this.intro4 = intro4;
	}
}