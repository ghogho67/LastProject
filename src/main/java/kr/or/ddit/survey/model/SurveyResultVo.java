package kr.or.ddit.survey.model;


public class SurveyResultVo {

	private String surresult_id;
	private int sur_part_id;
	private String sur_result;
	private String sur_time;
	
	
	
	public SurveyResultVo(String surresult_id, int sur_part_id, String sur_result) {
		super();
		this.surresult_id = surresult_id;
		this.sur_part_id = sur_part_id;
		this.sur_result = sur_result;
	}
	
	public SurveyResultVo(String surresult_id, int sur_part_id, String sur_result, String sur_time) {
		super();
		this.surresult_id = surresult_id;
		this.sur_part_id = sur_part_id;
		this.sur_result = sur_result;
		this.sur_time = sur_time;
	}
	
	
	@Override
	public String toString() {
		return "SurveyResultVo [surresult_id=" + surresult_id + ", sur_part_id=" + sur_part_id + ", sur_result="
				+ sur_result + ", sur_time=" + sur_time + "]";
	}


	public String getSurresult_id() {
		return surresult_id;
	}


	public void setSurresult_id(String surresult_id) {
		this.surresult_id = surresult_id;
	}


	public int getSur_part_id() {
		return sur_part_id;
	}


	public void setSur_part_id(int sur_part_id) {
		this.sur_part_id = sur_part_id;
	}


	public String getSur_result() {
		return sur_result;
	}


	public void setSur_result(String sur_result) {
		this.sur_result = sur_result;
	}


	public String getSur_time() {
		return sur_time;
	}


	public void setSur_time(String sur_time) {
		this.sur_time = sur_time;
	}
	
	

	
	
	
}
