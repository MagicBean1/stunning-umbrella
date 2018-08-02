package lent.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lent.model.service.LentService;
import lent.model.vo.LentBike;
import lent.model.vo.PurchaseTicket;
import shop.model.vo.Shop;

/**
 * Servlet implementation class LentConfirm
 */
@WebServlet("/lent/lentConfirm")
public class LentConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LentConfirm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String merchantUid = request.getParameter("merchantUid");
		int methodNum = Integer.parseInt(request.getParameter("methodNum"));
		String bikeId = request.getParameter("bikeId");		
		String buyDate = request.getParameter("buyDate");
		String returnDate = request.getParameter("returnDate");
		String buyerId = request.getParameter("buyerId");
		String shopId = request.getParameter("shopId");
		int lentPrice = Integer.parseInt(request.getParameter("lentPrice"));
		
		// 이전 페이지 url 확인
		String referer = request.getHeader("referer");
		// 이용권 구매시에는 InsertLentDAO 실행.
		if(referer.contains("/lentSelect2")) {
			LentBike lb = new LentBike(merchantUid,methodNum,bikeId,buyDate,returnDate,buyerId,shopId,lentPrice);
			// DB저장
			new LentService().insertLent(lb);
			// 저장된 데이터를 가져온다. lentConfirmEnd.jsp에 출력용
			LentBike selectLb = new LentService().selectLentBike(merchantUid);
			
			// 이용권 이름, 대여소 이름 불러오기. End.jsp 출력용
			PurchaseTicket selectPt= new LentService().selectPurchaseTicket(methodNum);
			Shop selectShop = new LentService().selectShop(shopId);
			
			request.setAttribute("selectLb", selectLb);
			request.setAttribute("selectPt", selectPt);
			request.setAttribute("selectShop", selectShop);
			request.setAttribute("referer", referer);
			request.getRequestDispatcher("/views/lent/lentConfirmEnd.jsp").forward(request, response);
		} else {
			LentBike selectLb = new LentService().selectLentBike(merchantUid);
			
			// 이용권 이름, 대여소 이름 불러오기. End.jsp 출력용
			PurchaseTicket selectPt= new LentService().selectPurchaseTicket(methodNum);
			Shop selectShop = new LentService().selectShop(shopId);
			
			request.setAttribute("selectLb", selectLb);
			request.setAttribute("selectPt", selectPt);
			request.setAttribute("selectShop", selectShop);
			request.setAttribute("referer", referer);
			request.getRequestDispatcher("/views/lent/lentConfirmEnd.jsp").forward(request, response);
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
