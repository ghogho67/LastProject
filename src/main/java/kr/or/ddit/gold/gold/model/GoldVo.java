package kr.or.ddit.gold.gold.model;

import java.util.Date;

public class GoldVo {

	private String mem_id;
	private Date gold_st;
	private Date gold_end;

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

	public Date getGold_end() {
		return gold_end;
	}

	public void setGold_end(Date gold_end) {
		this.gold_end = gold_end;
	}

	@Override
	public String toString() {
		return "GoldVo [mem_id=" + mem_id + ", gold_st=" + gold_st + ", gold_end=" + gold_end + "]";
	}

}
