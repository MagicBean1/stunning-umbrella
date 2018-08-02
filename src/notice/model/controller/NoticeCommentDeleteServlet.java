package notice.model.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;

/**
 * Servlet implementation class NoticeCommentDeleteServlet
 */
@WebServlet("/notice/noticeCommentDelete")
public class NoticeCommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeCommentDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noticeNo = Integer.parseInt(request.getParameter("h_noticeNo"));
		int commentNo = Integer.parseInt(request.getParameter("h_CommentNo"));
		String referer = request.getHeader("referer");
		//코멘트삭제
		int result = new NoticeService().deleteNoticeComment(commentNo); 
		
		String msg = "";
		String loc="/notice/noticeList";
	
		
		if(result >0) {
			msg="공지사항 삭제 완료!!";
			//공지사항 댓글수 찾기
			/*int count = new NoticeService().commentMinusCount(noticeNo);*/
			//공지사항 댓글수 감소
			
			new NoticeService().commentCountMinus(noticeNo);
		
			
		}else {
			msg="공지사항 삭제 실패!!";
			
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc); 
		request.setAttribute("referer", referer); 
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
