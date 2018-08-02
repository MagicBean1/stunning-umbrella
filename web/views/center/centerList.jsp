<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="center.model.vo.Center,java.util.*,comment.model.vo.Comment"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<%@ include file='/views/common/header.jsp' %>
<%
	List<Center> list = (List<Center>)request.getAttribute("list");
	System.out.println(list);
	String pageBar =(String)request.getAttribute("pageBar");
    List<Comment> comment = (List<Comment>)request.getAttribute("total");
%>
<style>
	div.container-fluid{padding-top:10px; padding-bottom:10px}
	div.col-lg-2 {background-color:white;height:600px}
	div.main_title{font:italic normal normal 50px/1.4em dinneuzeitgroteskltw01-_812426 sans-serif;background-color:#1E68CB;color:white;height:200px;
	    padding-top:10px}
	span.font{font:italic normal normal 200px}
	table{margin-top:15px}
	.gi-2x{font-size: 2.5em;margin-top:20px}
	 .back {
		background-color: white;
		color: black;
		position: static;
	}
	.modal-80size {
	   height: auto;
	  min-height: 30%; 
	  width:65%
	} 
	.modal_left{
		left: 55%;
   		 transform: translateX(-55%);
	}
	.modal_line{
		border:none;
		margin-top:20px
	}

</style>
<script>
	function fn_write()
	{	
		   if(<%=memberLoggedIn==null%>){
			   var result = confirm("로그인 후 이용이 가능합니다.");
			   return false;
		   }else{
			   location.href="<%=request.getContextPath()%>/centerForm";
			   return true;
		   }
		   			
	}
   
   $(function (){
	   $(".checkA").click(function(){
		   $('#checkPwd').val("");
		    var commentNoA=$("[name=commentNoA]").val(); 
		   var id = $('.checkId').attr('id');
		    var no = $(this).attr('id');
		    var pwd = $(this).attr('name'); //db에 있는 password 값
		    if(id=='admin'){
		    	$(this).attr("data-toggle","");
				 $(this).attr("data-target","");
		    	location.href="<%=request.getContextPath()%>/centerView?centerNo_="+no+"&commentNo="+commentNoA;
		    }else{
		    	$("#centerNo_").val(no);
				$("#centerPw").val(pwd);
				$("#sub").val("first");
				 $("#commentNo2").val(commentNoA); 
		    }	
	   });
   });
   var noSum = [];
   $(function (){
	   $(".checkB").click(function(){
		   var id = $('.checkId').attr('id');
		   var no = $(this).attr('id');
		   var pwd = $(this).attr('name');
		   var count =$('.count').val();
	
		   if(id=='admin'){
				   $("."+no).slideToggle("fast");
		   }
		   else if(noSum.length==0){
			   $(this).attr("data-toggle","modal");
			    $(this).attr("data-target","#checkPwdmodal");
			    $("#centerNo_").val(no);
				$("#centerPw").val(pwd); 
				$("#sub").val("second");
				noSum.push(no);
		   }else if(noSum.length>0){
				if(noSum.some(function(item){return item==no})){
					$("."+no).slideToggle("fast"); 
					   $(this).attr("data-toggle","");
					   $(this).attr("data-target","");
					   $("#sub").val("second");
				}else{
					$('#checkPwd').val("");
					$(this).attr("data-toggle","modal");
				    $(this).attr("data-target","#checkPwdmodal");
				    $("#centerNo_").val(no);
					$("#centerPw").val(pwd); 
					$("#sub").val("second");
					noSum.push(no);
				}
		   }
	   });
   });
   
   function fn_checkPwd() {
	   var pwd = $("[name=centerPw]").val();
	   var sub = $("[name=sub]").val();
	   var centerNo_ = $("[name=centerNo_]").val();
		if($('#checkPwd').val().trim().length == 0) { // val() => 값. trim() => 공백 제거. 
			alert("비밀번호를 입력하세요");
			$('#checkPwd').focus(); 
			return false;
		}else if($('#checkPwd').val()!=pwd){ //입력한 값과 db값을 비교 
			alert("비밀번호가 틀립니다. 다시 입력해주세요.");
			return false;
		}else if(sub=="second"){
			$(".pwdForm").attr("action","<%=request.getContextPath()%>/centerList");
			$("#checkPwdmodal").modal("hide");
		 	return false; 
		}else{
			$(".pwdForm").attr("action","<%=request.getContextPath()%>/centerView");
			return true;
		}
		return true;
	}
   
   function fn_cancel(){
	    var commentDelete=$("[name=delete]").val();
		location.href="<%=request.getContextPath()%>/commentDelete?commentDelete="+commentDelete; 
	}
   
   function fn_change(){
	   var commentNo3=$("[name=commentNo3]").val();
	   var comment=$("[name=comment]").val();
	   var centerNo=$("[name=centerNo]").val();
	   location.href="<%=request.getContextPath()%>/centerView?centerNo_="+centerNo+"&comment="+comment+"&commentNo="+commentNo3; 
   }

</script>
<section>

