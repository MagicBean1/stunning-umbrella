<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="center.model.vo.Center"%>
<%@ include file='/views/common/header.jsp' %>
<%
	Center c = (Center)request.getAttribute("c");
	String comment = request.getParameter("comment");
	 int commentNo = Integer.parseInt(request.getParameter("commentNo"));
%>
<style>
	div.container-fluid{padding-top:10px; padding-bottom:10px}
	div.col-lg-2 {background-color:white;height:800px}
	div.main_title{font:italic normal normal 50px/1.4em dinneuzeitgroteskltw01-_812426,sans-serif;background-color:#1E68CB;color:white;height:100px;
	    padding-top:10px}
	div.sub_title{font:italic normal normal 35px/1.4em dinneuzeitgroteskltw01-_812426,sans-serif;color:#1E68CB;padding-top:55px}
	div.div_title{border:1px solid #1E68CB; width:644.32px; height:40px; padding-top:7px; color:#1E68CB}
/* 	div.div_content{border:1px solid #1E68CB; width:644.32px; height:450px; padding-top:7px;color:#1E68CB} */
	span.font{font:italic normal normal 200px}
	div.content{background-color:#F0F0F0}
	button#btn1{background-color:#1E68CB; width:170px; height:50px}
	button#btn2{background-color:#1E68CB; width:170px; height:50px;margin-left:65px}
	button#btn3{background-color:#1E68CB; width:170px; height:50px;margin-left:130px}
</style>
<script>
function fn_update(){
	location.href="<%=request.getContextPath()%>/views/center/centerUpdate.jsp?writer=<%=c.getCenterWriter()%>&title=<%=c.getCenterTitle()%>&content=<%=c.getCenterContent() %>&no=<%=c.getCenterNo()%>&password=<%=c.getCenterPwd()%>";
}
	function fn_delete(){
		location.href="<%=request.getContextPath()%>/centerDelete?no=<%=c.getCenterNo()%>";
	}
	function fn_cancel(){
		location.href="<%=request.getContextPath()%>/centerList";
	}
	function viewDate(){
		var comment=$("[name=comment]").val();
		
		if(comment.trim().length==0){
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}
	function changeDate(){
		var comment1=$("[name=comment1]").val();
		
		if(comment1.trim().length==0){
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}
</script>
<section>

<div class="container-fluid">	    
	  <div class="row">
		    <div class="col-lg-2 sidenav">
		    </div>
		    <div class="row" >
			    <div class="col-lg-8 main_title text-center">
			    	COMMUNICATION
			    </div>
			    <div class="col-lg-8 content"> 
			    	
			   		<div class="row">
			   			<div class="text-center sub_title">Content Impormation</div>
			   		</div>
			   		<div class="row" style="padding-top:40px">
			   			<div class="col-lg-3"></div>
			   			<div class="col-lg-3" style="border:1px solid #1E68CB; height:40px; padding-top:7px;color:#1E68CB" ><span style="font-weight:bold">NO.</span> <%=c.getCenterNo() %></div>
			   			<div class="col-lg-3" style="border:1px solid #1E68CB;height:40px; padding-top:7px;color:#1E68CB"><span style="font-weight:bold">WRITER</span> <%=c.getCenterWriter() %></div>
			   			<div class="col-lg-3"></div>
			   		</div>
			   		
			   		<div class="row" style="padding-top:40px">
			   			<div class="col-lg-3"></div>
			   			<div class="col-lg-6 div_title"><span style="font-weight:bold">TITLE</span> <%=c.getCenterTitle() %></div>
			   			<div class="col-lg-3"></div>
			   		</div>
			   		
			   		<div class="row" style="padding-top:40px">
			   			<div class="col-lg-3"></div>
			   			<%if(c.getOriginalFileName()!=null){ %>
			   			<div class="col-lg-6 div_content" style="border:1px solid #1E68CB; width:644.32px; height:450px; padding-top:7px;color:#1E68CB"><span style="font-weight:bold">CONTENT</span><br><br>
			   					<p style="text-align:center;">
			    				<img style="width:450px; height:300px"src='<%=request.getContextPath() %>/upload/center/<%=c.getOriginalFileName()%>' width='16px'>
			    				</p>
			    			<br><br>
			   				<%=c.getCenterContent() %>
			   			</div>
			   			<%} else{%>
			    			<div class="col-lg-6 div_content" style="border:1px solid #1E68CB; width:644.32px; height:250px; padding-top:7px;color:#1E68CB"><span style="font-weight:bold">CONTENT</span><br><br>
			   				<%=c.getCenterContent() %>
			   				</div>
			    			<%} %>
			   			<div class="col-lg-3"></div>
			   		</div>
			   		<%if(memberLoggedIn!=null) {%>
			   			<%if(memberLoggedIn.getMem_id().equals(c.getCenterWriter())) {%>
			   		<div class="row" style="padding-top:40px;padding-bottom:100px">
			   			<div class="col-lg-3"></div>
			   			<div class="col-lg-6">
			   				<div class="col-lg-3"><button type="button" class="btn btn-primary" id="btn1" onclick="fn_update()">update</button></div>
			   				<div class="col-lg-3"><button type="button" class="btn btn-primary" id="btn2" onclick="fn_delete()">delet</button></div>
			   				<div class="col-lg-3"><button type="button" class="btn btn-primary" id="btn3" onclick="fn_cancel()">cancel</button></div>
			   				<div class="col-lg-3"></div>
			   			</div>
			   			<div class="col-lg-3"></div>
			   		</div>
			   			<%} else if(memberLoggedIn.getMem_id().equals("admin")){%>
			   				<%if(comment==null) {%>
			   			 <form action="<%=request.getContextPath()%>/commentAdd" method="post">
			   				<div class="row" style="padding-top:40px;">
					   			<div class="col-lg-3"></div>
					   			<div class="col-lg-6" style="padding:0px">
					   				<textarea rows="10" name="comment"cols="85" style="width:644.32px; height:250px;"></textarea>
					   			</div>
					   			<div class="col-lg-3"></div>
			   				</div>
			   				<div class="row" style="padding-top:40px;padding-bottom:100px">
				   				<div class="col-lg-3"></div>
				   				<div class="col-lg-6">
					   				<input type="hidden" name="refNo" value="<%=c.getCenterNo()%>">
		   							<input type="hidden" name="writer" value="<%=memberLoggedIn.getMem_id()%>"/>
		   							<div class="col-lg-3">
					   					<button type="submit" class="btn btn-primary" value="등록하기" onclick="return viewDate();" id="btn1"style="background-color:#1E68CB;" >save</button>
					   				</div>
					   				<div class="col-lg-3"><button type="button" class="btn btn-primary" id="btn2" onclick="fn_delete()">delet</button></div>
					   				<div class="col-lg-3"><button type="button" class="btn btn-primary" id="btn3" onclick="fn_cancel()">cancel</button></div>
				   					<div class="col-lg-3"></div>
				   				</div>
				   				<div class="col-lg-3"></div>			
			   				</div>
			   			</form>
			   			<%} else{%>
			   				<form action="<%=request.getContextPath()%>/commentUpdate" method="post">
			   				<div class="row" style="padding-top:40px;">
					   			<div class="col-lg-3"></div>
					   			<div class="col-lg-6" style="padding:0px">
					   				<textarea rows="10" name="comment1"cols="85" style="width:644.32px; height:250px;"><%=comment %></textarea>
					   			</div>
					   			<div class="col-lg-3"></div>
			   				</div>
			   				<div class="row" style="padding-top:40px;padding-bottom:100px">
				   				<div class="col-lg-3"></div>
				   				<div class="col-lg-6">
		   							<input type="hidden" name="writer" value="<%=memberLoggedIn.getMem_id()%>"/>
		   							 <input type="hidden" name="commentNo" value="<%=commentNo%>"/>  
		   							<div class="col-lg-3">
					   					<button type="submit" class="btn btn-primary" value="등록하기" onclick="return changeDate();" id="btn1"style="background-color:#1E68CB; margin-left:60px" >save</button>
					   				</div>
					   				<div class="col-lg-3">
					   				<div class="col-lg-3"><button type="button" class="btn btn-primary" id="btn3" onclick="fn_cancel()">cancel</button></div>
				   					<div class="col-lg-3"></div>
				   				</div>
				   				<div class="col-lg-3"></div>			
			   				</div>
			   			</form>
			   			<%} %>
			   		<%}else{%>
			   			<div class="row" style="padding-top:40px;padding-bottom:100px"></div>
			   		<%} %>
			   			<% } else{ %>
			   			<div class="row" style="padding-top:40px;padding-bottom:100px"></div>
			   		<%}%>
			    </div>
		    </div>
		   <!--  <div class="col-lg-2 sidenav">
		     
		    </div> -->
	  </div>
</div>

</section>
<%@ include file='/views/common/footer.jsp' %>