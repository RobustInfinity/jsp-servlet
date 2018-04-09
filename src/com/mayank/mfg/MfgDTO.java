package com.mayank.mfg;

public class MfgDTO {

	private Integer companyNo;
	private String companyName;
	private String supervisor;
	private String contactNo;
	private String address;
	private String gstinNo;
	private String status;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Integer getCompanyNo() {
		return companyNo;
	}
	public void setCompanyNo(Integer companyNo) {
		this.companyNo = companyNo;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getSupervisor() {
		return supervisor;
	}
	public void setSupervisor(String supervisor) {
		this.supervisor = supervisor;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGstinNo() {
		return gstinNo;
	}
	public void setGstinNo(String gstinNo) {
		this.gstinNo = gstinNo;
	}
}
