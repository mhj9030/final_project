package com.final_project.company;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Company {
	private String cSerial, cSerial1, cSerial2, cSerial3; 
	private String cCeo, cName, mId;
	private int cPeople, cProfit, subCode;
	private String cCreated, cSize, cIntro;
	private String cTel, cTel1, cTel2, cTel3; 
	
	private int ciNum;
	private String cOriginalFilename, cSaveFilename;
	private List<MultipartFile> upload;
	public String getcSerial() {
		return cSerial;
	}
	public void setcSerial(String cSerial) {
		this.cSerial = cSerial;
	}
	public String getcSerial1() {
		return cSerial1;
	}
	public void setcSerial1(String cSerial1) {
		this.cSerial1 = cSerial1;
	}
	public String getcSerial2() {
		return cSerial2;
	}
	public void setcSerial2(String cSerial2) {
		this.cSerial2 = cSerial2;
	}
	public String getcSerial3() {
		return cSerial3;
	}
	public void setcSerial3(String cSerial3) {
		this.cSerial3 = cSerial3;
	}
	public String getcCeo() {
		return cCeo;
	}
	public void setcCeo(String cCeo) {
		this.cCeo = cCeo;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public int getcPeople() {
		return cPeople;
	}
	public void setcPeople(int cPeople) {
		this.cPeople = cPeople;
	}
	public int getcProfit() {
		return cProfit;
	}
	public void setcProfit(int cProfit) {
		this.cProfit = cProfit;
	}
	public int getSubCode() {
		return subCode;
	}
	public void setSubCode(int subCode) {
		this.subCode = subCode;
	}
	public String getcCreated() {
		return cCreated;
	}
	public void setcCreated(String cCreated) {
		this.cCreated = cCreated;
	}
	public String getcSize() {
		return cSize;
	}
	public void setcSize(String cSize) {
		this.cSize = cSize;
	}
	public String getcIntro() {
		return cIntro;
	}
	public void setcIntro(String cIntro) {
		this.cIntro = cIntro;
	}
	public String getcTel() {
		return cTel;
	}
	public void setcTel(String cTel) {
		this.cTel = cTel;
	}
	public String getcTel1() {
		return cTel1;
	}
	public void setcTel1(String cTel1) {
		this.cTel1 = cTel1;
	}
	public String getcTel2() {
		return cTel2;
	}
	public void setcTel2(String cTel2) {
		this.cTel2 = cTel2;
	}
	public String getcTel3() {
		return cTel3;
	}
	public void setcTel3(String cTel3) {
		this.cTel3 = cTel3;
	}
	public int getCiNum() {
		return ciNum;
	}
	public void setCiNum(int ciNum) {
		this.ciNum = ciNum;
	}
	public String getcOriginalFilename() {
		return cOriginalFilename;
	}
	public void setcOriginalFilename(String cOriginalFilename) {
		this.cOriginalFilename = cOriginalFilename;
	}
	public String getcSaveFilename() {
		return cSaveFilename;
	}
	public void setcSaveFilename(String cSaveFilename) {
		this.cSaveFilename = cSaveFilename;
	}
	public List<MultipartFile> getUpload() {
		return upload;
	}
	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
	}
}
