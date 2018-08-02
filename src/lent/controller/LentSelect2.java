package lent.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bike.model.vo.BikePrice;
import lent.model.service.LentService;
import lent.model.vo.LentBike;

/**
 * Servlet implementation class LentSelect2
 */
@WebServlet("/lent/lentSelect2")
public class LentSelect2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LentSelect2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//데이터 받아오기
		/*String merchantUid = (String)request.getParameter("merchantUid");*/
		/*int lentPrice = Integer.parseInt(request.getParameter("lentPrice"));*/
		/*String buyerId = (String)request.getParameter("buyerId");*/
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
		        
		        request.setAttribute("lentPrice", lentPrice);
		        request.setAttribute("methodNum", methodNum);		
				request.setAttribute("shopId", shopId);
				request.setAttribute("bikeId", bikeId);		
				request.setAttribute("buyDate", buyDate);
				request.setAttribute("returnDate", returnDate);
		        request.getRequestDispatcher("/views/lent/lentConfirm.jsp").forward(request, response);
		    	}
		        catch(ParseException e)
		        {
		            // 예외 처리
		        }

				
		/*//jdbc 작업 : 결제완료되면  할 부분, 시험용으로 DB삽입되는지 넣어봄
		LentBike lb = new LentBike(merchantUid,methodNum,bikeId,buyDate,returnDate,buyerId,shopId,lentPrice);
		System.out.println(lb);
	
		//DB입력  -->결제완료되면  할 부분, 시험용으로 DB삽입되는지 넣어봄
		int result = new LentService().insertLent(lb);*/
		


		/*request.setAttribute("methodNum", methodNum);		
		request.setAttribute("shopId", shopId);
		request.setAttribute("bikeId", bikeId);		
		request.setAttribute("buyDate", buyDate);
		request.setAttribute("returnDate", returnDate);
		
		
		request.getRequestDispatcher("/views/lent/lentConfirm.jsp").forward(request, response);*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
