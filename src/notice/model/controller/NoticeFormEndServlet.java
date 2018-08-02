package notice.model.controller;

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

import notice.model.service.NoticeService;
import notice.model.vo.Notice;




/**
 * Servlet implementation class NoticeFormEndServlet
 */
@WebServlet("/notice/noticeFormEnd")
public class NoticeFormEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeFormEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
/*//			파일 업로드!!
		
//		파일 업로드는 그냥 못하고 cos.jar파일(라이브러리)을 이용해서 제공
//		파일이 업로드되면 서버에 저장할 이름 다시 지정  > 겹쳐지지 않게 하기 위해
		
		1. 파일이 제대로 들어왔는지 확인!! (multipart가 제대로 왔는지)
		2. 저장할 디렉토리 지정
		3. 파일의 크기를 설정
		4. 파라미터값을 가져옴
		5. notice객체를 생성
		6. 비지니스 로직 수행
		7. VIEW 응답페이지 작성
//		업로드시 멀티파트가 있나 없으면 실행
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "게시판 작성오류 !! [form:enctype 관리자에게 문의하세요.]");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		2. 저장경로설정
		먼저 저장할 곳의 폴더 생성!!
		String  root= getServletContext().getRealPath("/");
		System.out.println(root);
		String saveDir = root+"upload"+File.separator+"notice";
		System.out.println(saveDir);
//		root+"upload"+File.separator+"notice";
		
		
//		3.파일 크기 설정
		int maxSize= 1024*1024*10; 100MB
		
//		4.파일을 업로드하는 객체를 생성!  생성과 동시에 업로드
		MultipartRequest생성자의 매개변수
		 
		(   HttpServletRequest,saveDir(저장폴더),파일크기,문자셋(UTF-8),리네임을 처리할 수 있는 객체(new DefaultFileRenamedPolicy)  )
		
		
		MultipartRequest mpreq=new MultipartRequest(request, saveDir,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		
//		파일업로드 끘!!
		
//		이제 비지니스로직 구성
		
//		6.파라미터가져오기 (MultipartRequest이용해서)
		String title=mpreq.getParameter("title");
		String writer=mpreq.getParameter("writer");
//		사용자가 올린이름의 파일명!!을 가져옴
		String origin=mpreq.getOriginalFileName("up_file");
//		정책에 rename된 파일명
		String rename=mpreq.getFilesystemName("up_file");
		String content=mpreq.getParameter("content");*/
		
		
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		String referer = request.getHeader("referer");
		
		
		Notice notice = new Notice();
		notice.setNoticeTitle(title);
		notice.setNoticeWriter(writer);
		notice.setNoticeContent(content);
	
		
//		DAO갔다 오기
		int result = new NoticeService().insertNotice(notice);
		String msg = "";
		String loc = "/notice/noticeList";
		
		if(result >0) {
			msg="게시판 등록 성공!!";
			
			
		}else {
			msg="게시판 등록 실패!!";
			
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.setAttribute("referer", referer); 
		
		request.getRequestDispatcher("/views/common/communityMsg.jsp").forward(request,response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
