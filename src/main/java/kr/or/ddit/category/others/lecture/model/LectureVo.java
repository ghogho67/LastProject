package kr.or.ddit.category.others.lecture.model;

import java.util.Date;

public class LectureVo {
	private int lec_id;
	private int culture_id;
	private String lec_nm;
	private String lec_tea;
	private Date lec_st_dt;
	private Date lec_end_dt;
	private Date lec_st_time;
	private Date lec_end_time;
	private int lec_fee;
	private String lec_day;

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

	public Date getLec_st_time() {
		return lec_st_time;
	}

	public void setLec_st_time(Date lec_st_time) {
		this.lec_st_time = lec_st_time;
	}

	public Date getLec_end_time() {
		return lec_end_time;
	}

	public void setLec_end_time(Date lec_end_time) {
		this.lec_end_time = lec_end_time;
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

	@Override
	public String toString() {
		return "LectureVo [lec_id=" + lec_id + ", culture_id=" + culture_id + ", lec_nm=" + lec_nm + ", lec_tea="
				+ lec_tea + ", lec_st_dt=" + lec_st_dt + ", lec_end_dt=" + lec_end_dt + ", lec_st_time=" + lec_st_time
				+ ", lec_end_time=" + lec_end_time + ", lec_fee=" + lec_fee + ", lec_day=" + lec_day + "]";
	}

}
