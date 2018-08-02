package notice.model.vo;

import java.util.Date;

public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeWriter;
	private String noticeContent;
	private Date noticeDate;
	private int noticeReadcount;
	private int noticeCommentCount;
	@Override
	public String toString() {
		return "["+noticeNo +" | "+noticeTitle +" | "+noticeWriter +" | "+noticeContent +" | "+noticeDate +" | "+noticeReadcount +" | "+noticeCommentCount +"]";
	}
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Notice(int noticeNo, String noticeTitle, String noticeWriter, String noticeContent, Date noticeDate,
			int noticeReadcount, int noticeCommentCount) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeWriter = noticeWriter;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.noticeReadcount = noticeReadcount;
		this.noticeCommentCount = noticeCommentCount;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeWriter() {
		return noticeWriter;
	}
	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public Date getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
	public int getNoticeReadcount() {
		return noticeReadcount;
	}
	public void setNoticeReadcount(int noticeReadcount) {
		this.noticeReadcount = noticeReadcount;
	}
	public int getNoticeCommentCount() {
		return noticeCommentCount;
	}
	public void setNoticeCommentCount(int noticeCommentCount) {
		this.noticeCommentCount = noticeCommentCount;
	}
	
	
	
}
