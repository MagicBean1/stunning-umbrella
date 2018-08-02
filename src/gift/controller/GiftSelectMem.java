package gift.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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

import bike.model.vo.BikePrice;
import gift.model.service.GiftService;
import lent.model.service.LentService;
import member.controller.MyAuthentication;
import member.model.vo.Member;

/**
 * Servlet implementation class PresentSelectMem
 */
@WebServlet("/gift/giftSelectMemPhone")
public class GiftSelectMem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GiftSelectMem() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String presentUid = (String)request.getParameter("sendEmail");
				String giftSelectPhone = (String)request.getParameter("giftSelectPhone");
				System.out.println(giftSelectPhone+"번호파라미터");
				//휴대폰번호를 받아서 입력한 휴대폰번호와 일치하는 회원의 이름, ID를 찾아옴 = bikeId의 가격
				Member m = new GiftService().selectMemPhone(giftSelectPhone);
				System.out.println(giftSelectPhone+"가져온번호");
				
				//선물받을 사람
				String sendMemId = m.getMem_id();
				String sendEmail = m.getMem_email();

				//값 받아오기
				int methodNum = Integer.parseInt(request.getParameter("methodNum"));		
				String shopId = (String) request.getParameter("shopId");
				String bikeId = (String) request.getParameter("bikeId");						
				
		
				//대여료 계산하기 위해 필요한 bike_type -> price
				//고유 ID를 받아서 sql join 이용 하여 자전거 가격을 찾아옴 b = bikeId의 가격
				BikePrice b = new LentService().selectBikePrice(bikeId);
				System.out.println(b.getPrice());
								
				//날짜 받아오기
				String bDate = (String)request.getParameter("bDate");
				String rDate = (String)request.getParameter("rDate");
				//시간받아오기
				String bTime = (String)request.getParameter("bTime");
				String rTime = (String)request.getParameter("rTime");
				//날짜+시간 합침
				String buyDate = bDate+" "+bTime;
				String returnDate =rDate+" "+rTime;
				
				//yyyy-MM-dd + HH:mm
				System.out.println(buyDate);
				System.out.println(returnDate);
				
						

				//받은 대여/반납 시간을 db에 삽입하기 위해  lentBike vo객체에 있는 변수명과 동일하게 붙여줌.
				//대여시간에서 반납시간의 분 차이를 구하여 대여로를 계싼하는 로직
				String date2 = buyDate;
				String date1 = returnDate;
				 
				// String -> Date 로 캐스팅하면서 생기는 예외 발생으로 예외처리
				    try{ 
				        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				        // String date1, date2 를 Date로 parsing하는 과정
				        Date FirstDate = format.parse(date1);
				        Date SecondDate = format.parse(date2);
				        //parse 후 time을 가져옴
				        long FirstDateTime = FirstDate.getTime();
				        long SecondDateTime = SecondDate.getTime();
				        //분으로 대여시간 계산
				        long minute = (FirstDateTime-SecondDateTime)/60000;
				        
				        System.out.println(minute+"분 대여함");
				        
				        //분단위기때문에 60으로 나눠준 뒤 계산
				        System.out.println("대여료: "+(int)(minute/60*b.getPrice()));
				        
				        //서블릿에서 계산 후 최종 결제값이 옮겨짐
				        int lentPrice = (int)(minute/60*b.getPrice());
				        request.setAttribute("presentUid", presentUid);
				        request.setAttribute("sendMemId",sendMemId);
				        request.setAttribute("lentPrice", lentPrice);
				        request.setAttribute("methodNum", methodNum);		
						request.setAttribute("shopId", shopId);
						request.setAttribute("bikeId", bikeId);		
						request.setAttribute("buyDate", buyDate);
						request.setAttribute("returnDate", returnDate);
				        request.getRequestDispatcher("/views/gift/giftConfirm.jsp").forward(request, response);
				    	}
				        catch(ParseException e)
				        {
				            // 예외 처리
				        }

				
				
				    	/*테스트*/
				    
				    Properties props=System.getProperties();
				    
			    	props.put("mail.smtp.user", "hellostella226@gmail.com"); //서버 아이디
			    	props.put("mail.smtp.host","smtp.gmail.com"); //구글 SMTP
			    	props.put("mail.smtp.starttls.enable", "true");
			    	props.put("mail.smtp.auth", "true");
			    	props.put("mail.smtp.port","465");
			    	props.put("mail.smtp.socketFactory.port","465");
			    	props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
			    	props.put("mail.smtp.socketFactory.fallback", "false");
				    
			    	props.put("mail.smtp.ssl.enable", "true");
			    	props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
			    	props.put("mail.smtp.dubug", "true");
			    	
			    	Authenticator auth1=new MyAuthentication();
			    	
			    	//session 생성 및 MimeMessage 생성
			    	Session session=Session.getDefaultInstance(props,auth1);
			    	MimeMessage msgs=new MimeMessage(session);
			    	
			    	try {
			    		//편지보낸시간
			    		msgs.setSentDate(new Date());
			    		
			    		InternetAddress from=new InternetAddress("hellostella226@gmail.com");
			    		
			    		//이메일 발신자
			    		msgs.setFrom(from);
			    		
			    		//이메일 수신자
			    		String email= m.getMem_email(); //사용자가 입력한 이메일 받아오기
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
			    	
	}
			    	
			    	
			    	
			    	
			    	
			        	
			        	
			    		
			    	
				
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
