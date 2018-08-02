package admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;

/**
 * Servlet implementation class BikeStatusUpdateServlet
 */
@WebServlet("/bikeStatusUpdate")
public class BikeStatusUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BikeStatusUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String input_statusAvailable =(String)request.getParameter("input_statusAvailable");
		String input_statusUsing =(String)request.getParameter("input_statusUsing");
		String input_statusRepair =(String)request.getParameter("input_statusRepair");
		String bikeId =(String)request.getParameter("bikeId");
		String referer = request.getHeader("referer");
	
		String msg ="";
		String loc="/views/admin/bikeList.jsp";
		
		if(input_statusAvailable !=null) {
			String status =input_statusAvailable;
			int result = new AdminService().bikeStatusUpdate(bikeId,status);
			if(result==1) {
				msg =status +" 상태로 변경 되었습니다~";
			}else {
				msg = "상태가 변경되지 않았습니다~";
			}
			
		}
		else if(input_statusUsing !=null) {
			String status =input_statusUsing;
			int result = new AdminService().bikeStatusUpdate(bikeId,status);
			if(result==1) {
				msg =status +" 상태로 변경 되었습니다~";
			}else {
				msg = "상태가 변경되지 않았습니다~";
			}
		
			
		}
		else if(input_statusRepair !=null){
		
			String status =input_statusRepair;
			int result = new AdminService().bikeStatusUpdate(bikeId,status);
			if(result==1) {
				msg =status +" 상태로 변경 되었습니다~";
			}else {
				msg = "상태가 변경되지 않았습니다~";
			}
		
			
		}
		
		request.setAttribute("referer", referer);
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request,response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
