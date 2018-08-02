package gift.model.vo;

public class Gift {
	
	private String presentUid;
	private int method_num;
	private String sendMemId;
	
	public Gift() {}

	public Gift(String presentUid, int method_num, String sendMemId) {
		super();
		this.presentUid = presentUid;
		this.method_num = method_num;
		this.sendMemId = sendMemId;
	}

	public String getPresentUid() {
		return presentUid;
	}

	public void setPresentUid(String presentUid) {
		this.presentUid = presentUid;
	}

	public int getMethod_num() {
		return method_num;
	}

	public void setMethod_num(int method_num) {
		this.method_num = method_num;
	}

	public String getSendMemId() {
		return sendMemId;
	}

	public void setSendMemId(String sendMemId) {
		this.sendMemId = sendMemId;
	}

	@Override
	public String toString() {
		return "Gift [presentUid=" + presentUid + ", method_num=" + method_num + ", sendMemId=" + sendMemId + "]";
	};
	
	
	

}
