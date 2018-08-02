package community.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import community.model.service.CommunityService;
import community.model.vo.Community;


/**
 * Servlet implementation class CommunityFormEndServlet
 */
@WebServlet("/community/communityFormEnd")
public class CommunityFormEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityFormEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "게시판 작성 오류![form:enctype관리자에게 문의하세요.]");
			request.setAttribute("loc", "/"); // "/"메인페이지로 가라는 소리
			request.getRequestDispatcher("/views/common/communityMsg.jsp").forward(request, response);
			return;
		}
		String root = getServletContext().getRealPath("/");
		String saveDir=root+"upload"+File.separator+"community";
		
		int maxSize=1024*1024*10;
		
		MultipartRequest mpreq = new MultipartRequest(request, saveDir, maxSize,"utf-8",new DefaultFileRenamePolicy());
		
		String title = mpreq.getParameter("title");
		String writer = mpreq.getParameter("writer");
		request.setCharacterEncoding("utf-8");
		String content =mpreq.getParameter("content");
		String origin = mpreq.getOriginalFileName("file");
		String rename = mpreq.getFilesystemName("file");
		
		Community c = new Community();
		c.setCommunityWriter(writer);
		c.setCommunityTitle(title);
		c.setCommunityContent(content);
		c.setOriginalFileName(origin);
		c.setRenameFileName(rename);
		
		int result = new CommunityService().insertCommunity(c);
		String msg="";
		String loc="/community/communityList";
		if(result>0) {
			msg="게시판 등록이 되었습니다.";
		}else {
			msg="게시판 등록이 되지 않았습니다.";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/communityMsg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
