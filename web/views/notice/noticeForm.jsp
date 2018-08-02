<%@page import="java.sql.Date"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="notice.model.vo.Notice"  %>
    							
<%@ include file= '/views/common/header.jsp' %>



   <%-- <% Member memberLoggedIn= (Member)session.getAttribute("memberLoggedIn"); %>  --%> 

<style>
	
	
	table#tbl-board{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse;}
	table#tbl-board th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
	table#tbl-board td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
	
</style>    

<script>
   //공백여부 기능
   function validate() {
		var content = $('[name=content]').val();
		var title = $('[name=title]').val();
		
		if(content.trim().length==0){
			alert("내용을 입력하세요!!!");
			return false;
		}
		if(title.trim().length==0){
			alert("제목을 입력하세요!!!");
			return false;
		}
		
		return true;
	}
   
   
   //돌아가기 버튼
   function rtList() {
	   
	   location.href="<%=request.getContextPath()%>/notice/noticeList";
	
	}
 
   
</script>   
    
    



<!-- 글쓰는 폼 -->
<div class="container" ><br>
<div  style="margin:40px 40px 40px 180px;">
<legend><strong> <h2>공지사항 작성</h2></strong></legend>
 <form class="form-inline" action="<%=request.getContextPath()%>/notice/noticeFormEnd" method="post" onsubmit="return validate()">
    <div class="form-group">
        <label for=title >제목:&nbsp;&nbsp;&nbsp;&nbsp; </label>
        <input type="text"  class="form-control"  placeholder="Title " id ="title" name="title" style="border-radius: 10px;">
        <label for="writer">작성자 :</label>
      <input type="text" class="form-control"   name="writer" value="admin"  style="border-radius: 10px;" readonly>
    </div><hr>
		<td colspan="2">
			<textarea  cols="65"  id='content' name='content' style="height:200px;border-radius: 10px;"  ></textarea>
		</td>
	
	<hr>
	
		<input type="submit" value="등록하기" onclick="return validate()" class="btn btn-default" />
		<input type="button" value="돌아가기" onclick="return rtList()"  class="btn btn-default" />
		<!-- <td  style="position: relative;" ></td>  -->  
	 
</form>
</div>
</div>	 
		
			
					      
					
		





    
    

    
<%@ include file= '/views/common/footer.jsp' %>