<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='/views/common/header.jsp' %>
<style>
	div.container-fluid{padding-top:10px; padding-bottom:10px}
	div.col-lg-2 {background-color:white;height:800px}
	div.main_title{font:italic normal normal 50px/1.4em dinneuzeitgroteskltw01-_812426,sans-serif;background-color:#1E68CB;color:white;height:100px;
	    padding-top:10px}
	div.sub_title{font:italic normal normal 35px/1.4em dinneuzeitgroteskltw01-_812426,sans-serif;color:#1E68CB;padding-top:55px}
	span.font{font:italic normal normal 200px}
	div.content{background-color:#F0F0F0}
	div#subContent{margin-left:20%}
</style>
 <script>
    	function validate(){
    		var content=$("[name=content]").val();
    		var title=$("[name=title]").val();
    		var password=$("[name=password]").val();
    		
    		if(password.trim().length==0){
    			alert("비밀번호를 입력하세요");
    			return false;
    		}else if(title.trim().length==0){
    			alert("제목을 입력하세요");
    			return false;
    		}
    		else if(content.trim().length==0){
    			alert("내용을 입력하세요");
    			return false;
    		}else if(password.trim().length<4||password.trim().length>4){
    			alert("비밀번호는 4자리로 입력해주세요.");
    			return false;
    		}
    		return true;
    	}
    	
    	function fn_cancel(){
    		location.href="<%=request.getContextPath()%>/centerList";
    	}
    </script>
<section>

<div class="container-fluid">    
  <form class="form-horizontal" action="<%=request.getContextPath()%>/centerFormEnd" method="post" enctype="multipart/form-data">
  	<div class="row">
	    <div class="col-lg-2 sidenav">
	    </div>
    <div class="row" >
	    <div class="col-lg-8 main_title text-center">
	    	CUSTOMER CENTER
	    </div>
    <div class="col-lg-8 content"> 
   		<div class="row">
   			<div class="text-center sub_title">Content Impormation</div>
   		</div>
   		
   		<div class="row form-group" style="padding-top:40px;">
   			
   			<div class="col-lg-7" id="subContent">
   				<label class="control-label col-sm-2">NAME</label>
   				<div class="col-sm-9">
   					<input type="text" class="form-control" name="writer" readonly value="<%=memberLoggedIn.getMem_id()%>"/>
   				</div>
   			</div>
   			<div class="col-lg-3"></div>
   			
   		</div>
   		
   		<div class="row form-group" style="padding-top:40px">
   			
   			<div class="col-lg-7" id="subContent" style="margin-left:17%">
   				<label class="control-label col-sm-2" style="padding-right:19%;">PASSWORD</label>
   				<div class="col-sm-9">
   					<input type="text" class="form-control" name="password" placeholder="4자리 입력" required/>
   				</div>
   			</div>
   			<div class="col-lg-3"></div>
   		</div>
   		
   		<div class="row form-group" style="padding-top:40px">
   			
   			<div class="col-lg-7" id="subContent">
   				<label class="control-label col-sm-2">TITLE</label>
   				<div class="col-sm-9">
   					<input type="text" class="form-control" name="title" placeholder="Enter title" required/>
   				</div>
   			</div>
   			<div class="col-lg-3"></div>
   		</div>
   		
   		<div class="row form-group" style="padding-top:40px">
   			
   			<div class="col-lg-7" id="subContent">
   				<label for="file" class="control-label col-sm-2">FILE</label>
   				<div class="col-sm-9">
   				<input type="file"  class="form-control" placeholder="file" name="file"></textarea>
   				</div>
   			</div>
   			<div class="col-lg-3"></div>
   		</div>
   		
   		<div class="row form-group" style="padding-top:40px">
   			
   			<div class="col-lg-7" id="subContent" style="margin-left:18%">
   				<label for="comment" class="control-label col-sm-2" style="padding-right:17%;">CONTENT</label>
   				<div class="col-sm-9">
   				<textarea rows="6" class="form-control" placeholder="Enter comment" name="content"></textarea>
   				</div>
   			</div>
   			<div class="col-lg-3"></div>
   		</div>
   		<div class="row" style="padding-top:40px;padding-bottom:80px;margin-left:31%">
   					<div class="col-lg-3">
   						<button type="submit" class="btn btn-primary" value="등록하기" onclick="return validate();" style=" height:40px;width:130px " >save</button>
   					</div>
   					<div class="col-lg-3">
   						<button type="button" class="btn btn-primary" id="btn1" onclick="fn_cancel()" style="height:40px;width:130px;margin-left:30px ">cancel</button>
   					</div>
   					<div class="col-lg-3"></div>
   		</div>
    </div>
    </div>
	   <!--  <div class="col-lg-2 sidenav">
	     
	    </div> -->
  </div>
  </form>
</div>

</section>
<%@ include file='/views/common/footer.jsp' %>