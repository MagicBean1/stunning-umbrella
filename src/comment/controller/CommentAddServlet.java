package comment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import center.model.vo.Center;
import comment.model.service.CommentService;
import comment.model.vo.Comment;

/**
 * Servlet implementation class CommentAddServlet
 */
@WebServlet("/commentAdd")
public class CommentAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int refNo = Integer.parseInt(request.getParameter("refNo"));
		String writer = request.getParameter("writer");
		String comment = request.getParameter("comment");
		System.out.println(comment);
		
		Comment c = new Comment();
		c.setComment(comment);
		c.setRefNo(refNo);
		c.setWriter(writer);
		
		int result = new CommentService().insertComment(c);
		
		String msg = "";
		String loc="/centerList";
		
		if(result>0) {
			msg="등록되었습니다.";
			/*List<Comment> total =  new CommentService().commentList();
			request.setAttribute("total", total);
			request.getRequestDispatcher("/centerList").forward(request, response);*/
			
		
		}else {
			msg="등록이 되지 않았습니다.";
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
