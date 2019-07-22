package kr.or.ddit.member.careWorker.serviceType.model;

public class ServiceTypeVo {
	private int ser_type_id;
	private String ser_type;

	public int getSer_type_id() {
		return ser_type_id;
	}

	public void setSer_type_id(int ser_type_id) {
		this.ser_type_id = ser_type_id;
	}

	public String getSer_type() {
		return ser_type;
	}

	public void setSer_type(String ser_type) {
		this.ser_type = ser_type;
	}

	@Override
	public String toString() {
		return "ServiceTypeVo [ser_type_id=" + ser_type_id + ", ser_type=" + ser_type + "]";
	}

}
