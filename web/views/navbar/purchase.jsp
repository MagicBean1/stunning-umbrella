<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file= '/views/common/header.jsp' %>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<style>
.jumbotron {  
    background-image: url(<%= request.getContextPath() %>/images/jumbo.jpg);
    background-size: cover;
    color: #fff;
}
</style>
<script>

</script>

<div class="jumbotron text-center">
	<h1>이용권 구매</h1>
	<p>다양한 종류의 이용권으로 BIKEE를 즐기세요</p>
	
</div>

<%@ include file= '/views/common/footer.jsp' %>