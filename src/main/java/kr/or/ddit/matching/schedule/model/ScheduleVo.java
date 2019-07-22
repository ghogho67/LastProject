package kr.or.ddit.matching.schedule.model;

import java.util.Date;

public class ScheduleVo {
	private int mat_id;
	private Date sche_day;
	private Date sche_st;
	private Date sche_end;

	public int getMat_id() {
		return mat_id;
	}

	public void setMat_id(int mat_id) {
		this.mat_id = mat_id;
	}

	public Date getSche_day() {
		return sche_day;
	}

	public void setSche_day(Date sche_day) {
		this.sche_day = sche_day;
	}

	public Date getSche_st() {
		return sche_st;
	}

	public void setSche_st(Date sche_st) {
		this.sche_st = sche_st;
	}

	public Date getSche_end() {
		return sche_end;
	}

	public void setSche_end(Date sche_end) {
		this.sche_end = sche_end;
	}

	@Override
	public String toString() {
		return "ScheduleVo [mat_id=" + mat_id + ", sche_day=" + sche_day + ", sche_st=" + sche_st + ", sche_end="
				+ sche_end + "]";
	}

}
