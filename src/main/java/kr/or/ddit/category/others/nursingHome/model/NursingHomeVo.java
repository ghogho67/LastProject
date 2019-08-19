package kr.or.ddit.category.others.nursingHome.model;

public class NursingHomeVo {
	
	private String nh_id;
	private String nh_nm;
	private String nh_rep;
	private String nh_add;
	private String nh_phone;
	private String nh_grade;
	private int cate_id;
	
	private int rn;
	
	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public NursingHomeVo() {
		
	}
	
	public String getNh_id() {
		return nh_id;
	}
	public void setNh_id(String nh_id) {
		this.nh_id = nh_id;
	}
	public String getNh_nm() {
		return nh_nm;
	}
	public void setNh_nm(String nh_nm) {
		this.nh_nm = nh_nm;
	}
	public String getNh_rep() {
		return nh_rep;
	}
	public void setNh_rep(String nh_rep) {
		this.nh_rep = nh_rep;
	}
	public String getNh_add() {
		return nh_add;
	}
	public void setNh_add(String nh_add) {
		this.nh_add = nh_add;
	}
	public String getNh_phone() {
		return nh_phone;
	}
	public void setNh_phone(String nh_phone) {
		this.nh_phone = nh_phone;
	}
	public String getNh_grade() {
		return nh_grade;
	}
	public void setNh_grade(String nh_grade) {
		this.nh_grade = nh_grade;
	}
	public int getCate_id() {
		return cate_id;
	}
	public void setCate_id(int cate_id) {
		this.cate_id = cate_id;
	}

	public NursingHomeVo(String nh_id, String nh_nm, String nh_rep, String nh_add, String nh_phone, String nh_grade,
			int cate_id) {
		this.nh_id = nh_id;
		this.nh_nm = nh_nm;
		this.nh_rep = nh_rep;
		this.nh_add = nh_add;
		this.nh_phone = nh_phone;
		this.nh_grade = nh_grade;
		this.cate_id = cate_id;
	}

	@Override
	public String toString() {
		return "NursingHomeVo [nh_id=" + nh_id + ", nh_nm=" + nh_nm + ", nh_rep=" + nh_rep + ", nh_add=" + nh_add
				+ ", nh_phone=" + nh_phone + ", nh_grade=" + nh_grade + ", cate_id=" + cate_id + "]";
	}
	
	
	

}
