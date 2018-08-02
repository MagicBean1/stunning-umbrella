<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="lent.model.vo.LentBike, shop.model.vo.Shop, lent.model.vo.PurchaseTicket" %>
<% 
	LentBike selectLb = (LentBike) request.getAttribute("selectLb");
	PurchaseTicket selectPt = (PurchaseTicket) request.getAttribute("selectPt");
	Shop selectShop = (Shop) request.getAttribute("selectShop");
	String referer = (String) request.getAttribute("referer");
%>
    
<%@ include file= '/views/common/header.jsp' %>

<style>
h1 {
	margin: 50px 0 0 0;
	font-weight: 700;
}
.table {
	margin: 50px 0 30px 0;
}

td {
	font-size: 1.2em;
}

.row {
	font-weight: 700;
	font-size: 1.5em;
}

#btn {
	margin-bottom: 50px; 
	
}

.btn {
	margin: 10px;
}

#cancelReason {
	max-width: 500px;
	margin: 0 auto;
	display: inline;
}
</style>

<script>
$(function() {
	$('#cancel_box').hide();
	
	$("#cancel_btn").click(function() {
		$("#cancel_box").show();
	});
	
	$("#cancelReason").click(function() {
		$("#cancelReason").val("");
	});
	
	$("#cancelBtn").click(function() {
		alert("관리자에게 결제 취소를 요청하였습니다.");
	})
});



</script>

<div class="container text-center">
	<% if(referer.contains("/lentSelect2")) { %>
	<h1>이용권 구매가 완료되었습니다.</h1>
	<% } else { %>
	<h1>이용권 구매내역</h1>
	<% } %>
	<table class="table table-hover table-responsive">
		<tr>
			<td class="row">구매 번호</td>
			<td><%= selectLb.getMerchantUid() %></td>
		</tr>
		<tr>
			<td class="row">이용권 종류</td>
			<td><%= selectPt.getPurchaseMethod() %></td>
		</tr>
		<tr>
			<td class="row">이용권 가격</td>
			<td><%= selectLb.getLentPrice() %></td>
		</tr>
		<tr>
			<td class="row">바이크 종류</td>
			<td><%= selectLb.getBikeId() %></td>
		</tr>
		<tr class="success">
			<td class="row">구매일</td>
			<td><%= selectLb.getBuyDate() %></td>
		</tr>
		<tr class="danger">
			<td class="row">반납일</td>
			<td><%= selectLb.getReturnDate() %></td>
		</tr>
		<tr>
			<td class="row">구매자</td>
			<td><%= selectLb.getBuyerId() %></td>
		</tr>
		<tr>
			<td class="row">대여소</td>
			<td><%= selectShop.getShopName() %></td>
		</tr>
	</table>
	<div id="btn">
		<% if(referer.contains("/memberLentHistory")) { %>
		<button type="button" class="btn btn-primary btn-lg" onclick="location.href='<%= request.getContextPath() %>';">확인</button>
		<button type="button" class="btn btn-primary btn-lg" id="cancel_btn">구매 취소</button>
		
		<div id="cancel_box" class="alert alert-warning">
    		<strong>구매취소</strong> 사유를 입력하세요.<br><br>
    		<form action="<%= request.getContextPath() %>/lent/lentCancel" method="post" id="cancelFrm">
    			<input type="text" class="form-control" name="cancelReason" id="cancelReason" value="취소사유를 입력하세요">
    			<input type="hidden" name="cancelMuid" id="cancelMuid" value="<%= selectLb.getMerchantUid() %>">
                <button type="submit" class="btn btn-primary text-center" id="cancelBtn">전송</button>
    		</form>
  		</div>
  		
		<% } else { %>
		<button type="button" class="btn btn-primary btn-lg" onclick="location.href='<%= request.getContextPath() %>';">확인</button>
		<% } %>
	</div>
</div>

<%@ include file= '/views/common/footer.jsp' %>