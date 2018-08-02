<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='/views/common/header.jsp' %>

<%
Member m = (Member)request.getAttribute("member");

%>
<style>
h5 a{text-align: center; }
	.col-md-6{padding-right: 10px;padding-left: 0px;}
.colorgraph {
  height: 7px;
  border-top: 0;
  background: #c4e17f;
  border-radius: 5px;
  
  background-image: linear-gradient(to right,#A2D1DF,#B3C9E6 50%);
}
.updateForm{margin: 60px;}
</style>

<script>
$(function() {
	$('#nowPw').blur(function () {
		var nowPw = $('#nowPw').val().trim();
		var hiddenPw = $('#hiddenPw').val().trim();
		
		if(nowPw !=hiddenPw) {
			alert("현재 비밀번호가 맞지 않습니다.")
			$('#nowPw').val("");
			return;

		}
	})
});

$(function() {
	$('#checkPw').blur(function () {
		var nowPw = $('#nowPw').val().trim();
		var pw1 = $('#updatePw').val().trim();
		var pw2 = $('#checkPw').val().trim();
		
		if(nowPw == pw1 || nowPw ==pw2){
			alert("현재 비밀번호는 사용하실 수 없습니다.");
			$('#updatePw').val("");
			$('#checkPw').val("");
			$('#updatePw').focus();
			return;
		}
		if(pw1 !=pw2){
			alert("입력하신 비밀번호가 일치하지 않습니다.")
			$('#updatePw').val("");
			$('#checkPw').val("");
			$('#updatePw').focus();
		}
	})
});




</script>
    
    
<div class="container">

<div class="row">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<form  role="form" method="post" class="updateForm" action="<%= request.getContextPath() %>/member/memberPassUpdateEnd">
			<legend><h2 style="text-align: center;" >비밀번호변경</h2></legend>
			
			
			
			<hr class="colorgraph">
			<div class="row ">
				<div class="col-xs-12 col-sm-6 col-md-6">
					
					<div class="form-group ">
						<label>현재 비밀번호</label>
						<input type="password"  name="nowPw" id="nowPw"  class="form-control input-lg" placeholder="현재 비밀번호" tabindex="1" required >
					</div><br>
					
					<div class="form-group">
						<label>수정할 비밀번호</label>
						<input type="password"  name="updatePw" id="updatePw"  class="form-control input-lg" placeholder="수정할 비밀번호" tabindex="2" required >
					</div><br>
					
					<div class="form-group">
						<label>수정할 비밀번호 확인</label>
						<input type="password"  name="checkPw" id="checkPw" class="form-control input-lg" placeholder="수정할 비밀번호 확인" tabindex="3" required>
					</div>
					<input type="hidden" name="userId" id="userId" value="<%=m.getMem_id() %>">
					<input type="hidden" name="hiddenPw" id="hiddenPw" value="<%=m.getMem_pw()%>">
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6" style="padding: 0px; text-align: left; ">
					
					<div class="form-group">
					<br><br><br>
					<p >안전한 비밀번호로 내정보를 보호하세요.</p>
						<br>		
						
						<br>
						<p>이전에 사용한 적 없는 비밀번호가</p>
						<p> 안전합니다.</p>
					
					
					</div>
					
				</div>
				
			</div>
			
			
			<hr class="colorgraph" style="color: black">
			<div class="row">
				<div class="col-xs-12 col-md-6"><input type="submit" value="수정완료" class="btn btn-default btn-block btn-lg" tabindex="7"></div>
				<div class="col-xs-12 col-md-6"><a href="<%=request.getContextPath() %>"  class="btn btn-default btn-block btn-lg">돌아가기</a></div>
			</div>
		</form>
	</div>
</div>
<!-- Modal -->

</div>
 <%@ include file='/views/common/footer.jsp' %>   