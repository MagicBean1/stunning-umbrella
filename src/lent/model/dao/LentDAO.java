package lent.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import bike.model.vo.BikePrice;
import lent.model.vo.LentBike;
import lent.model.vo.LentCancel;
import lent.model.vo.PurchaseTicket;
import shop.model.vo.Shop;


public class LentDAO {
   
   private Properties prop;
   
   public LentDAO() {
      prop = new Properties();
      
      try {
         String file = LentDAO.class.getResource("/sql/lent/lent-sql.properties").getPath();
         prop.load(new FileReader(file));
      } catch(IOException e) {
         e.printStackTrace();
      }
   }
   
   public int insertLent(Connection conn, LentBike lb) {
      PreparedStatement pstmt = null;
      int result = 0;
      String sql = prop.getProperty("insertLent3");
      
      /*DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm");
      Date date = (Date)formatter.parse(lb.getBuyDate());
      Date sql_buyDate = new Date(buyDate.getTime());
      pstmt.setDate(4, sql_buyDate);*/
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1, lb.getMerchantUid());
         pstmt.setInt(2, lb.getMethodNum());
         pstmt.setString(3, lb.getBikeId());
         SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm");
         /*String buydate = lb.getBuyDate().replaceAll("-", "/");*/
         pstmt.setString(4, lb.getBuyDate().replaceAll("-", "/"));
         DateFormat formatter2 = new SimpleDateFormat("yyyy/MM/dd HH:mm");
         /*java.util.Date returnDate = formatter2.parse();
         Date sql_returnDate = new Date(returnDate.getTime());*/
         pstmt.setString(5, lb.getReturnDate().replaceAll("-", "/"));
         /*SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
         java.util.Date buyDate = format.parse(lb.getBuyDate());
         Date sql_buyDate = new Date(buyDate.getTime());
         pstmt.setDate(4, sql_buyDate);
         SimpleDateFormat format2 = new SimpleDateFormat("yyyy-mm-dd");
         java.util.Date returnDate = format2.parse(lb.getReturnDate());
         Date sql_returnDate = new Date(returnDate.getTime());
         pstmt.setDate(5, sql_returnDate);*/
         pstmt.setString(6, lb.getBuyerId());
         pstmt.setString(7, lb.getShopId());
         //String형 int변환
         pstmt.setInt(8, lb.getLentPrice());
         
