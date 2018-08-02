package member.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class SendEmailServlet
 */
@WebServlet("/sendEmail")
public class SendEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public SendEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//id가 틀리면 화면 안넘어가고 alert 뜨게하기
		
		//먼저 아이디 확인
		String findId=(String)request.getParameter("findId");
		System.out.println("SendEmailServlet"+findId);
		boolean isAble=new MemberService().checkId2(findId);//아이디 값이 있으면 false, 아이디 값 사용 가능
		String msg="";
		String loc="";
		String view="";
		if(isAble==true)
		{
			msg="아이디를 다시 입력해주세요";
			loc="/views/member/findPw.jsp";
			view="/views/common/msg.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher(view).forward(request, response);
			return;
		}
		else
		{
			msg="이메일에서 인증번호를 확인해주세요";
			request.setAttribute("msg", msg);
	 		request.setAttribute("isAble", isAble);
	 		request.setAttribute("findId", findId);
	 		
	 		Properties props=System.getProperties();
	    	props.put("mail.smtp.user", "hiek2003@gmail.com"); //서버 아이디
	    	props.put("mail.smtp.host","smtp.gmail.com"); //구글 SMTP
	    	props.put("mail.smtp.starttls.enable", "true");
	    	props.put("mail.smtp.auth", "true");
	    	props.put("mail.smtp.port","465");
	    	props.put("mail.smtp.socketFactory.port","465");
	    	props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
	    	props.put("mail.smtp.socketFactory.fallback", "false");
	    	
//	    	props.put("mail.smtp.ssl.enable", "true");
//	    	props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
//	    	props.put("mail.smtp.dubug", "true");
	    	
	    	Authenticator auth=new MyAuthentication();
	    	
	    	//session 생성 및 MimeMessage 생성
	    	Session session=Session.getDefaultInstance(props,auth);
	    	MimeMessage msgs=new MimeMessage(session);
	    	
	    	//debug용
	    	session.setDebug(true);
	    	
	    	try {
	    		//편지보낸시간
	    		msgs.setSentDate(new Date());
	    		
	    		InternetAddress from=new InternetAddress("hiek2003@gmail.com");
	    		
	    		//이메일 발신자
	    		msgs.setFrom(from);
	    		
	    		//이메일 수신자
	    		String email=request.getParameter("findEmail");//사용자가 입력한 이메일 받아오기
	    		InternetAddress to=new InternetAddress(email);
	    		msgs.setRecipient(Message.RecipientType.TO, to);
	    		
	    		//이메일 제목
	    		msgs.setSubject("비밀번호 인증번호","UTF-8");
	    		
	    		//이메일 내용
	    		String code=request.getParameter("code_check");//인증번호 값 받기
	    		request.setAttribute("code", code);
	    		msgs.setText(code,"UTF-8");
	    		
	    		//이메일 헤더
	    		msgs.setHeader("content-Type", "text/html");
	    		
	    		//메일 보내기
	    		Transport.send(msgs);
	    		System.out.println("메일 발송!");
	    		
	    	}catch(AddressException e) {
	    		e.printStackTrace();
	    	}catch(MessagingException e) {
	    		e.printStackTrace();
	    	}
	
	 	    RequestDispatcher rd=request.getRequestDispatcher("/views/member/checkCode.jsp");
	     	rd.forward(request, response);
	     	
	     	class MyAuthentication extends Authenticator{
	     		
	     		PasswordAuthentication pa;
	     		
	     		public MyAuthentication() {
	     			
	     			String id = "hellostella226";
	     			String pw = "Wkdtlfna119";
	     			
	     			pa = new PasswordAuthentication(id, pw);
	     			
	     		}
	     		
	     		public PasswordAuthentication getPasswordAuthentication() {
	     			
	     			return pa;
	     		}
	     		
	     	}
	     	
	    	
	    }
	   
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
       
}
   
