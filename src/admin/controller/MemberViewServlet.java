package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberListServlet
 */
@WebServlet("/memberView")
public class MemberViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m=(Member)request.getSession().getAttribute("memberLoggedIn");

		if(m==null||!m.getMem_id().equals("admin")) {
			request.setAttribute("msg", "잘못된 경로로 접근하였습니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		int cPage;
		int numPerPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}
		catch(NumberFormatException e)
		{
			cPage=1;
		}
		try {
			numPerPage=Integer.parseInt(request.getParameter("numPerPage"));
		}
		catch(NumberFormatException e)
		{
			numPerPage=10;
		}
		List<Member> list=new AdminService().selectMemberList(cPage,numPerPage);
		
		//String pageBar=PageBar.getPageBar(request, cPage, numPerPage);
		int totalContent=new AdminService().selectMemberCount();
		String pageBar="";
		int totalPage=(int)Math.ceil((double)totalContent/numPerPage);
		int barSize=5;
		int pageNo=((cPage-1)/barSize)*barSize+1;
		int pageEnd=pageNo*barSize-1;
		
		if(pageNo==1) {
			pageBar+="<li><a><<</a></li>";
		}
		else {
			pageBar+="<li><a href='"+request.getContextPath()+"/memberView?cPage="+(pageNo-1)+"&numPerPage="+numPerPage+"'><<</a></li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='cPage'><a>"+pageNo+"</a></li>";
			}
			else {
				pageBar+="<li><a href='"+request.getContextPath()+"/memberView?cPage="+pageNo+"&numPerPage="+numPerPage+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='cPage'>"+pageNo+"</a></li>";
		}
		else {
			pageBar+="<li><a href='"+request.getContextPath()+"/memberView?cPage="+pageNo+"&numPerPage="+numPerPage+"'>>></a></li>";
		}
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/admin/memberList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
