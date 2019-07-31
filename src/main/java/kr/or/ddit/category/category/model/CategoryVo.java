package kr.or.ddit.category.category.model;

import java.util.Date;

public class CategoryVo {
	private int cate_id;
	private int cate_paerent_id;
	private String cate_title;
	private String cate_usage;
	private int cate_sortnum;
	private Date cate_date;
	private String mem_id;

	

	
	
	public CategoryVo(int cate_id, String cate_title) {
	super();
	this.cate_id = cate_id;
	this.cate_title = cate_title;
}





	public int getCate_id() {
		return cate_id;
	}

	public void setCate_id(int cate_id) {
		this.cate_id = cate_id;
	}

	public int getCate_paerent_id() {
		return cate_paerent_id;
	}

	public void setCate_paerent_id(int cate_paerent_id) {
		this.cate_paerent_id = cate_paerent_id;
	}

	public String getCate_title() {
		return cate_title;
	}

	public void setCate_title(String cate_title) {
		this.cate_title = cate_title;
	}

	public String getCate_usage() {
		return cate_usage;
	}

	public void setCate_usage(String cate_usage) {
		this.cate_usage = cate_usage;
	}

	public int getCate_sortnum() {
		return cate_sortnum;
	}

	public void setCate_sortnum(int cate_sortnum) {
		this.cate_sortnum = cate_sortnum;
	}

	public Date getCate_date() {
		return cate_date;
	}

	public void setCate_date(Date cate_date) {
		this.cate_date = cate_date;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	@Override
	public String toString() {
		return "CategoryVo [cate_id=" + cate_id + ", cate_paerent_id=" + cate_paerent_id + ", cate_title=" + cate_title
				+ ", cate_usage=" + cate_usage + ", cate_sortnum=" + cate_sortnum + ", cate_date=" + cate_date
				+ ", mem_id=" + mem_id + "]";
	}

}
