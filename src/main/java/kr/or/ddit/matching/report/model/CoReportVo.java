package kr.or.ddit.matching.report.model;

import java.util.Date;

public class CoReportVo {

	private int report_id;
	private String mem_id;
	private String name;
	private String facnm;
	private int reg;
	private int grade;
	private int cwnum;
	private String facnum;
	private String year;
	private int tt;
	private String sh;
	private String eh;
	private int physup;
	private int cogsur;
	private int life;
	private int talk;
	private int clean;
	private int phy;
	private int food;
	private int cog;
	private int ln;
	private int sn;
	private String ft;
	private String fc;
	private String sign;
	private String patsign;
	private Date Time;

	public int getReport_id() {
		return report_id;
	}

	public void setReport_id(int report_id) {
		this.report_id = report_id;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFacnm() {
		return facnm;
	}

	public void setFacnm(String facnm) {
		this.facnm = facnm;
	}

	public int getReg() {
		return reg;
	}

	public void setReg(int reg) {
		this.reg = reg;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getCwnum() {
		return cwnum;
	}

	public void setCwnum(int cwnum) {
		this.cwnum = cwnum;
	}

	public String getFacnum() {
		return facnum;
	}

	public void setFacnum(String facnum) {
		this.facnum = facnum;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public int getTt() {
		return tt;
	}

	public void setTt(int tt) {
		this.tt = tt;
	}

	public String getSh() {
		return sh;
	}

	public void setSh(String sh) {
		this.sh = sh;
	}

	public String getEh() {
		return eh;
	}

	public void setEh(String eh) {
		this.eh = eh;
	}

	public int getPhysup() {
		return physup;
	}

	public void setPhysup(int physup) {
		this.physup = physup;
	}

	public int getCogsur() {
		return cogsur;
	}

	public void setCogsur(int cogsur) {
		this.cogsur = cogsur;
	}

	public int getLife() {
		return life;
	}

	public void setLife(int life) {
		this.life = life;
	}

	public int getTalk() {
		return talk;
	}

	public void setTalk(int talk) {
		this.talk = talk;
	}

	public int getClean() {
		return clean;
	}

	public void setClean(int clean) {
		this.clean = clean;
	}

	public int getPhy() {
		return phy;
	}

	public void setPhy(int phy) {
		this.phy = phy;
	}

	public int getFood() {
		return food;
	}

	public void setFood(int food) {
		this.food = food;
	}

	public int getCog() {
		return cog;
	}

	public void setCog(int cog) {
		this.cog = cog;
	}

	public int getLn() {
		return ln;
	}

	public void setLn(int ln) {
		this.ln = ln;
	}

	public int getSn() {
		return sn;
	}

	public void setSn(int sn) {
		this.sn = sn;
	}

	public String getFt() {
		return ft;
	}

	public void setFt(String ft) {
		this.ft = ft;
	}

	public String getFc() {
		return fc;
	}

	public void setFc(String fc) {
		this.fc = fc;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public String getPatsign() {
		return patsign;
	}

	public void setPatsign(String patsign) {
		this.patsign = patsign;
	}

	public Date getTime() {
		return Time;
	}

	public void setTime(Date time) {
		Time = time;
	}

	@Override
	public String toString() {
		return "CoReportVo [report_id=" + report_id + ", mem_id=" + mem_id + ", name=" + name + ", facnm=" + facnm
				+ ", reg=" + reg + ", grade=" + grade + ", cwnum=" + cwnum + ", facnum=" + facnum + ", year=" + year
				+ ", tt=" + tt + ", sh=" + sh + ", eh=" + eh + ", physup=" + physup + ", cogsur=" + cogsur + ", life="
				+ life + ", talk=" + talk + ", clean=" + clean + ", phy=" + phy + ", food=" + food + ", cog=" + cog
				+ ", ln=" + ln + ", sn=" + sn + ", ft=" + ft + ", fc=" + fc + ", sign=" + sign + ", patsign=" + patsign
				+ ", Time=" + Time + "]";
	}

}
