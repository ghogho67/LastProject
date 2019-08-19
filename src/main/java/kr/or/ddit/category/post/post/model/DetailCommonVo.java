package kr.or.ddit.category.post.post.model;

public class DetailCommonVo {
	private int resultCode; // 결과코드
	private int resultMsg; // 결과메시지
	private int numOfRows; // 한 페이지 결과 수
	private int pageNo; // 페이지 번호
	private int totalCount; // 전체 결과 수
	private String contentid; // 콘텐츠ID
	private String contenttypeid; // 콘텐츠타입ID
	private int booktour;// 교과서여행지여부(1=여행지,0=해당없음)
	private String createdtime; // 콘텐츠 최초 등록일
	private String homepage;
	private String modifiedtime; // 컨텐츠수정일
	private String tel; // 전화번호
	private String telname;
	private String firstimage; // 원본 대표이미지(약500*333 size) URL 응답
	private String firstimage2; // 썸네일 대표이미지(약 150*100 size) URL 응답
	private int areacode; // 지역코드
	private int sigungucode; // 시군구코드
	private String cat1;
	private String cat2;
	private String cat3;
	private String addr1; // 주소
	private String addr2; // 상세주소
	private String zipcode;
	private double mapx; // GPS X좌표(WGS84 경도좌표) 응답
	private double mapy; // GPS Y좌표(WGS84 위도좌표) 응답
	private int mlevel; // 응답
	private String overview;
	private String title;
	public int getResultCode() {
		return resultCode;
	}
	public void setResultCode(int resultCode) {
		this.resultCode = resultCode;
	}
	public int getResultMsg() {
		return resultMsg;
	}
	public void setResultMsg(int resultMsg) {
		this.resultMsg = resultMsg;
	}
	public int getNumOfRows() {
		return numOfRows;
	}
	public void setNumOfRows(int numOfRows) {
		this.numOfRows = numOfRows;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public String getContentid() {
		return contentid;
	}
	public void setContentid(String contentid) {
		this.contentid = contentid;
	}
	public String getContenttypeid() {
		return contenttypeid;
	}
	public void setContenttypeid(String contenttypeid) {
		this.contenttypeid = contenttypeid;
	}
	public int getBooktour() {
		return booktour;
	}
	public void setBooktour(int booktour) {
		this.booktour = booktour;
	}
	public String getCreatedtime() {
		return createdtime;
	}
	public void setCreatedtime(String createdtime) {
		this.createdtime = createdtime;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getModifiedtime() {
		return modifiedtime;
	}
	public void setModifiedtime(String modifiedtime) {
		this.modifiedtime = modifiedtime;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getTelname() {
		return telname;
	}
	public void setTelname(String telname) {
		this.telname = telname;
	}
	public String getFirstimage() {
		return firstimage;
	}
	public void setFirstimage(String firstimage) {
		this.firstimage = firstimage;
	}
	public String getFirstimage2() {
		return firstimage2;
	}
	public void setFirstimage2(String firstimage2) {
		this.firstimage2 = firstimage2;
	}
	public int getAreacode() {
		return areacode;
	}
	public void setAreacode(int areacode) {
		this.areacode = areacode;
	}
	public int getSigungucode() {
		return sigungucode;
	}
	public void setSigungucode(int sigungucode) {
		this.sigungucode = sigungucode;
	}
	public String getCat1() {
		return cat1;
	}
	public void setCat1(String cat1) {
		this.cat1 = cat1;
	}
	public String getCat2() {
		return cat2;
	}
	public void setCat2(String cat2) {
		this.cat2 = cat2;
	}
	public String getCat3() {
		return cat3;
	}
	public void setCat3(String cat3) {
		this.cat3 = cat3;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public double getMapx() {
		return mapx;
	}
	public void setMapx(double mapx) {
		this.mapx = mapx;
	}
	public double getMapy() {
		return mapy;
	}
	public void setMapy(double mapy) {
		this.mapy = mapy;
	}
	public int getMlevel() {
		return mlevel;
	}
	public void setMlevel(int mlevel) {
		this.mlevel = mlevel;
	}
	public String getOverview() {
		return overview;
	}
	public void setOverview(String overview) {
		this.overview = overview;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "DetailCommonVo [resultCode=" + resultCode + ", resultMsg=" + resultMsg + ", numOfRows=" + numOfRows
				+ ", pageNo=" + pageNo + ", totalCount=" + totalCount + ", contentid=" + contentid + ", contenttypeid="
				+ contenttypeid + ", booktour=" + booktour + ", createdtime=" + createdtime + ", homepage=" + homepage
				+ ", modifiedtime=" + modifiedtime + ", tel=" + tel + ", telname=" + telname + ", firstimage="
				+ firstimage + ", firstimage2=" + firstimage2 + ", areacode=" + areacode + ", sigungucode="
				+ sigungucode + ", cat1=" + cat1 + ", cat2=" + cat2 + ", cat3=" + cat3 + ", addr1=" + addr1 + ", addr2="
				+ addr2 + ", zipcode=" + zipcode + ", mapx=" + mapx + ", mapy=" + mapy + ", mlevel=" + mlevel
				+ ", overview=" + overview + ", title=" + title + "]";
	}
	
	
	
	
}
