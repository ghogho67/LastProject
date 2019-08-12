package kr.or.ddit.chat.chatMem.model;

public class ChatMemVo {

	private String mem_id;
	private int chat_id;

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getChat_id() {
		return chat_id;
	}

	public void setChat_id(int chat_id) {
		this.chat_id = chat_id;
	}

	@Override
	public String toString() {
		return "ChatMemVo [mem_id=" + mem_id + ", chat_id=" + chat_id + "]";
	}

	public ChatMemVo(String mem_id, int chat_id) {
		super();
		this.mem_id = mem_id;
		this.chat_id = chat_id;
	}

	public ChatMemVo() {
	}
	
	
	

}
