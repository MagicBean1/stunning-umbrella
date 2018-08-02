package bike.model.vo;

public class Bike {
	private String bikeId;
	private String bikeType;
	private String shopId;
	private String bikeStatus;
	
	public Bike() {
		
	}

	public Bike(String bikeId, String bikeType, String shopId, String bikeStatus) {
		super();
		this.bikeId = bikeId;
		this.bikeType = bikeType;
		this.shopId = shopId;
		this.bikeStatus = bikeStatus;
	}

	public String getBikeId() {
		return bikeId;
	}

	public void setBikeId(String bikeId) {
		this.bikeId = bikeId;
	}

	public String getBikeType() {
		return bikeType;
	}

	public void setBikeType(String bikeType) {
		this.bikeType = bikeType;
	}

	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	public String getBikeStatus() {
		return bikeStatus;
	}

	public void setBikeStatus(String bikeStatus) {
		this.bikeStatus = bikeStatus;
	}

	@Override
	public String toString() {
		return "Bike [bikeId=" + bikeId + ", bikeType=" + bikeType + ", shopId=" + shopId + ", bikeStatus=" + bikeStatus
				+ "]";
	}
}
