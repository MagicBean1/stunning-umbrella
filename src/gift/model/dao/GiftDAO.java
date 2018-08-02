package gift.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Properties;

import gift.model.vo.Gift;
import lent.model.vo.LentBike;

import member.model.vo.Member;

public class GiftDAO {
	
	private Properties prop;
	
	public GiftDAO() {
		prop = new Properties();
		
		try {
			String file = GiftDAO.class.getResource("/sql/gift/gift-sql.properties").getPath();
			prop.load(new FileReader(file));
		} catch(IOException e) {
			e.printStackTrace();
		}			
	}

	public Member selectMemPhone(Connection conn, String giftSelectPhone) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		String sql = prop.getProperty("selectMemPhone");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, giftSelectPhone);
			rs = pstmt.executeQuery();
			
			
			
			if(rs.next()) {
				m = new Member();
				
				// DB 컬럼명을 따른다.
				m.setMem_id(rs.getString("mem_id"));
				m.setMem_pw(rs.getString("mem_pw"));
				m.setMem_name(rs.getString("mem_name"));
				m.setMem_birthdate(rs.getInt("mem_birthdate"));
				m.setMem_phone(rs.getString("mem_phone"));
				m.setMem_email(rs.getString("mem_email"));
				m.setMem_addr(rs.getString("mem_addr"));

			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return m;
		
	}
	
	public int insertGift(Connection conn, Gift gift) {
		
		PreparedStatement pstmt = null;
	    int result = 0;
	    String sql = prop.getProperty("insertGift");
		
	    try {
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, gift.getPresentUid());
	         pstmt.setInt(2, gift.getMethod_num());
	         pstmt.setString(3, gift.getSendMemId());
	        
	         result = pstmt.executeUpdate();
	      } catch(Exception e) {
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	      }
	      System.out.println(result);
	      return result;
	   
	}
	
	public Gift selectGift(Connection conn, String presentUid) {
		PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = prop.getProperty("selectGift");
	    Gift selectGift = null;
	    
	    try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, presentUid);
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	        	 selectGift = new Gift();	            
	        	 selectGift.setPresentUid(rs.getString("present_uid"));
	        	 selectGift.setMethod_num(rs.getInt("method_num"));
	        	 selectGift.setSendMemId(rs.getString("sendmem_id"));
	         }
	         
	      } catch(Exception e) {
	         e.printStackTrace();
	      } finally {
	         close(rs);
	         close(pstmt);
	      }
	      return selectGift;
	}


}
