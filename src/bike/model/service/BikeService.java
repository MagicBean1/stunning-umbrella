package bike.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;

import bike.model.dao.BikeDAO;
import bike.model.vo.Bike;
import bike.model.vo.BikePrice;

public class BikeService {
	
	public Bike selectBike(String bikeId) {
		Connection conn = getConnection();
		
		Bike bike = new BikeDAO().selectBike(conn, bikeId);
		
		close(conn);
		
		return bike;
	}
	
	public BikePrice selectBikePrice(String bikeType) {
		Connection conn = getConnection();
		
		BikePrice bp = new BikeDAO().selectBikePrice(conn, bikeType);
		
		close(conn);
		
		return bp;
		
	}
}
