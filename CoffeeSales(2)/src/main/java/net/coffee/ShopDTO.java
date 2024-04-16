package net.coffee;

public class ShopDTO {
	private String scode;
	private String sname;
	private String pcode;
	private int cost;
	private int amount;
	private int shap;
	
	public ShopDTO() {
	}
	public String getScode() {
		return scode;
	}
	public void setScode(String scode) {
		this.scode = scode;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getShap() {
		return shap;
	}
	public void setShap(int shap) {
		this.shap = shap;
	}
	@Override
	public String toString() {
		return "ShopDTO [scode=" + scode + ", sname=" + sname + ", pcode="
				+ pcode + ", cost=" + cost + ", amount=" + amount + ", shap="
				+ shap + "]";
	}

	

}