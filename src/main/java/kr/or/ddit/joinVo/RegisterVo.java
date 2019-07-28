package kr.or.ddit.joinVo;

public class RegisterVo {
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

	private String cw_driver;
	private String cw_lic;
	private int cw_day;
	
	private int ser_type_id;
	private int cw_ser_type_id;
	
	public int getCw_ser_type_id() {
		return cw_ser_type_id;
	}
	public void setCw_ser_type_id(int cw_ser_type_id) {
		this.cw_ser_type_id = cw_ser_type_id;
	}
	public int getSer_type_id() {
		return ser_type_id;
	}
	public void setSer_type_id(int ser_type_id) {
		this.ser_type_id = ser_type_id;
	}
	private int loc_id;
	private String loc_dong;
	
	
	private int cw_career_id;
	private String career_cont;
	private String career_st_dt;
	private String career_end_dt;
	private String career_hos;	
	
	private String hos_nm;
	private String hos_add;
	private String hos_phone;
	
	public RegisterVo() {
		
	}
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
	public int getCw_day() {
		return cw_day;
	}
	public void setCw_day(int cw_day) {
		this.cw_day = cw_day;
	}
	public int getLoc_id() {
		return loc_id;
	}
	public void setLoc_id(int loc_id) {
		this.loc_id = loc_id;
	}
	public String getLoc_dong() {
		return loc_dong;
	}
	public void setLoc_dong(String loc_dong) {
		this.loc_dong = loc_dong;
	}
	public int getCw_career_id() {
		return cw_career_id;
	}
	public void setCw_career_id(int cw_career_id) {
		this.cw_career_id = cw_career_id;
	}
	public String getCareer_cont() {
		return career_cont;
	}
	public void setCareer_cont(String career_cont) {
		this.career_cont = career_cont;
	}
	public String getCareer_st_dt() {
		return career_st_dt;
	}
	public void setCareer_st_dt(String career_st_dt) {
		this.career_st_dt = career_st_dt;
	}
	public String getCareer_end_dt() {
		return career_end_dt;
	}
	public void setCareer_end_dt(String career_end_dt) {
		this.career_end_dt = career_end_dt;
	}
	public String getCareer_hos() {
		return career_hos;
	}
	public void setCareer_hos(String career_hos) {
		this.career_hos = career_hos;
	}
	public String getHos_nm() {
		return hos_nm;
	}
	public void setHos_nm(String hos_nm) {
		this.hos_nm = hos_nm;
	}
	public String getHos_add() {
		return hos_add;
	}
	public void setHos_add(String hos_add) {
		this.hos_add = hos_add;
	}
	public String getHos_phone() {
		return hos_phone;
	}
	public void setHos_phone(String hos_phone) {
		this.hos_phone = hos_phone;
	}
	@Override
	public String toString() {
		return "RegisterVo [mem_id=" + mem_id + ", mem_nm=" + mem_nm + ", mem_birth=" + mem_birth + ", mem_gender="
				+ mem_gender + ", mem_pass=" + mem_pass + ", mem_phone=" + mem_phone + ", mem_add1=" + mem_add1
				+ ", mem_add2=" + mem_add2 + ", mem_zipcd=" + mem_zipcd + ", mem_mail=" + mem_mail + ", mem_grade="
				+ mem_grade + ", mem_del=" + mem_del + ", mem_photo_path=" + mem_photo_path + ", mem_photo_nm="
				+ mem_photo_nm + ", cw_driver=" + cw_driver + ", cw_lic=" + cw_lic + ", cw_day=" + cw_day
				+ ", ser_type_id=" + ser_type_id + ", cw_ser_type_id=" + cw_ser_type_id + ", loc_id=" + loc_id
				+ ", loc_dong=" + loc_dong + ", cw_career_id=" + cw_career_id + ", career_cont=" + career_cont
				+ ", career_st_dt=" + career_st_dt + ", career_end_dt=" + career_end_dt + ", career_hos=" + career_hos
				+ ", hos_nm=" + hos_nm + ", hos_add=" + hos_add + ", hos_phone=" + hos_phone + "]";
	}
	public RegisterVo(String mem_id, String mem_nm, String mem_birth, String mem_gender, String mem_pass,
			String mem_phone, String mem_add1, String mem_add2, String mem_zipcd, String mem_mail, String mem_grade,
			String mem_del, String mem_photo_path, String mem_photo_nm, String cw_driver, String cw_lic, int cw_day,
			int ser_type_id, int cw_ser_type_id, int loc_id, String loc_dong, int cw_career_id, String career_cont,
			String career_st_dt, String career_end_dt, String career_hos, String hos_nm, String hos_add,
			String hos_phone) {
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
		this.cw_day = cw_day;
		this.ser_type_id = ser_type_id;
		this.cw_ser_type_id = cw_ser_type_id;
		this.loc_id = loc_id;
		this.loc_dong = loc_dong;
		this.cw_career_id = cw_career_id;
		this.career_cont = career_cont;
		this.career_st_dt = career_st_dt;
		this.career_end_dt = career_end_dt;
		this.career_hos = career_hos;
		this.hos_nm = hos_nm;
		this.hos_add = hos_add;
		this.hos_phone = hos_phone;
	}

	
	

	
	

}
