package comment.model.vo;

import java.util.Date;

public class Comment {
private int commentNo;
private int refNo;
private String comment;
private String writer;
private Date commentDate;
	
public Comment() {}

public Comment(int commentNo, int refNo, String comment, String writer, Date commentDate) {
	super();
	this.commentNo = commentNo;
	this.refNo = refNo;
	this.comment = comment;
	this.writer = writer;
	this.commentDate = commentDate;
}

public int getCommentNo() {
	return commentNo;
}

public void setCommentNo(int commentNo) {
	this.commentNo = commentNo;
}

public int getRefNo() {
	return refNo;
}

public void setRefNo(int refNo) {
	this.refNo = refNo;
}

public String getComment() {
	return comment;
}

public void setComment(String comment) {
	this.comment = comment;
}

public String getWriter() {
	return writer;
}

public void setWriter(String writer) {
	this.writer = writer;
}

public Date getCommentDate() {
	return commentDate;
}

public void setCommentDate(Date commentDate) {
	this.commentDate = commentDate;
}

@Override
public String toString() {
	return "Comment [commentNo=" + commentNo + ", refNo=" + refNo + ", comment=" + comment + ", writer=" + writer
			+ ", commentDate=" + commentDate + "]";
}
}
