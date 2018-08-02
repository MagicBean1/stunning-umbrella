package community.model.vo;

import java.util.Date;

public class Community {
	private int communityNo;
	private String communityTitle;
	private String communityWriter;
	private String communityContent;
	private String originalFileName;
	private String renameFileName;
	private Date communityDate;
	private int communityReadCount;
	
	public Community() {}
	public Community(int communityNo, String communityTitle, String communityWriter, String communityContent,
			String originalFileName, String renameFileName, Date communityDate, int communityReadCount) {
		super();
		this.communityNo = communityNo;
		this.communityTitle = communityTitle;
		this.communityWriter = communityWriter;
		this.communityContent = communityContent;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.communityDate = communityDate;
		this.communityReadCount = communityReadCount;
	}
	public int getCommunityNo() {
		return communityNo;
	}
	public void setCommunityNo(int communityNo) {
		this.communityNo = communityNo;
	}
	public String getCommunityTitle() {
		return communityTitle;
	}
	public void setCommunityTitle(String communityTitle) {
		this.communityTitle = communityTitle;
	}
	public String getCommunityWriter() {
		return communityWriter;
	}
	public void setCommunityWriter(String communityWriter) {
		this.communityWriter = communityWriter;
	}
	public String getCommunityContent() {
		return communityContent;
	}
	public void setCommunityContent(String communityContent) {
		this.communityContent = communityContent;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getRenameFileName() {
		return renameFileName;
	}
	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}
	public Date getCommunityDate() {
		return communityDate;
	}
	public void setCommunityDate(Date communityDate) {
		this.communityDate = communityDate;
	}
	public int getCommunityReadCount() {
		return communityReadCount;
	}
	public void setCommunityReadCount(int communityReadCount) {
		this.communityReadCount = communityReadCount;
	}
	@Override
	public String toString() {
		return "Community [communityNo=" + communityNo + ", communityTitle=" + communityTitle + ", communityWriter="
				+ communityWriter + ", communityContent=" + communityContent + ", originalFileName=" + originalFileName
				+ ", renameFileName=" + renameFileName + ", communityDate=" + communityDate + ", communityReadCount="
				+ communityReadCount + "]";
	}
}
