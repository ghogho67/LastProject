package kr.or.ddit.survey.model;

import java.util.Date;

public class SurveyAnswerVo {
	private int sur_part_id;
	private int ques_id;
	private String sur_ans_cont;
	private Date sur_ans_time;

	public SurveyAnswerVo(int sur_part_id, int ques_id, String sur_ans_cont) {
		super();
		this.sur_part_id = sur_part_id;
		this.ques_id = ques_id;
		this.sur_ans_cont = sur_ans_cont;
	}

	public int getSur_part_id() {
		return sur_part_id;
	}

	public void setSur_part_id(int sur_part_id) {
		this.sur_part_id = sur_part_id;
	}

	public int getQues_id() {
		return ques_id;
	}

	public void setQues_id(int ques_id) {
		this.ques_id = ques_id;
	}

	public String getSur_ans_cont() {
		return sur_ans_cont;
	}

	public void setSur_ans_cont(String sur_ans_cont) {
		this.sur_ans_cont = sur_ans_cont;
	}

	public Date getSur_ans_time() {
		return sur_ans_time;
	}

	public void setSur_ans_time(Date sur_ans_time) {
		this.sur_ans_time = sur_ans_time;
	}

	@Override
	public String toString() {
		return "SurveyAnswerVo [sur_part_id=" + sur_part_id + ", ques_id=" + ques_id + ", sur_ans_cont=" + sur_ans_cont
				+ ", sur_ans_time=" + sur_ans_time + "]";
	}

}
