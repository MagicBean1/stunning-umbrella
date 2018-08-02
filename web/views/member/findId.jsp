<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file='/views/common/header.jsp' %>
<style>
form.form-horizontal{margin-top:100px;width:300px;margin-left:750px;margin-bottom:100px;}
</style>
 
<form class="form-horizontal" name="findId" method="post" action="<%=request.getContextPath()%>/findId">
<div class="form-group">
  <h1>아이디 찾기</h1><br>
  <p>가입할때 작성했던 이메일어야 합니다.</p>
  	<div class="form-group" id="divfindName">
	   <label for="findName">이름</label>
	   <input type="text" class="form-control onlyHangul" name="findName" id="findName" requried/>
	 </div>
	 <div class="form-group" id="divEmail">
	   <label for="findEmail">이메일</label>
	   <input type="text" class="form-control"  placeholder="@gmail.com으로 작성해주세요" name="findEmail" id="findEmail" requried/>
	  <!--  <input type="button" id="SendNum" class="btn btn-default" value="인증번호전송"/> -->
	 </div>
	 <!-- <div class="form-group" id="divfindAddrNum">
	   <label for="findAddrNum">인증번호 입력</label>
	   <input type="text" class="form-control"  name="findAddrNum" id="findAddrNum" requried/>
	 </div> -->
	 <div class="form-group text-center">
       <button type="submit" class="btn btn-info">아이디 찾기</button>
       <input type="button" class="btn btn-warning" value="취소" onclick="location.href='<%=request.getContextPath()%>/'"></button>
     </div>
    </div>
  </div>
</div>
</form>

  
  
 <%@ include file= '/views/common/footer.jsp' %> 