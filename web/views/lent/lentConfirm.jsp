<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="lent.model.vo.LentBike, bike.model.vo.Bike, shop.model.vo.Shop, bike.model.vo.BikePrice" %>
<%
	int methodNum = (int) request.getAttribute("methodNum");
	String shopId = (String) request.getAttribute("shopId");
	String bikeId = (String) request.getAttribute("bikeId");
	String buyDate =  (String) request.getAttribute("buyDate");
	String returnDate = (String) request.getAttribute("returnDate");
	int lentPrice = (int)request.getAttribute("lentPrice");;
%>
<%@ include file= '/views/common/header.jsp' %>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script> <!-- 아임포트 -->

<!-- 결제 script -->
<script>

IMP.init('imp83689208'); // 가맹점 식별코드. 결제완료 후 고유id로 나옴.

IMP.request_pay({
    pg : 'inicis', // version 1.1.0부터 지원.
    pay_method : 'card',
    merchant_uid : 'mUid' + new Date().getTime(), // 가맹점에서 생성/관리하는 고유 주문번호
    name : '<%= bikeId %>',
    amount :  '<%= lentPrice %>',
    buyer_email : '<%= memberLoggedIn.getMem_email() %>',
    buyer_name : '<%= memberLoggedIn.getMem_name() %>',
    buyer_tel : '<%= memberLoggedIn.getMem_phone() %>',
    buyer_addr : '<%= memberLoggedIn.getMem_addr() %>',
}, 

function(rsp) {
    if ( rsp.success ) { // success => 결제 성공 / 완료 여부 판단. boolean
        var msg = '결제가 완료되었습니다.\n';
        msg += '고유ID : ' + rsp.imp_uid + "\n"; 
        msg += '고유번호 : ' + rsp.merchant_uid + "\n";
        msg += '결제 금액 : ' + rsp.paid_amount + "\n";
        msg += '카드 승인번호 : ' + rsp.apply_num + "\n";
		location.href = "<%= request.getContextPath() %>/lent/lentConfirm?merchantUid="+rsp.merchant_uid+"&methodNum=<%=methodNum%>&bikeId=<%=bikeId%>&buyDate=<%=buyDate%>&returnDate=<%=returnDate%>&buyerId=<%=memberLoggedIn.getMem_id()%>&shopId=<%=shopId%>&lentPrice=<%=lentPrice%>";
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
    }
    alert(msg);
});
</script>

<%@ include file= '/views/common/footer.jsp' %>