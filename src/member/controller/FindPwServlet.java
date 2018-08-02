package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FindPwServlet
 */
@WebServlet("/findPw")
public class FindPwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//아이디, 이메일 확인해서 이메일 주소로 이메일 보내기. 이메일 들어가서 인증번호 적기
		//인증번호 입력해야만 다음으로 넘어가게 하기
		//비밀번호 찾기 버튼 눌렀을때 아이디가 틀렸으면, alert만 나오고 페이지 그대로 두기
		//아이디가 맞으면 비밀번호 변경, 비밀번호 변경 확인 누르기(update)
		String findId=request.getParameter("findId");
		request.setAttribute("findId", findId);
		request.getRequestDispatcher("views/member/findPwChangePw.jsp").forward(request, response);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
