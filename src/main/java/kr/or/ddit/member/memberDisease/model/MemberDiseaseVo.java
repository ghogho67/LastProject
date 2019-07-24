package kr.or.ddit.member.memberDisease.model;

public class MemberDiseaseVo {
	private int mem_dis_id;
	private String mem_id;
	private int dis_id;

	public int getMem_dis_id() {
		return mem_dis_id;
	}

	public void setMem_dis_id(int mem_dis_id) {
		this.mem_dis_id = mem_dis_id;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getDis_id() {
		return dis_id;
	}

	public void setDis_id(int dis_id) {
		this.dis_id = dis_id;
	}

	@Override
	public String toString() {
		return "MemberDiseaseVo [mem_dis_id=" + mem_dis_id + ", mem_id=" + mem_id + ", dis_id=" + dis_id + "]";
	}
	
	public MemberDiseaseVo() {
		
	}

}
