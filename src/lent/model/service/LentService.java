package lent.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import bike.model.vo.BikePrice;
import lent.model.dao.LentDAO;
import lent.model.vo.LentBike;
import lent.model.vo.LentCancel;
import lent.model.vo.PurchaseTicket;
import shop.model.vo.Shop;



public class LentService {
	
	/* lent_bike db 저장 */
	public int insertLent(LentBike lb) {
		Connection conn = getConnection();
		
		int result = new LentDAO().insertLent(conn, lb);
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		return result;
	}
	
	/* bike_price 테이블에서 자전거 종류별 가격 가져옴 */
	public BikePrice selectBikePrice(String bikeId) {
		Connection conn = getConnection();
		BikePrice b = new LentDAO().selectBikePrice(conn, bikeId);
		close(conn);
		return b;
	}
	
	/* 이용권이름 검색 */
	public PurchaseTicket selectPurchaseTicket(int methodNum) {
		Connection conn = getConnection();
		
		PurchaseTicket selectPt = new LentDAO().selectPurchaseTicket(conn, methodNum);
		
		close(conn);
		
		return selectPt;
	} 
	
	/* lentConfirmEnd 출력용 검색 */
	public LentBike selectLentBike(String merchantUid) {
		Connection conn = getConnection();
		
		LentBike selectLb = new LentDAO().selectLentBike(conn, merchantUid);
		
		close(conn);
		
		return selectLb;
	}
	
	public Shop selectShop(String shopId) {
		Connection conn = getConnection();
		
		Shop selectShop = new LentDAO().selectShop(conn, shopId);
		
		close(conn);
		
		return selectShop;
	}
	
	/* mypage -> /memberLentHistory에서 전체 리스트 검색 */
	
	public List<LentBike> selectLentBikeList(String memId) {
		Connection conn = getConnection();
		
		List<LentBike> list = new LentDAO().selectLentBikeList(conn, memId);
		
		close(conn);
		
		return list;
	}
	
	public List<LentBike> memberPayList(int cPage, int numPerPage,String content, String opt){
		Connection conn = getConnection();
		List<LentBike> list = new LentDAO().memberPayList(conn,cPage,numPerPage,content,opt);
		close(conn);
		return list;
	}
	
	public int payListCount() {
		Connection conn = getConnection();
		int result = new LentDAO().payListCount(conn);
		close(conn);
		return result;
	}
	
	
	// 구매취소부분
	public int insertLentCancel(String cancelReason, String cancelMuid) {
		Connection conn = getConnection();
		int result = new LentDAO().insertLentCancel(conn, cancelReason, cancelMuid);
		if(result>0) commit(conn);
		else rollback(conn);

		return result;
	}
	
	public LentCancel selectLentCancel(String cancelMuid) {
		Connection conn = getConnection();
		LentCancel selectLC = new LentDAO().selectLentCancel(conn, cancelMuid);
		close(conn);
		
		return selectLC;
	}
	
	public List<LentCancel> selectLentCancelList() {
		Connection conn = getConnection();
		List<LentCancel> cancelList = new LentDAO().selectLentCancelList(conn); 
		close(conn);
		
		return cancelList;
	}
	
	public int updateLentCancel(LentCancel lc) {
		Connection conn = getConnection();
		int updateResult = new LentDAO().updateLentCancel(conn, lc);
		
		if(updateResult>0) commit(conn);
		else rollback(conn);
		
		return updateResult;
	}
	
	public int deleteLentBike(String cancelMuid) {
		Connection conn = getConnection();
		
		int deleteResult = new LentDAO().deleteLentBike(conn, cancelMuid);
		if(deleteResult>0) commit(conn);
		else rollback(conn);
		
		return deleteResult;
	}
}
