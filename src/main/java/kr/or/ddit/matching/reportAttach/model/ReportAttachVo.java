package kr.or.ddit.matching.reportAttach.model;

public class ReportAttachVo {

	private int rep_att_id;
	private String rep_att_path;
	private String rep_att_nm;
	private int mat_id;

	public int getRep_att_id() {
		return rep_att_id;
	}

	public void setRep_att_id(int rep_att_id) {
		this.rep_att_id = rep_att_id;
	}

	public String getRep_att_path() {
		return rep_att_path;
	}

	public void setRep_att_path(String rep_att_path) {
		this.rep_att_path = rep_att_path;
	}

	public String getRep_att_nm() {
		return rep_att_nm;
	}

	public void setRep_att_nm(String rep_att_nm) {
		this.rep_att_nm = rep_att_nm;
	}

	public int getMat_id() {
		return mat_id;
	}

	public void setMat_id(int mat_id) {
		this.mat_id = mat_id;
	}

	@Override
	public String toString() {
		return "ReportAttachVo [rep_att_id=" + rep_att_id + ", rep_att_path=" + rep_att_path + ", rep_att_nm="
				+ rep_att_nm + ", mat_id=" + mat_id + "]";
	}

}
