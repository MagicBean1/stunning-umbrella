package bike.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import bike.model.vo.Bike;
import bike.model.vo.BikePrice;

public class BikeDAO {
	private Properties prop;
	
	public BikeDAO() {
		prop = new Properties();
		
		try {
			String file = BikeDAO.class.getResource("/sql/lent/lent-sql.properties").getPath();
			prop.load(new FileReader(file));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public Bike selectBike(Connection conn, String bikeId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectBike");
		Bike bike = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bikeId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bike = new Bike();
				
				bike.setBikeId(rs.getString("bike_id"));
				bike.setBikeType(rs.getString("bike_type"));
				bike.setShopId(rs.getString("shop_id"));
				bike.setBikeStatus(rs.getString("bike_status"));
			} 
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return bike;
	}
	
	public BikePrice selectBikePrice(Connection conn, String bikeType) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectBikePrice");
		BikePrice bp = null;
		System.out.println(sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bikeType);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bp = new BikePrice();
				bp.setBikeType(rs.getString("bike_type"));
				bp.setPrice(rs.getInt("price"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		System.out.println(bp);
		return bp;
	}
}
