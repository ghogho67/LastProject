package kr.or.ddit.survey.video.model;

public class VideoVo {
	private int video_id;
	private String video_path;
	private String video_nm;
	private int sur_id;

	public int getVideo_id() {
		return video_id;
	}

	public void setVideo_id(int video_id) {
		this.video_id = video_id;
	}

	public String getVideo_path() {
		return video_path;
	}

	public void setVideo_path(String video_path) {
		this.video_path = video_path;
	}

	public String getVideo_nm() {
		return video_nm;
	}

	public void setVideo_nm(String video_nm) {
		this.video_nm = video_nm;
	}

	public int getSur_id() {
		return sur_id;
	}

	public void setSur_id(int sur_id) {
		this.sur_id = sur_id;
	}

	@Override
	public String toString() {
		return "VideoVo [video_id=" + video_id + ", video_path=" + video_path + ", video_nm=" + video_nm + ", sur_id="
				+ sur_id + "]";
	}

}