         result = pstmt.executeUpdate();
      } catch(Exception e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      return result;
   }
   
   public PurchaseTicket selectPurchaseTicket(Connection conn, int methodNum) {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      PurchaseTicket selectPt = null;
      String sql = prop.getProperty("selectMethodNum");
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, methodNum);
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
            selectPt = new PurchaseTicket();
            
            selectPt.setMethodNum(rs.getInt("method_num"));
            selectPt.setPurchaseMethod(rs.getString("purchase_method"));
         }
      } catch(Exception e) {
         e.printStackTrace();
      } finally {
         close(rs);
         close(pstmt);
      }
      
      return selectPt;
   }
   
   public BikePrice selectBikePrice(Connection conn, String bikeId) {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      BikePrice b = null;
      String sql = prop.getProperty("selectBikePrice");
      try {
         pstmt= conn.prepareStatement(sql);
         pstmt.setString(1, bikeId);
         rs= pstmt.executeQuery();
         if(rs.next()) {
            b = new BikePrice();
            b.setPrice(rs.getInt("price"));
         }
      }catch(Exception e) {
         e.printStackTrace();
      }
      close(rs);
      close(pstmt);
      System.out.println(b);
      return b;
   }
   
   public LentBike selectLentBike(Connection conn, String merchantUid) {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = prop.getProperty("selectLentBike");
      LentBike selectLb = null;
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, merchantUid);
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
            selectLb = new LentBike();
            
            selectLb.setMerchantUid(rs.getString("merchant_uid"));
            selectLb.setMethodNum(rs.getInt("method_num"));
            selectLb.setBikeId(rs.getString("bike_id"));
            selectLb.setBuyDate(rs.getString("buy_date"));
            selectLb.setReturnDate(rs.getString("return_date"));
            selectLb.setBuyerId(rs.getString("buyer_id"));
            selectLb.setShopId(rs.getString("shop_id"));
            selectLb.setLentPrice(rs.getInt("lent_price"));
         }
         
      } catch(Exception e) {
         e.printStackTrace();
      } finally {
         close(rs);
         close(pstmt);
      }
      return selectLb;
   }
   
   
   public Shop selectShop(Connection conn, String shopId) {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      Shop s = null;
      String sql = prop.getProperty("selectShop");
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, shopId);
         rs = pstmt.executeQuery();
         
         if(rs.next()) {
            s = new Shop();
            s.setShopId(rs.getString("shop_id"));
            s.setShopName(rs.getString("shop_name"));
            s.setShopAddr(rs.getString("shop_addr"));
            s.setShopPhone(rs.getString("shop_phone"));
         }
      } catch(Exception e) {
         e.printStackTrace();
      } finally {
         close(rs);
         close(pstmt);
      }
      
      return s;
   }
   
   
   public List<LentBike> memberPayList(Connection conn,int cPage,int numPerPage,String content, String opt){
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      ArrayList<LentBike> list = new ArrayList();
      LentBike lb = null;
      
      try {
         if(opt==null) {
            String sql = prop.getProperty("memberPayList");         
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, (cPage-1)*numPerPage+1);
            pstmt.setInt(2, cPage*numPerPage);
            
         }else if(opt.equals("1")) {
            String sql = prop.getProperty("payNumList");
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, "%"+content+"%");
            pstmt.setInt(2, (cPage-1)*numPerPage+1);
            pstmt.setInt(3, cPage*numPerPage);
            System.out.println("1번 :"+opt);
            System.out.println("1번 :"+content);
         }else {
            String sql = prop.getProperty("buyerList");
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, "%"+content+"%");
            pstmt.setInt(2, (cPage-1)*numPerPage+1);
            pstmt.setInt(3, cPage*numPerPage);
            System.out.println("2번 :"+opt);
            System.out.println("2번 :"+content);
         }
         rs = pstmt.executeQuery();
         while(rs.next()) {
            lb = new LentBike();
            lb.setMerchantUid(rs.getString("merchant_uid"));
            lb.setMethodNum(rs.getInt("method_num"));
            lb.setBikeId(rs.getString("bike_id"));
            lb.setBuyDate(rs.getString("buy_date"));
            lb.setReturnDate(rs.getString("return_date"));
            lb.setBuyerId(rs.getString("buyer_id"));
            lb.setShopId(rs.getString("shop_id"));
            lb.setLentPrice(rs.getInt("lent_price"));
            list.add(lb);
         }
      } catch(Exception e) {
         e.printStackTrace();
      } 
         close(rs);
         close(pstmt);
      
      return list;
   }
   
   public int payListCount(Connection conn) {
      PreparedStatement pstmt=null;
      ResultSet rs =null;
      
      int result=0;
      try {
            String sql = prop.getProperty("payListCount");
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
   
   
   public LentCancel selectLentCancel(Connection conn, String cancelMuid) {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = prop.getProperty("selectLentCancel");
      LentCancel selectLC = null;
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, cancelMuid);
         
         rs = pstmt.executeQuery();
         
         if(rs.next()) {
            selectLC = new LentCancel();
            
            selectLC.setCancelMuid(rs.getString("cancel_muid"));
            selectLC.setCancelReason(rs.getString("cancel_reason"));
            selectLC.setCancelState(rs.getString("cancel_state"));
            selectLC.setStateReason(rs.getString("State_Reason"));
         }
      } catch(Exception e) {
         e.printStackTrace();
      } finally {
         close(rs);
         close(pstmt);
      }
      
      return  selectLC;
   }
   
   public List<LentCancel> selectLentCancelList(Connection conn) {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = prop.getProperty("selectLentCancelList");
      ArrayList<LentCancel> cancelList = new ArrayList();
      LentCancel LC = null;
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
            LC = new LentCancel();
            
            LC.setCancelMuid(rs.getString("cancel_muid"));
            LC.setCancelReason(rs.getString("cancel_reason"));
            LC.setCancelState(rs.getString("cancel_state"));
            LC.setStateReason(rs.getString("state_reason"));
                  
            cancelList.add(LC);
         }
      } catch(Exception e) {
         e.printStackTrace();
      } finally {
         close(rs);
         close(pstmt);
      }
      
      return cancelList;
   }
   
   public int updateLentCancel(Connection conn, LentCancel lc) {
      PreparedStatement pstmt = null;
      int updateResult = 0;
      String sql = prop.getProperty("updateLentCancel");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1, lc.getCancelState());
         pstmt.setString(2, lc.getStateReason());
         pstmt.setString(3, lc.getCancelMuid());
         
         updateResult = pstmt.executeUpdate();
      } catch(Exception e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return updateResult;
   }
   
   public int deleteLentBike(Connection conn, String cancelMuid) {
      PreparedStatement pstmt = null;
      int deleteResult = 0;
      String sql = prop.getProperty("deleteLentBike");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1, cancelMuid);
         
         deleteResult = pstmt.executeUpdate();
      } catch(Exception e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return deleteResult;
   }
   
   public int insertLentCancel(Connection conn, String cancelReason, String cancelMuid) {
      PreparedStatement pstmt = null;
      int result = 0;
      String sql = prop.getProperty("insertLentCancel");
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, cancelMuid);
         pstmt.setString(2, cancelReason);

         result=pstmt.executeUpdate();
      } catch(Exception e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
   }
   
   public List<LentBike> selectLentBikeList(Connection conn, String memId) {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = prop.getProperty("selectLentBikeList");
      ArrayList<LentBike> list = new ArrayList();
      LentBike lb = null;
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, memId);
         
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
            lb = new LentBike();
            
            lb.setMerchantUid(rs.getString("merchant_uid"));
            lb.setMethodNum(rs.getInt("method_num"));
            lb.setBikeId(rs.getString("bike_id"));
            lb.setBuyDate(rs.getString("buy_date"));
            lb.setReturnDate(rs.getString("return_date"));
            lb.setBuyerId(rs.getString("buyer_id"));
            lb.setShopId(rs.getString("shop_id"));
            lb.setLentPrice(rs.getInt("lent_price"));
            
            list.add(lb);
         }
      } catch(Exception e) {
         e.printStackTrace();
      } finally {
         close(rs);
         close(pstmt);
      }
      
      return list;
   }

}