package kr.or.ddit.survey.model;

public class SurveyPartVo {
	public SurveyPartVo(int sur_part_id, int sur_id, String mem_id) {
		super();
		this.sur_part_id = sur_part_id;
		this.sur_id = sur_id;
		this.mem_id = mem_id;
	}

	private int sur_part_id;
	private int sur_id;
	private String mem_id;


	public int getSur_part_id() {
		return sur_part_id;
	}

	public void setSur_part_id(int sur_part_id) {
		this.sur_part_id = sur_part_id;
	}

	public int getSur_id() {
		return sur_id;
	}

	public void setSur_id(int sur_id) {
		this.sur_id = sur_id;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	@Override
	public String toString() {
		return "SurveyPartVo [sur_part_id=" + sur_part_id + ", sur_id=" + sur_id + ", mem_id=" + mem_id + "]";
	}

}
