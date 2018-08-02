package admin.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import admin.model.dao.AdminDAO;
import bike.model.vo.Bike;
import member.model.vo.Member;

public class AdminService {

	public ArrayList<Member> selectMemberList(int cPage, int numPerPage)
	{
		Connection conn=getConnection();
		ArrayList<Member> list=new AdminDAO().selectMemberList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public int selectMemberCount()
	{
		Connection conn=getConnection();
		int result=new AdminDAO().seletMemberCount(conn);
		close(conn);
		return result;
	}
	
	public ArrayList<Member> searchMemberName(String searchValue)
	{
		Connection conn=getConnection();
		ArrayList<Member> list=new AdminDAO().searchMemberName(conn,searchValue);
		close(conn);
		return list;
	}
	
	public ArrayList<Member> searchMemberId(String searchValue)
	{
		Connection conn=getConnection();
		ArrayList<Member> list=new AdminDAO().searchMemberId(conn,searchValue);
		close(conn);
		return list;
	}
//	자전거
	public List<Bike> selectBikeList(int cPage, int numPerPage,String shopCode){
		Connection conn = getConnection();
		
		List<Bike> list = new AdminDAO().selectBikeList(conn,cPage,numPerPage,shopCode);
		
		close(conn);
		
		
		return list;
	}
	
	public int selectShopTotalCount() {
		
		Connection conn=getConnection();
		int result=new AdminDAO().selectShopTotalCount(conn);
		close(conn);
		
		return result;
	}

	
//  status 변경
	public int bikeStatusUpdate(String bikeId,String status) {
		
		Connection conn=getConnection();
		int result=new AdminDAO().bikeStatusUpdate(conn,bikeId,status);
		if(result>0){
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
		
		
		
		


	}
	
//  shop별
	public List<Bike> shopClassiFication(int cPage, int numPerPage, String shopCode){
		Connection conn = getConnection();
		List<Bike> list = new AdminDAO().shopClassiFication(conn,cPage,numPerPage,shopCode);
		close(conn);
		
		return list;
		
	}
	
public int selectBikeTotalCount() {
		
		Connection conn=getConnection();
		int result=new AdminDAO().selectBikeTotalCount(conn);
		close(conn);
		
		return result;
	}

	
}
