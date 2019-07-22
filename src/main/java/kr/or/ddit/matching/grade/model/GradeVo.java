package kr.or.ddit.matching.grade.model;

import java.util.Date;

public class GradeVo {

	private int grade_id;
	private int grade;
	private Date grade_time;
	private int mat_id;

	public int getGrade_id() {
		return grade_id;
	}

	public void setGrade_id(int grade_id) {
		this.grade_id = grade_id;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public Date getGrade_time() {
		return grade_time;
	}

	public void setGrade_time(Date grade_time) {
		this.grade_time = grade_time;
	}

	public int getMat_id() {
		return mat_id;
	}

	public void setMat_id(int mat_id) {
		this.mat_id = mat_id;
	}

	@Override
	public String toString() {
		return "GradeVo [grade_id=" + grade_id + ", grade=" + grade + ", grade_time=" + grade_time + ", mat_id="
				+ mat_id + "]";
	}

}
