package center.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import center.model.dao.CenterDAO;
import center.model.vo.Center;

public class CenterService {
	public List<Center> centerList(int cPage, int numPerPage){
		Connection conn = getConnection();
		List<Center> list = new CenterDAO().centerList(conn,cPage,numPerPage);
		close(conn);
		return list;
		
	}
	
	public int selectCenterCount() {
		Connection conn = getConnection();
		int result = new CenterDAO().selectCenterCount(conn);
		close(conn);
		return result;
	}
	
	public Center selectCenter(int no) {
		Connection conn = getConnection();
		Center c = new CenterDAO().selectCenter(conn, no);
		close(conn);
		return c;
	}
	
	public int insertCenter(Center c) {
		Connection conn = getConnection();
		int result = new CenterDAO().insertCenter(conn,c);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int updateCenter(Center c) {
		Connection conn = getConnection();
		int result = new CenterDAO().updateCenter(conn,c);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int deleteCenter(int no) {
		Connection conn = getConnection();
		int result = new CenterDAO().deleteCenter(conn,no);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
