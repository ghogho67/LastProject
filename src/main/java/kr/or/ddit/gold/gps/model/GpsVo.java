package kr.or.ddit.gold.gps.model;

import java.util.Date;

public class GpsVo {
	private int gps_id;
	private String mem_id;
	private Date gold_st;
	private Date gps_time;
	private int gps_lo;
	private int gps_la;

	public int getGps_id() {
		return gps_id;
	}

	public void setGps_id(int gps_id) {
		this.gps_id = gps_id;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public Date getGold_st() {
		return gold_st;
	}

	public void setGold_st(Date gold_st) {
		this.gold_st = gold_st;
	}

	public Date getGps_time() {
		return gps_time;
	}

	public void setGps_time(Date gps_time) {
		this.gps_time = gps_time;
	}

	public int getGps_lo() {
		return gps_lo;
	}

	public void setGps_lo(int gps_lo) {
		this.gps_lo = gps_lo;
	}

	public int getGps_la() {
		return gps_la;
	}

	public void setGps_la(int gps_la) {
		this.gps_la = gps_la;
	}

	@Override
	public String toString() {
		return "GpsVo [gps_id=" + gps_id + ", mem_id=" + mem_id + ", gold_st=" + gold_st + ", gps_time=" + gps_time
				+ ", gps_lo=" + gps_lo + ", gps_la=" + gps_la + "]";
	}

}
