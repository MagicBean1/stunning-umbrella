package notice.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;

/**
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet("/notice/noticeUpdate")
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String upContent =(String)request.getParameter("updateContent");
		int updateNo =Integer.parseInt(request.getParameter("updateNo"));
		
		
		int result = new NoticeService().updateNotice(upContent,updateNo);
		
		String msg = "";
		String loc="/notice/noticeList";
		
		
		if(result >0) {
			msg="공지사항 수정 완료!!";
			
			
		}else {
			msg="공지사항 수정 실패!!";
			
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
