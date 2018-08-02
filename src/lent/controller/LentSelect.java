package lent.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lent.model.service.LentService;


/**
 * Servlet implementation class LentSelect
 */
@WebServlet("/lent/lentSelect")
public class LentSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LentSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int methodNum = Integer.parseInt(request.getParameter("methodNum"));
		
		//request.setAttribute("methodNum", methodNum);
			if(methodNum==1)
			{
				request.setAttribute("methodNum", methodNum);
				request.getRequestDispatcher("/views/lent/lentPage.jsp").forward(request, response);
			}
			else
			{
				request.setAttribute("methodNum", methodNum);
				request.getRequestDispatcher("/views/gift/giftPage.jsp").forward(request, response);
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
