package com.final_project.community;


public class Review {
	private int ibnum, listNum, cNum;
	private String mName, mId, subject, content, created, company, pass, prophoto, directcompany;
	private int hitCount, replyCount, likeCount;
	
	
	public String getDirectcompany() {
		return directcompany;
	}
	public void setDirectcompany(String directcompany) {
		this.directcompany = directcompany;
	}
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
	public String getProphoto() {
		return prophoto;
	}
	public void setProphoto(String prophoto) {
		this.prophoto = prophoto;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getIbnum() {
		return ibnum;
	}
	public void setIbnum(int ibnum) {
		this.ibnum = ibnum;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
}
