package kr.or.ddit.matching.report.model;

import java.util.Date;

public class ReportCheckVo {
	private int mat_id;
	private Date rep_time;
	private String rep_title;
	private String rep_cont;
	private int check;

	public int getMat_id() {
		return mat_id;
	}

	public void setMat_id(int mat_id) {
		this.mat_id = mat_id;
	}

	public Date getRep_time() {
		return rep_time;
	}

	public void setRep_time(Date rep_time) {
		this.rep_time = rep_time;
	}

	public String getRep_title() {
		return rep_title;
	}

	public void setRep_title(String rep_title) {
		this.rep_title = rep_title;
	}

	public String getRep_cont() {
		return rep_cont;
	}

	public void setRep_cont(String rep_cont) {
		this.rep_cont = rep_cont;
	}

	public int getCheck() {
		return check;
	}

	public void setCheck(int check) {
		this.check = check;
	}

	@Override
	public String toString() {
		return "ReportCheckVo [mat_id=" + mat_id + ", rep_time=" + rep_time + ", rep_title=" + rep_title + ", rep_cont="
				+ rep_cont + ", check=" + check + "]";
	}

}
