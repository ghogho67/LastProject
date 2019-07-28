package kr.or.ddit.category.post.attachment.model;

public class AttachmentVo {

	private int att_id;
	private String att_path;
	private String att_nm;
	private int post_id;

	public int getAtt_id() {
		return att_id;
	}

	public void setAtt_id(int att_id) {
		this.att_id = att_id;
	}

	public String getAtt_path() {
		return att_path;
	}

	public void setAtt_path(String att_path) {
		this.att_path = att_path;
	}

	public String getAtt_nm() {
		return att_nm;
	}

	public void setAtt_nm(String att_nm) {
		this.att_nm = att_nm;
	}

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	@Override
	public String toString() {
		return "AttachmentVo [att_id=" + att_id + ", att_path=" + att_path + ", att_nm=" + att_nm + ", post_id="
				+ post_id + "]";
	}

}
