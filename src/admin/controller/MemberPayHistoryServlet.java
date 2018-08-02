package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import community.model.service.CommunityService;
import community.model.vo.Community;
import lent.model.service.LentService;
import lent.model.vo.LentBike;

/**
 * Servlet implementation class MemberPayHistoryServlet
 */
@WebServlet("/member/PayHistory")
public class MemberPayHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPayHistoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String content = request.getParameter("content");
		String opt = request.getParameter("opt");
		int numPerPage = 10;
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		List<LentBike> list = new LentService().memberPayList(cPage,numPerPage,content,opt);
		int totalContent = new LentService().payListCount();
		int totalPage = (int)Math.ceil((double)totalContent/numPerPage);
		int barSize=5;
		String pageBar="";
		int pageNo = ((cPage-1)/barSize)*barSize+1;
		int pageEnd = pageNo*barSize-1;
		
		if(pageNo==1) {
			pageBar+="<li><a><<</a></li>";
		}else {
			pageBar+="<li><a href='"+request.getContextPath()+"/member/PayHistory?cPage="+(pageNo-1)+"&numPerPage="+numPerPage+"'><<</a></li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='cPage'><a>"+pageNo+"</a></li>";
			}else {
				pageBar+="<li><a href='"+request.getContextPath()+"/member/PayHistory?cPage="+pageNo+"&numPerPage="+numPerPage+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='cPage'><a>>></a></li>";
		}else {
			pageBar+="<li><a href='"+request.getContextPath()+"/member/PayHistory?cPage="+pageNo+"&numPerPage="+numPerPage+"'>>></a></li>";
		}
		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		request.getRequestDispatcher("/views/admin/memberPayList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
