package kr.or.ddit.matching.reportAttach.model;

public class ReportAttachVo {

	private int rep_att_id;
	private String rep_att_path;
	private String rep_att_nm;
	private int rep_id;

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

	public int getRep_id() {
		return rep_id;
	}

	public void setRep_id(int rep_id) {
		this.rep_id = rep_id;
	}

	@Override
	public String toString() {
		return "ReportAttachVo [rep_att_id=" + rep_att_id + ", rep_att_path=" + rep_att_path + ", rep_att_nm="
				+ rep_att_nm + ", rep_id=" + rep_id + "]";
	}

}
