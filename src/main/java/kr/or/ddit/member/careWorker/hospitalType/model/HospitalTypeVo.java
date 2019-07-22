package kr.or.ddit.member.careWorker.hospitalType.model;

public class HospitalTypeVo {
	private int ser_type_id;
	private int hos_id;

	public int getSer_type_id() {
		return ser_type_id;
	}

	public void setSer_type_id(int ser_type_id) {
		this.ser_type_id = ser_type_id;
	}

	public int getHos_id() {
		return hos_id;
	}

	public void setHos_id(int hos_id) {
		this.hos_id = hos_id;
	}

	@Override
	public String toString() {
		return "HospitalType [ser_type_id=" + ser_type_id + ", hos_id=" + hos_id + "]";
	}

}
