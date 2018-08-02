package course.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CourseChangeServlet
 */
@WebServlet("/course/courseChange")
public class CourseChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sel = Integer.parseInt(request.getParameter("co"));
		String view = "";
		switch(sel) {
		case 1 : view = "/views/course/course1-1.jsp"; break;
		case 2 : view = "/views/course/course2-1.jsp"; break;
		case 3 : view = "/views/course/course3-1.jsp"; break;
		case 4 : view = "/views/course/course3-2.jsp"; break;
		case 5 : view = "/views/course/course4-1.jsp"; break;
		case 6 : view = "/views/course/course4-2.jsp"; break;
		case 7 : view = "/views/course/course5-1.jsp"; break;
		case 8 : view = "/views/course/course6-1.jsp"; break;
		case 9 : view = "/views/course/course6-2.jsp"; break;
		}
		
		
		response.sendRedirect(request.getContextPath()+view);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
