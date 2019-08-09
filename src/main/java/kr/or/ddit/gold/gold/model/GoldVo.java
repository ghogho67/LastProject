package kr.or.ddit.gold.gold.model;

import java.util.Date;

public class GoldVo {

	private String mem_id;
	private Date gold_st;
	private Date gold_end;
	private String gold_del;
	public GoldVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GoldVo(String mem_id, Date gold_st, Date gold_end, String gold_del) {
		super();
		this.mem_id = mem_id;
		this.gold_st = gold_st;
		this.gold_end = gold_end;
		this.gold_del = gold_del;
	}
	@Override
	public String toString() {
		return "GoldVo [mem_id=" + mem_id + ", gold_st=" + gold_st + ", gold_end=" + gold_end + ", gold_del=" + gold_del
				+ "]";
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
	public Date getGold_end() {
		return gold_end;
	}
	public void setGold_end(Date gold_end) {
		this.gold_end = gold_end;
	}
	public String getGold_del() {
		return gold_del;
	}
	public void setGold_del(String gold_del) {
		this.gold_del = gold_del;
	}

}
