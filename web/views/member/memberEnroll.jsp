<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <%@ include file='/views/common/header.jsp' %>
  
<style>
	form.form-horizontal{width:900px;margin-left:500px;}
</style>  
 <script>
  $(function(){
	  
	  $('#openIdChk').on('click',function(){
			
			var mem_id=$('#mem_id').val().trim();
			
			var url="<%=request.getContextPath()%>/openIdChk";
			
			var title="openIdChk";
			
			var status="left=500px, top=100px, width=300px, height=200px, menubar=no, status=no, scrollbars=yes";
			var popup=window.open('',title,status);
		
			openIdChkFrm.mem_id.value=mem_id;
			
			openIdChkFrm.target=title;
			
			openIdChkFrm.action=url;
			
			openIdChkFrm.method="post";
			openIdChkFrm.submit(); 					
		});
	  
	 $('.onlyHangul').keyup(function(event){
			if(!(event.keyCode>=37 && event.keyCode<=40)) {
				var inputVal=$(this).val();
				$(this).val(inputVal.replace(/[a-z0-9]/gi,''));
			}
	 });
	 $('.onlyNumber').keyup(function(event){
			if(!(event.keyCode>=37 && event.keyCode<=40)) {
				var inputVal=$(this).val();
				$(this).val(inputVal.replace(/[a-z]/gi,''));
			}
	 });
	 
	 $('.onlyAlphabetAndNumber').keyup(function(event){
			if(!(event.keyCode>=37 && event.keyCode<=40)) {
				var inputVal=$(this).val();
				$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
			}
	 });
	 
	
	 
	 //-----검사하여 상태를 class에 적용
	 $('#mem_id').blur(function(event){
		 	divId=$('#divId');
		 if($('#mem_id').val().trim().length<4){
			 
			 divId.removeClass("has-success");
			 divId.addClass("has-error");
			 alert("4자이상 입력하세요")
		}
		 
		 else{
			 
			 divId.removeClass("has-error");
			 divId.addClass("has-success");
		 }
		
	 }); 
	 
	 $('#mem_pw').blur(function(event){
		 	divPw=$('#divPw');
		 if($('#mem_pw').val()==""){
			 divPw.removeClass("has-success");
			 divPw.addClass("has-error");
		 }
		 else{
			 divPw.removeClass("has-error");
			 divPw.addClass("has-success");
		 }
	 });
	 
	 $('#mem_pw_2').blur(function(event){
			 divPwCheck=$('#divPwCheck');
		 if($('#mem_pw_2').val()==""){
			 divPwCheck.removeClass("has-success");
			 divPwCheck.addClass("has-error");
		 }
		 else{
			 divPwCheck.removeClass("has-error");
			 divPwCheck.addClass("has-success");
		 }
	 }); 
	 
	 $('#mem_name').blur(function(event){
		 	divName=$('#divName');
		 if($('#mem_name').val()==""){
			 divName.removeClass("has-success");
			 divName.addClass("has-error");
		 }
		 else{
			 divName.removeClass("has-error");
			 divName.addClass("has-success");
		 }
	 });
	 
	 $('#mem_birthdate').blur(function(event){
		 	divBirthDate=$('#divBirthDate');
		 if($('#mem_birthdate').val()==""){
			 divBirthDate.removeClass("has-success");
			 divBirthDate.addClass("has-error");
		 }
		 else{
			 divBirthDate.removeClass("has-error");
			 divBirthDate.addClass("has-success");
		 }
	 });
	 
	 $('#mem_phone').blur(function(event){
		 	divPhone=$('#divPhone');
		 if($.trim($('#mem_phone').val())==""){
			 divPhone.removeClass("has-success");
			 divPhone.addClass("has-error");
		 }
		 else{
			 divPhone.removeClass("has-error");
			 divPhone.addClass("has-success");
		 }
	 });
	 
	 $('#mem_email').blur(function(event){
		 	divEmail=$('#divEmail');
		 if($('#mem_email').val()==""){
			 divEmail.removeClass("has-success");
			 divEmail.addClass("has-error");
		 }
		 else{
			 divEmail.removeClass("has-error");
			 divEmail.addClass("has-success");
		 }
	 });
	 
	 $('#mem_addr').blur(function(event){
		 	divAddr=$('#divAddr');
		 if($('#mem_addr').val()==""){
			 divAddr.removeClass("has-success");
			 divAddr.addClass("has-error");
		 }
		 else{
			 divAddr.removeClass("has-error");
			 divAddr.addClass("has-success");
		 }
	 });
  }); 
  
  
	 //----validation 검사
	 function joinChk() {
	   
		 	
		 	//아이디 검사
		 	<%-- if($('#mem_id').val()==""){
		 		alert("아이디를 입력해주시기 바랍니다.");
		 	
		 		locaion.href="<%=request.getContextPath()%>/memberEnroll.jsp"
				divId.removeClass("has-success");
				divId.addClass("has-error");
				$('#mem_id').focus();
				return false;
			}else{
				divId.removeClass("has-error");
				divId.addClass("has-success");
				
			} --%>
		 	
		 	/* var mem_id=$('#mem_id').val().trim(); */
			//아이디 값이 잇는지. 아이디가 4글자 이상인지 check
			if($('#mem_id').val().trim().length<4)
			{
				alert("아이디를 4자 이상 입력해주세요.");
				
				divId.removeClass("has-success"); 
				divId.addClass("has-error"); 
				
				/* $('#mem_id').focus(); */
				return false;
			}
			else if($('#mem_id').val().trim()==""||$('#mem_id').val()==null)
			{
				alert("아이디를 4자 이상 입력해주세요.");
				
				divId.removeClass("has-success"); 
				divId.addClass("has-error"); 
				
				/* $('#mem_id').focus(); */
				return false;
			}
			else{
				divId.removeClass("has-error");
				divId.addClass("has-success");
				
			}
	 
			
		 	
		 	//패스워드 검사
			 if($('#mem_pw').val().trim()==""||$('#mem_pw').val()==null){
				alert("패스워드를 입력하여 주시기 바랍니다.");
				
				divPw.removeClass("has-success");
				divPw.addClass("has-error");
				$('#mem_pw').focus();
				return false;
			}else{
				divPw.removeClass("has-error");
				divPw.addClass("has-success");
				
			}
			//패스워드 확인
			if($('#mem_pw_2').val().trim()==""||$('#mem_pw_2').val()==null){
				alert("패스워드 확인을 입력하여 주시기 바랍니다.");
				
				divPwCheck.removeClass("has-success");
				divPwCheck.addClass("has-error");
				$('#mem_pw_2').focus();
				return false;
			}else{
				divPwCheck.removeClass("has-error");
				divPwCheck.addClass("has-success");
				
			} 
			//패스워드 비교
			if($('#mem_pw').val()!=$('#mem_pw_2').val() || $('#mem_pw_2').val().trim()==""){
				
				alert("패스워드가 일치하지 않습니다.");
				
				divPwCheck.removeClass("has-success");
				divPwCheck.addClass("has-error");
				$('#mem_pw_2').focus();
				return false;
			}else{
				divPwCheck.removeClass("has-error");
				divPwCheck.addClass("has-success");
				
			}
			
			//이름
			if($('#mem_name').val().trim()==""||$('#mem_name').val()==null){
				alert("이름을 입력하여 주시기 바랍니다.");
				
				divName.removeClass("has-success");
				divName.addClass("has-error");
				$('#mem_name').focus();
				return false;
			}else{
				divName.removeClass("has-error");
				divName.addClass("has-success");
				
			}
			//생년월일
			if($('#mem_birthdate').val().trim()==""||$('#mem_birthdate').val()==null){
				alert("생년월일을 입력하여 주시기 바랍니다.");
				
				divBirthDate.removeClass("has-success");
				divBirthDate.addClass("has-error");
				$('#mem_birthdate').focus();
				return false;
			}else{
				divBirthDate.removeClass("has-error");
				divBirthDate.addClass("has-success");
				
			}
			//전화번호
			if($('#mem_phone').val().trim()==""||$('#mem_phone').val()==null){
				alert("전화번호를 입력하여 주시기 바랍니다.");
				
				divPhone.removeClass("has-success");
				divPhone.addClass("has-error");
				$('#mem_phone').focus();
				return false;
			}else{
				divPhone.removeClass("has-error");
				divPhone.addClass("has-success");
				
			}
			//이메일
			if($('#mem_email').val().trim()==""||$('#mem_email').val()==null){
				alert("이메일을 입력하여 주시기 바랍니다.");
				
				divEmail.removeClass("has-success");
				divEmail.addClass("has-error");
				$('#mem_email').focus();
				return false;
			}else{
				divEmail.removeClass("has-error");
				divEmail.addClass("has-success");
				
			}
			//주소
			if($('#mem_addr').val().trim()==""||$('#mem_addr').val()==null){
				alert("주소을 입력하여 주시기 바랍니다.");
				
				divAddr.removeClass("has-success");
				divAddr.addClass("has-error");
				$('#mem_addr').focus();
				return false;
			}else{
				divAddr.removeClass("has-error");
				divAddr.addClass("has-success");
				
			} 
			return true;
	 }

