package kr.or.ddit.joinVo;

import java.util.Date;

public class MatchingGradeVo {
	
	private int grade_id;
	private int grade;
	private Date grade_time;
	private int mat_id;
	
	private int mat_id_fk;
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
	
	private String cwAvg;

	public int getGrade_id() {
		return grade_id;
	}

	public void setGrade_id(int grade_id) {
		this.grade_id = grade_id;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public Date getGrade_time() {
		return grade_time;
	}

	public void setGrade_time(Date grade_time) {
		this.grade_time = grade_time;
	}

	public int getMat_id() {
		return mat_id;
	}

	public void setMat_id(int mat_id) {
		this.mat_id = mat_id;
	}

	public int getMat_id_fk() {
		return mat_id_fk;
	}

	public void setMat_id_fk(int mat_id_fk) {
		this.mat_id_fk = mat_id_fk;
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

	public String getCwAvg() {
		return cwAvg;
	}

	public void setCwAvg(String cwAvg) {
		this.cwAvg = cwAvg;
	}

	@Override
	public String toString() {
		return "MatchingGradeVo [grade_id=" + grade_id + ", grade=" + grade + ", grade_time=" + grade_time + ", mat_id="
				+ mat_id + ", mat_id_fk=" + mat_id_fk + ", mat_title=" + mat_title + ", mat_cont=" + mat_cont
				+ ", mat_st=" + mat_st + ", mat_end=" + mat_end + ", mat_type=" + mat_type + ", mat_bc=" + mat_bc
				+ ", mat_tc=" + mat_tc + ", mat_allDay=" + mat_allDay + ", cw_mem_id=" + cw_mem_id + ", mem_id="
				+ mem_id + ", cwAvg=" + cwAvg + "]";
	}

	public MatchingGradeVo() {
		
	}

	public MatchingGradeVo(int grade_id, int grade, Date grade_time, int mat_id, int mat_id_fk, String mat_title,
			String mat_cont, String mat_st, String mat_end, String mat_type, String mat_bc, String mat_tc,
			String mat_allDay, String cw_mem_id, String mem_id, String cwAvg) {
		super();
		this.grade_id = grade_id;
		this.grade = grade;
		this.grade_time = grade_time;
		this.mat_id = mat_id;
		this.mat_id_fk = mat_id_fk;
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
		this.cwAvg = cwAvg;
	}

	public MatchingGradeVo(String cw_mem_id, int grade, int mat_id, int mat_id_fk, String cwAvg) {
		super();
		this.cw_mem_id = cw_mem_id;
		this.grade = grade;
		this.mat_id = mat_id;
		this.mat_id_fk = mat_id_fk;
		this.cwAvg = cwAvg;
	}
	
	
	
	

}
