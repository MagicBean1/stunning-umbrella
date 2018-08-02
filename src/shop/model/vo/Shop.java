package shop.model.vo;

public class Shop {
	private String shopId;
	private String shopName;
	private String shopAddr;
	private String shopPhone;
	private String runTime;
	private String bikeKind;
	public Shop() {
		
	}

	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getShopAddr() {
		return shopAddr;
	}

	public void setShopAddr(String shopAddr) {
		this.shopAddr = shopAddr;
	}

	public String getShopPhone() {
		return shopPhone;
	}

	public void setShopPhone(String shopPhone) {
		this.shopPhone = shopPhone;
	}

	public String getRunTime() {
		return runTime;
	}

	public void setRunTime(String runTime) {
		this.runTime = runTime;
	}

	public String getBikeKind() {
		return bikeKind;
	}

	public void setBikeKind(String bikeKind) {
		this.bikeKind = bikeKind;
	}

	@Override
	public String toString() {
		return "Shop [shopId=" + shopId + ", shopName=" + shopName + ", shopAddr=" + shopAddr + ", shopPhone="
				+ shopPhone + ", runTime=" + runTime + ", bikeKind=" + bikeKind + "]";
	}
	
	
}
