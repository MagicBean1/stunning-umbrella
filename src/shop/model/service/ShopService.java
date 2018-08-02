package shop.model.service;

import static common.JDBCTemplate.*;
import shop.model.vo.Shop;
import java.sql.Connection;
import shop.model.dao.ShopDAO;

public class ShopService {
	
	public Shop selectShop(String shopId) {
		Connection conn = getConnection();
		Shop shop = new ShopDAO().selectShop(conn, shopId);
		close(conn);
		return shop;
	}

}
