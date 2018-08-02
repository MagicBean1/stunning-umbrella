<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='java.util.*,community.model.vo.Community' %>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<%@ include file='/views/common/header.jsp' %>
<%
	List<Community> list = (List<Community>)request.getAttribute("list");
	String pageBar =(String)request.getAttribute("pageBar");
%>
<style>
	div.container-fluid{padding-top:10px; padding-bottom:10px}
	div.sidenav {background-color:white;height:600px}
	div.main_title{font:italic normal normal 50px/1.4em dinneuzeitgroteskltw01-_812426 sans-serif;background-color:#1E68CB;color:white;height:100px;
	    padding-top:10px}
	span.font{font:italic normal normal 200px}
	table{margin-top:15px}
	/* modal position(center)*/
        .modal 
        {
          text-align: center;
        }
        
        @media screen and (min-width: 768px) 
        {
          .modal:before 
          {
            display: inline-block;
            vertical-align: middle;
            content: " ";
            height: 100%;
          }
        }
        
        .modal-dialog 
        {
          display: inline-block;
          text-align: left;
          vertical-align: middle;
        }
</style>
<script>
	
function fn_write()
{	
	   if(<%=memberLoggedIn==null%>){
		   var result = confirm("로그인 후 이용이 가능합니다.");
		   return false;
	   }else{
			location.href="<%=request.getContextPath()%>/community/communityForm";	
		   return true;
	   }
	   			
}
   
	function fn_date(){
		var content=$("[name=content]").val();
		
		 if(content.trim().length==0){
			alert("검색할 내용이 없습니다.");
			return false;
		}
		return true;
	}
	
</script>
<section>

<div class="container-fluid">  
	
	  <div class="row content">
		    <div class="col-lg-2 sidenav">
		    	 <div class="w3-sidebar w3-bar-block w3-light-grey" style="width:280px;height:183px;box-shadow: 1px 1px 1px grey; ">
			    	<h3 class="w3-bar-item w3-border-bottom" style="margin-bottom:0px;text-align: center;color:#1E68CB;font-weight:bold">Communication</h3>
						    <a href="<%=request.getContextPath()%>/community/communityList" class="w3-bar-item w3-button w3-border-bottom" style="height:60px;background:white; text-align: center;">자유게시판</a>
  							<a href="<%=request.getContextPath()%>/reviewList" class="w3-bar-item w3-button w3-border-bottom" style="height:60px;background:white;text-align: center;">이용후기</a>
			    </div>
		    </div>
		    <div class="row" >
				    <div class="col-lg-8 main_title text-center">
				    	COMMUNICATION
				    </div>
			    <div class="col-lg-8"> 
				     <table class="table table-striped">
					   <thead>
							<tr>
								<th>NO</th>
								<th>TITLE</th>
								<th>WRITER</th>
								<th>DATE</th>
								<th>FILE</th>
								<th>COUNT</th>
								<!-- <th>STATE</th> -->
							</tr>
					   </thead>
						<tbody>
							<%for(Community c :list) {%>
							<tr>
								<td><%=c.getCommunityNo() %></td>
								<td><a href='<%=request.getContextPath()%>/community/communityView?no=<%=c.getCommunityNo()%>'><%=c.getCommunityTitle() %></a></td>
								<td><%=c.getCommunityWriter() %></td>
								<td><%=c.getCommunityDate() %></td>
								<td><%if(c.getOriginalFileName()!=null){%>
								<img src='<%=request.getContextPath()%>/images/file1.PNG' width='16px'/>
								<%} %>
								</td>
								<td><%=c.getCommunityReadCount() %></td>
							</tr>
							<%} %>
						</tbody>
					 </table>
					<div class="text-center" style="margin-left:110px">
					    <ul class="pagination pagination-lg">
					    	<%=pageBar %>
					     </ul> 
					 	
				       		<button type="button" class="btn btn-primary btn pull-right" onclick='fn_write()' style="background-color:#1E68CB;width:110px; height:40px; font-size:16px;margin-top:22px">WRITE</button>
						
					</div>
					<form  action="<%=request.getContextPath()%>/community/communityList" method="post">
						<div style="margin-top:50px"></div>
						<div class="col-lg-1"></div>
						<div class="col-lg-2" ><div style="wdith:450px"></div></div>
						<div class="col-lg-1" style="margin-left:35px">
							<select class="form-control" style="width:100px;" name="opt"> 
								<option value="1">제목</option> 
								<option value="2">내용</option> 
								<option value="3">작성자</option> 
							</select>
						</div>
						<div class="col-lg-2">
							<input type="text" name="content" style="width:300px; height:30px;margin-top:3px"/>
						</div>
						<div class="col-lg-2">
							<button type="submit" class="btn btn-default" value="search" onclick="return fn_date();" style="height:35px;width:90px;margin-left:98px " >search</button>
						</div>
						<div class="col-lg-2"></div>
					</form>
			    </div>
			  
		    </div>
		    <div style="margin-bottom:60px"></div>
			   <!--  <div class="col-lg-2 sidenav">
			    </div> -->
	  </div>
	
</div>

</section>
<%@ include file='/views/common/footer.jsp' %>