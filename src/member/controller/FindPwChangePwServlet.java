package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class FindPwChangePwServlet
 */
@WebServlet("/changePw")
public class FindPwChangePwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwChangePwServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//아이디가 맞으면 비밀번호 변경
		String findId=(String)request.getParameter("findId");
		String changePw=(String)request.getParameter("changePw");
		String changePw2=(String)request.getParameter("changePw2");
		String msg="";
		String loc="";
		/*String referer="/views/common/msg.jsp";*/
		Member m=new MemberService().checkId3(findId);
		
		m.setMem_pw(changePw2);
		int result=new MemberService().changePw(m);
		if(result>0) {
			msg="비밀번호 수정완료";
			loc="/";
		}
		else
		{
			msg="비밀번호 수정실패";
			loc="/views/member/findPwChangePw.jsp";
		}
	
		request.setAttribute("msg", msg);
		request.setAttribute("loc",loc);
		request.getRequestDispatcher(loc).forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
