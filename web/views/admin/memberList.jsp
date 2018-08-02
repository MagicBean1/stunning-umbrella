<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='/views/common/header.jsp' %>
<%@ page import="java.util.*, member.model.vo.Member"%>
<%
	ArrayList<Member> list=(ArrayList)request.getAttribute("list");
	String pageBar=(String)request.getAttribute("pageBar");
%>
<script>
/* $(document).ready(function(){
	$('#admin-table').DataTable();
	
});  */
function fn_search(){
	var content=$("[name=content]").val();
	
	if(content.trim().length==0) {
		alert("검색할 내용이 없습니다.");
		return false;
	}
	return true;
}
</script>
<style>
	table#admin-table {margin-left:260px;width:70%;}
	div.main_title{font:italic normal normal 50px/1.4em dinneuzeitgroteskltw01-_812426 sans-serif;background-color:#2478FF;color:white;height:100px;
	    padding-top:10px;margin-left:230px;margin-top:5px;width:75%;}
</style>
<div class="col-lg-8 main_title text-center">
	MEMBER LIST
</div>
<div id="memberList-container">	
	<!-- <h4>회원 관리</h4> -->
     <table id="admin-table" class="table table-condensed" cellspacing="0" width="80%">
       <thead>
         <tr>
            <th class="th-sm">아이디</th>
            <th class="th-sm">이름</th>
            <th class="th-sm">생년월일</th>
            <th class="th-sm">전화번호</th>
            <th class="th-sm">이메일</th>
            <th class="th-sm">주소</th>
         </tr>
       </thead>
      <!-- 보내준 데이터를 출력하는 로직 -->
      <%if(list==null){ %>
      <tbody>
        <tr>
           <td colspan=6>검색결과가 없습니다.</td>
        </tr>
      </tbody>
      <%}
      else
      {
         for(Member m:list)
         {
      %>   <tbody>
      		<tr>
            <td scope="row"><a href="<%=request.getContextPath()%>/memberView?memId=<%=m.getMem_id()%>">
            <%=m.getMem_id()%>
            </a>
            </td>
            <td><%=m.getMem_name() %></td>
            <td><%=m.getMem_birthdate()%></td>
            <td><%=m.getMem_email()%></td>
            <td><%=m.getMem_phone()%></td>
            <td><%=m.getMem_addr()%></td>
         </tr>
         </tbody>
         <%}
      }%>
      </table>
     </div>
     <div class="pagebar text-center">
	    <ul class="pagination pagination-member">
	    	<%=pageBar %>
	     </ul>  
	 

	 <div style="margin-bottom:50px;">
	 <div class="col-lg-4"></div>
	 	 <form id="search" action="<%=request.getContextPath()%>/admin/memberFinder" method="post">
		    <select class="col-lg-2 form-control" style="width:100px;" id="searchKey" name="searchKey"> 
		      <option value="memName">이름</option> 
		      <option value="memId">아이디</option> 
		    </select>
		  <div class="col-lg-2">
		    <input type="text" name="searchValue" style="width:300px; height:30px;"/>
		  </div>
		  <div class="col-lg-2">
		    <button type="submit" class="btn btn-default" value="search" onclick="return fn_search();" style="height:35px;width:90px;margin-right:200px;" >search</button>
		  </div>
		<div class="col-lg-2"></div>
	  </form>
	 </div>
	</div>
  

<%@ include file='/views/common/footer.jsp' %>