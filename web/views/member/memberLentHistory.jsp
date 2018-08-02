<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="lent.model.vo.LentBike, java.util.List, lent.model.vo.LentCancel" %>
<%
	List<LentBike> list = (List<LentBike>) request.getAttribute("list");
%>
<%@ include file= '/views/common/header.jsp' %>
<style>
.jumbotron{
	background-image: url("<%=request.getContextPath() %>/images/jumbo.jpg");
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: 100%;
}

.jumbotron h1 {
	color: white;
	font-weight: 500;
}
	
#pp {
	margin-top: 30px;
	float: right;
	font-style: italic;
}

#selectFrm {
	display: inline-block;
	margin: 20px 0px 10px;
	float: left;
}

table {
	margin: 0px 0px 50px 0px;
}

thead {
	font-size: 1.3em;
	font-weight: 700;
	background-color: rgb(7, 48, 110);
	color: white;
}

#btn {
	position: relative;
	left: 47%;
	
}

.btn {
	margin: 10px;
	floag: right;
	margin-bottom: 100px;
}

</style>
<script>
</script>

<div class="container">
	<div class="jumbotron text-center">
		<h1>이용권 구매내역</h1>
	</div>
	
	<p id="pp">구매번호를 클릭하면 상세 정보가 나옵니다.</p>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>구매번호</th>
				<th>이용권 가격</th>
				<th>바이크 종류</th>
				<th>구매자</th>
			</tr>
		</thead>
		<tbody>
			<% for(LentBike lb : list) { %>
			<tr>
				<td><a href="<%= request.getContextPath() %>/lent/lentConfirm?merchantUid=<%= lb.getMerchantUid() %>&methodNum=<%=lb.getMethodNum()%>&bikeId=<%=lb.getBikeId()%>&buyDate=<%=lb.getBuyDate()%>&returnDate=<%=lb.getReturnDate()%>&buyerId=<%=lb.getBuyerId()%>&shopId=<%=lb.getShopId()%>&lentPrice=<%=lb.getLentPrice()%>"><%= lb.getMerchantUid() %></a></td>
				<td><%= lb.getLentPrice() %></td>
				<td><%= lb.getBikeId() %></td>
				<td><%= lb.getBuyerId() %></td>
			</tr>
			<% } %>
		</tbody>
	</table>
	<div id="btn">
		<button type="button" class="btn btn-primary btn-lg" onclick="location.href='<%= request.getContextPath() %>';">확인</button>
	</div>
</div>
<%@ include file= '/views/common/footer.jsp' %>