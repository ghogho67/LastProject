package kr.or.ddit.joinVo;

import java.util.Date;

public class DonationApprovalVo {
	
	private int don_id;
	private String doner;
	private String doner_phone;
	private String doner_comment;
	private String mem_yn;
	private int app_id;
	
	private int app_id_fk;
	private int app_pay;
	private Date app_time;
	private String app_type;
	private String mem_id;
	private String app_del;
	
	private int rn;
	
	
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


	public String getMem_yn() {
		return mem_yn;
	}


	public void setMem_yn(String mem_yn) {
		this.mem_yn = mem_yn;
	}


	public int getApp_id() {
		return app_id;
	}


	public void setApp_id(int app_id) {
		this.app_id = app_id;
	}


	public int getApp_id_fk() {
		return app_id_fk;
	}


	public void setApp_id_fk(int app_id_fk) {
		this.app_id_fk = app_id_fk;
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


	public int getRn() {
		return rn;
	}


	public void setRn(int rn) {
		this.rn = rn;
	}


	public DonationApprovalVo(int don_id, String doner, String doner_phone, String doner_comment, String mem_yn,
			int app_id, int app_id_fk, int app_pay, Date app_time, String app_type, String mem_id, String app_del,
			int rn) {
		this.don_id = don_id;
		this.doner = doner;
		this.doner_phone = doner_phone;
		this.doner_comment = doner_comment;
		this.mem_yn = mem_yn;
		this.app_id = app_id;
		this.app_id_fk = app_id_fk;
		this.app_pay = app_pay;
		this.app_time = app_time;
		this.app_type = app_type;
		this.mem_id = mem_id;
		this.app_del = app_del;
		this.rn = rn;
	}


	@Override
	public String toString() {
		return "DonationApprovalVo [don_id=" + don_id + ", doner=" + doner + ", doner_phone=" + doner_phone
				+ ", doner_comment=" + doner_comment + ", mem_yn=" + mem_yn + ", app_id=" + app_id + ", app_id_fk="
				+ app_id_fk + ", app_pay=" + app_pay + ", app_time=" + app_time + ", app_type=" + app_type + ", mem_id="
				+ mem_id + ", app_del=" + app_del + ", rn=" + rn + "]";
	}
	
	

	
	

	
	
	
	
	

}
