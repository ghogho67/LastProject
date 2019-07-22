package kr.or.ddit.approval.model;

import java.util.Date;

public class ApprovalVo {

	private int app_id;
	private int app_pay;
	private Date app_time;
	private int app_type;
	private String mem_id;

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

	public int getApp_type() {
		return app_type;
	}

	public void setApp_type(int app_type) {
		this.app_type = app_type;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	@Override
	public String toString() {
		return "ApprovalVo [app_id=" + app_id + ", app_pay=" + app_pay + ", app_time=" + app_time + ", app_type="
				+ app_type + ", mem_id=" + mem_id + "]";
	}

}
