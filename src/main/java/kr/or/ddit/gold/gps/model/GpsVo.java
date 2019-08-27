package kr.or.ddit.gold.gps.model;

import java.util.Date;

public class GpsVo {
	private int gps_id;
	private String mem_id;
	private Date gold_st;
	private String gps_time;
	private double gps_lo;
	private double gps_la;
	private int car_bpm;


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


	public String getGps_time() {
		return gps_time;
	}


	public void setGps_time(String gps_time) {
		this.gps_time = gps_time;
	}


	public double getGps_lo() {
		return gps_lo;
	}


	public void setGps_lo(double gps_lo) {
		this.gps_lo = gps_lo;
	}


	public double getGps_la() {
		return gps_la;
	}


	public void setGps_la(double gps_la) {
		this.gps_la = gps_la;
	}


	public int getCar_bpm() {
		return car_bpm;
	}


	public void setCar_bpm(int car_bpm) {
		this.car_bpm = car_bpm;
	}


	@Override
	public String toString() {
		return "GpsVo [gps_id=" + gps_id + ", mem_id=" + mem_id + ", gold_st=" + gold_st + ", gps_time=" + gps_time
				+ ", gps_lo=" + gps_lo + ", gps_la=" + gps_la + ", car_bpm=" + car_bpm + "]";
	}

}
