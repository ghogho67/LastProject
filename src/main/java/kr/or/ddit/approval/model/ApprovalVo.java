package kr.or.ddit.approval.model;

import java.util.Date;

public class ApprovalVo {

	private int app_id;
	private int app_pay;
	private Date app_time;
	private String app_type;
	private String mem_id;
	private String app_del;
	private String app_obj;
	private int rn;

	public ApprovalVo() {
		
	}
	
	
	
	
	public ApprovalVo(int app_id, int app_pay, Date app_time, String app_type, String app_del, String app_obj) {
		this.app_id = app_id;
		this.app_pay = app_pay;
		this.app_time = app_time;
		this.app_type = app_type;
		this.app_del = app_del;
		this.app_obj = app_obj;
	}




	public ApprovalVo(int app_id, int app_pay, Date app_time, String app_type, String mem_id, String app_del,
			String app_obj, int rn) {
		this.app_id = app_id;
		this.app_pay = app_pay;
		this.app_time = app_time;
		this.app_type = app_type;
		this.mem_id = mem_id;
		this.app_del = app_del;
		this.app_obj = app_obj;
		this.rn = rn;
	}

	public ApprovalVo(int app_id, int app_pay, Date app_time, String app_type, String mem_id, String app_del,
			String app_obj) {
		this.app_id = app_id;
		this.app_pay = app_pay;
		this.app_time = app_time;
		this.app_type = app_type;
		this.mem_id = mem_id;
		this.app_del = app_del;
		this.app_obj = app_obj;
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

	public String getApp_obj() {
		return app_obj;
	}

	public void setApp_obj(String app_obj) {
		this.app_obj = app_obj;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	@Override
	public String toString() {
		return "ApprovalVo [app_id=" + app_id + ", app_pay=" + app_pay + ", app_time=" + app_time + ", app_type="
				+ app_type + ", mem_id=" + mem_id + ", app_del=" + app_del + ", app_obj=" + app_obj + ", rn=" + rn
				+ "]";
	}

}
