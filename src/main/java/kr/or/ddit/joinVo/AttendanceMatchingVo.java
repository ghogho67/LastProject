package kr.or.ddit.joinVo;

public class AttendanceMatchingVo {
	
	private int ad_id;
	private String ad_st;
	private String ad_end;
	private int mat_id;
	
	private int m_mat_id;
	private String mat_title;
	private String mat_cont;
	private String mat_st;
	private String mat_end;
	private String mat_type;
	private String mat_bc;
	private String mat_tc;
	private boolean mat_allDay;
	private String cw_mem_id;
	private String mem_id;
	private String mat_del;
	
	private int rn;
	
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public int getAd_id() {
		return ad_id;
	}
	public void setAd_id(int ad_id) {
		this.ad_id = ad_id;
	}
	public String getAd_st() {
		return ad_st;
	}
	public void setAd_st(String ad_st) {
		this.ad_st = ad_st;
	}
	public String getAd_end() {
		return ad_end;
	}
	public void setAd_end(String ad_end) {
		this.ad_end = ad_end;
	}
	public int getMat_id() {
		return mat_id;
	}
	public void setMat_id(int mat_id) {
		this.mat_id = mat_id;
	}
	public int getM_mat_id() {
		return m_mat_id;
	}
	public void setM_mat_id(int m_mat_id) {
		this.m_mat_id = m_mat_id;
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
	public boolean isMat_allDay() {
		return mat_allDay;
	}
	public void setMat_allDay(boolean mat_allDay) {
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
	public String getMat_del() {
		return mat_del;
	}
	public void setMat_del(String mat_del) {
		this.mat_del = mat_del;
	}
	public AttendanceMatchingVo() {
	}
	@Override
	public String toString() {
		return "AttendanceMatching [ad_id=" + ad_id + ", ad_st=" + ad_st + ", ad_end=" + ad_end + ", mat_id=" + mat_id
				+ ", m_mat_id=" + m_mat_id + ", mat_title=" + mat_title + ", mat_cont=" + mat_cont + ", mat_st="
				+ mat_st + ", mat_end=" + mat_end + ", mat_type=" + mat_type + ", mat_bc=" + mat_bc + ", mat_tc="
				+ mat_tc + ", mat_allDay=" + mat_allDay + ", cw_mem_id=" + cw_mem_id + ", mem_id=" + mem_id
				+ ", mat_del=" + mat_del + "]";
	}
	public AttendanceMatchingVo(String ad_st, String ad_end, int mat_id, String mat_type, String mem_id, String mat_del) {
		super();
		this.ad_st = ad_st;
		this.ad_end = ad_end;
		this.mat_id = mat_id;
		this.mat_type = mat_type;
		this.mem_id = mem_id;
		this.mat_del = mat_del;
	}
	
	
	
	

}
