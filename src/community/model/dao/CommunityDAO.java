package community.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import community.model.vo.Community;


public class CommunityDAO {
	private Properties prop;
	public CommunityDAO() {
		prop = new Properties();
		try {
			String file = CommunityDAO.class.getResource("/sql/community/community-sql.properties").getPath();
			prop.load(new FileReader(file));
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Community> communityList(Connection conn, int cPage, int numPerPage,String opt,String content){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Community c = null;
		
		ArrayList<Community> list = new ArrayList();
		
		try {
			if(opt==null) {
				String sql = prop.getProperty("communityList");
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, (cPage-1)*numPerPage+1);
				pstmt.setInt(2, cPage*numPerPage);
			}else if(opt.equals("1")) {
				String sql = prop.getProperty("titleList");
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+content+"%");
				pstmt.setInt(2, (cPage-1)*numPerPage+1);
				pstmt.setInt(3, cPage*numPerPage);
			}else if(opt.equals("2")) {
				String sql = prop.getProperty("contentList");
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+content+"%");
				pstmt.setInt(2, (cPage-1)*numPerPage+1);
				pstmt.setInt(3, cPage*numPerPage);
			}else {
				String sql = prop.getProperty("writerList");
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+content+"%");
				pstmt.setInt(2, (cPage-1)*numPerPage+1);
				pstmt.setInt(3, cPage*numPerPage);
			}
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				c = new Community();
				c.setCommunityNo(rs.getInt("community_no"));
				c.setCommunityTitle(rs.getString("community_title"));
				c.setCommunityWriter(rs.getString("community_writer"));
				c.setCommunityContent(rs.getString("community_content"));
				c.setOriginalFileName(rs.getString("community_original_filename"));
				c.setRenameFileName(rs.getString("community_renamed_filename"));
				c.setCommunityDate(rs.getDate("community_date"));
				c.setCommunityReadCount(rs.getInt("community_readcount"));
				list.add(c);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return list;
	}
	
	public int selectCommunityCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		
		int result=0;
		try {
				String sql = prop.getProperty("selectCommunityCount");
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("cnt");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return result;
	}
	
	public Community selectCommunity(Connection conn, int no) {
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		Community c = null;
		String sql = prop.getProperty("selectCommunity");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				c = new Community();
				c.setCommunityNo(rs.getInt("community_no"));
				c.setCommunityTitle(rs.getString("community_title"));
				c.setCommunityWriter(rs.getString("community_writer"));
				c.setCommunityContent(rs.getString("community_content"));
				c.setOriginalFileName(rs.getString("community_original_filename"));
				c.setRenameFileName(rs.getString("community_renamed_filename"));
				c.setCommunityDate(rs.getDate("community_date"));
				c.setCommunityReadCount(rs.getInt("community_readcount"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return c;
	}
	
	public int insertCommunity(Connection conn, Community c) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCommunity");
		int result =0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getCommunityTitle());
			pstmt.setString(2, c.getCommunityWriter());
			pstmt.setString(3, c.getCommunityContent());
			pstmt.setString(4, c.getOriginalFileName());
			pstmt.setString(5, c.getRenameFileName());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}
	
	public int updateCommunity(Connection conn, Community c) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateCommunity");
		int result=0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getCommunityTitle());
			pstmt.setString(2, c.getOriginalFileName());
			pstmt.setString(3, c.getRenameFileName());
			pstmt.setString(4, c.getCommunityContent());
			pstmt.setInt(5, c.getCommunityNo());
			
			result =pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}
	public int deleteCommunity(Connection conn, int no) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteCommunity");
		int result=0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}
	
	public int communityCount(Connection conn, int no) {
		PreparedStatement pstmt =null;
		String sql = prop.getProperty("communityCount");
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}
}
