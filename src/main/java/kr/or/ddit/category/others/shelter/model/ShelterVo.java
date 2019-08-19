package kr.or.ddit.category.others.shelter.model;

import java.util.Date;

public class ShelterVo {
	private int sh_id;
	private String sh_nm;
	private String sh_add;
	private Date sh_st_dt;
	private String sh_type;
	private Date sh_end_dt;
	private Date sh_day_st;
	private Date sh_day_end;
	private Date sh_we_st;
	private Date sh_we_end;
	private String sw_nm;
	private String sw_phone;
	private int cate_id;
	
	private int rn;
	
	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public int getSh_id() {
		return sh_id;
	}

	public void setSh_id(int sh_id) {
		this.sh_id = sh_id;
	}

	public String getSh_nm() {
		return sh_nm;
	}

	public void setSh_nm(String sh_nm) {
		this.sh_nm = sh_nm;
	}

	public String getSh_add() {
		return sh_add;
	}

	public void setSh_add(String sh_add) {
		this.sh_add = sh_add;
	}

	public Date getSh_st_dt() {
		return sh_st_dt;
	}

	public void setSh_st_dt(Date sh_st_dt) {
		this.sh_st_dt = sh_st_dt;
	}

	public String getSh_type() {
		return sh_type;
	}

	public void setSh_type(String sh_type) {
		this.sh_type = sh_type;
	}

	public Date getSh_end_dt() {
		return sh_end_dt;
	}

	public void setSh_end_dt(Date sh_end_dt) {
		this.sh_end_dt = sh_end_dt;
	}

	public Date getSh_day_st() {
		return sh_day_st;
	}

	public void setSh_day_st(Date sh_day_st) {
		this.sh_day_st = sh_day_st;
	}

	public Date getSh_day_end() {
		return sh_day_end;
	}

	public void setSh_day_end(Date sh_day_end) {
		this.sh_day_end = sh_day_end;
	}

	public Date getSh_we_st() {
		return sh_we_st;
	}

	public void setSh_we_st(Date sh_we_st) {
		this.sh_we_st = sh_we_st;
	}

	public Date getSh_we_end() {
		return sh_we_end;
	}

	public void setSh_we_end(Date sh_we_end) {
		this.sh_we_end = sh_we_end;
	}

	public String getSw_nm() {
		return sw_nm;
	}

	public void setSw_nm(String sw_nm) {
		this.sw_nm = sw_nm;
	}

	public String getSw_phone() {
		return sw_phone;
	}

	public void setSw_phone(String sw_phone) {
		this.sw_phone = sw_phone;
	}

	public int getCate_id() {
		return cate_id;
	}

	public void setCate_id(int cate_id) {
		this.cate_id = cate_id;
	}

	@Override
	public String toString() {
		return "ShelterVo [sh_id=" + sh_id + ", sh_nm=" + sh_nm + ", sh_add=" + sh_add + ", sh_st_dt=" + sh_st_dt
				+ ", sh_type=" + sh_type + ", sh_end_dt=" + sh_end_dt + ", sh_day_st=" + sh_day_st + ", sh_day_end="
				+ sh_day_end + ", sh_we_st=" + sh_we_st + ", sh_we_end=" + sh_we_end + ", sw_nm=" + sw_nm
				+ ", sw_phone=" + sw_phone + ", cate_id=" + cate_id + "]";
	}

}
