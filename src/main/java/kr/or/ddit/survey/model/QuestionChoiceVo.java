package kr.or.ddit.survey.model;

public class QuestionChoiceVo {
	private int ques_id;
	private String ques;
	private String ans;
	private int sur_id;

	private String choice_id;
	private String choice_ct1;
	private String choice_ct2;
	private String choice_ct3;
	private String choice_ct4;
	
	
	public QuestionChoiceVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QuestionChoiceVo(int ques_id, String ques, String ans, int sur_id, String choice_id, String choice_ct1,
			String choice_ct2, String choice_ct3, String choice_ct4) {
		super();
		this.ques_id = ques_id;
		this.ques = ques;
		this.ans = ans;
		this.sur_id = sur_id;
		this.choice_id = choice_id;
		this.choice_ct1 = choice_ct1;
		this.choice_ct2 = choice_ct2;
		this.choice_ct3 = choice_ct3;
		this.choice_ct4 = choice_ct4;
	}
	@Override
	public String toString() {
		return "QuestionChoiceVo [ques_id=" + ques_id + ", ques=" + ques + ", ans=" + ans + ", sur_id=" + sur_id
				+ ", choice_id=" + choice_id + ", choice_ct1=" + choice_ct1 + ", choice_ct2=" + choice_ct2
				+ ", choice_ct3=" + choice_ct3 + ", choice_ct4=" + choice_ct4 + "]";
	}
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
	public String getChoice_id() {
		return choice_id;
	}
	public void setChoice_id(String choice_id) {
		this.choice_id = choice_id;
	}
	public String getChoice_ct1() {
		return choice_ct1;
	}
	public void setChoice_ct1(String choice_ct1) {
		this.choice_ct1 = choice_ct1;
	}
	public String getChoice_ct2() {
		return choice_ct2;
	}
	public void setChoice_ct2(String choice_ct2) {
		this.choice_ct2 = choice_ct2;
	}
	public String getChoice_ct3() {
		return choice_ct3;
	}
	public void setChoice_ct3(String choice_ct3) {
		this.choice_ct3 = choice_ct3;
	}
	public String getChoice_ct4() {
		return choice_ct4;
	}
	public void setChoice_ct4(String choice_ct4) {
		this.choice_ct4 = choice_ct4;
	}
	
	
	
	
	
	

}
