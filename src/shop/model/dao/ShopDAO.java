package shop.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import shop.model.vo.Shop;

public class ShopDAO {
	private Properties prop;
	
	public ShopDAO() {
		prop = new Properties();
		
		try {
			String file = ShopDAO.class.getResource("/sql/shop/shop-sql.properties").getPath();
			prop.load(new FileReader(file));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public Shop selectShop(Connection conn, String shopId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectShop");
		Shop shop = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, shopId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				shop = new Shop();
				shop.setShopId(rs.getString("shop_id"));
				shop.setShopName(rs.getString("shop_name"));
				shop.setShopAddr(rs.getString("shop_addr"));
				shop.setShopPhone(rs.getString("shop_phone"));
				shop.setRunTime(rs.getString("run_time"));
				shop.setBikeKind(rs.getString("bike_kind"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return shop;
	}
}
