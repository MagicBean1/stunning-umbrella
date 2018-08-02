package notice.model.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;
import notice.model.vo.NoticeComment;

/**
 * Servlet implementation class noticeViewServlet
 */
@WebServlet("/notice/noticeView")
public class NoticeViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noticeNo= Integer.parseInt(request.getParameter("no"));
		
//		client가 보낸 쿠키 확인
		
		Cookie[] cookie = request.getCookies();
		String noticeCookieVal = "";
		boolean hasRead = false;
		
		if(cookie !=null) {
			outer:
				for(Cookie c:cookie) {
					String name = c.getName();   /*key값*/
					String value = c.getValue(); /*value값*/
					if("noticeCookie".equals(name)) { /*noticeCookie값이 있다는소리는 한 번이라도 저장했다는소리 */
						noticeCookieVal=value;
						if(value.contains("|"+noticeNo+"|")) {
								/*읽었다는소리*/
							hasRead = true;
							break outer;
						}
						
					}
				}
		}
		if(!hasRead) { //읽지 않았다면 쿠키를 만들어서 저장
			
			Cookie noticeCookie = new Cookie("noticeCookie", noticeCookieVal+"|"+noticeNo+"|"); //10번읽으면 |10| 이렇게 저장 noticeCookie안에
			noticeCookie.setMaxAge(-1);//브라우저가 끊어져야 삭제 //세션이 끊어져야
			response.addCookie(noticeCookie);
		}
		
		Notice notice= new NoticeService().selectOne(noticeNo,hasRead);
		
		String view="";
		if(notice!=null) {
			request.setAttribute("notice", notice);
			List<NoticeComment> list = new NoticeService().selectNoticeCommentList(noticeNo);
			request.setAttribute("list", list);
			
			
			view="/views/notice/noticeView.jsp";
		}else {
			request.setAttribute("msg", "오류!!");
			request.setAttribute("loc", "/notice/noticeView");
			view = "/views/common/msg.jsp";
			
		}
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
