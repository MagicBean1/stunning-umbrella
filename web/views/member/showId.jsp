<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String showId=(String)request.getParameter("showId");
%>
<%@ include file='/views/common/header.jsp' %>

<style>
div.showId{height:75px;width:450px;margin-left:700px;margin-bottom:200px;margin-top:200px;border:1px solid black;
font-size:20px; text-align:center;font-family:"spoqa-han-sans"}
</style>

<div class="showId">
	<p>회원님의 아이디는 아래와 같습니다.</p><%=showId %>
</div>

<%@ include file='/views/common/footer.jsp' %>