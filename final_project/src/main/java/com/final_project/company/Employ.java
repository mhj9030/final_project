package com.final_project.company;

import org.springframework.web.multipart.MultipartFile;

public class Employ {
	private int ceNum, cePeople, listNum;
	private String ceSubject, ceType;
	private String ceStart, ceEnd;
	private String cePay, cePayMin, cePayMax;
	private String cePlace, cePrefere, ceEtc;
	private String resumeForm, resumeFile, resumeOriginalName;
	private MultipartFile upload; 
	private String cSerial;
	private int atCode, subCode;

	public int getCeNum() {
		return ceNum;
	}
	public void setCeNum(int ceNum) {
		this.ceNum = ceNum;
	}
	public int getCePeople() {
		return cePeople;
	}
	public void setCePeople(int cePeople) {
		this.cePeople = cePeople;
	}
	public String getCeSubject() {
		return ceSubject;
	}
	public void setCeSubject(String ceSubject) {
		this.ceSubject = ceSubject;
	}
	public String getCeType() {
		return ceType;
	}
	public void setCeType(String ceType) {
		this.ceType = ceType;
	}
	public String getCeStart() {
		return ceStart;
	}
	public void setCeStart(String ceStart) {
		this.ceStart = ceStart;
	}
	public String getCeEnd() {
		return ceEnd;
	}
	public void setCeEnd(String ceEnd) {
		this.ceEnd = ceEnd;
	}
	public String getCePay() {
		return cePay;
	}
	public void setCePay(String cePay) {
		this.cePay = cePay;
	}
	public String getCePayMin() {
		return cePayMin;
	}
	public void setCePayMin(String cePayMin) {
		this.cePayMin = cePayMin;
	}
	public String getCePayMax() {
		return cePayMax;
	}
	public void setCePayMax(String cePayMax) {
		this.cePayMax = cePayMax;
	}
	public String getCePlace() {
		return cePlace;
	}
	public void setCePlace(String cePlace) {
		this.cePlace = cePlace;
	}
	public String getCePrefere() {
		return cePrefere;
	}
	public void setCePrefere(String cePrefere) {
		this.cePrefere = cePrefere;
	}
	public String getCeEtc() {
		return ceEtc;
	}
	public void setCeEtc(String ceEtc) {
		this.ceEtc = ceEtc;
	}
	public String getResumeForm() {
		return resumeForm;
	}
	public void setResumeForm(String resumeForm) {
		this.resumeForm = resumeForm;
	}
	public String getResumeFile() {
		return resumeFile;
	}
	public void setResumeFile(String resumeFile) {
		this.resumeFile = resumeFile;
	}
	public String getResumeOriginalName() {
		return resumeOriginalName;
	}
	public void setResumeOriginalName(String resumeOriginalName) {
		this.resumeOriginalName = resumeOriginalName;
	}
	public String getcSerial() {
		return cSerial;
	}
	public void setcSerial(String cSerial) {
		this.cSerial = cSerial;
	}
	public int getAtCode() {
		return atCode;
	}
	public void setAtCode(int atCode) {
		this.atCode = atCode;
	}
	public int getSubCode() {
		return subCode;
	}
	public void setSubCode(int subCode) {
		this.subCode = subCode;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
}
