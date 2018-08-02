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
 * Servlet implementation class MemberEnrollEndServlet
 */
@WebServlet("/memberEnrollEnd")
public class MemberEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String mem_id=request.getParameter("mem_id");
		String mem_pw=request.getParameter("mem_pw");
		String mem_name=request.getParameter("mem_name");
		int mem_birthdate=Integer.parseInt(request.getParameter("mem_birthdate"));
		String mem_phone=request.getParameter("mem_phone");
		String mem_email=request.getParameter("mem_email");
		String mem_addr=request.getParameter("mem_addr");
		
		
		/*Member m=new Member(mem_id,mem_pw,mem_name,mem_birthdate,mem_phone,mem_email,mem_addr);*/
		Member m=new Member();
		m.setMem_id(mem_id);
		m.setMem_pw(mem_pw);
		m.setMem_name(mem_name);
		m.setMem_birthdate(mem_birthdate);
		m.setMem_phone(mem_phone);
		m.setMem_email(mem_email);
		m.setMem_addr(mem_addr);
		
	
		
		
		
		int result=new MemberService().insertMember(m);
		
		
		String msg="";
		String loc="";
		String view="/views/common/communityMsg.jsp";
		if(result>0)
		{
			msg="회원가입 성공!";
			loc="/index.jsp";
			
		}
		else
		{
			msg="회원가입 항목을 다시 확인해주세요";
			loc="/views/member/memberEnroll.jsp";
		}
		
		request.setAttribute("msg",msg);
		request.setAttribute("loc", loc);
		System.out.println(loc);
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
