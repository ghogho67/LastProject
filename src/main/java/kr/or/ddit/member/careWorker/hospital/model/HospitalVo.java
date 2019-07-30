package kr.or.ddit.member.careWorker.hospital.model;

public class HospitalVo {
	private int hos_id;
	private String hos_nm;
	private String hos_add;
	private String hos_phone;
	
	public HospitalVo() {
		
	}

	public int getHos_id() {
		return hos_id;
	}

	public void setHos_id(int hos_id) {
		this.hos_id = hos_id;
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
		return "HospitalVo [hos_id=" + hos_id + ", hos_nm=" + hos_nm + ", hos_add=" + hos_add + ", hos_phone="
				+ hos_phone + "]";
	}

	public HospitalVo(int hos_id, String hos_nm, String hos_add, String hos_phone) {
		super();
		this.hos_id = hos_id;
		this.hos_nm = hos_nm;
		this.hos_add = hos_add;
		this.hos_phone = hos_phone;
	}


	



}
