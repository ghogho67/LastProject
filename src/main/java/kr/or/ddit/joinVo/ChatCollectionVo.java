package kr.or.ddit.joinVo;

import java.util.Date;

public class ChatCollectionVo {
	
	private String cm_mem_id;
	private int cm_chat_id;
	
	private int chat_id;
	private String chat_nm;
	private Date chat_dt;
	private String chat_mem_id;

	private int chattext_id;
	private int text_chat_id;
	private String mem_id;
	private String chattext_cont;
	private Date chattext_time;
	
	private int cnt;

	public String getCm_mem_id() {
		return cm_mem_id;
	}

	public void setCm_mem_id(String cm_mem_id) {
		this.cm_mem_id = cm_mem_id;
	}

	public int getCm_chat_id() {
		return cm_chat_id;
	}

	public void setCm_chat_id(int cm_chat_id) {
		this.cm_chat_id = cm_chat_id;
	}

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

	public int getChattext_id() {
		return chattext_id;
	}

	public void setChattext_id(int chattext_id) {
		this.chattext_id = chattext_id;
	}

	public int getText_chat_id() {
		return text_chat_id;
	}

	public void setText_chat_id(int text_chat_id) {
		this.text_chat_id = text_chat_id;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getChattext_cont() {
		return chattext_cont;
	}

	public void setChattext_cont(String chattext_cont) {
		this.chattext_cont = chattext_cont;
	}

	public Date getChattext_time() {
		return chattext_time;
	}

	public void setChattext_time(Date chattext_time) {
		this.chattext_time = chattext_time;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public ChatCollectionVo(String cm_mem_id, int cm_chat_id, int chat_id, String chat_nm, Date chat_dt,
			String chat_mem_id, int chattext_id, int text_chat_id, String mem_id, String chattext_cont,
			Date chattext_time, int cnt) {
		super();
		this.cm_mem_id = cm_mem_id;
		this.cm_chat_id = cm_chat_id;
		this.chat_id = chat_id;
		this.chat_nm = chat_nm;
		this.chat_dt = chat_dt;
		this.chat_mem_id = chat_mem_id;
		this.chattext_id = chattext_id;
		this.text_chat_id = text_chat_id;
		this.mem_id = mem_id;
		this.chattext_cont = chattext_cont;
		this.chattext_time = chattext_time;
		this.cnt = cnt;
	}

	public ChatCollectionVo() {
	}

	@Override
	public String toString() {
		return "ChatCollectionVo [cm_mem_id=" + cm_mem_id + ", cm_chat_id=" + cm_chat_id + ", chat_id=" + chat_id
				+ ", chat_nm=" + chat_nm + ", chat_dt=" + chat_dt + ", chat_mem_id=" + chat_mem_id + ", chattext_id="
				+ chattext_id + ", text_chat_id=" + text_chat_id + ", mem_id=" + mem_id + ", chattext_cont="
				+ chattext_cont + ", chattext_time=" + chattext_time + ", cnt=" + cnt + "]";
	}
	

	
}