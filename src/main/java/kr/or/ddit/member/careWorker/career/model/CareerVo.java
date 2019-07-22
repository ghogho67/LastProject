package kr.or.ddit.member.careWorker.career.model;

import java.util.Date;

public class CareerVo {

	private int cw_career_id;
	private String career_cont;
	private Date career_st_dt;
	private Date career_end_dt;
	private String mem_id;
	private int hos_id;

	public int getCw_career_id() {
		return cw_career_id;
	}

	public void setCw_career_id(int cw_career_id) {
		this.cw_career_id = cw_career_id;
	}

	public String getCareer_cont() {
		return career_cont;
	}

	public void setCareer_cont(String career_cont) {
		this.career_cont = career_cont;
	}

	public Date getCareer_st_dt() {
		return career_st_dt;
	}

	public void setCareer_st_dt(Date career_st_dt) {
		this.career_st_dt = career_st_dt;
	}

	public Date getCareer_end_dt() {
		return career_end_dt;
	}

	public void setCareer_end_dt(Date career_end_dt) {
		this.career_end_dt = career_end_dt;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getHos_id() {
		return hos_id;
	}

	public void setHos_id(int hos_id) {
		this.hos_id = hos_id;
	}

	@Override
	public String toString() {
		return "CareerVo [cw_career_id=" + cw_career_id + ", career_cont=" + career_cont + ", career_st_dt="
				+ career_st_dt + ", career_end_dt=" + career_end_dt + ", mem_id=" + mem_id + ", hos_id=" + hos_id + "]";
	}

}
