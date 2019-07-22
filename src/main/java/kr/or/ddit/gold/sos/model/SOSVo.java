package kr.or.ddit.gold.sos.model;
//sos
public class SOSVo {
	private int sos_id;
	private int gps_id;

	public int getSos_id() {
		return sos_id;
	}

	public void setSos_id(int sos_id) {
		this.sos_id = sos_id;
	}

	public int getGps_id() {
		return gps_id;
	}

	public void setGps_id(int gps_id) {
		this.gps_id = gps_id;
	}

	@Override
	public String toString() {
		return "SOSVo [sos_id=" + sos_id + ", gps_id=" + gps_id + "]";
	}

}
