package admin.model.vo;

import java.sql.Date;

public class Search {

	private String searchCondition;		// 검색조건 1
	private int searchConditionI;		// 검색조건 값이 숫자인 경우
	private String searchCondition2;	// 검색조건 2
	private String searchValue;			// 조건 값 
	private Date startDate;				// 기간검색 1
	private Date endDate;				// 기간검색 2
	
	public Search() {}
	
	

	public Search(String searchCondition, int searchConditionI, String searchCondition2, String searchValue,
			Date startDate, Date endDate) {
		super();
		this.searchCondition = searchCondition;
		this.searchConditionI = searchConditionI;
		this.searchCondition2 = searchCondition2;
		this.searchValue = searchValue;
		this.startDate = startDate;
		this.endDate = endDate;
	}


	public Search(String searchCondition, String searchValue) {
		super();
		this.searchCondition = searchCondition;
		this.searchValue = searchValue;
	}
	
	public Search(String searchCondition, String searchCondition2, String searchValue) {
		super();
		this.searchCondition = searchCondition;
		this.searchCondition2 = searchCondition2;
		this.searchValue = searchValue;
	}
	

	public Search(int searchConditionI, String searchCondition2, String searchValue) {
		super();
		this.searchConditionI = searchConditionI;
		this.searchCondition2 = searchCondition2;
		this.searchValue = searchValue;
	}

	

	public Search(String searchCondition, String searchCondition2, String searchValue, Date startDate, Date endDate) {
		super();
		this.searchCondition = searchCondition;
		this.searchCondition2 = searchCondition2;
		this.searchValue = searchValue;
		this.startDate = startDate;
		this.endDate = endDate;
	}



	public int getSearchConditionI() {
		return searchConditionI;
	}

	public void setSearchConditionI(int searchConditionI) {
		this.searchConditionI = searchConditionI;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchCondition2() {
		return searchCondition2;
	}

	public void setSearchCondition2(String searchCondition2) {
		this.searchCondition2 = searchCondition2;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	
	
	public Date getStartDate() {
		return startDate;
	}



	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}



	public Date getEndDate() {
		return endDate;
	}



	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}



	@Override
	public String toString() {
		return "Search [searchCondition=" + searchCondition + ", searchConditionI=" + searchConditionI
				+ ", searchCondition2=" + searchCondition2 + ", searchValue=" + searchValue + ", startDate=" + startDate
				+ ", endDate=" + endDate + "]";
	}


}
