package kr.or.ddit.chat.chatText.model;

import java.util.Date;

public class ChatTextVo {
	private int chattext_id;
	private int chat_id;
	private String mem_id;
	private String chattext_cont;
	private Date chattext_time;

	public int getChattext_id() {
		return chattext_id;
	}

	public void setChattext_id(int chattext_id) {
		this.chattext_id = chattext_id;
	}

	public int getChat_id() {
		return chat_id;
	}

	public void setChat_id(int chat_id) {
		this.chat_id = chat_id;
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

	@Override
	public String toString() {
		return "ChatTextVo [chattext_id=" + chattext_id + ", chat_id=" + chat_id + ", mem_id=" + mem_id
				+ ", chattext_cont=" + chattext_cont + ", chattext_time=" + chattext_time + "]";
	}

	public ChatTextVo() {
	}

	public ChatTextVo(int chattext_id, int chat_id, String mem_id, String chattext_cont, Date chattext_time) {
		super();
		this.chattext_id = chattext_id;
		this.chat_id = chat_id;
		this.mem_id = mem_id;
		this.chattext_cont = chattext_cont;
		this.chattext_time = chattext_time;
	}

	public ChatTextVo(int chat_id, String mem_id, String chattext_cont) {
		super();
		this.chat_id = chat_id;
		this.mem_id = mem_id;
		this.chattext_cont = chattext_cont;
	}
	
	
	

}
