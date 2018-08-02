<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 응답한것을 받아서 처리 */
	//isAble=false 중복이다. isAble=true 사용가능하다.
	boolean isAble=(boolean)request.getAttribute("isAble");
	String mem_id=(String)request.getAttribute("mem_id");
%>
<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>아이디 중복검사</title>
	<style>
		div#checkid-container
		{
			text-align: center;
			padding-top:50px;
		}
		span#duplicated
		{
			color:red;
			font-weight:bold;
		}
		
		
	</style>
	<script>
	//자식창에서도 계속 사용가능한 아이디를 찾을 수 있게 구현한 것
	function openIdChk()
	{
		var mem_id=document.getElementById("mem_id").value.trim();
		if(!mem_id||mem_id.length<4)
		{
		 	alert("아이디는 4글자 이상 가능합니다.");
		 	return;
		}
		//새로 입력한 아이디 값을 저장해주고 부모창으로 보내주는 것
		openIdChkFrm.mem_id.value=mem_id;
		openIdChkFrm.submit();
	}
	
	//아이디 사용 가능하면 부모창(회원가입하는 홈페이지)에 해당 id를 입력해주는 함수. 그리고 자식창은 닫아줌
	function setMem_id(mem_id)
	{
		var frm=opener.document.memberEnroll;
		frm.mem_id.value=mem_id;
		frm.mem_pw.focus(); 
		self.close();
		
		
	}
	
	</script>

</head>
<body>
	<div id="checkid-container">
		<% if(isAble==true) {%>
		[<span><%= mem_id%></span>]는 사용가능합니다.
		<br><br>
		<button type="button" onclick="setMem_id('<%=mem_id%>');">닫기</button>
		<%}
		else {%>
		[<span><%= mem_id%></span>]는 이미 사용중입니다.
		<br><br>
		<form action="<%=request.getContextPath() %>/openIdChk" name="openIdChkFrm" method="post">
			<input type='text' name='mem_id' id='mem_id' placeholder='아이디를 입력하세요'/>&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="openIdChk();">아이디중복검사</button>
		</form>
		<%} %>
	</div>
</body>
</html>