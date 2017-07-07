package com.final_project.talent;

public class Talent {
	// 분류
	private int mainCode, subCode;
	private String mainName, subName;
	// 인재 리스트
	private int rNum;
	private String mId, rName, rPhoto;
	
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
}