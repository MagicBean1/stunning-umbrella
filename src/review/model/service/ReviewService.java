package review.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import review.model.dao.ReviewDAO;
import review.model.vo.Review;

public class ReviewService {
	public List<Review> reviewList(int cPage, int numPerPage,String opt,String content){
		Connection conn = getConnection();
		List<Review> list = new ReviewDAO().reviewList(conn,cPage,numPerPage,opt,content);
		close(conn);
		return list;
	}
	
	public int selectReviewCount() {
		Connection conn = getConnection();
		int result = new ReviewDAO().selectReviewCount(conn);
		close(conn);
		return result;
	}
	
	public Review selectReview(int no,boolean hasRead) {
		Connection conn = getConnection();
		Review c = new ReviewDAO().selectReview(conn, no);
		int result=0;
		if(c!=null) {
			if(!hasRead) {
				result = new ReviewDAO().reviewCount(conn,no);
				if(result>0) commit(conn);
				else rollback(conn);
			}
		}
		close(conn);
		return c;
	}
	
	public int insertReview(Review c) {
		Connection conn = getConnection();
		int result = new ReviewDAO().insertReview(conn,c);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int updateReview(Review r) {
		Connection conn = getConnection();
		int result = new ReviewDAO().updateReview(conn,r);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int deleteReview(int no) {
		Connection conn = getConnection();
		int result = new ReviewDAO().deleteReview(conn,no);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
