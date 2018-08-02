<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="community.model.vo.Community"%>
<%@ include file='/views/common/header.jsp' %>
<%
	Community c = (Community)request.getAttribute("c");
	System.out.println(c.getOriginalFileName());
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
		$(".update").attr("action","<%=request.getContextPath()%>/views/community/communityUpdate.jsp");
		return true;
	}
	function fn_delete(){
		var result=confirm("해당 글을 삭제하시겠습니까?");
		if(result){
			$(".update").attr("action","<%=request.getContextPath()%>/community/communityDelete");
			return true;
		}else{
			return false;
		}
		
	}
	function fn_cancel(){
		location.href="<%=request.getContextPath()%>/community/communityList";
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
			   		<form action="" class="update" method="post">
			   		<div class="row" style="padding-top:40px">
			   			<div class="col-lg-3"></div>
			   			<div class="col-lg-3" style="border:1px solid #1E68CB; height:40px; padding-top:7px;color:#1E68CB" ><span style="font-weight:bold">NO.</span> <%=c.getCommunityNo() %>
			   				<input type="hidden" name="no" value="<%=c.getCommunityNo() %>"/>
			   			</div>
			   			<div class="col-lg-3" style="border:1px solid #1E68CB;height:40px; padding-top:7px;color:#1E68CB"><span style="font-weight:bold">WRITER</span> <%=c.getCommunityWriter() %>
							<input type="hidden" name="writer" value="<%=c.getCommunityWriter() %>"/>			   			
			   			</div>
			   			<div class="col-lg-3"></div>
			   		</div>
			   		
			   		<div class="row" style="padding-top:40px">
			   			<div class="col-lg-3"></div>
			   			<div class="col-lg-6 div_title"><span style="font-weight:bold">TITLE</span> <%=c.getCommunityTitle() %>
			   				<input type="hidden" name="title" value="<%=c.getCommunityTitle() %>"/>	
			   			</div>
			   			<div class="col-lg-3"></div>
			   		</div>
			   		
			   		<div class="row" style="padding-top:40px">
			   			<div class="col-lg-3"></div>
			   			<%if(c.getOriginalFileName()!=null){ %>
			   			<div class="col-lg-6 div_content" style="border:1px solid #1E68CB; width:644.32px; height:450px; padding-top:7px;color:#1E68CB"><span style="font-weight:bold">CONTENT</span><br><br>
			   					<p style="text-align:center;">
			    				<img style="width:450px; height:300px"src='<%=request.getContextPath() %>/upload/community/<%=c.getOriginalFileName()%>' width='16px'>
			    				</p>
			    			<br><br>
			   				<%=c.getCommunityContent() %>
			   				<input type="hidden" name="content" value="<%=c.getCommunityContent() %>"/>	
			   			</div>
			   			<%} else{%>
			    			<div class="col-lg-6 div_content" style="border:1px solid #1E68CB; width:644.32px; height:250px; padding-top:7px;color:#1E68CB"><span style="font-weight:bold">CONTENT</span><br><br>
			   				<%=c.getCommunityContent() %>
			   				<input type="hidden" name="content" value="<%=c.getCommunityContent() %>"/>	
			   				</div>
			    			<%} %>
			   			<div class="col-lg-3"></div>
			   		</div>
			   	
			   		
			   		<%if(memberLoggedIn!=null) {%> 
			   			<%if(memberLoggedIn.getMem_id().equals("admin")){ %>
			   				<div class="row" style="padding-top:40px;padding-bottom:100px">
					   			<div class="col-lg-3"></div>
					   			<div class="col-lg-6">
					   				<div class="col-lg-3"></div>
					   				<div class="col-lg-3"><button type="submit" class="btn btn-primary" id="btn2" onclick="fn_delete()">delet</button></div>
					   				<div class="col-lg-3"></div>
					   				<div class="col-lg-3"></div>
					   			</div>
					   			<div class="col-lg-3"></div>
			   				</div>
			   			<%}else if(memberLoggedIn.getMem_id().equals(c.getCommunityWriter())) {%> 
			   		<div class="row" style="padding-top:40px;padding-bottom:100px">
			   			<div class="col-lg-3"></div>
			   			<div class="col-lg-6">
			   				<div class="col-lg-3"><button type="submit" class="btn btn-primary" id="btn1" onclick="fn_update()">update</button></div>
			   				<div class="col-lg-3"><button type="submit" class="btn btn-primary" id="btn2" onclick="fn_delete()">delet</button></div>
			   				<div class="col-lg-3"><button type="button" class="btn btn-primary" id="btn3" onclick="fn_cancel()">cancel</button></div>
			   				<div class="col-lg-3"></div>
			   			</div>
			   			<div class="col-lg-3"></div>
			   		</div>
			   	</form>
			   			<%} else{%>
			   				<div class="row" style="padding-top:40px;padding-bottom:100px"></div>
			   			<%} %>
			   		<%} else{ %>
			   			<div class="row" style="padding-top:40px;padding-bottom:100px"></div>
			   		<%} %>
			   		
			    </div>
		    </div>
		   <!--  <div class="col-lg-2 sidenav">
		     
		    </div> -->
	  </div>
</div>

</section>
<%@ include file='/views/common/footer.jsp' %>