package kr.or.ddit.chat.chat.model;

import java.util.Date;

public class ChatVo {
	private int chat_id;
	private String chat_nm;
	private Date chat_dt;
	private String chat_mem_id;

	public int getChat_id() {
		return chat_id;
	}

	public void setChat_id(int chat_id) {
		this.chat_id = chat_id;
	}

	public String getChat_nm() {
		return chat_nm;
	}

	public void setChat_nm(String chat_nm) {
		this.chat_nm = chat_nm;
	}

	public Date getChat_dt() {
		return chat_dt;
	}

	public void setChat_dt(Date chat_dt) {
		this.chat_dt = chat_dt;
	}

	public String getChat_mem_id() {
		return chat_mem_id;
	}

	public void setChat_mem_id(String chat_mem_id) {
		this.chat_mem_id = chat_mem_id;
	}

	@Override
	public String toString() {
		return "ChatVo [chat_id=" + chat_id + ", chat_nm=" + chat_nm + ", chat_dt=" + chat_dt + ", chat_mem_id="
				+ chat_mem_id + "]";
	}

}
