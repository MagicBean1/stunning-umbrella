package gift.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

import gift.model.dao.GiftDAO;
import gift.model.vo.Gift;
import lent.model.dao.LentDAO;
import member.model.vo.Member;

public class GiftService {
	
	public Member selectMemPhone(String giftSelectPhone) {
		
		Connection conn = getConnection();
		Member m = new GiftDAO().selectMemPhone(conn,giftSelectPhone);
		close(conn);
		return m;
		
	}
	
	
	public int insertGift(Gift gift) {
		Connection conn = getConnection();
		
		int result = new GiftDAO().insertGift(conn, gift);
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		return result;
	}
	
	public Gift selectGift(String presentUid) {
		
		Connection conn = getConnection();
		Gift selectGift = new GiftDAO().selectGift(conn,presentUid);
		close(conn);
		return selectGift;
		
	}


}
