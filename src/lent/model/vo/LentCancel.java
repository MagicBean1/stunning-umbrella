package lent.model.vo;

public class LentCancel {
	private String cancelMuid;
	private String cancelReason;
	private String cancelState;
	private String stateReason;
	
	public LentCancel() {
		
	}

	public LentCancel(String cancelMuid, String cancelReason, String cancelState, String stateReason) {
		this.cancelMuid = cancelMuid;
		this.cancelReason = cancelReason;
		this.cancelState = cancelState;
		this.stateReason = stateReason;
	}

	public String getCancelMuid() {
		return cancelMuid;
	}

	public void setCancelMuid(String cancelMuid) {
		this.cancelMuid = cancelMuid;
	}

	public String getCancelReason() {
		return cancelReason;
	}

	public void setCancelReason(String cancelReason) {
		this.cancelReason = cancelReason;
	}

	public String getCancelState() {
		return cancelState;
	}

	public void setCancelState(String cancelState) {
		this.cancelState = cancelState;
	}

	public String getStateReason() {
		return stateReason;
	}

	public void setStateReason(String stateReason) {
		this.stateReason = stateReason;
	}

	@Override
	public String toString() {
		return "LentCancel [cancelMuid=" + cancelMuid + ", cancelReason=" + cancelReason + ", cancelState="
				+ cancelState + ", stateReason=" + stateReason + "]";
	}
}
