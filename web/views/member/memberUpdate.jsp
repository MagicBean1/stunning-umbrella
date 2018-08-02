<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file='/views/common/header.jsp' %>

<%
Member m = (Member)request.getAttribute("member");
	


	
%>
<style>
	.col-md-6{padding-right: 10px;padding-left: 0px;}
.colorgraph {
  height: 7px;
  border-top: 0;
  background: #c4e17f;
  border-radius: 5px;
 
  background-image: linear-gradient(to right, #A2D1DF,#B3C9E6 50%);
}
.updateForm{margin: 40px;}
</style>
<script>





$(function() {
	$('#userPw').blur(function () {
		var userPw = $('#userPw').val().trim();
		var passwordCheck = $('#passwordCheck').val().trim();

		if(userPw !=passwordCheck){
			alert("현재 비밀번호와 일치하지 않습니다.")
			$('#userPw').val("");
			return;
		}
	})
});

</script>
    
    
<div class="container">

<div class="row">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<form role="form" method="post" id="updateForm" class="updateForm" action="<%= request.getContextPath() %>/member/memberUpdateEnd">
			<h2>회원정보 변경<small >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수정할 정보를 입력해 주세요.</small></h2>
			<hr class="colorgraph">
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<!-- 아이디 -->
					<div class="form-group">
						<label>아이디</label>
           				<input type="text" value="<%=m.getMem_id() %>" name="userId" id="userId" class="form-control input-lg" placeholder="아이디" tabindex="1" readonly>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<!-- 이름 -->
					<div class="form-group">
						<label>이름</label>
						<input type="text" value="<%=m.getMem_name() %>" name="userName" id="userName" class="form-control input-lg" placeholder="이름" tabindex="2" readonly>
					</div>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">		
					<!-- 생년월일 -->
					<div class="form-group">
						<label>비밀번호</label>
						<input type="password" value="" name="userPw" id="userPw" class="form-control input-lg" placeholder="비밀번호" tabindex="3" required>
						<input type="hidden" value="<%=m.getMem_pw()%>" id="passwordCheck"> 
					</div>
					<div class="form-group">
						<label>이메일</label>
						<input type="email"  name="userEmail" id="userEmail" value="<%=m.getMem_email() %>" class="form-control input-lg" placeholder="이메일" tabindex="4" required >
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<!-- 전화번호 -->
					<div class="form-group">
						<label>전화번호</label>
						<input type="text" value="<%=m.getMem_phone() %>" name="userPhone" id="userPhone" class="form-control input-lg" placeholder="전화번호" tabindex="6" required>
					</div>
					<div class="form-group">
						<label>생년월일</label>
						<input type="number" value="<%=m.getMem_birthdate() %>" name="userBirthday" id="userBirthday" class="form-control input-lg" placeholder="생년월일" tabindex="3" required>
					</div>
					
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-12" style="padding: 0;">
					<div class="form-group">
						<label>주소</label>
						<input type="text"  name="userAddress" id="userAddress" value="<%=m.getMem_addr() %>" class="form-control input-lg" placeholder="주소" tabindex="5" required value="<%=m.getMem_phone()%>">
					</div><br>
					
				</div>
				
			</div>
			<br>
			
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