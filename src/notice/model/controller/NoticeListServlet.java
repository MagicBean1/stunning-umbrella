package notice.model.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet("/notice/noticeList")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	/*int noticeNo = Integer.parseInt( request.getParameter(""));*/
	int numPerPage =10;
	int cPage;
		try {
//				값이 null이라  캐치문 실행
				cPage= Integer.parseInt(request.getParameter("cPage"));
				
		}catch (Exception e) {
			cPage=1;
			
		}
		
		
		List<Notice> list = new NoticeService().selectNoticeList(cPage,numPerPage);
		/*int coCount = new NoticeService().commentCount(list.get);*/
		/*페이지 선언!
		====사용 변수====
		1. cPage : 현재 페이지
		2. numPerPage : 페이지당 자료수
		3. totalContent : 총 자료수 (데이터 수) 
		4. totalPage : 총 페이지수 
		5. pageBarSize : 페이지 표시숫자 수(바 형식)
		6. pageNo : pageBar에 표시되는 처음숫자
		7. pageEnd : pageBar에 표시되는 끝숫자*/
		
		
		
//		pageBar 생성!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//		전체자료수
		int totalContent = new NoticeService().selectNoticeCount();
//		전체 page수
		int totalPage =(int) Math.ceil((double)totalContent/numPerPage);
//		페이지번호 1~5
		int barSize = 5;  
//		이전 ,페이지번호,다음 넣을 변수
		String pageBar="";
//		pageBar에 표시되는 처음숫자
		int pageNo = ((cPage-1)/barSize) * barSize+1;
//		pageBar에 표시되는 마지막숫자
		int pageEnd = pageNo+barSize-1;
		
//		pageBar 만들기
		/*
		====사용 변수====
				1. cPage : 현재 페이지
				2. numPerPage : 페이지당 자료수
				3. totalContent : 총 자료수 (데이터 수) 
				4. totalPage : 총 페이지수 
				5. pageBarSize : 페이지 표시숫자 수(바 형식)
				6. pageNo : pageBar에 표시되는 처음숫자
				7. pageEnd : pageBar에 표시되는 끝숫자*/
//		pageNo이 처음엔 1
		if(pageNo ==1) {
			pageBar += "<ul class='"+"pagination"+"'><li><span>&laquo;</span></li></ul>";
					
					
		}else {													/*현재페이지 연결*/
			pageBar += "<ul class='"+"pagination"+"'><li><a href='"+request.getContextPath()+"/notice/noticeList?cPage="+(pageNo-1)+"' ><span>&laquo;</span></a></li></ul>";
		}
		while(!(pageNo > pageEnd|| pageNo>totalPage)) {
			if(cPage == pageNo) { 
				pageBar += "<ul class='"+"pagination"+"'><li><span>"+pageNo+"</span></li></ul>";  /*현재페이지와 페이지번호가 같으면 그번호를 span으로 해버려서 클릭할 수 없게함*/
			}else {  				 /*나머지 페이지는 누를수 있게해놈*/                                
				pageBar += "<ul class='"+"pagination"+"'><li><a href='"+request.getContextPath()+"/notice/noticeList?cPage="+pageNo+"' >"+pageNo+"</a></li></ul>";
				//             
			}
			pageNo++;
		}
		
		
		if(pageNo > totalPage) {
			pageBar+="<ul class='"+"pagination"+"'><li><span>&raquo;</span></li></ul>";
		}else {
			pageBar += "<ul class='"+"pagination"+"'><li><a href='"+request.getContextPath()+"/notice/noticeList?cPage="+pageNo+"' ><span>&raquo;</span></a></li></ul>";
		}
		request.setAttribute("list", list);
		
		request.setAttribute("cPage", cPage);
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("totalContent", totalContent);
		request.getRequestDispatcher("/views/notice/noticeList.jsp").forward(request, response);
		
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
