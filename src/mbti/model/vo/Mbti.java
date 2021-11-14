package mbti.model.vo;

public class Mbti {
	private String mbtiType;
	private String mbtiContent;
	private String reco;
	private String recoContent;
	private String recoImage;
	
	public Mbti() {}
	
	public Mbti(String mbtiType, String mbtiContent, String reco, String recoContent, String recoImage) {
		super();
		this.mbtiType = mbtiType;
		this.mbtiContent = mbtiContent;
		this.reco = reco;
		this.recoContent = recoContent;
		this.recoImage = recoImage;
	}


	public String getMbtiType() {
		return mbtiType;
	}


	public void setMbtiType(String mbtiType) {
		this.mbtiType = mbtiType;
	}


	public String getMbtiContent() {
		return mbtiContent;
	}


	public void setMbtiContent(String mbtiContent) {
		this.mbtiContent = mbtiContent;
	}


	public String getReco() {
		return reco;
	}


	public void setReco(String reco) {
		this.reco = reco;
	}


	public String getRecoContent() {
		return recoContent;
	}


	public void setRecoContent(String recoContent) {
		this.recoContent = recoContent;
	}


	public String getRecoImage() {
		return recoImage;
	}


	public void setRecoImage(String recoImage) {
		this.recoImage = recoImage;
	}


	@Override
	public String toString() {
		return "Mbti [mbtiType=" + mbtiType + ", mbtiContent=" + mbtiContent + ", reco=" + reco + ", recoContent="
				+ recoContent + ", recoImage=" + recoImage + "]";
	}
	
	
}
