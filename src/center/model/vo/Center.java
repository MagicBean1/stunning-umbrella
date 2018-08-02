package center.model.vo;

import java.util.Date;

public class Center {
	private int centerNo;
	private int centerPwd;
	private String centerTitle;
	private String centerWriter;
	private String centerContent;
	private String originalFileName;
	private String renameFileName;
	private Date centerDate;
	
	public Center() {}

	public Center(int centerNo, int centerPwd, String centerTitle, String centerWriter, String centerContent,
			String originalFileName, String renameFileName, Date centerDate) {
		super();
		this.centerNo = centerNo;
		this.centerPwd = centerPwd;
		this.centerTitle = centerTitle;
		this.centerWriter = centerWriter;
		this.centerContent = centerContent;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.centerDate = centerDate;
	}



	public int getCenterNo() {
		return centerNo;
	}

	public void setCenterNo(int centerNo) {
		this.centerNo = centerNo;
	}
	
	public int getCenterPwd() {
		return centerPwd;
	}

	public void setCenterPwd(int centerPwd) {
		this.centerPwd = centerPwd;
	}

	public String getCenterTitle() {
		return centerTitle;
	}

	public void setCenterTitle(String centerTitle) {
		this.centerTitle = centerTitle;
	}

	public String getCenterWriter() {
		return centerWriter;
	}

	public void setCenterWriter(String centerWriter) {
		this.centerWriter = centerWriter;
	}

	public String getCenterContent() {
		return centerContent;
	}

	public void setCenterContent(String centerContent) {
		this.centerContent = centerContent;
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

	public Date getCenterDate() {
		return centerDate;
	}

	public void setCenterDate(Date centerDate) {
		this.centerDate = centerDate;
	}

	@Override
	public String toString() {
		return "Center [centerNo=" + centerNo + ", centerPwd=" + centerPwd + ", centerTitle=" + centerTitle
				+ ", centerWriter=" + centerWriter + ", centerContent=" + centerContent + ", originalFileName="
				+ originalFileName + ", renameFileName=" + renameFileName + ", centerDate=" + centerDate + "]";
	}
	
}
