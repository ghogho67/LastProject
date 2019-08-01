package kr.or.ddit.matching.attendance.model;


public class AttendanceVo {
	private int ad_id;
	private String ad_st;
	private String ad_end;
	private int mat_id;

	public int getAd_id() {
		return ad_id;
	}

	public void setAd_id(int ad_id) {
		this.ad_id = ad_id;
	}

	public String getAd_st() {
		return ad_st;
	}

	public void setAd_st(String ad_st) {
		this.ad_st = ad_st;
	}

	public String getAd_end() {
		return ad_end;
	}

	public void setAd_end(String ad_end) {
		this.ad_end = ad_end;
	}

	public int getMat_id() {
		return mat_id;
	}

	public void setMat_id(int mat_id) {
		this.mat_id = mat_id;
	}

	@Override
	public String toString() {
		return "AttendanceVo [ad_id=" + ad_id + ", ad_st=" + ad_st + ", ad_end=" + ad_end + ", mat_id=" + mat_id + "]";
	}

}
