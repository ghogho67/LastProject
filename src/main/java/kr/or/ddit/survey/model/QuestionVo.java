package kr.or.ddit.survey.model;

public class QuestionVo {
	private int ques_id;
	private String ques;
	private String ans;
	private int sur_id;

	public int getQues_id() {
		return ques_id;
	}

	public void setQues_id(int ques_id) {
		this.ques_id = ques_id;
	}

	public String getQues() {
		return ques;
	}

	public void setQues(String ques) {
		this.ques = ques;
	}

	public String getAns() {
		return ans;
	}

	public void setAns(String ans) {
		this.ans = ans;
	}

	public int getSur_id() {
		return sur_id;
	}

	public void setSur_id(int sur_id) {
		this.sur_id = sur_id;
	}

	@Override
	public String toString() {
		return "QuestionVo [ques_id=" + ques_id + ", ques=" + ques + ", ans=" + ans + ", sur_id=" + sur_id + "]";
	}

}
