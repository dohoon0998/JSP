package net.coffee;

public class SaleDTO {
	private int saleno;
	private String pcode;
	private String saledate;
	private String scode;
	private String name;	
	private int amount;
	private int tot;
	
	public SaleDTO() {
	}

	public int getSaleno() {
		return saleno;
	}

	public void setSaleno(int saleno) {
		this.saleno = saleno;
	}

	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}

	public String getSaledate() {
		return saledate;
	}

	public void setSaledate(String saledate) {
		this.saledate = saledate;
	}

	public String getScode() {
		return scode;
	}

	public void setScode(String scode) {
		this.scode = scode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	public int getTot() {
		return tot;
	}

	public void setTot(int tot) {
		this.tot = tot;
	}

	@Override
	public String toString() {
		return "SaleDTO [saleno=" + saleno + ", pcode=" + pcode + ", saledate="
				+ saledate + ", scode=" + scode + ", name=" + name
				+ ", amount=" + amount + ", tot=" + tot + "]";
	}
}