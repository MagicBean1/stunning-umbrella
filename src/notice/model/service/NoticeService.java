package notice.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import notice.model.dao.NoticeDAO;
import notice.model.vo.Notice;
import notice.model.vo.NoticeComment;
public class NoticeService {
	public List<Notice> selectNoticeList(int cPage,int numPerPage){
		
		
		Connection conn = getConnection();
		List<Notice> list = new NoticeDAO().selectNoticeList(conn, cPage, numPerPage);
		close(conn);
		
		
		return list;
		
	}
	
	
	public int selectNoticeCount(){
		
		Connection conn = getConnection();
	
		int result = new NoticeDAO().selectNoticeCount(conn);
//		총갯수를 가져옴
		close(conn);
		
		return result;
	}
	
	public int insertNotice(Notice notice){
		Connection conn = getConnection();
		int result = new NoticeDAO().insertNotice(conn,notice);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public Notice selectOne(int noticeNo,boolean hasRead) {
		Connection conn = getConnection();
		
		Notice n = new NoticeDAO().selectOne(conn, noticeNo);
		int result =0;
		if(n!=null) {
			
			if(hasRead==true) {
				result =new NoticeDAO().insertNoticeCount(conn,noticeNo);
				if(result>0){
					commit(conn);
				}else {
					rollback(conn);
				}
			}
		}
		
		close(conn);
		
		return n;
	}
	
	public int insertNoticeComment(NoticeComment bc) {
		Connection conn = getConnection();
		int result = new NoticeDAO().insertNoticeComment(conn,bc);
		if(result>0){
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public List<NoticeComment> selectNoticeCommentList(int no) {
		Connection conn =getConnection();
		List<NoticeComment> list = new NoticeDAO().selectNoticeCommentList(conn,no);
		
		close(conn);

		return list;
	}
	
	public int updateNotice(String upContent,int updateNo ) {
		Connection conn =getConnection();
		
		int result = new NoticeDAO().updateNotice(conn,upContent,updateNo);
		if(result>0){
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		
		
		return result;
	}
	
	public int deleteNotice(int updateNo) {
		Connection conn= getConnection();
		int result = new NoticeDAO().deleteNotice(conn,updateNo);
		if(result>0){
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}
	
	public int commentCountAdd(int noticeRef) {
		Connection conn =getConnection();
		
		int result = new NoticeDAO().commentCountAdd(conn,noticeRef);
		
		if(result>0){
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public List<Notice> selectNoticeListAjax(){
		Connection conn = getConnection();
		List<Notice> list = new NoticeDAO().selectNoticeListAjax(conn);
		close(conn);
		
		
		return list;
		
	}


	public int deleteNoticeComment(int commentNo) {
		
		Connection conn= getConnection();
		int result = new NoticeDAO().deleteNoticeComment(conn,commentNo);
		if(result>0){
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int commentCountMinus(int noticeNo) {
		Connection conn =getConnection();
		
		int result = new NoticeDAO().commentCountMinus(conn,noticeNo);
		
		if(result>0){
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}

	public int commentMinusCount(int noticeNo) {
		Connection conn =getConnection();
		
		
		int count = new NoticeDAO().commentMinusCount(conn,noticeNo);
		if(count>0){
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return count;
	}
}
