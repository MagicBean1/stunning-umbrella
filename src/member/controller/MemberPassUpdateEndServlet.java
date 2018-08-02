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
 * Servlet implementation class MemberPassUpdateEndServlet
 */
@WebServlet("/member/memberPassUpdateEnd")
public class MemberPassUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPassUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String userId = (String)request.getParameter("userId");
		String updatePw = (String)request.getParameter("updatePw");
		System.out.println("왔음");
		
		Member m = new Member();
		m.setMem_id(userId);
		m.setMem_pw(updatePw);
		
		int result = new MemberService().changePw(m);
		
		String msg="";
		String loc="/";
		String view="/views/common/communityMsg.jsp";
		
		if(result>0)
		{
			msg="비밀번호 수정을 완료하였습니다.";
		}
		else
		{
			msg="비밀번호 수정을 실패하였습니다.";
			
			loc=request.getContextPath();
		}
		request.setAttribute("msg", msg); 
		request.setAttribute("loc", loc);
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
