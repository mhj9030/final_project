package com.final_project.company;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

/**
 * @author user1
 *
 */
public class Company {
	private int cNum;
	private String cSerial, cSerial1, cSerial2, cSerial3; 
	private String cCeo, cName, mId, mName;
	private int cPeople, subCode;
	private String cProfit, cProfit1, cProfit2, cProfit3;
	private String subName, maName;
	private String cCreated, cSize, cIntro, cDescription, cAddress;
	private String cTel, cTel1, cTel2, cTel3;
	private int employ_cnt;
	
	private int ciNum;
	private String cCoverImage, cLogoImage, cLogoOriginalFilename, cCoverOriginalFilename;
	private String proPhoto;
	private List<MultipartFile> upload;
	
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	public String getMaName() {
		return maName;
	}
	public void setMaName(String maName) {
		this.maName = maName;
	}
	public String getcLogoOriginalFilename() {
		return cLogoOriginalFilename;
	}
	public void setcLogoOriginalFilename(String cLogoOriginalFilename) {
		this.cLogoOriginalFilename = cLogoOriginalFilename;
	}
	public String getcCoverOriginalFilename() {
		return cCoverOriginalFilename;
	}
	public void setcCoverOriginalFilename(String cCoverOriginalFilename) {
		this.cCoverOriginalFilename = cCoverOriginalFilename;
	}
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
	public String getcDescription() {
		return cDescription;
	}
	public void setcDescription(String cDescription) {
		this.cDescription = cDescription;
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
	public String getcCoverImage() {
		return cCoverImage;
	}
	public void setcCoverImage(String cCoverImage) {
		this.cCoverImage = cCoverImage;
	}
	public String getcLogoImage() {
		return cLogoImage;
	}
	public void setcLogoImage(String cLogoImage) {
		this.cLogoImage = cLogoImage;
	}
	public List<MultipartFile> getUpload() {
		return upload;
	}
	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
	}
	public int getEmploy_cnt() {
		return employ_cnt;
	}
	public void setEmploy_cnt(int employ_cnt) {
		this.employ_cnt = employ_cnt;
	}
	public String getcAddress() {
		return cAddress;
	}
	public void setcAddress(String cAddress) {
		this.cAddress = cAddress;
	}
	public String getcProfit() {
		return cProfit;
	}
	public void setcProfit(String cProfit) {
		this.cProfit = cProfit;
	}
	public String getcProfit1() {
		return cProfit1;
	}
	public void setcProfit1(String cProfit1) {
		this.cProfit1 = cProfit1;
	}
	public String getcProfit2() {
		return cProfit2;
	}
	public void setcProfit2(String cProfit2) {
		this.cProfit2 = cProfit2;
	}
	public String getcProfit3() {
		return cProfit3;
	}
	public void setcProfit3(String cProfit3) {
		this.cProfit3 = cProfit3;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getProPhoto() {
		return proPhoto;
	}
	public void setProPhoto(String proPhoto) {
		this.proPhoto = proPhoto;
	}
}
