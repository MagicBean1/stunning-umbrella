<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
   String msg = (String)request.getAttribute("msg");
   String loc = (String)request.getAttribute("loc");
   String referer = (String)request.getAttribute("referer");
   
%>
<body>
   <script>
    alert('<%=msg%>');
	location.href = "<%=referer %>";
   </script>
</body>
</html>