package kr.or.ddit.donation.model;

public class DonationVo {
	
	private int don_id;
	private String doner;
	private String doner_phone;
	private String doner_comment;
	private int app_id;
	
	public DonationVo() {
		
	}

	public int getDon_id() {
		return don_id;
	}

	public void setDon_id(int don_id) {
		this.don_id = don_id;
	}

	public String getDoner() {
		return doner;
	}

	public void setDoner(String doner) {
		this.doner = doner;
	}

	public String getDoner_phone() {
		return doner_phone;
	}

	public void setDoner_phone(String doner_phone) {
		this.doner_phone = doner_phone;
	}

	public String getDoner_comment() {
		return doner_comment;
	}

	public void setDoner_comment(String doner_comment) {
		this.doner_comment = doner_comment;
	}

	public int getApp_id() {
		return app_id;
	}

	public void setApp_id(int app_id) {
		this.app_id = app_id;
	}

	public DonationVo(int don_id, String doner, String doner_phone, String doner_comment, int app_id) {
		super();
		this.don_id = don_id;
		this.doner = doner;
		this.doner_phone = doner_phone;
		this.doner_comment = doner_comment;
		this.app_id = app_id;
	}

	@Override
	public String toString() {
		return "DonationVo [don_id=" + don_id + ", doner=" + doner + ", doner_phone=" + doner_phone + ", doner_comment="
				+ doner_comment + ", app_id=" + app_id + "]";
	}
	
	
	
	

}
