package kr.or.ddit.member.careWorker.day.model;

public class DayVo {
	private String mem_id;
	private int cw_day;

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getCw_day() {
		return cw_day;
	}

	public void setCw_day(int cw_day) {
		this.cw_day = cw_day;
	}

	@Override
	public String toString() {
		return "DayVo [mem_id=" + mem_id + ", cw_day=" + cw_day + "]";
	}

}
