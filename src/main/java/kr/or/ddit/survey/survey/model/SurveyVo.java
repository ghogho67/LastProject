package kr.or.ddit.survey.survey.model;

public class SurveyVo {
	private int sur_id;
	private String sur_nm;

	public int getSur_id() {
		return sur_id;
	}

	public void setSur_id(int sur_id) {
		this.sur_id = sur_id;
	}

	public String getSur_nm() {
		return sur_nm;
	}

	public void setSur_nm(String sur_nm) {
		this.sur_nm = sur_nm;
	}

	@Override
	public String toString() {
		return "SurveyVo [sur_id=" + sur_id + ", sur_nm=" + sur_nm + "]";
	}

}
