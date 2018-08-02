package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberLoginServlet
 */
@WebServlet("/member/memberLogin")
public class MemberLoginServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String mem_id = (String) request.getParameter("memId");
      String mem_pw = (String) request.getParameter("memPw");
      String referer = request.getHeader("referer");
      
      Member m = new MemberService().selectOne(mem_id);
      
      String msg = "";
      String view = "/views/common/msg.jsp";
      
      if(m != null) { // DA에 계정이 존재하면
         if(m.getMem_pw().equals(mem_pw)) { // 로그인 창에서 입력받은 비밀번호와 DB에 저장된 비밀번호가 같다면 
            msg = "로그인 되었습니다.";
            HttpSession session = request.getSession();
            session.setAttribute("memberLoggedIn", m); // 로그인 세션 생성
            
            String saveId = request.getParameter("saveId");
            
            // checkBox에 체크되어있으면 아이디 저장
            if(saveId != null) { // checkbox에 체크여부 확인
               Cookie c = new Cookie("saveId", mem_id);
               c.setMaxAge(365*24*60*60); // session을 언제까지 유지할지 지정.
               c.setPath("/"); // Cookie의 저장 경로
               response.addCookie(c);
            } else {
               // Cookie값 삭제!
               Cookie c = new Cookie("saveId", mem_id);
               c.setMaxAge(0); // 저장하는 기간 0 => 삭제
               c.setPath("/");
               response.addCookie(c);
            }
            
         } else { // 두 비밀번호가 틀리다면
            msg = "비밀번호가 다릅니다. 비밀번호를 확인하세요";
         }
      } else { // 계정이 존재하지 않으면
         msg = "아이디가 없습니다. 아이디를 확인하세요";
      }
      request.setAttribute("msg", msg);
      request.setAttribute("referer", referer);
      request.setAttribute("memId",mem_id);
      request.setAttribute("mempw",mem_pw);
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