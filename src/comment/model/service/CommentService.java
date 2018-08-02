package comment.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;
import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import center.model.vo.Center;
import comment.model.dao.CommentDAO;
import comment.model.vo.Comment;


public class CommentService {
	public int insertComment(Comment c) {
		Connection conn = getConnection();
		int result = new CommentDAO().insertComment(conn,c);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public List<Comment> commentList() {
		Connection conn = getConnection();
		List<Comment> comment = new CommentDAO().commentList(conn);
		close(conn);
		return comment;
	}
	
	public int commentDelete(int commentNo) {
		Connection conn = getConnection();
		int result = new CommentDAO().commentDelete(conn,commentNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int updateComment(int commentNo, String comment) {
		Connection conn = getConnection();
		int result = new CommentDAO().updateComment(conn,commentNo,comment);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
