package review.model.vo;

import java.util.Date;

public class Review {
	private int reviewNo;
	private String reviewTitle;
	private String reviewWriter;
	private String reviewContent;
	private String originalFileName;
	private String renameFileName;
	private Date reviewDate;
	private int reviewReadCount;
	private String courseType;
	private String reviewStar;
	
	public Review() {}

	public Review(int reviewNo, String reviewTitle, String reviewWriter, String reviewContent, String originalFileName,
			String renameFileName, Date reviewDate, int reviewReadCount, String courseType, String reviewStar) {
		super();
		this.reviewNo = reviewNo;
		this.reviewTitle = reviewTitle;
		this.reviewWriter = reviewWriter;
		this.reviewContent = reviewContent;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.reviewDate = reviewDate;
		this.reviewReadCount = reviewReadCount;
		this.courseType = courseType;
		this.reviewStar = reviewStar;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewWriter() {
		return reviewWriter;
	}

	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
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

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public int getReviewReadCount() {
		return reviewReadCount;
	}

	public void setReviewReadCount(int reviewReadCount) {
		this.reviewReadCount = reviewReadCount;
	}

	public String getCourseType() {
		return courseType;
	}

	public void setCourseType(String courseType) {
		this.courseType = courseType;
	}

	public String getReviewStar() {
		return reviewStar;
	}

	public void setReviewStar(String reviewStar) {
		this.reviewStar = reviewStar;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewTitle=" + reviewTitle + ", reviewWriter=" + reviewWriter
				+ ", reviewContent=" + reviewContent + ", originalFileName=" + originalFileName + ", renameFileName="
				+ renameFileName + ", reviewDate=" + reviewDate + ", reviewReadCount=" + reviewReadCount
				+ ", courseType=" + courseType + ", reviewStar=" + reviewStar + "]";
	}

	
}
