<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gift.model.vo.Gift" %>
<% 
	Gift selectGift = (Gift) request.getAttribute("selectGift");
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
</style>
<script>
	
</script>

<div class="container text-center">
	
	<h1><%= selectGift.getSendMemId() %> 님께 선물하기가 완료되었습니다!</h1>
	
</div>

<%@ include file= '/views/common/footer.jsp' %>