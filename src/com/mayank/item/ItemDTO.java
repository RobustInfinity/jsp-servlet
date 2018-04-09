package com.mayank.item;

public class ItemDTO {
	
	private Integer batchNo;
	private String itemName;
	private Integer itemPrice;
	private Double cgst;
	private Double sgst;
	private String manufacturer;
	private String hsnNo;
	private String status;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Integer getBatchNo() {
		return batchNo;
	}
	public void setBatchNo(Integer batchNo) {
		this.batchNo = batchNo;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public Integer getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(Integer itemPrice) {
		this.itemPrice = itemPrice;
	}
	public Double getCgst() {
		return cgst;
	}
	public void setCgst(Double cgst) {
		this.cgst = cgst;
	}
	public Double getSgst() {
		return sgst;
	}
	public void setSgst(Double sgst) {
		this.sgst = sgst;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public String getHsnNo() {
		return hsnNo;
	}
	public void setHsnNo(String hsnNo) {
		this.hsnNo = hsnNo;
	}
	
	

}
