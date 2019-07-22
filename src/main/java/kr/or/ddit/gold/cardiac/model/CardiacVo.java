package kr.or.ddit.gold.cardiac.model;

import java.util.Date;

public class CardiacVo {
	private int car_id;
	private String mem_id;
	private Date gold_st;
	private int car_bpm;
	private Date car_time;

	public int getCar_id() {
		return car_id;
	}

	public void setCar_id(int car_id) {
		this.car_id = car_id;
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

	public int getCar_bpm() {
		return car_bpm;
	}

	public void setCar_bpm(int car_bpm) {
		this.car_bpm = car_bpm;
	}

	public Date getCar_time() {
		return car_time;
	}

	public void setCar_time(Date car_time) {
		this.car_time = car_time;
	}

	@Override
	public String toString() {
		return "CardiacVo [car_id=" + car_id + ", mem_id=" + mem_id + ", gold_st=" + gold_st + ", car_bpm=" + car_bpm
				+ ", car_time=" + car_time + "]";
	}

}
