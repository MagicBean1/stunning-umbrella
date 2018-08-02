package bike.model.vo;

public class BikePrice {
	private String bikeType;
	private int price;
	
	public BikePrice() {
		
	}
	
	public BikePrice(String bikeType, int price) {
		super();
		this.bikeType = bikeType;
		this.price = price;
	}

	public String getBikeType() {
		return bikeType;
	}

	public void setBikeType(String bikeType) {
		this.bikeType = bikeType;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "BikePrice [bikeType=" + bikeType + ", price=" + price + "]";
	}
	
	
	
}
