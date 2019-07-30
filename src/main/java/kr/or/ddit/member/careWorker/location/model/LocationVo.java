package kr.or.ddit.member.careWorker.location.model;

public class LocationVo {
	private int loc_id;
	private String mem_id;
	private String loc_dong;

	public LocationVo() {
		
	}
	
	public int getLoc_id() {
		return loc_id;
	}

	public void setLoc_id(int loc_id) {
		this.loc_id = loc_id;
	}

	public LocationVo(int loc_id, String mem_id, String loc_dong) {
		this.loc_id = loc_id;
		this.mem_id = mem_id;
		this.loc_dong = loc_dong;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getLoc_dong() {
		return loc_dong;
	}

	public void setLoc_dong(String loc_dong) {
		this.loc_dong = loc_dong;
	}

	@Override
	public String toString() {
		return "LocationVo [loc_id=" + loc_id + ", mem_id=" + mem_id + ", loc_dong=" + loc_dong + "]";
	}

}
