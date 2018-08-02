package notice.model.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;

/**
 * Servlet implementation class noticeDeleteServlet
 */
@WebServlet("/notice/deleteNotice")

public class NoticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int updateNo = Integer.parseInt(request.getParameter("updateNo"));
		 
		int result = new NoticeService().deleteNotice(updateNo);
		
		String msg = "";
		String loc="/notice/noticeList";
	
		
		if(result >0) {
			msg="공지사항 삭제 완료!!";
			
			
		}else {
			msg="공지사항 삭제 실패!!";
			
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc); 
		
		request.getRequestDispatcher("/views/common/communityMsg.jsp").forward(request,response);
		

		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
