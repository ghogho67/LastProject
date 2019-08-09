package kr.or.ddit.member.member.model;

import java.util.Date;

public class GoldMemberVo {


	private String mem_id;
	private String mem_grade;
	private Date gold_st;
	private Date gold_end;
	
	
	
	public GoldMemberVo(String mem_id, String mem_grade, Date gold_st, Date gold_end) {
		super();
		this.mem_id = mem_id;
		this.mem_grade = mem_grade;
		this.gold_st = gold_st;
		this.gold_end = gold_end;
	}

	
	
	@Override
	public String toString() {
		return "GoldMemberVo [mem_id=" + mem_id + ", mem_grade=" + mem_grade + ", gold_st=" + gold_st + ", gold_end="
				+ gold_end + "]";
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_grade() {
		return mem_grade;
	}

	public void setMem_grade(String mem_grade) {
		this.mem_grade = mem_grade;
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

	public GoldMemberVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
}
