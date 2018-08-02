package lent.model.vo;



public class LentBike {
	private String merchantUid;
	private int methodNum;
	private String bikeId;
	private String buyDate;
	private String returnDate;
	private String buyerId;
	private String shopId;
	private int lentPrice;
	
	public LentBike() {
		
	}

	public LentBike(String merchantUid, int methodNum, String bikeId, String buyDate, String returnDate, String buyerId,
			String shopId, int lentPrice) {
		super();
		this.merchantUid = merchantUid;
		this.methodNum = methodNum;
		this.bikeId = bikeId;
		this.buyDate = buyDate;
		this.returnDate = returnDate;
		this.buyerId = buyerId;
		this.shopId = shopId;
		this.lentPrice = lentPrice;
	}

	public String getMerchantUid() {
		return merchantUid;
	}

	public void setMerchantUid(String merchantUid) {
		this.merchantUid = merchantUid;
	}

	public int getMethodNum() {
		return methodNum;
	}

	public void setMethodNum(int methodNum) {
		this.methodNum = methodNum;
	}

	public String getBikeId() {
		return bikeId;
	}

	public void setBikeId(String bikeId) {
		this.bikeId = bikeId;
	}

	public String getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(String buyDate) {
		this.buyDate = buyDate;
	}

	public String getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}

	public String getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}

	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	public int getLentPrice() {
		return lentPrice;
	}

	public void setLentPrice(int lentPrice) {
		this.lentPrice = lentPrice;
	}

	@Override
	public String toString() {
		return "LentBike [merchantUid=" + merchantUid + ", methodNum=" + methodNum + ", bikeId=" + bikeId + ", buyDate="
				+ buyDate + ", returnDate=" + returnDate + ", buyerId=" + buyerId + ", shopId=" + shopId
				+ ", lentPrice=" + lentPrice + "]";
	}

	
	

}