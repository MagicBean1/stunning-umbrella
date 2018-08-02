package notice.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import notice.model.vo.Notice;
import notice.model.vo.NoticeComment;





public class NoticeDAO {
	
	private Properties prop;

	
	public NoticeDAO() {
		prop = new Properties();
		
		try {
			String file = NoticeDAO.class.getResource("/sql/notice/notice-sql.properties").getPath();
			prop.load(new FileReader(file));
		} catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	public List<Notice> selectNoticeList(Connection conn,int cPage,int numPerPage ){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectNoticeList");
		
		Notice n=null;
		ArrayList<Notice> list = new ArrayList();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			
			while (rs.next()) {
				n = new Notice();
				n.setNoticeNo(rs.getInt("notice_no"));
				n.setNoticeWriter(rs.getString("notice_writer"));
				n.setNoticeTitle(rs.getString("notice_title"));
				n.setNoticeContent(rs.getString("notice_content"));
				n.setNoticeDate(rs.getDate("notice_date"));
				n.setNoticeReadcount(rs.getInt("notice_readcount"));
				n.setNoticeCommentCount(rs.getInt("NOTICENUM"));
				list.add(n);
				
				
			}
			
		}catch (Exception e) {
				e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
		
		
		
	}
	public int selectNoticeCount(Connection conn) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectNoticeCount");
		
		int result = 0;
		
		try {
			pstmt=conn.prepareStatement(sql);
		
			rs =pstmt.executeQuery();
			int i=0;
			if(rs.next()) {
//				테이블 데이터갯수가져옴
				result = rs.getInt("CNT");
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int insertNotice(Connection conn, Notice n) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertNotice");
		try {
			

			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeWriter());
			pstmt.setString(3, n.getNoticeContent());
			
			
			result = pstmt.executeUpdate();
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			
			close(pstmt);
		}
		return result;
		
		
		
	}
	
	public Notice selectOne(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectOne");
		Notice n=null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				n = new Notice();
				n.setNoticeNo(rs.getInt("notice_no"));
				n.setNoticeWriter(rs.getString("notice_writer"));
				n.setNoticeTitle(rs.getString("notice_title"));
				n.setNoticeContent(rs.getString("NOTICE_CONTENT"));				
				n.setNoticeDate(rs.getDate("notice_date"));
				n.setNoticeReadcount(rs.getInt("notice_readcount"));
				
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return n;
		
		
		
	}
	
	public int insertNoticeCount(Connection conn, int NoticeNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertNoticeCount");
		try {
		
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, NoticeNo);
			result = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
			
		close(pstmt);
		
		return result;
		
		
	}
	public int insertNoticeComment(Connection conn, NoticeComment bc) {
		PreparedStatement pstmt=null;
		int result =0;
		String sql = prop.getProperty("insertNoticeComment");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bc.getNoticeCommentLevel());
			pstmt.setString(2, bc.getNoticeCommentWrite());
			pstmt.setString(3, bc.getNoticeCommentContent());
			pstmt.setInt(4, bc.getNoticeRef());    			
			pstmt.setString(5, bc.getNoticeCommentRef()==0?null:String.valueOf(bc.getNoticeCommentRef()));/*답글에 대한 PK*/
			result=pstmt.executeUpdate();
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
				close(pstmt);
		return result;
	}
	
	public List<NoticeComment> selectNoticeCommentList(Connection conn, int no){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql =prop.getProperty("selectNoticeCommentList");
		ArrayList<NoticeComment> list = new ArrayList();
		NoticeComment bc= null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				bc = new NoticeComment();
				bc.setNoticeCommentContent(rs.getString("notice_comment_content"));
				bc.setNoticeCommentNo(rs.getInt("notice_comment_no"));
				bc.setNoticeCommentLevel(rs.getInt("notice_comment_level"));
				bc.setNoticeCommentWrite(rs.getString("notice_comment_writer"));
				bc.setNoticeRef(rs.getInt("notice_ref"));
				bc.setNoticeCommentRef(rs.getInt("notice_comment_ref"));
				bc.setNoticeCommentDate(rs.getDate("notice_comment_date"));
				list.add(bc);
				
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		
		return list;
	}
	
	public int updateNotice(Connection conn,String upContent,int updateNo) {
		PreparedStatement pstmt=null;
		int result =0;
		String sql = prop.getProperty("updateNotice");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, upContent);
			pstmt.setInt(2, updateNo);
			result = pstmt.executeUpdate();
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
				close(pstmt);
		return result;
		
		
		
	}
	public int deleteNotice(Connection conn ,int updateNo) {
		
		PreparedStatement pstmt=null;
		int result =0;
		String sql = prop.getProperty("deleteNotice");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, updateNo);
			result = pstmt.executeUpdate();
			
		
		}catch (Exception e) {
			e.printStackTrace();
		}
				close(pstmt);
		return result;
		
		
		
		
	}
	public int commentCountAdd(Connection conn, int noticeRef) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("commentCountAdd");
		try {
		
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, noticeRef);
			result = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
			
		close(pstmt);
		
		return result;
	}
	public List<Notice> selectNoticeListAjax(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("noticeListAjax");
		
		Notice n=null;
		ArrayList<Notice> list = new ArrayList();
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while (rs.next()) {
				n = new Notice();
				n.setNoticeNo(rs.getInt("notice_no"));
				n.setNoticeWriter(rs.getString("notice_writer"));
				n.setNoticeTitle(rs.getString("notice_title"));
				n.setNoticeContent(rs.getString("notice_content"));
				n.setNoticeDate(rs.getDate("notice_date"));
				n.setNoticeReadcount(rs.getInt("notice_readcount"));
				n.setNoticeCommentCount(rs.getInt("comment_count"));
				list.add(n);
				
				
			}
			
		}catch (Exception e) {
				e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
		
		
		
	}

	public int deleteNoticeComment(Connection conn, int commentNo) {
		PreparedStatement pstmt=null;
		int result =0;

		String sql = prop.getProperty("deleteNoticeComment");
	
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, commentNo);
			
			result = pstmt.executeUpdate();
	
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		
		return result;
	}
	public int commentCountMinus(Connection conn,int noticeNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("commentCountMinus");
		try {
			
			pstmt=conn.prepareStatement(sql);
			
			
			pstmt.setInt(1, noticeNo);
			result = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
			
		close(pstmt);
		
		return result;
	}


	public int commentMinusCount(Connection conn, int noticeNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("commentMinusCount");
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,noticeNo);
			result=pstmt.executeUpdate();
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
			
		close(pstmt);
		
		return result;
	}








}
