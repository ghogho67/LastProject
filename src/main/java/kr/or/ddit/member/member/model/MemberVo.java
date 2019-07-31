package kr.or.ddit.member.member.model;

public class MemberVo {


	private String mem_id;
	private String mem_nm;
	private String mem_birth;
	private String mem_gender;
	private String mem_pass;
	private String mem_phone;
	private String mem_add1;
	private String mem_add2;
	private String mem_zipcd;
	private String mem_mail;
	private String mem_grade;
	private String mem_del;
	private String mem_photo_path;
	private String mem_photo_nm;
	private String pro_relation;
	private String pro_nm;
	private String pro_phone;
	private String cw_driver;
	private String cw_lic;


	
	
	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_nm() {
		return mem_nm;
	}

	public void setMem_nm(String mem_nm) {
		this.mem_nm = mem_nm;
	}

	public MemberVo(String mem_id, String mem_nm, String mem_birth, String mem_gender, String mem_pass,
			String mem_phone, String mem_add1, String mem_add2, String mem_zipcd, String mem_mail, String mem_grade,
			String mem_del, String mem_photo_path, String mem_photo_nm, String cw_driver, String cw_lic) {
		this.mem_id = mem_id;
		this.mem_nm = mem_nm;
		this.mem_birth = mem_birth;
		this.mem_gender = mem_gender;
		this.mem_pass = mem_pass;
		this.mem_phone = mem_phone;
		this.mem_add1 = mem_add1;
		this.mem_add2 = mem_add2;
		this.mem_zipcd = mem_zipcd;
		this.mem_mail = mem_mail;
		this.mem_grade = mem_grade;
		this.mem_del = mem_del;
		this.mem_photo_path = mem_photo_path;
		this.mem_photo_nm = mem_photo_nm;
		this.cw_driver = cw_driver;
		this.cw_lic = cw_lic;
	}

	public String getMem_birth() {
		return mem_birth;
	}

	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}

	public String getMem_gender() {
		return mem_gender;
	}

	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}

	public String getMem_pass() {
		return mem_pass;
	}

	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
	}

	public String getMem_phone() {
		return mem_phone;
	}

	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}

	public String getMem_add1() {
		return mem_add1;
	}

	public void setMem_add1(String mem_add1) {
		this.mem_add1 = mem_add1;
	}

	public String getMem_add2() {
		return mem_add2;
	}

	public void setMem_add2(String mem_add2) {
		this.mem_add2 = mem_add2;
	}

	public String getMem_zipcd() {
		return mem_zipcd;
	}

	public void setMem_zipcd(String mem_zipcd) {
		this.mem_zipcd = mem_zipcd;
	}

	public String getMem_mail() {
		return mem_mail;
	}

	public void setMem_mail(String mem_mail) {
		this.mem_mail = mem_mail;
	}

	public String getMem_grade() {
		return mem_grade;
	}

	public void setMem_grade(String mem_grade) {
		this.mem_grade = mem_grade;
	}

	public String getMem_del() {
		return mem_del;
	}

	public void setMem_del(String mem_del) {
		this.mem_del = mem_del;
	}

	public String getMem_photo_path() {
		return mem_photo_path;
	}

	public void setMem_photo_path(String mem_photo_path) {
		this.mem_photo_path = mem_photo_path;
	}

	public String getMem_photo_nm() {
		return mem_photo_nm;
	}

	public void setMem_photo_nm(String mem_photo_nm) {
		this.mem_photo_nm = mem_photo_nm;
	}

	public String getPro_relation() {
		return pro_relation;
	}

	public void setPro_relation(String pro_relation) {
		this.pro_relation = pro_relation;
	}

	public String getPro_nm() {
		return pro_nm;
	}

	public void setPro_nm(String pro_nm) {
		this.pro_nm = pro_nm;
	}

	public String getPro_phone() {
		return pro_phone;
	}

	public void setPro_phone(String pro_phone) {
		this.pro_phone = pro_phone;
	}

	public String getCw_driver() {
		return cw_driver;
	}

	public void setCw_driver(String cw_driver) {
		this.cw_driver = cw_driver;
	}

	public String getCw_lic() {
		return cw_lic;
	}

	public void setCw_lic(String cw_lic) {
		this.cw_lic = cw_lic;
	}

	public MemberVo(String mem_id, String mem_nm, String mem_birth, String mem_gender, String mem_pass,
			String mem_phone, String mem_add1, String mem_add2, String mem_zipcd, String mem_mail, String mem_grade,
			String mem_del, String mem_photo_path, String mem_photo_nm, String pro_relation, String pro_nm,
			String pro_phone) {
		this.mem_id = mem_id;
		this.mem_nm = mem_nm;
		this.mem_birth = mem_birth;
		this.mem_gender = mem_gender;
		this.mem_pass = mem_pass;
		this.mem_phone = mem_phone;
		this.mem_add1 = mem_add1;
		this.mem_add2 = mem_add2;
		this.mem_zipcd = mem_zipcd;
		this.mem_mail = mem_mail;
		this.mem_grade = mem_grade;
		this.mem_del = mem_del;
		this.mem_photo_path = mem_photo_path;
		this.mem_photo_nm = mem_photo_nm;
		this.pro_relation = pro_relation;
		this.pro_nm = pro_nm;
		this.pro_phone = pro_phone;
	}

	@Override
	public String toString() {
		return "MemberVo [mem_id=" + mem_id + ", mem_nm=" + mem_nm + ", mem_birth=" + mem_birth + ", mem_gender="
				+ mem_gender + ", mem_pass=" + mem_pass + ", mem_phone=" + mem_phone + ", mem_add1=" + mem_add1
				+ ", mem_add2=" + mem_add2 + ", mem_zipcd=" + mem_zipcd + ", mem_mail=" + mem_mail + ", mem_grade="
				+ mem_grade + ", mem_del=" + mem_del + ", mem_photo_path=" + mem_photo_path + ", mem_photo_nm="
				+ mem_photo_nm + ", pro_relation=" + pro_relation + ", pro_nm=" + pro_nm + ", pro_phone=" + pro_phone
				+ ", cw_driver=" + cw_driver + ", cw_lic=" + cw_lic + "]";
	}

	
	
	
	
	public MemberVo(String mem_id, String mem_nm, String mem_birth, String mem_gender, String mem_pass,
			String mem_phone, String mem_add1, String mem_add2, String mem_zipcd, String mem_mail, String mem_grade,
			String mem_del, String mem_photo_path, String mem_photo_nm, String pro_relation, String pro_nm,
			String pro_phone, String cw_driver, String cw_lic) {
		this.mem_id = mem_id;
		this.mem_nm = mem_nm;
		this.mem_birth = mem_birth;
		this.mem_gender = mem_gender;
		this.mem_pass = mem_pass;
		this.mem_phone = mem_phone;
		this.mem_add1 = mem_add1;
		this.mem_add2 = mem_add2;
		this.mem_zipcd = mem_zipcd;
		this.mem_mail = mem_mail;
		this.mem_grade = mem_grade;
		this.mem_del = mem_del;
		this.mem_photo_path = mem_photo_path;
		this.mem_photo_nm = mem_photo_nm;
		this.pro_relation = pro_relation;
		this.pro_nm = pro_nm;
		this.pro_phone = pro_phone;
		this.cw_driver = cw_driver;
		this.cw_lic = cw_lic;
	}
	
	public MemberVo() {
		
	}
	
}