<div class="container-fluid">    
	  <div class="row content">
		    <div class="col-lg-2 sidenav">
		    </div>
		    <div class="row" >
		    		<p id="demo"></p>
				    <div class="col-lg-8 main_title">
				    	<div class="row">
					    	<div class="col-lg-3" style="width:180px;margin-left:30px">
					    		<span class="glyphicon glyphicon-headphones gi-2x"></span>
					    	</div>
					    	<div class="col-lg-9" style="margin-top:20px">고객센터
					    		<p style="font-style:normal; font-size:15px">1:1문의를 통해 불편사항, 개선사항 등을 남겨주시면 빠른 시일내에 답변드리겠습니다. </p>
					    	</div>
				    	</div>

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
								<th>STATE</th>
							</tr>
					   </thead>
						<tbody>
							<%if(session.getAttribute("memberLoggedIn")!=null) {%>
							<input type="hidden" class="checkId"id="<%=memberLoggedIn.getMem_id()%>"/>
							<%} %>
							
						<%for(Center c :list) 
						{%>
							
							  <tr>
								<td><%=c.getCenterNo() %></td>
								<td>
									<i class="material-icons">lock_outline</i>
									<a href='#' id="<%=c.getCenterNo() %>" name="<%=c.getCenterPwd() %>" class="checkA" data-toggle="modal" data-target="#checkPwdmodal" data-backdroup="static"><%=c.getCenterTitle() %>
									</a>
									<div class="modal fade modal_left" id="checkPwdmodal" role="dialog" data-backdrop="false" tabindex="-1">
					                <div class="modal-dialog modal-80size">
					                  <!-- Modal 내용-->
						                  <div class="modal-content back modal-80size">
						                    <div class="modal-header modal_line">
							                      <button type="button" class="close" data-dismiss="modal">&times;</button>							                     
						                     </div> 
						                     
						                     <form class="pwdForm" action="<%=request.getContextPath()%>/centerView"id="loginModalFrm" method="post" onsubmit="return fn_checkPwd();">
							                      <div class="modal-body" >
							                      	 <h3 class="txtcenter text-center" style="margin-bottom:40px;margin-top:0px">비밀번호 입력</h3>
									                 <input type="password" id="checkPwd" name="checkPwd" class="form-control form-control-sm validate ml-0" placeholder="Enter password">
									                 <input type="hidden" id="centerNo_" name="centerNo_"/>
									                 <input type="hidden" id="centerPw" name="centerPw"/>
									                 <input type="hidden" id="commentNo2" name="commentNo"/>
									                 <input type="hidden" id="sub" name="sub"/>
									           	  </div>
							            	
							                     <div class="modal-footer modal_line">
								                     <button type="submit" class="btn btn-default " >확인</button>  
								                     <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
							                     </div>   
						                    </form>
						                </div>
					               </div>
							</div>
								</td>
								<td><%=c.getCenterWriter() %></td>
								<td><%=c.getCenterDate() %></td>
								<td><%if(c.getOriginalFileName()!=null){%>
								<img src='<%=request.getContextPath()%>/images/file1.PNG' width='16px'/>
								<%} %>
								</td>
								<%
								int flag=0;
								 for(int i=0;i<comment.size();i++)
								{
									 if(c.getCenterNo()==(comment.get(i)).getRefNo()){ %>
									 <td style="color:red">답변완료</td>
									<% flag++;
									 break;
								 	}
								}  %>
								<%if(flag==0){ %>
									<td>답변대기</td>
								<% }%>
							</tr>
						  <%for(Comment m:comment)
						  { %>
							  							
							<%if(c.getCenterNo()==m.getRefNo()){ %>
							<tr>
								<td></td>
								<td colspan="6">					
									<a href="#"class="checkB" id="<%=m.getCommentNo()%>" name="<%=c.getCenterPwd() %>">&nbsp;&nbsp;┗&nbsp;<%=c.getCenterWriter()%> 고객님 답변드려요^^
										<input type="hidden" name="commentNoA" value="<%=m.getCommentNo()%>"/> <!-- 관리자 모드에서 답글에 대한 정보를 수정할 때의 해당 번호 값 -->
										<input type="hidden" class="reviewNo" id="<%=m.getComment()%>"/>  
										<input type="hidden" class="count" id="count" name="count" value="0"/>
									</a>
									
								</td>
							</tr>
							
							<tr class ="<%=m.getCommentNo()%>" style="display: none">
								<td></td>
								<td colspan="6">
									<div>	
										<br>
										<p>안녕하세요 BIKEE입니다.</p>
										<p><%=m.getComment() %></p>
									</div>
									<div>
										<br><br>
										<p>[Original Message]</p>
										<p><%=c.getCenterContent() %></p>
										<%if(c.getOriginalFileName()!=null) {%>
										<img style="width:280px; height:160px; margin-bottom:50px"src='<%=request.getContextPath() %>/upload/center/<%=c.getOriginalFileName()%>' width='16px'/>
										<%} %>
										<br>
									</div>
										<%if(session.getAttribute("memberLoggedIn")!=null) {%>
											<%if(memberLoggedIn.getMem_id().equals("admin")){ %>
											<form action="<%=request.getContextPath()%>/centerView" method="post">
											<button type="submit" class="btn btn-default">수정</button>
											<input type="hidden" name="comment" value="<%=m.getComment()%>"/>
												<input type="hidden" name="commentNo" value="<%=m.getCommentNo()%>"/>
												<input type="hidden" name="centerNo_" value="<%=c.getCenterNo()%>"/>
											<button type="button" class="btn btn-default" onclick="fn_cancel()" name="delete" value="<%=m.getCommentNo()%>">삭제</button>
											</form>
											<%} %>
										<%} %>
								</td>
							</tr>
							
						<%} 
						if(m.getRefNo()==c.getCenterNo()) break;
						%>
					<%} %>
				<%} %>
				
						</tbody>
					 </table>
					<div class="text-center" >
					    <ul class="pagination pagination-sm" >
					    	<%=pageBar %>
					     </ul> 
					 	
				       		<button type="button" class="btn btn-primary btn pull-right" onclick='fn_write()' style="width:80px; height:29px; font-size:13px;margin-top:20px">WRITE</button>
					
					</div>
			    </div>
		    </div>
			   <!--  <div class="col-lg-2 sidenav">
			    </div> -->
	  </div>
</div>
</section>
<%@ include file='/views/common/footer.jsp' %>