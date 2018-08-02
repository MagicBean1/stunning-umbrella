<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='java.util.*,review.model.vo.Review' %>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<%@ include file='/views/common/header.jsp' %>
<%
	List<Review> list = (List<Review>)request.getAttribute("list");
	String pageBar =(String)request.getAttribute("pageBar");
%>
<style>
	div.container-fluid{padding-top:10px; padding-bottom:10px}
	div.sidenav {background-color:white;height:600px}
	div.main_title{font:italic normal normal 50px/1.4em dinneuzeitgroteskltw01-_812426 sans-serif;background-color:#1E68CB;color:white;height:100px;
	    padding-top:10px}
	span.font{font:italic normal normal 200px}
	table{margin-top:15px}
</style>
<script>

   function fn_write()
   {	
	   if(<%=memberLoggedIn==null%>){
		   var result = confirm("로그인 후 이용이 가능합니다.");
		   return false;
	   }else{
		   location.href="<%=request.getContextPath()%>/reviewForm";
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
		    	 <div class="w3-sidebar w3-bar-block w3-light-grey" style="width:15%;height:20%;box-shadow: 1px 1px 1px grey; ">
			    	<h4 class="w3-bar-item w3-border-bottom" style="margin-bottom:0px;text-align: center;color:#1E68CB;font-weight:bold;height:34%;"><strong>COMMUNICATION</strong></h4>
						    <a href="<%=request.getContextPath()%>/community/communityList" class="w3-bar-item w3-button w3-border-bottom" style="height:29%;background:white; text-align: center;">자유게시판</a>
  							<a href="<%=request.getContextPath()%>/reviewList" class="w3-bar-item w3-button w3-border-bottom" style="height:29%;background:white;text-align: center;">이용후기</a>
			    </div>
		    </div>
		    <div class="row" >
				    <div class="col-lg-8 main_title text-center">
				    	CONSUMER REVIEWS 
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
							<%for(Review r :list) {%>
							<tr>
								<td><%=r.getReviewNo() %></td>
								<td><a href='<%=request.getContextPath()%>/reviewView?no=<%=r.getReviewNo()%>'><%=r.getReviewTitle() %></a></td>
								<td><%=r.getReviewWriter()%></td>
								<td><%=r.getReviewDate() %></td>
								<td><%if(r.getOriginalFileName()!=null){%>
								<img src='<%=request.getContextPath()%>/images/file1.PNG' width='16px'/>
								<%} %>
								</td>
								<td><%=r.getReviewReadCount() %></td>
							</tr>
							<%} %>
						</tbody>
					 </table>
					<div class="text-center" style="margin-left:40%">
					    <ul class="pagination pagination-sm" style="margin-right:55%">
					    	<%=pageBar %>
					     </ul> 
					 
				       		<button type="button" class="btn btn-primary btn pull-right" onclick='fn_write()' style="width:80px; height:29px; font-size:13px;margin-top:20px">WRITE</button>
						
					</div>
					<form  action="<%=request.getContextPath()%>/reviewList" method="post">
					<div style="margin-top:50px"></div>
						
						
						<div class="col-lg-1" style="margin-left:19%; ">
							<select class="form-control" style="width:80px;height:30px;margin-top:3px" name="opt"> 
								<option value="1">제목</option> 
								<option value="2">내용</option> 
								<option value="3">작성자</option> 
							</select>
						</div>
						<div class="col-lg-2"style="margin-left:30px">
							<input type="text" name="content" style="width:250px; height:30px;margin-top:3px"/>
						</div>
						<div class="col-lg-2">
							<button type="submit" class="btn btn-default" value="search" onclick="return fn_date();" style="height:35px;width:80px;margin-left:120%; height:30px; margin-top:3px" >search</button>
						</div>
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