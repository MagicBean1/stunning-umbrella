package community.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import community.model.dao.CommunityDAO;
import community.model.vo.Community;

public class CommunityService {
	public List<Community> communityList(int cPage, int numPerPage,String opt,String content){
		Connection conn = getConnection();
		List<Community> list = new CommunityDAO().communityList(conn,cPage,numPerPage,opt,content);
		close(conn);
		return list;
	}
	
	public int selectCommuntiyCount() {
		Connection conn = getConnection();
		int result = new CommunityDAO().selectCommunityCount(conn);
		close(conn);
		return result;
	}
	
	public Community selectCommunity(int no,boolean hasRead) {
		Connection conn = getConnection();
		Community c = new CommunityDAO().selectCommunity(conn, no);
		int result=0;
		if(c!=null) {
			if(!hasRead) {
				result = new CommunityDAO().communityCount(conn,no);
				if(result>0) commit(conn);
				else rollback(conn);
			}
		}
		close(conn);
		return c;
	}
	
	public int insertCommunity(Community c) {
		Connection conn = getConnection();
		int result = new CommunityDAO().insertCommunity(conn,c);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int updateCommunity(Community c) {
		Connection conn = getConnection();
		int result = new CommunityDAO().updateCommunity(conn,c);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int deleteCommunity(int no) {
		Connection conn = getConnection();
		int result = new CommunityDAO().deleteCommunity(conn,no);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
