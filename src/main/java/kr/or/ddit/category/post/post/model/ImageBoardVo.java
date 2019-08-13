package kr.or.ddit.category.post.post.model;

public class ImageBoardVo {
	private int resultCode; // 결과코드
	private int resultMsg; // 결과메시지
	private int numOfRows; // 한 페이지 결과 수
	private int pageNo; // 페이지 번호
	private int totalCount; // 전체 결과 수
	private String addr1; // 주소
	private String addr2; // 상세주소
	private int areacode; // 지역코드
	private int booktour;// 교과서여행지여부(1=여행지,0=해당없음)
	private String cat1;
	private String cat2;
	private String cat3;
	private String contentid; // 콘텐츠ID
	private String contenttypeid; // 콘텐츠타입ID
	private String createdtime; // 콘텐츠 최초 등록일
	private String firstimage; // 원본 대표이미지(약500*333 size) URL 응답
	private String firstimage2; // 썸네일 대표이미지(약 150*100 size) URL 응답
	private double mapX; // GPS X좌표(WGS84 경도좌표) 응답
	private double mapY; // GPS Y좌표(WGS84 위도좌표) 응답
	private int mlevel; // 응답
	private String modifiedtime; // 컨텐츠수정일
	private int readcount; // 컨텐츠조회수(korean.visitkorea.or.kr 웹사이트기준)
	private int sigungucode; // 시군구코드
	private String tel; // 전화번호
	private String title; // 콘텐츠 제목
	private String eventstartdate; // 행사 시작일 (형식:YYYYMMDD)
	private String eventenddate; // 행사 종료일 (형식:YYYYMMDD)
	private int totalCnt; // 결과 리스트 갯수
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
	public int getAreacode() {
		return areacode;
	}
	public void setAreacode(int areacode) {
		this.areacode = areacode;
	}
	public int getBooktour() {
		return booktour;
	}
	public void setBooktour(int booktour) {
		this.booktour = booktour;
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
	public String getContentid() {
		return contentid;
	}
	public void setContentid(String contentid) {
		this.contentid = contentid;
	}
	public String getContenttyprid() {
		return contenttypeid;
	}
	public void setContenttyprid(String contenttypeid) {
		this.contenttypeid = contenttypeid;
	}
	public String getCreatedtime() {
		return createdtime;
	}
	public void setCreatedtime(String createdtime) {
		this.createdtime = createdtime;
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
	public double getMapX() {
		return mapX;
	}
	public void setMapX(double mapX) {
		this.mapX = mapX;
	}
	public double getMapY() {
		return mapY;
	}
	public void setMapY(double mapY) {
		this.mapY = mapY;
	}
	public int getMlevel() {
		return mlevel;
	}
	public void setMlevel(int mlevel) {
		this.mlevel = mlevel;
	}
	public String getModifiedtime() {
		return modifiedtime;
	}
	public void setModifiedtime(String modifiedtime) {
		this.modifiedtime = modifiedtime;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getSigungucode() {
		return sigungucode;
	}
	public void setSigungucode(int sigungucode) {
		this.sigungucode = sigungucode;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getEventstartdate() {
		return eventstartdate;
	}
	public void setEventstartdate(String eventstartdate) {
		this.eventstartdate = eventstartdate;
	}
	public String getEventenddate() {
		return eventenddate;
	}
	public void setEventenddate(String eventenddate) {
		this.eventenddate = eventenddate;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	@Override
	public String toString() {
		return "ImageBoardVo [resultCode=" + resultCode + ", resultMsg=" + resultMsg + ", numOfRows=" + numOfRows
				+ ", pageNo=" + pageNo + ", totalCount=" + totalCount + ", addr1=" + addr1 + ", addr2=" + addr2
				+ ", areacode=" + areacode + ", booktour=" + booktour + ", cat1=" + cat1 + ", cat2=" + cat2 + ", cat3="
				+ cat3 + ", contentid=" + contentid + ", contenttypeid=" + contenttypeid + ", createdtime="
				+ createdtime + ", firstimage=" + firstimage + ", firstimage2=" + firstimage2 + ", mapX=" + mapX
				+ ", mapY=" + mapY + ", mlevel=" + mlevel + ", modifiedtime=" + modifiedtime + ", readcount="
				+ readcount + ", sigungucode=" + sigungucode + ", tel=" + tel + ", title=" + title + ", eventstartdate="
				+ eventstartdate + ", eventenddate=" + eventenddate + ", totalCnt=" + totalCnt + "]";
	}


	
}
