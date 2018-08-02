<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='/views/common/header.jsp' %>
<%!
	//5자리 숫자로 이루어진 인증번호를 랜덤으로 생성
	public int getRandom(){
	int random=0;
	random=(int)Math.floor((Math.random()*(99999-10000+1)))+10000;
	return random;
}
%>
<style>
form.form-horizontal{margin-top:100px;width:300px;margin-left:750px;margin-bottom:100px;}
</style>
<script>
$('#findId').blur(function(event){
 	divfindId=$('#divfindId');
 if($('#findId').val()==""){
	 divfindId.removeClass("has-success");
	 divfindId.addClass("has-error");
 }
 else{
	 divfindId.removeClass("has-error");
	 divfindId.addClass("has-success");
 }
});
$('#findEmail').blur(function(event){
	divfindEmail=$('#divfindEmail');
 if($('#findEmail').val()==""){
	 divfindEmail.removeClass("has-success");
	 divfindEmail.addClass("has-error");
 }
 else{
	 divfindEmail.removeClass("has-error");
	 divfindEmail.addClass("has-success");
 }
});
$('#findEmailNum').blur(function(event){
 	divfindEmailNum=$('#divfindEmailNum');
 if($('#findEmailNum').val()==""){
	 divfindEmailNum.removeClass("has-success");
	 divfindEmailNum.addClass("has-error");
 }
 else{
	 divfindEmailNum.removeClass("has-error");
	 divfindEmailNum.addClass("has-success");
 }
});




</script>
<form class="form-horizontal" name="findPw" method="post" action="<%=request.getContextPath()%>/sendEmail"/>
<div class="form-group">
  <h1>비밀번호 찾기</h1><br>
  <p>가입할때 작성했던 이메일이어야 합니다.</p>
  	<div class="form-group" id="divfindId">
	   <label for="findId">아이디</label>
	   <input type="text" class="form-control" name="findId" id="findId" requried/>
	 </div>
	 <div class="form-group" id="divfindEmail">
	   <label for="findEmail">이메일</label>
	   <input type="email" class="form-control" name="findEmail" id="findEmail" requried/>
	   <input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=getRandom()%>"/>
	 </div>
     <div class="form-group text-center">
       <input type="submit" class="btn btn-default" value="인증번호전송"/> 
       <input type="button" class="btn btn-warning" value="취소" onclick="location.href='<%=request.getContextPath()%>/'"></button>
     </div>
    </div>
  </div>
</div>
</form>


<%@ include file='/views/common/footer.jsp' %>