package kr.or.ddit.category.post.reply.model;

import java.util.Date;

public class ReplyVo {

	private int reply_id;
	private String reply_cont;
	private String reply_del;
	private Date reply_time;
	private String mem_id;
	private int post_id;

	public int getReply_id() {
		return reply_id;
	}

	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}

	public String getReply_cont() {
		return reply_cont;
	}

	public void setReply_cont(String reply_cont) {
		this.reply_cont = reply_cont;
	}

	public String getReply_del() {
		return reply_del;
	}

	public void setReply_del(String reply_del) {
		this.reply_del = reply_del;
	}

	public Date getReply_time() {
		return reply_time;
	}

	public void setReply_time(Date reply_time) {
		this.reply_time = reply_time;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	@Override
	public String toString() {
		return "ReplyVo [reply_id=" + reply_id + ", reply_cont=" + reply_cont + ", reply_del=" + reply_del
				+ ", reply_time=" + reply_time + ", mem_id=" + mem_id + ", post_id=" + post_id + "]";
	}

}
