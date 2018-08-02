package center.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import center.model.service.CenterService;
import center.model.vo.Center;

/**
 * Servlet implementation class CenterViewServlet
 */
@WebServlet("/centerView")
public class CenterViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("centerNo_"));
		String comment= request.getParameter("comment");
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		
		
		Center c = new CenterService().selectCenter(no);
		
		if(c!=null) {
			request.setAttribute("c", c);
			request.setAttribute("comment", comment);
			request.setAttribute("commentNo", commentNo);
			request.getRequestDispatcher("/views/center/centerView.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "조회된 게시물이 없습니다.");
			request.setAttribute("loc", "/view/center/centerList.jsp");
			request.getRequestDispatcher("/views/common/centerMsg.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