$(function(){
	$('#openInChk').click(function(event){
		 if($('#mem_id').val().trim()==""||!($('#mem_id').val()))
		{
			 alert("아이디를 입력해주시길 바랍니다.");
			 divId.removeClass("has-success");
			 divId.addClass("has-error");
			 $('#mem_id').focus();
		}
		 else {
			 divId.removeClass("has-error");
			 divId.addClass("has-success");
		 }
	 });
});	 
	 
	 
	
 
   
	
</script>
<!-- <body> -->

<form class="form-horizontal" name="memberEnroll" method="post" action="<%=request.getContextPath()%>/memberEnrollEnd" onsubmit="return joinChk();">
     <div class="form-group">
       <h1>회원정보 입력하기 </h1>
     </div>
     	<div class="form-group" id="divId">
           <label for="mem_id">아이디</label>
           <input type="text" class="form-control onlyAlphabetAndNumber" name="mem_id" id="mem_id" placeholder="4자-20자 입력" maxlength=20 requried/>
           <input type="button" value="중복검사" class="btn btn-default" id="openIdChk"/> 
           <input type="hidden" name="idDuplication" value="idUncheck"/>
          </div>
       	 <div class="form-group" id="divPw">
           <label for="mem_pw">비밀번호</label>
           <input type="password" class="form-control onlyAlphabetAndNumber" name="mem_pw" id="mem_pw" placeholder="6자-20자이하 /소문자,숫자 입력" maxlength=20 requried/>
         </div>
         <div class="form-group" id="divPwCheck">
           <label for="mem_pw_2">비밀번호 확인</label>
           <input type="password" class="form-control onlyAlphabetAndNumber" name="mem_pw_2" id="mem_pw_2" maxlength=20 requried/>
           <p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
         </div>
         <div class="form-group" id="divName">
           <label for="mem_name">이름</label>
           <input type="text" class="form-control onlyHangul" name="mem_name" id="mem_name" requried/>
         </div>
         <div class="form-group" id="divBirthDate">
           <label for="mem_birthdate">생년월일</label>
           <input type="number" class="form-control onlyNumber" name="mem_birthdate" id="mem_birthdate" placeholder="(ex)20180101" requried/>
         </div>
         <div class="form-group" id="divPhone">
           <label for="mem_phone">전화번호</label>
           <input type="number" class="form-control onlyNumber" name="mem_phone" id="mem_phone" placeholder="-없이 입력해주세요" requried/>
         </div>
         <div class="form-group" id="divEmail">
           <label for="mem_email">이메일</label>
           <input type="email" class="form-control" name="mem_email" id="mem_email" requried/>
         </div>
         <div class="form-group" id="divAddr">
           <label for="mem_addr">주소</label>
           <input type="text" class="form-control onlyHangul" name="mem_addr" id="mem_addr" requried/>
         </div>
         <div class="form-group text-center">
           <button type="submit" class="btn btn-info">회원가입</button>
           <button type="reset" class="btn btn-warning">가입취소</button>
         </div>
       
     </form>

 <form name="openIdChkFrm" height="100px">
	<!-- 새로운 아이디값/type=hidden하면 버튼 위로 글씨가 뜨지 않음 -->
		<input type="hidden" name="mem_id"/>
</form> 


 

<!-- </body> -->
 <%@ include file= '/views/common/footer.jsp' %> 