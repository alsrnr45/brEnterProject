package com.brEnt.brFamily.member.model.vo;

public class Member {

	private int memNo;
	private int deptNo;
	private int posiNo;
	private String id;
	private String pwd;
	private String officeEmail;
	private String personalEmail;
	private String memName;
	private String phone;
	private String post;
	private String roadAddress;
	private String detailAddress;
	private String memEnrollDate;
	private String hireDate;
	private String regi;
	private String bank;
	private String account;
	private String profile;
	private int offCount;
	private String acceptStatus;
	private String memStatus;
	private String adminStatus;

	public Member() {}

	public Member(int memNo, int deptNo, int posiNo, String id, String pwd, String officeEmail, String personalEmail,
			String memName, String phone, String post, String roadAddress, String detailAddress, String memEnrollDate,
			String hireDate, String regi, String bank, String account, String profile, int offCount,
			String acceptStatus, String memStatus, String adminStatus) {
		super();
		this.memNo = memNo;
		this.deptNo = deptNo;
		this.posiNo = posiNo;
		this.id = id;
		this.pwd = pwd;
		this.officeEmail = officeEmail;
		this.personalEmail = personalEmail;
		this.memName = memName;
		this.phone = phone;
		this.post = post;
		this.roadAddress = roadAddress;
		this.detailAddress = detailAddress;
		this.memEnrollDate = memEnrollDate;
		this.hireDate = hireDate;
		this.regi = regi;
		this.bank = bank;
		this.account = account;
		this.profile = profile;
		this.offCount = offCount;
		this.acceptStatus = acceptStatus;
		this.memStatus = memStatus;
		this.adminStatus = adminStatus;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}

	public int getPosiNo() {
		return posiNo;
	}

	public void setPosiNo(int posiNo) {
		this.posiNo = posiNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getOfficeEmail() {
		return officeEmail;
	}

	public void setOfficeEmail(String officeEmail) {
		this.officeEmail = officeEmail;
	}

	public String getPersonalEmail() {
		return personalEmail;
	}

	public void setPersonalEmail(String personalEmail) {
		this.personalEmail = personalEmail;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getRoadAddress() {
		return roadAddress;
	}

	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getMemEnrollDate() {
		return memEnrollDate;
	}

	public void setMemEnrollDate(String memEnrollDate) {
		this.memEnrollDate = memEnrollDate;
	}

	public String getHireDate() {
		return hireDate;
	}

	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}

	public String getRegi() {
		return regi;
	}

	public void setRegi(String regi) {
		this.regi = regi;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public int getOffCount() {
		return offCount;
	}

	public void setOffCount(int offCount) {
		this.offCount = offCount;
	}

	public String getAcceptStatus() {
		return acceptStatus;
	}

	public void setAcceptStatus(String acceptStatus) {
		this.acceptStatus = acceptStatus;
	}

	public String getMemStatus() {
		return memStatus;
	}

	public void setMemStatus(String memStatus) {
		this.memStatus = memStatus;
	}

	public String getAdminStatus() {
		return adminStatus;
	}

	public void setAdminStatus(String adminStatus) {
		this.adminStatus = adminStatus;
	}

	@Override
	public String toString() {
		return "Member [memNo=" + memNo + ", deptNo=" + deptNo + ", posiNo=" + posiNo + ", id=" + id + ", pwd=" + pwd
				+ ", officeEmail=" + officeEmail + ", personalEmail=" + personalEmail + ", memName=" + memName
				+ ", phone=" + phone + ", post=" + post + ", roadAddress=" + roadAddress + ", detailAddress="
				+ detailAddress + ", memEnrollDate=" + memEnrollDate + ", hireDate=" + hireDate + ", regi=" + regi
				+ ", bank=" + bank + ", account=" + account + ", profile=" + profile + ", offCount=" + offCount
				+ ", acceptStatus=" + acceptStatus + ", memStatus=" + memStatus + ", adminStatus=" + adminStatus + "]";
	}
	
	
	
}
