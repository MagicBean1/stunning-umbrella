package community.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import community.model.service.CommunityService;
import community.model.vo.Community;


/**
 * Servlet implementation class CommunityViewServlet
 */
@WebServlet("/community/communityView")
public class CommunityViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		
		Cookie[] cookie = request.getCookies();
		String CookieVal ="";
		boolean hasRead=false;
		if(cookie!=null) {
			outer:
				for(Cookie c: cookie) {
					String name = c.getName();
					String value = c.getValue();
					if("communityCookie".equals(name)) {
						CookieVal = value;
						if(value.contains("|"+no+"|")) {
							hasRead = true;
							break outer;
						}
					}
				}
		}
		if(!hasRead) {
			Cookie communityCookie = new Cookie("communityCookie",CookieVal+"|"+no+"|");
			communityCookie.setMaxAge(-1);
			response.addCookie(communityCookie);
		}
		
		
		Community c = new CommunityService().selectCommunity(no,hasRead);
		
		if(c!=null) {
			request.setAttribute("c", c);
			request.getRequestDispatcher("/views/community/communityView.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "조회된 게시물이 없습니다.");
			request.setAttribute("loc", "/view/community/communityList.jsp");
			request.getRequestDispatcher("/views/common/communityMsg.jsp").forward(request, response);
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
