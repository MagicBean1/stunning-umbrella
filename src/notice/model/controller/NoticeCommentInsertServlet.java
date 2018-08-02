package notice.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.NoticeComment;




/**
 * Servlet implementation class NoticeCommentInsertServlet
 */
@WebServlet("/notice/noticeCommentInsert")
public class NoticeCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeCommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noticeRef = Integer.parseInt(request.getParameter("noticeRef"));
		int  noticeCommentLevel =Integer.parseInt( request.getParameter("noticeCommentLevel"));
		int  noticeCommentRef =Integer.parseInt( request.getParameter("noticeCommentRef"));
		String noticeCommentWriter = request.getParameter("noticeCommentWriter");
		String noticeCommentContent= request.getParameter("noticeCommentContent");
		String referer = request.getHeader("referer");
		/*System.out.println("ref" +boardRef);
		System.out.println("boardCommentLevel" +boardCommentLevel);
		System.out.println("boardCommentRef" +boardCommentRef);
		System.out.println("boardCommentWriter" +boardCommentWriter);
		System.out.println("boardCommentContent" +boardCommentContent);*/

		
		
		NoticeComment bc = new NoticeComment();
		bc.setNoticeRef(noticeRef);
		bc.setNoticeCommentWrite(noticeCommentWriter);
		bc.setNoticeCommentContent(noticeCommentContent);
		bc.setNoticeCommentLevel(noticeCommentLevel);
		bc.setNoticeCommentRef(noticeCommentRef);
		
		int coCount=0;
		int result = new NoticeService().insertNoticeComment(bc);
		
		
		String msg ="";
		
		String view = "/views/common/msg.jsp";
		/*WEB-INF*/
		if(result>0) {
			msg= "댓글등록 성공";
			new NoticeService().commentCountAdd(noticeRef);
		}else {
			msg= "댓글등록 실패";
		}										
		
		
		request.setAttribute("msg", msg);
		request.setAttribute("referer", referer);
		request.getRequestDispatcher(view).forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
