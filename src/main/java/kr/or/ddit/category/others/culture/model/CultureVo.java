package kr.or.ddit.category.others.culture.model;

public class CultureVo {
	private int culture_id;
	private String culture_add;
	private String culture_type;
	private String culture_phone;
	private int cate_id;

	public int getCulture_id() {
		return culture_id;
	}

	public void setCulture_id(int culture_id) {
		this.culture_id = culture_id;
	}

	public String getCulture_add() {
		return culture_add;
	}

	public void setCulture_add(String culture_add) {
		this.culture_add = culture_add;
	}

	public String getCulture_type() {
		return culture_type;
	}

	public void setCulture_type(String culture_type) {
		this.culture_type = culture_type;
	}

	public String getCulture_phone() {
		return culture_phone;
	}

	public void setCulture_phone(String culture_phone) {
		this.culture_phone = culture_phone;
	}

	public int getCate_id() {
		return cate_id;
	}

	public void setCate_id(int cate_id) {
		this.cate_id = cate_id;
	}

	@Override
	public String toString() {
		return "CultureVo [culture_id=" + culture_id + ", culture_add=" + culture_add + ", culture_type=" + culture_type
				+ ", culture_phone=" + culture_phone + ", cate_id=" + cate_id + "]";
	}

}
