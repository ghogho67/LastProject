package kr.or.ddit.category.others.lecture.model;

import java.util.Date;

public class LectureVo {
	private int lec_id;
	private int culture_id;
	private String lec_nm;
	private String lec_tea;
	private Date lec_st_dt;
	private Date lec_end_dt;
	private String lec_time;
	private int lec_fee;
	private String lec_day;
	private String lec_type;
	private String lec_amount;
	private String lec_use;
	private String lec_cont;
	
	public LectureVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LectureVo(int lec_id, int culture_id, String lec_nm, String lec_tea, Date lec_st_dt, Date lec_end_dt,
			String lec_time, int lec_fee, String lec_day, String lec_type, String lec_amount, String lec_use,
			String lec_cont) {
		super();
		this.lec_id = lec_id;
		this.culture_id = culture_id;
		this.lec_nm = lec_nm;
		this.lec_tea = lec_tea;
		this.lec_st_dt = lec_st_dt;
		this.lec_end_dt = lec_end_dt;
		this.lec_time = lec_time;
		this.lec_fee = lec_fee;
		this.lec_day = lec_day;
		this.lec_type = lec_type;
		this.lec_amount = lec_amount;
		this.lec_use = lec_use;
		this.lec_cont = lec_cont;
	}
	@Override
	public String toString() {
		return "LectureVo [lec_id=" + lec_id + ", culture_id=" + culture_id + ", lec_nm=" + lec_nm + ", lec_tea="
				+ lec_tea + ", lec_st_dt=" + lec_st_dt + ", lec_end_dt=" + lec_end_dt + ", lec_time=" + lec_time
				+ ", lec_fee=" + lec_fee + ", lec_day=" + lec_day + ", lec_type=" + lec_type + ", lec_amount="
				+ lec_amount + ", lec_use=" + lec_use + ", lec_cont=" + lec_cont + "]";
	}
	public int getLec_id() {
		return lec_id;
	}
	public void setLec_id(int lec_id) {
		this.lec_id = lec_id;
	}
	public int getCulture_id() {
		return culture_id;
	}
	public void setCulture_id(int culture_id) {
		this.culture_id = culture_id;
	}
	public String getLec_nm() {
		return lec_nm;
	}
	public void setLec_nm(String lec_nm) {
		this.lec_nm = lec_nm;
	}
	public String getLec_tea() {
		return lec_tea;
	}
	public void setLec_tea(String lec_tea) {
		this.lec_tea = lec_tea;
	}
	public Date getLec_st_dt() {
		return lec_st_dt;
	}
	public void setLec_st_dt(Date lec_st_dt) {
		this.lec_st_dt = lec_st_dt;
	}
	public Date getLec_end_dt() {
		return lec_end_dt;
	}
	public void setLec_end_dt(Date lec_end_dt) {
		this.lec_end_dt = lec_end_dt;
	}
	public String getLec_time() {
		return lec_time;
	}
	public void setLec_time(String lec_time) {
		this.lec_time = lec_time;
	}
	public int getLec_fee() {
		return lec_fee;
	}
	public void setLec_fee(int lec_fee) {
		this.lec_fee = lec_fee;
	}
	public String getLec_day() {
		return lec_day;
	}
	public void setLec_day(String lec_day) {
		this.lec_day = lec_day;
	}
	public String getLec_type() {
		return lec_type;
	}
	public void setLec_type(String lec_type) {
		this.lec_type = lec_type;
	}
	public String getLec_amount() {
		return lec_amount;
	}
	public void setLec_amount(String lec_amount) {
		this.lec_amount = lec_amount;
	}
	public String getLec_use() {
		return lec_use;
	}
	public void setLec_use(String lec_use) {
		this.lec_use = lec_use;
	}
	public String getLec_cont() {
		return lec_cont;
	}
	public void setLec_cont(String lec_cont) {
		this.lec_cont = lec_cont;
	}
	
	
	
}
