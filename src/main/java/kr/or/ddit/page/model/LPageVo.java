package kr.or.ddit.page.model;

public class LPageVo {

	@Override
	public String toString() {
		return "LPageVo [page=" + page + ", pageSize=" + pageSize + ", lec_type=" + lec_type + "]";
	}

	private int page;
	private int pageSize;
	private String lec_type;

	public String getLec_type() {
		return lec_type;
	}

	public void setLec_type(String lec_type) {
		this.lec_type = lec_type;
	}

	public int getPage() {
		return page == 0 ? 1 : page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPageSize() {
		return pageSize == 0 ? 10 : pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	
	public LPageVo() {
	}

	public LPageVo(int page, int pageSize ,String lec_type) {
		super();
		this.page = page;
		this.pageSize = pageSize;
		this.lec_type = lec_type;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + getPage();
		result = prime * result + getPageSize();
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		LPageVo other = (LPageVo) obj;
		if (getPage() != other.getPage())
			return false;
		if (getPageSize() != other.getPageSize())
			return false;
		return true;
	}

}
