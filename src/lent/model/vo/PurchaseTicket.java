package lent.model.vo;

public class PurchaseTicket {
	private int methodNum;
	private String purchaseMethod;
	
	public PurchaseTicket() {
		
	}

	public PurchaseTicket(int methodNum, String purchaseMethod) {
		super();
		this.methodNum = methodNum;
		this.purchaseMethod = purchaseMethod;
	}

	public int getMethodNum() {
		return methodNum;
	}

	public void setMethodNum(int methodNum) {
		this.methodNum = methodNum;
	}

	public String getPurchaseMethod() {
		return purchaseMethod;
	}

	public void setPurchaseMethod(String purchaseMethod) {
		this.purchaseMethod = purchaseMethod;
	}

	@Override
	public String toString() {
		return "PurchaseTicket [methodNum=" + methodNum + ", purchaseMethod=" + purchaseMethod + "]";
	}
}
