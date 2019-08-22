package kr.or.ddit.chat.chatMem.model;

public class ChatMemVo {

	private String mem_id;
	private int chat_id;
	private String newmsgyn;
	
	
	
	public String getNewmsgyn() {
		return newmsgyn;
	}

	public void setNewmsgyn(String newmsgyn) {
		this.newmsgyn = newmsgyn;
	}

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
		return "ChatMemVo [mem_id=" + mem_id + ", chat_id=" + chat_id + ", newmsgyn=" + newmsgyn + "]";
	}

	public ChatMemVo(int chat_id, String mem_id) {
		super();
		this.mem_id = mem_id;
		this.chat_id = chat_id;
	}

	public ChatMemVo() {
	}

	public ChatMemVo(String mem_id, int chat_id, String newmsgyn) {
		super();
		this.mem_id = mem_id;
		this.chat_id = chat_id;
		this.newmsgyn = newmsgyn;
	}
	
	
	
	

}
