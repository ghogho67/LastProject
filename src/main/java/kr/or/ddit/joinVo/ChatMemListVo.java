package kr.or.ddit.joinVo;

import java.util.Date;

public class ChatMemListVo {
	
	private int chat_id;
	private String chat_nm;
	private Date chat_dt;
	private String chat_mem_id;
	private String chat_del;
	
	private String mem_id;
	private int cm_chat_id;
	private String newmsgyn;
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
	public String getChat_del() {
		return chat_del;
	}
	public void setChat_del(String chat_del) {
		this.chat_del = chat_del;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getCm_chat_id() {
		return cm_chat_id;
	}
	public void setCm_chat_id(int cm_chat_id) {
		this.cm_chat_id = cm_chat_id;
	}
	public String getNewmsgyn() {
		return newmsgyn;
	}
	public void setNewmsgyn(String newmsgyn) {
		this.newmsgyn = newmsgyn;
	}
	public ChatMemListVo(int chat_id, String chat_nm, Date chat_dt, String chat_mem_id, String chat_del, String mem_id,
			int cm_chat_id, String newmsgyn) {
		super();
		this.chat_id = chat_id;
		this.chat_nm = chat_nm;
		this.chat_dt = chat_dt;
		this.chat_mem_id = chat_mem_id;
		this.chat_del = chat_del;
		this.mem_id = mem_id;
		this.cm_chat_id = cm_chat_id;
		this.newmsgyn = newmsgyn;
	}

	public ChatMemListVo() {

	}
	@Override
	public String toString() {
		return "ChatMemListVo [chat_id=" + chat_id + ", chat_nm=" + chat_nm + ", chat_dt=" + chat_dt + ", chat_mem_id="
				+ chat_mem_id + ", chat_del=" + chat_del + ", mem_id=" + mem_id + ", cm_chat_id=" + cm_chat_id
				+ ", newmsgyn=" + newmsgyn + "]";
	}
	
	

	
	

	
	
	
}
