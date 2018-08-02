package comment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import center.model.service.CenterService;
import center.model.vo.Center;
import comment.model.service.CommentService;

/**
 * Servlet implementation class CommentUpdateServlet
 */
@WebServlet("/commentUpdate")
public class CommentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		 String comment = request.getParameter("comment1");
		 
		 int result = new CommentService().updateComment(commentNo, comment);

			String msg="";
			String loc="/centerList";
			if(result>0) {
				msg="수정 되었습니다.";
			}else {
				msg="수정이 되지 않았습니다.";
			}
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/centerMsg.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
