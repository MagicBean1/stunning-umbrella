<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<%@ page import="lent.model.vo.LentBike, java.util.List" %>

<%@ include file='/views/common/header.jsp' %>
<%
List<LentBike> list = (List<LentBike>) request.getAttribute("list");
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
		    	 
		    </div>
		    <div class="row" >
				    <div class="col-lg-8 main_title text-center">
				    	MEMBER PAY LIST
				    </div>
			    <div class="col-lg-8"> 
				     <table class="table table-striped">
					   <thead>
							<tr>
								<th class="th-sm">구매번호</th>
					            <th class="th-sm">이용권 가격</th>
					            <th class="th-sm">바이크 종류</th>
					            <th class="th-sm">구매자</th>
								
							</tr>
					   </thead>
						<tbody>
							<% for(LentBike lb : list) { %>
								<tr>
									<td><a href="<%= request.getContextPath() %>/lent/lentConfirm?merchantUid=<%= lb.getMerchantUid() %>&methodNum=<%=lb.getMethodNum()%>&bikeId=<%=lb.getBikeId()%>&buyDate=<%=lb.getBuyDate()%>&returnDate=<%=lb.getReturnDate()%>&buyerId=<%=lb.getBuyerId()%>&shopId=<%=lb.getShopId()%>&lentPrice=<%=lb.getLentPrice()%>"><%= lb.getMerchantUid() %></a></td>
									<td><%= lb.getLentPrice() %></td>
									<td><%= lb.getBikeId() %></td>
									<td><%= lb.getBuyerId() %></td>
								</tr>
							<% } %>
						</tbody>
					 </table>
					<div class="text-center">
					    <ul class="pagination pagination-sm">
					    	<%=pageBar %>
					     </ul> 
					 	<%-- <%if(memberLoggedIn!=null){%>
				       		<button type="button" class="btn btn-primary btn pull-right" onclick='fn_write()' style="background-color:#1E68CB;width:110px; height:40px; font-size:16px;margin-top:22px">WRITE</button>
						<%} %> --%>
					</div>
					<form  action="<%=request.getContextPath()%>/member/PayHistory" method="post">
						<div style="margin-top:50px"></div>
						

						<div class="col-lg-1" style="margin-left:18%">
							<select class="form-control" style="width:99px;height:30px;margin-top:3px;" name="opt"> 
								<option value="1">구매번호</option> 
								<option value="2">구매자</option> 
							</select>
						</div>
						<div class="col-lg-2"style="margin-left:50px">
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