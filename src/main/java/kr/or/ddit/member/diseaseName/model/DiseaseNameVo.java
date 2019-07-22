package kr.or.ddit.member.diseaseName.model;

public class DiseaseNameVo {
	
	private int dis_id;
	private String dis_nm;

	public int getDis_id() {
		return dis_id;
	}

	public void setDis_id(int dis_id) {
		this.dis_id = dis_id;
	}

	public String getDis_nm() {
		return dis_nm;
	}

	public void setDis_nm(String dis_nm) {
		this.dis_nm = dis_nm;
	}

	@Override
	public String toString() {
		return "DiseaseNameVo [dis_id=" + dis_id + ", dis_nm=" + dis_nm + "]";
	}

}
