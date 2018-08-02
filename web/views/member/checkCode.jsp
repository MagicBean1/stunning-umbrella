<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='/views/common/header.jsp' %>
<%
	String findId=(String)request.getAttribute("findId");
%>
<style>
form.form-horizontal{margin-top:100px;width:300px;margin-left:750px;margin-bottom:100px;}
</style>
<script>

$(function(){
	$('#CodeChk').click(function(){
		var v1=$('#checkCode').val().trim();
		var v2=$('#code_check').val().trim();
		var divfindEmailNum=$('#divfindEmailNum');
		
		if(v1!=v2)
		{
			
			divfindEmailNum.removeClass("has-success");
			divfindEmailNum.addClass("has-error"); 
			
			alert("인증번호를 정확하게 입력해주세요");
			
			return false;
		}
		else
		{
			divfindEmailNum.removeClass("has-error");
			divfindEmailNum.addClass("has-success");
	
			return true;
		}	
	});
});
	
	





</script>
<form class="form-horizontal" id="form2" method="post" action="<%=request.getContextPath()%>/findPw?findId=<%=findId %>" onsubmit="return">
<div class="form-group">
  <h1>비밀번호 찾기</h1><br>
  <p>인증번호를 입력해주세요</p>
 	<div class="form-group" id="divfindEmailNum">
	   <label for="findEmailNum">인증번호</label>
	   <input type="text" name="checkCode" id="checkCode" class="form-control"  name="findEmailNum" id="findEmailNum" maxlength=5 requried/>
	   <input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=request.getAttribute("code") %>"/>
	   <input type="hidden" name="findId" value="<%=findId %>"/>
	 </div>
	 <div class="form-group text-center">
	 	<button id="CodeChk" class="btn btn-info">비밀번호찾기</button>
      </div>
</div>
</form>

<%@ include file='/views/common/footer.jsp' %>