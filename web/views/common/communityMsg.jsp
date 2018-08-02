<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "member.model.vo.Member" %>
<%
	String msg = (String) request.getAttribute("msg");
	String loc = request.getContextPath() + (String) request.getAttribute("loc");
	String script = (String) request.getAttribute("script");
	Member memberLoggedIn = (Member) session.getAttribute("memberLoggedIn");

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	alert('<%= msg %>');
	location.href = "<%= loc %>";
	<%= script != null ? script : "" %>;
</script>

<body>


</body>
</html>