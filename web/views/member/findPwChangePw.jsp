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
 $('#changePw').blur(function(event){
	 divChangePw=$('#divChangePw');
		 if($('#changePw').val()==""){
			 divChangePw.removeClass("has-success");
			 divChangePw.addClass("has-error");
		 }
		 else{
			 divChangePw.removeClass("has-error");
			 divChangePw.addClass("has-success");
		 }
	 });
	 
	 $('#changePw2').blur(function(event){
		 divChangePw2=$('#divChangePw2');
		 if($('#changePw2').val()==""){
			 divChangePw2.removeClass("has-success");
			 divChangePw2.addClass("has-error");
		 }
		 else if($('#changePw2').val()!=$('#changePw2').val()){
			alert("패스워드가 일치하지 않습니다.");
			divChangePw2.removeClass("has-success");
			divChangePw2.addClass("has-error");
		 }
		else{
			divChangePw2.removeClass("has-error");
			divChangePw2.addClass("has-success");
		 }
	 }); 
});	 

function ChangePwChk(){
	 if($('#changePw').val().trim()==""){
			alert("패스워드를 입력하여 주시기 바랍니다.");
			
			return false;
		}else{
			divChangePw.removeClass("has-error");
			divChangePw.addClass("has-success");
			
		}
		//패스워드 확인
		if($('#changePw2').val().trim()==""){
			alert("패스워드 확인을 입력하여 주시기 바랍니다.");
			
			return false;
		}else{
			divChangePw2.removeClass("has-error");
			divChangePw2.addClass("has-success");
			
		} 
		//패스워드 비교
		if($('#changePw').val()!=$('#changePw2').val() || $('#changePw2').val().trim()==""){
			
			divChangePw2.removeClass("has-success");
			divChangePw2.addClass("has-error");
			alert("패스워드가 일치하지 않습니다.");
			
			return false;
		}else{
			divChangePw2.removeClass("has-error");
			divChangePw2.addClass("has-success");
			
		}
}
</script>
<form class="form-horizontal" name="findPw" method="post" action="<%=request.getContextPath()%>/changePw?findId=<%=findId %>" onsubmit="return ChangePwChk();">
<div class="form-group">
  <h1>비밀번호 변경</h1><br>

  	<div class="form-group" id="divChangePw">
	   <label for="changePw">비밀번호 변경</label>
	   <input type="password" class="form-control" name="changePw" id="changePw" requried/>
	 </div>
	 <div class="form-group" id="divChangePw2">
	   <label for="changePw2">비밀번호 확인</label>
	   <input type="password" class="form-control" name="changePw2" id="changePw2" requried/>
	 </div>
     <div class="form-group text-center">
       <input type="submit" class="btn btn-info" value="변경하기"/> 
       <input type="button" class="btn btn-warning" value="취소" onclick="location.href='<%=request.getContextPath()%>/'"></button>
     </div>
    </div>
  </div>
</div>
</form>

<%@ include file='/views/common/footer.jsp' %>