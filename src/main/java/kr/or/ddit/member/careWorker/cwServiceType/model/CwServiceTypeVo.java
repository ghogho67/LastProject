package kr.or.ddit.member.careWorker.cwServiceType.model;

public class CwServiceTypeVo {
	private String mem_id;
	private int ser_type_id;
	private int cw_ser_type_id;

	public CwServiceTypeVo() {
		
	}
	
	public int getCw_ser_type_id() {
		return cw_ser_type_id;
	}

	public void setCw_ser_type_id(int cw_ser_type_id) {
		this.cw_ser_type_id = cw_ser_type_id;
	}


	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getSer_type_id() {
		return ser_type_id;
	}

	public void setSer_type_id(int ser_type_id) {
		this.ser_type_id = ser_type_id;
	}

	public CwServiceTypeVo(String mem_id, int ser_type_id, int cw_ser_type_id) {
		this.mem_id = mem_id;
		this.ser_type_id = ser_type_id;
		this.cw_ser_type_id = cw_ser_type_id;
	}

	@Override
	public String toString() {
		return "CwServiceTypeVo [mem_id=" + mem_id + ", ser_type_id=" + ser_type_id + ", cw_ser_type_id="
				+ cw_ser_type_id + "]";
	}



}
