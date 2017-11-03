package com.lecheng.pos.pojo;

public class ToPrintList {
	private String itemId;
	private String goodName;
	private String goodSku;
	private double goodPrice;
	private int goodDiscount;
	private int goodNum;
	
	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	public String getGoodName() {
		return goodName;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	public String getGoodSku() {
		return goodSku;
	}
	public void setGoodSku(String goodSku) {
		this.goodSku = goodSku;
	}
	public double getGoodPrice() {
		return goodPrice;
	}
	public void setGoodPrice(double goodPrice) {
		this.goodPrice = goodPrice;
	}
	public int getGoodDiscount() {
		return goodDiscount;
	}
	public void setGoodDiscount(int goodDiscount) {
		this.goodDiscount = goodDiscount;
	}
	public int getGoodNum() {
		return goodNum;
	}
	public void setGoodNum(int goodNum) {
		this.goodNum = goodNum;
	}

	@Override
	public int hashCode() {
		return itemId.hashCode() + goodName.hashCode();
	}
	
	@Override
	public boolean equals(Object obj) {
		return hashCode() == obj.hashCode();
	}
}
