package kr.or.ddit.matching.matching.model;

/**
 * CalendarVo.java
 *
 * @author PC24
 * @version 1.0
 * @see
 *
 *      <pre>
* << 개정이력(Modification Information) >>
*
* 수정자 수정내용
* ------ ------------------------
* PC24 최초 생성
 *
 *      </pre>
 */
public class CalendarVo {
	private int c_id;
	private String c_title;
	private String c_description;
	private String c_start;
	private String c_end;
	private String c_type;
	private String c_mem_id;
	private String c_backgroundColor;
	private String c_textColor;
	private boolean c_allDay;
	private String c_worker;

	public int getC_id() {
		return c_id;
	}

	public void setC_id(int c_id) {
		this.c_id = c_id;
	}

	public String getC_title() {
		return c_title;
	}

	public void setC_title(String c_title) {
		this.c_title = c_title;
	}

	public String getC_description() {
		return c_description;
	}

	public void setC_description(String c_description) {
		this.c_description = c_description;
	}

	public String getC_start() {
		return c_start;
	}

	public void setC_start(String c_start) {
		this.c_start = c_start;
	}

	public String getC_end() {
		return c_end;
	}

	public void setC_end(String c_end) {
		this.c_end = c_end;
	}

	public String getC_type() {
		return c_type;
	}

	public void setC_type(String c_type) {
		this.c_type = c_type;
	}

	public String getC_backgroundColor() {
		return c_backgroundColor;
	}

	public void setC_backgroundColor(String c_backgroundColor) {
		this.c_backgroundColor = c_backgroundColor;
	}

	public String getC_textColor() {
		return c_textColor;
	}

	public void setC_textColor(String c_textColor) {
		this.c_textColor = c_textColor;
	}

	public boolean isC_allDay() {
		return c_allDay;
	}

	public void setC_allDay(boolean c_allDay) {
		this.c_allDay = c_allDay;
	}

	public String getC_mem_id() {
		return c_mem_id;
	}

	public void setC_mem_id(String c_mem_id) {
		this.c_mem_id = c_mem_id;
	}

	public String getC_worker() {
		return c_worker;
	}

	public void setC_worker(String c_worker) {
		this.c_worker = c_worker;
	}

	@Override
	public String toString() {
		return "CalendarVo [c_id=" + c_id + ", c_title=" + c_title + ", c_description=" + c_description + ", c_start="
				+ c_start + ", c_end=" + c_end + ", c_type=" + c_type + ", c_mem_id=" + c_mem_id
				+ ", c_backgroundColor=" + c_backgroundColor + ", c_textColor=" + c_textColor + ", c_allDay=" + c_allDay
				+ ", c_worker=" + c_worker + "]";
	}

}
