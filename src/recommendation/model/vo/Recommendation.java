package recommendation.model.vo;

public class Recommendation {
	
	private int recoNo;				// 추천장소번호
	private String publicYn;		// 노출여부('Y'/'N')
	private int recoArea;			// 지역(1='동부', 2='서부', 3='남부', 4='북부')
	private String recoAddress;		// 주소
	private int recoCategory;		// 카테고리(1='관광지', 2='식당', 3='카페')
	private String recoExpl;		// 설명
	private String recoKeyword;		// 키워드
	private String recoName;		// 이름
	private String naverMap;		// 네이버맵 url
	private String kakaoMap;		// 카카오맵 url
	private String recoImage;		// 이미지경로(1개)
	private int likeCount;			// 좋아요 횟수
	
	private double score;			// 평점
	private String imageName;		// 이미지명
	private String deletedName;		// 삭제될 이미지명
	
	/*
	 RECO_NO	NUMBER
	 PUBLIC_YN	VARCHAR2(10 BYTE)
	 RECO_AREA	NUMBER
	 RECO_ADDRESS	VARCHAR2(150 BYTE)
	 RECO_CATEGORY	NUMBER
	 RECO_EXPL	VARCHAR2(2000 BYTE)
	 RECO_KEYWORD	VARCHAR2(30 BYTE)
	 RECO_NAME	VARCHAR2(50 BYTE)
	 NAVER_MAP	VARCHAR2(1000 BYTE)
	 KAKAO_MAP	VARCHAR2(1000 BYTE)
	 RECO_IMAGE	VARCHAR2(1000 BYTE)
 	 LIKE_COUNT	NUMBER
	 */
	
	public Recommendation() {}
	
	public Recommendation(int recoNo, String publicYn, int recoArea, String recoAddress, int recoCategory,
			String recoExpl, String recoKeyword, String recoName, String naverMap, String kakaoMap, String recoImage,
			int likeCount) {
		super();
		this.recoNo = recoNo;
		this.publicYn = publicYn;
		this.recoArea = recoArea;
		this.recoAddress = recoAddress;
		this.recoCategory = recoCategory;
		this.recoExpl = recoExpl;
		this.recoKeyword = recoKeyword;
		this.recoName = recoName;
		this.naverMap = naverMap;
		this.kakaoMap = kakaoMap;
		this.recoImage = recoImage;
		this.likeCount = likeCount;
	}

	public Recommendation(int recoNo, String publicYn, int recoArea, String recoAddress, int recoCategory,
			String recoExpl, String recoKeyword, String recoName, String naverMap, String kakaoMap, String recoImage,
			int likeCount, double score) {
		super();
		this.recoNo = recoNo;
		this.publicYn = publicYn;
		this.recoArea = recoArea;
		this.recoAddress = recoAddress;
		this.recoCategory = recoCategory;
		this.recoExpl = recoExpl;
		this.recoKeyword = recoKeyword;
		this.recoName = recoName;
		this.naverMap = naverMap;
		this.kakaoMap = kakaoMap;
		this.recoImage = recoImage;
		this.likeCount = likeCount;
		this.score = score;
	}	
	

	public Recommendation(int recoNo, String publicYn, int recoArea, String recoAddress, int recoCategory,
			String recoExpl, String recoKeyword, String recoName, String naverMap, String kakaoMap, String recoImage,
			int likeCount, double score, String imageName, String deletedName) {
		super();
		this.recoNo = recoNo;
		this.publicYn = publicYn;
		this.recoArea = recoArea;
		this.recoAddress = recoAddress;
		this.recoCategory = recoCategory;
		this.recoExpl = recoExpl;
		this.recoKeyword = recoKeyword;
		this.recoName = recoName;
		this.naverMap = naverMap;
		this.kakaoMap = kakaoMap;
		this.recoImage = recoImage;
		this.likeCount = likeCount;
		this.score = score;
		this.imageName = imageName;
		this.deletedName = deletedName;
	}

	public String getDeletedName() {
		return deletedName;
	}

	public void setDeletedName(String deletedName) {
		this.deletedName = deletedName;
	}

	public int getRecoNo() {
		return recoNo;
	}

	public void setRecoNo(int recoNo) {
		this.recoNo = recoNo;
	}

	public String getPublicYn() {
		return publicYn;
	}

	public void setPublicYn(String publicYn) {
		this.publicYn = publicYn;
	}

	public int getRecoArea() {
		return recoArea;
	}

	public void setRecoArea(int recoArea) {
		this.recoArea = recoArea;
	}

	public String getRecoAddress() {
		return recoAddress;
	}

	public void setRecoAddress(String recoAddress) {
		this.recoAddress = recoAddress;
	}

	public int getRecoCategory() {
		return recoCategory;
	}

	public void setRecoCategory(int recoCategory) {
		this.recoCategory = recoCategory;
	}

	public String getRecoExpl() {
		return recoExpl;
	}

	public void setRecoExpl(String recoExpl) {
		this.recoExpl = recoExpl;
	}

	public String getRecoKeyword() {
		return recoKeyword;
	}

	public void setRecoKeyword(String recoKeyword) {
		this.recoKeyword = recoKeyword;
	}

	public String getRecoName() {
		return recoName;
	}

	public void setRecoName(String recoName) {
		this.recoName = recoName;
	}

	public String getNaverMap() {
		return naverMap;
	}

	public void setNaverMap(String naverMap) {
		this.naverMap = naverMap;
	}

	public String getKakaoMap() {
		return kakaoMap;
	}

	public void setKakaoMap(String kakaoMap) {
		this.kakaoMap = kakaoMap;
	}

	public String getRecoImage() {
		return recoImage;
	}

	public void setRecoImage(String recoImage) {
		this.recoImage = recoImage;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}


	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}
	
	@Override
	public String toString() {
		return "Recommendation [recoNo=" + recoNo + ", publicYn=" + publicYn + ", recoArea=" + recoArea
				+ ", recoAddress=" + recoAddress + ", recoCategory=" + recoCategory + ", recoExpl=" + recoExpl
				+ ", recoKeyword=" + recoKeyword + ", recoName=" + recoName + ", naverMap=" + naverMap + ", kakaoMap="
				+ kakaoMap + ", recoImage=" + recoImage + ", likeCount=" + likeCount + ", score=" + score
				+ ", imageName=" + imageName + ", deletedName=" + deletedName + "]";
	}

}



