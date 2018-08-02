<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="lent.model.vo.LentBike, lent.model.vo.LentCancel, java.util.*" %>
<%
	String referer = (String) request.getAttribute("referer");
	List<LentCancel> cancelList = (List<LentCancel>) request.getAttribute("cancelList");
%>
<!-- 일반회원 -> lentConfirm / 관리자 -> null -->
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

#chkBtn {
	float: right;
	padding: 0px 10px;

}

#stateReason {
	max-width: 300px;
	margin: 0 auto;
	display: inline-block;
}

#chkBtn2 {
	display: inline-block;
}

#cancelState {
	width: 100px;
	margin: 0 auto;
	display: inline-block;
}

</style>

<script>

$(function() {
	$('#chkBox').hide();
	
	$(".chkBtn").click(function() {
		$("#chkBox").show();

		var chkBtn = $(this);
		
		var tr = chkBtn.parent().parent();
		var td = tr.children();
		
		var cancelMuid = td.eq(0).text();
		var cancelReason = td.eq(1).text();
		
		$("#cancelMuid").attr("value", cancelMuid);
		$("#cancelReason").attr("value", cancelReason);
		
	});
	
	$("#stateReason").click(function() {
		$("#stateReason").val("");
	});
	
	
});

</script>

<% if(referer.contains("/lentConfirm?merchantUid")) { %>
<script>
	$(function() {
		location.href="<%= request.getContextPath() %>/memberLentHistory?memId=<%=memberLoggedIn.getMem_id()%>";
	})
</script>
<% } else { %>
<div class="container">
	<div class="jumbotron text-center">
		<h1>이용권 결제 취소 요청</h1>
	</div>
	
	<table class="table table-hover">
		<thead>
			<tr>
				<th>취소 요청 구매번호</th>
				<th>취소 요청 이유</th>
				<th>취소 상태</th>
				<th colspan="2">취소 상태 이유</th>
			</tr>
		</thead>
		<tbody>
			<% for(LentCancel lc : cancelList) { %>
			<tr>
				<td><%= lc.getCancelMuid() %></td>
				<td><%= lc.getCancelReason() %></td>
				<td><%= lc.getCancelState() %></td>
				<td><%= lc.getStateReason() %></td>
				<td><button type="button" class="btn btn-primary btn-sm chkBtn">확인</button></td>
			</tr>
			<% } %>
		</tbody>
	</table>
	
	<div id="chkBox" class="alert alert-danger text-center">
   		<strong>구매취소 처리</strong><br><br>
   		<form action="<%= request.getContextPath() %>/lent/lentCancelAdmin" method="post" id="chkFrm">
   			<select class="form-control" name="cancelState" id="cancelState">
    			<option>YES</option>
   				<option>NO</option>
  				</select>
   			<input type="text" class="form-control" name="stateReason" id="stateReason" value="메시지를 입력하세요.">
   			<input type="hidden" name="cancelMuid" id="cancelMuid">
   			<input type="hidden" name="cancelReason" id="cancelReason">
            <button type="submit" class="btn btn-primary text-center" id="cancelBtn">전송</button>
   		</form>
	</div>
</div>
<% } %>
<%@ include file= '/views/common/footer.jsp' %>