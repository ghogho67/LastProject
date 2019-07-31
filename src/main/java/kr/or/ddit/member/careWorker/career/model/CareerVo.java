package kr.or.ddit.member.careWorker.career.model;

import java.util.Date;

public class CareerVo {

	private int cw_career_id;
	private String career_cont;
	private String career_st_dt;
	private String career_end_dt;
	private String mem_id;
	private String career_hos;
	
	
	public CareerVo() {
		
	}


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


	public String getCareer_st_dt() {
		return career_st_dt;
	}


	public void setCareer_st_dt(String career_st_dt) {
		this.career_st_dt = career_st_dt;
	}


	public String getCareer_end_dt() {
		return career_end_dt;
	}


	public void setCareer_end_dt(String career_end_dt) {
		this.career_end_dt = career_end_dt;
	}


	public String getMem_id() {
		return mem_id;
	}


	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}


	public String getCareer_hos() {
		return career_hos;
	}


	public void setCareer_hos(String career_hos) {
		this.career_hos = career_hos;
	}


	@Override
	public String toString() {
		return "CareerVo [cw_career_id=" + cw_career_id + ", career_cont=" + career_cont + ", career_st_dt="
				+ career_st_dt + ", career_end_dt=" + career_end_dt + ", mem_id=" + mem_id + ", career_hos="
				+ career_hos + "]";
	}


	public CareerVo(int cw_career_id, String career_cont, String career_st_dt, String career_end_dt, String mem_id,
			String career_hos) {
		this.cw_career_id = cw_career_id;
		this.career_cont = career_cont;
		this.career_st_dt = career_st_dt;
		this.career_end_dt = career_end_dt;
		this.mem_id = mem_id;
		this.career_hos = career_hos;
	}







}
