package kr.or.ddit.joinVo;

import java.util.Date;

public class MatchingReportAttachmentVo {

	
	private int mat_id;
	private String mat_title;
	private String mat_cont;
	private String mat_st;
	private String mat_end;
	private String mat_type;
	private String mat_bc;
	private String mat_tc;
	private String mat_allDay;
	private String cw_mem_id;
	private String mem_id;
	
	
	private int rep_id;
	private Date rep_time;
	private String rep_title;
	private String rep_cont;
	
	private int rep_att_id;
	private String rep_att_path;
	private String rep_att_nm;
	public int getMat_id() {
		return mat_id;
	}
	public void setMat_id(int mat_id) {
		this.mat_id = mat_id;
	}
	public String getMat_title() {
		return mat_title;
	}
	public void setMat_title(String mat_title) {
		this.mat_title = mat_title;
	}
	public String getMat_cont() {
		return mat_cont;
	}
	public void setMat_cont(String mat_cont) {
		this.mat_cont = mat_cont;
	}
	public String getMat_st() {
		return mat_st;
	}
	public void setMat_st(String mat_st) {
		this.mat_st = mat_st;
	}
	public String getMat_end() {
		return mat_end;
	}
	public void setMat_end(String mat_end) {
		this.mat_end = mat_end;
	}
	public String getMat_type() {
		return mat_type;
	}
	public void setMat_type(String mat_type) {
		this.mat_type = mat_type;
	}
	public String getMat_bc() {
		return mat_bc;
	}
	public void setMat_bc(String mat_bc) {
		this.mat_bc = mat_bc;
	}
	public String getMat_tc() {
		return mat_tc;
	}
	public void setMat_tc(String mat_tc) {
		this.mat_tc = mat_tc;
	}
	public String getMat_allDay() {
		return mat_allDay;
	}
	public void setMat_allDay(String mat_allDay) {
		this.mat_allDay = mat_allDay;
	}
	public String getCw_mem_id() {
		return cw_mem_id;
	}
	public void setCw_mem_id(String cw_mem_id) {
		this.cw_mem_id = cw_mem_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getRep_id() {
		return rep_id;
	}
	public void setRep_id(int rep_id) {
		this.rep_id = rep_id;
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
	@Override
	public String toString() {
		return "MatchingReportAttachmentVo [mat_id=" + mat_id + ", mat_title=" + mat_title + ", mat_cont=" + mat_cont
				+ ", mat_st=" + mat_st + ", mat_end=" + mat_end + ", mat_type=" + mat_type + ", mat_bc=" + mat_bc
				+ ", mat_tc=" + mat_tc + ", mat_allDay=" + mat_allDay + ", cw_mem_id=" + cw_mem_id + ", mem_id="
				+ mem_id + ", rep_id=" + rep_id + ", rep_time=" + rep_time + ", rep_title=" + rep_title + ", rep_cont="
				+ rep_cont + ", rep_att_id=" + rep_att_id + ", rep_att_path=" + rep_att_path + ", rep_att_nm="
				+ rep_att_nm + "]";
	}
	public MatchingReportAttachmentVo(int mat_id, String mat_title, String mat_cont, String mat_st, String mat_end,
			String mat_type, String mat_bc, String mat_tc, String mat_allDay, String cw_mem_id, String mem_id,
			int rep_id, Date rep_time, String rep_title, String rep_cont, int rep_att_id, String rep_att_path,
			String rep_att_nm) {
		super();
		this.mat_id = mat_id;
		this.mat_title = mat_title;
		this.mat_cont = mat_cont;
		this.mat_st = mat_st;
		this.mat_end = mat_end;
		this.mat_type = mat_type;
		this.mat_bc = mat_bc;
		this.mat_tc = mat_tc;
		this.mat_allDay = mat_allDay;
		this.cw_mem_id = cw_mem_id;
		this.mem_id = mem_id;
		this.rep_id = rep_id;
		this.rep_time = rep_time;
		this.rep_title = rep_title;
		this.rep_cont = rep_cont;
		this.rep_att_id = rep_att_id;
		this.rep_att_path = rep_att_path;
		this.rep_att_nm = rep_att_nm;
	}
	
	
	
	
	
	
	
	
	
	
	
	public MatchingReportAttachmentVo(String mem_id, int rep_id) {
		this.mem_id = mem_id;
		this.rep_id = rep_id;
		
	}
	
	
	
	public MatchingReportAttachmentVo() {
		super();
	}

	
	
	

}
