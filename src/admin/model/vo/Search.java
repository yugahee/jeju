package admin.model.vo;

public class Search {

	private String searchCondition;
	private String searchCondition2;
	private String searchValue;
	
	public Search() {}

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

	@Override
	public String toString() {
		return "Search [searchCondition=" + searchCondition + ", searchCondition2=" + searchCondition2
				+ ", searchValue=" + searchValue + "]";
	}

}
