package net.coffee;

public class ProDTO {
	private String scode;
	private String sname;
	private String pcode;
	private String name;
	private int cost;
	private int amount;
	private int hap;
	
	public ProDTO() {
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public int getHap() {
		return hap;
	}
	public void setHap(int hap) {
		this.hap = hap;
	}
	@Override
	public String toString() {
		return "ProDTO [scode=" + scode + ", sname=" + sname + ", pcode="
				+ pcode + ", name=" + name + ", cost=" + cost + ", amount="
				+ amount + ", hap=" + hap + "]";
	}

}