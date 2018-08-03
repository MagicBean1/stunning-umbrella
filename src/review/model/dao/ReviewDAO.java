package review.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import review.model.vo.Review;

public class ReviewDAO {
   private Properties prop;
   public ReviewDAO() {
      prop = new Properties();
      try {
         String file = ReviewDAO.class.getResource("/sql/review/review-sql.properties").getPath();
         prop.load(new FileReader(file));
      }catch(Exception e) {
         e.printStackTrace();
      }
   }
   
   public List<Review> reviewList(Connection conn, int cPage, int numPerPage,String opt,String content){
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      Review r = null;
      
      ArrayList<Review> list = new ArrayList();
      
      try {
         if(opt==null) {
            String sql = prop.getProperty("reviewList");
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
            r = new Review();
            r.setReviewNo(rs.getInt("review_no"));
            r.setReviewTitle(rs.getString("review_title"));
            r.setReviewWriter(rs.getString("review_writer"));
            r.setReviewContent(rs.getString("review_content"));
            r.setOriginalFileName(rs.getString("review_original_filename"));
            r.setRenameFileName(rs.getString("review_renamed_filename"));
            r.setReviewDate(rs.getDate("review_date"));
            r.setReviewReadCount(rs.getInt("review_readcount"));
            r.setCourseType(rs.getString("review_course_type"));
            list.add(r);
         }
      }catch(Exception e) {
         e.printStackTrace();
      }
      close(rs);
      close(pstmt);
      return list;
   }
   
   public int selectReviewCount(Connection conn) {
      PreparedStatement pstmt=null;
      ResultSet rs =null;
      
      int result=0;
      try {
            String sql = prop.getProperty("selectReviewCount");
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
   
   public Review selectReview(Connection conn, int no) {
      PreparedStatement pstmt=null;
      ResultSet rs = null;
      Review r = null;
      String sql = prop.getProperty("selectReview");
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1,no);
         rs = pstmt.executeQuery();
         if(rs.next()) {
            r = new Review();
            r.setReviewNo(rs.getInt("review_no"));
            r.setReviewTitle(rs.getString("review_title"));
            r.setReviewWriter(rs.getString("review_writer"));
            r.setReviewContent(rs.getString("review_content"));
            r.setOriginalFileName(rs.getString("review_original_filename"));
            r.setRenameFileName(rs.getString("review_renamed_filename"));
            r.setReviewDate(rs.getDate("review_date"));
            r.setReviewReadCount(rs.getInt("review_readcount"));
            r.setCourseType(rs.getString("review_course_type"));
            r.setReviewStar(rs.getString("review_star_score"));
         }
      }catch(Exception e) {
         e.printStackTrace();
      }
      close(rs);
      close(pstmt);
      return r;
   }
   
   public int insertReview(Connection conn, Review r) {
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("insertReview");
      int result =0;
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, r.getReviewTitle());
         pstmt.setString(2, r.getReviewWriter());
         pstmt.setString(3, r.getReviewContent());
         pstmt.setString(4, r.getOriginalFileName());
         pstmt.setString(5, r.getRenameFileName());
         pstmt.setString(6, r.getCourseType());
         pstmt.setString(7, r.getReviewStar());
         result = pstmt.executeUpdate();
      }catch(Exception e) {
         e.printStackTrace();
      }
      close(pstmt);
      return result;
   }
   
   public int updateReview(Connection conn, Review r) {
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("updateReview");
      int result=0;
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, r.getReviewTitle());
         pstmt.setString(2, r.getOriginalFileName());
         pstmt.setString(3, r.getRenameFileName());
         pstmt.setString(4, r.getReviewContent());
         pstmt.setString(5, r.getCourseType());
         pstmt.setString(6, r.getReviewStar());
         pstmt.setInt(7, r.getReviewNo());
         
         result =pstmt.executeUpdate();
      }catch(Exception e) {
         e.printStackTrace();
      }
      close(pstmt);
      return result;
   }
   public int deleteReview(Connection conn, int no) {
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("deleteReview");
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
   
   public int reviewCount(Connection conn, int no) {
      PreparedStatement pstmt =null;
      String sql = prop.getProperty("reviewCount");
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

   public List<Review> selectReviewCourse(Connection conn, int sel) {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      Review r = null;
      
      ArrayList<Review> rlist = new ArrayList();
      String course = "코스"+sel;
      System.out.println(course);
      try {
         String sql = prop.getProperty("selectReviewCourse");
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, course);
         
         rs = pstmt.executeQuery();
         while(rs.next()) {
            r = new Review();
            r.setReviewNo(rs.getInt("review_no"));
            r.setReviewTitle(rs.getString("review_title"));
            r.setReviewWriter(rs.getString("review_writer"));
            r.setReviewContent(rs.getString("review_content"));
            r.setOriginalFileName(rs.getString("review_original_filename"));
            r.setRenameFileName(rs.getString("review_renamed_filename"));
            r.setReviewDate(rs.getDate("review_date"));
            r.setReviewReadCount(rs.getInt("review_readcount"));
            r.setCourseType(rs.getString("review_course_type"));
            rlist.add(r);
         }
      }
      catch(Exception e) {
         e.printStackTrace();
      }
      
      close(rs);
      close(pstmt);
      
      
      return rlist;
   }
}