package kr.or.ddit.joinVo;

import java.util.Date;

public class DonationApprovalVo {
	
	private int don_id;
	private String doner;
	private String doner_phone;
	private String doner_comment;
	
	private int app_id;
	private int app_pay;
	private Date app_time;
	private String app_type;
	private String mem_id;
	private String app_del;
	
	public DonationApprovalVo() {
		
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

	public int getApp_pay() {
		return app_pay;
	}

	public void setApp_pay(int app_pay) {
		this.app_pay = app_pay;
	}

	public Date getApp_time() {
		return app_time;
	}

	public void setApp_time(Date app_time) {
		this.app_time = app_time;
	}

	public String getApp_type() {
		return app_type;
	}

	public void setApp_type(String app_type) {
		this.app_type = app_type;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getApp_del() {
		return app_del;
	}

	public void setApp_del(String app_del) {
		this.app_del = app_del;
	}

	public DonationApprovalVo(int don_id, String doner, String doner_phone, String doner_comment, int app_id,
			int app_pay, Date app_time, String app_type, String mem_id, String app_del) {
		this.don_id = don_id;
		this.doner = doner;
		this.doner_phone = doner_phone;
		this.doner_comment = doner_comment;
		this.app_id = app_id;
		this.app_pay = app_pay;
		this.app_time = app_time;
		this.app_type = app_type;
		this.mem_id = mem_id;
		this.app_del = app_del;
	}

	@Override
	public String toString() {
		return "DonationApprovalVo [don_id=" + don_id + ", doner=" + doner + ", doner_phone=" + doner_phone
				+ ", doner_comment=" + doner_comment + ", app_id=" + app_id + ", app_pay=" + app_pay + ", app_time="
				+ app_time + ", app_type=" + app_type + ", mem_id=" + mem_id + ", app_del=" + app_del + "]";
	}

	
	
	
	

}
