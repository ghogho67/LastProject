package kr.or.ddit.category.post.model;

import java.util.Date;

public class PostVo {

	// test
	private int post_id;
	private int post_cnt;
	private Date post_time;
	private String post_nm;
	private String post_cont;
	private String post_del;
	private int post_group;
	private String mem_id;
	private int cate_id;
	private int post_par;

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	public int getPost_cnt() {
		return post_cnt;
	}

	public void setPost_cnt(int post_cnt) {
		this.post_cnt = post_cnt;
	}

	public Date getPost_time() {
		return post_time;
	}

	public void setPost_time(Date post_time) {
		this.post_time = post_time;
	}

	public String getPost_nm() {
		return post_nm;
	}

	public void setPost_nm(String post_nm) {
		this.post_nm = post_nm;
	}

	public String getPost_cont() {
		return post_cont;
	}

	public void setPost_cont(String post_cont) {
		this.post_cont = post_cont;
	}

	public String getPost_del() {
		return post_del;
	}

	public void setPost_del(String post_del) {
		this.post_del = post_del;
	}

	public int getPost_group() {
		return post_group;
	}

	public void setPost_group(int post_group) {
		this.post_group = post_group;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getCate_id() {
		return cate_id;
	}

	public void setCate_id(int cate_id) {
		this.cate_id = cate_id;
	}

	public int getPost_par() {
		return post_par;
	}

	public void setPost_par(int post_par) {
		this.post_par = post_par;
	}

	@Override
	public String toString() {
		return "PostVo [post_id=" + post_id + ", post_cnt=" + post_cnt + ", post_time=" + post_time + ", post_nm="
				+ post_nm + ", post_cont=" + post_cont + ", post_usage=" + post_del + ", post_group=" + post_group
				+ ", mem_id=" + mem_id + ", cate_id=" + cate_id + ", post_par=" + post_par + "]";
	}

}
