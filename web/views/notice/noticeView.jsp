<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = 'java.util.*, notice.model.vo.*' %>


<%
  Notice notice = (Notice)request.getAttribute("notice");
  List<NoticeComment> commentList = (List<NoticeComment>)request.getAttribute("list");  /* 댓글 */
  

%>
<%@ include file= '/views/common/header.jsp' %>
<style>
	div#notice-container{width:800px; margin:0 auto; text-align:center;}
	div#notice-container h2{margin:10px 0;}
	form#tbl-notice{width:500px; margin:0 auto; border-bottom:1px solid black; border-collapse:collapse; clear:both; }
 	div#comment-container button#btn-insert{width :70px; height: 40px;   position :relative; top :-20px; } 
	table#tbl-comment{width:580px; margin:0 auto; border-collapse:collapse; clear:both; } 
    table#tbl-comment tr td{border-bottom:0.3px dotted black;  padding:5px; text-align:left; line-height:120%;}
    
    tr td:first-of-type{padding: 5px 5px 5px 20px;}
    tr td:last-of-type {text-align:right; width: 130px;}
    
    
    
    
    
    
    
     /* level 1 */
   	
     .level1 .comment-writer { color : navy; font-size:25px; font-family: "comic sans Ms" }
     .level1 .comment-date   {color:tomato; font-size:13px}
     .level1 tr td:first-of-type{padding :5px 5px 10px 20px;}
     tr td:last-of-type {text-align:right; width: 200px; padding: 0px; height: 120px;color:gray; }
    
    
     /* level 2 */ 
    
    .level2 .comment-writer{color:#8e8eff;  font-size:20px; font-family: "comic sans Ms"}
    .level2 .comment-date{color:#ff9c8a; font-size:13px}

    .level2 td:last-of-type {color:gray; }
    table#tbl-comment .level2 td:first-of-type{padding-left:50px;}
    /* table#tbl-comment tr.level2 td:first-of-type{padding-left:200px;} */
    
    
    /*   삭제  */
   .comment-delete{display:inline;width: 70px; height:20px; background-color: white;border: 1px solid white;}
   .comment-delete:hover{display:inline;width :70px;color:#F15F5F;font-size:14px;
	text-shadow:1px 1px 1px  #DB0000,10px 10px 20px  palegoldenrod;
	}
    tr:hover .comment-delete{display :inline;}
    /*  답글  */
     #commentFrm1{display: inline;}
     #commentFrm2{display: inline;}
     .btn-reply{display:inline; width: 70px; height:20px; background-color: white;border: 1px solid white;}
     .btn-reply:hover{display:inline; width: 70px; color:skyblue;font-size:14px;
     text-shadow:1px 1px 1px  blue,10px 10px 20px  palegoldenrod;
     }  
    tr:hover .btn-reply{display:inline;}

   	
   	/*  hr  */
   	.colorgraph {
	  height: 7px;
	  border-top: 0;
	  background :#c4e17f;
	  border-radius: 5px;
	  background-image: linear-gradient(to right,#A2D1DF,#B3C9E6 50%);
	}
	.commentlistAdd{ background-color: rgba(130,130,130,0.1) ;border-radius :25px 35px 25px 35px;}
    .abc{display:inline; width: 70px; height:20px; background-color: white;border: 1px solid white;}
    .abc:hover{display:inline; width: 70px; color:skyblue;font-size:14px;
     text-shadow:1px 1px 1px  blue,10px 10px 20px  palegoldenrod;
     top:-20px; background-color: white;border: 1px solid white;
     }  
     
</style>

<script>
	

	
	
	
	
 	$(function() {/* 로그인이 된사람 */
 		
//		1. 
		$('[name=noticeComment]').focus(
			function () {
				if(<%=memberLoggedIn==null%>){
					fn_loginAlert();
				}
		});
//		2.
		$('[name=noticeCommentFrm]').submit(function (e) {
				
				if(<%=memberLoggedIn==null%>){
					fn_loginAlert();
					e.preventDefault();
					return;
				}
				var len =$('textarea[name=noticeCommentContent]').val().trim().length;
				if(len ==0){
					alert('내용 없음! 내용 입력!');
					e.preventDefault();
				}
				
		});
		
		
//		3.
<%if(memberLoggedIn !=null ){%>
		$('.btn-reply').on('click',function() {
			if(<%=memberLoggedIn != null%>){
				/* 세션에 로그인정보 넣어놈// 로그인 성공 */
			
				var tr = $("<tr></tr>"); /* <tr>요소를 만듬  [create.element] 댓글을위한 tr 그 밑에 td*/
				var html = ""; /* colspan = 답글 , 내용 */
				
				
//				 답글에 버튼 
				html+="<td style='display: none; text-align: left;colspan:2' >";
				html+="<form action='<%=request.getContextPath()%>/notice/noticeCommentInsert' method='post' style='width:400px;'>";
				html+="<input type='hidden' name='noticeRef' value='<%=notice.getNoticeNo() %>'/>";                      /* level2 = 답글O 댓글 X */
				html+="<input type='hidden' name='noticeCommentWriter' value='<%=memberLoggedIn.getMem_id() %>'/>";
				html+="<input type='hidden' name='noticeCommentLevel' value='2' />";
				html+="<input type='hidden' name='noticeCommentRef' value='"+$(this).val()+"'/>";  /* $(this) = 이벤트가 걸린놈 = 버튼   [btn-reply의 value값]*/                    
				html+="<textarea name='noticeCommentContent' cols='40' rows='3'></textarea>&nbsp&nbsp";
				html+="<button type='submit' class='abc fa fa-cloud' >등록</button>";
				html+="</form>";
				html+="</td>";
				
				
				tr.html(html);
				tr.insertAfter($(this).parent().parent()).children("td").slideDown(500);   /* $(this).parent().parent() 뒤에 tr넣는다 = insertAfter */
				$(this).off('click'); /* 한번만할때 off 안막으면 계속생김*/	/* td = html */
				tr.find("form").submit(function(e) {
					if(<%=memberLoggedIn==null%>){
						fn_loginAlert();
						e.preventDefault();
						return;
					}
					var len=$(this).children("textarea").val().trim().length;
					if(len==0){
						e.preventDefault();
					}
					
				});
				tr.find("textarea").focus();
			}else{
				/* 로그인 실패 */
				fn_loginAlert();
			}
		});
		
		
	});
 	<%}%>
 	
 	
 	function fn_loginAlert() {
 		alert('로그인 후 이용하세요!!');
		$('#userId').focus();
	}
 	
 	
 	

	
	
 function deleteNotice() {
 		
 		var frm = $('#noticeFrm');
		var url = '<%= request.getContextPath() %>/notice/deleteNotice';
		frm.attr("action", url);
		frm.submit();		
 }
 	
 function fn_updateNotice() {
		
		var frm = $('#noticeFrm');
		var url = "<%= request.getContextPath() %>/notice/noticeUpdate";
		frm.removeAttr('readonly');
		frm.attr("action", url);
		frm.submit();
	}
 function fn_returnList() {
	 
	 	location.href="<%=request.getContextPath()%>/notice/noticeList";
	 
}
 
 function fn_delete() {
	
	var frm = $('#commentFrm1');
	var url = "<%=request.getContextPath()%>/notice/noticeCommentDelete";
	frm.attr("action",url);
	frm.submit();
}
function fn_delete2()  {
	var frm = $('#commentFrm2');
	var url = "<%=request.getContextPath()%>/notice/noticeCommentDelete";
	frm.attr("action",url);
	frm.submit();
}
$(function(){
	$(document).ready(function(){ 
	    $("#toggle").on("click", function(){ 
	       $(this).toggleClass($('#updateContent').removeAttr('readonly')); 
	    }); 
	}); 
})








</script>

<section> 
<div id="notice-container" style="width: 700px; margin-bottom: 100px;">
	<div id="tbl-notice">
		 <div id="board-container"><br>
			<div class="container" style="width: 600px;">
				
			
					<p class="pull-left" style="font-size: 25px;"><%=notice.getNoticeTitle()%></p>
					<p class="pull-right" style="font-size: 15px;"><%=notice.getNoticeDate()%></p>
				
					
			</div>
			<hr class="colorgraph">
			<form id="noticeFrm"class="form-inline" action="<%=request.getContextPath()%>/notice/noticeUpdate" method="post">
				<%if(memberLoggedIn ==null || !(memberLoggedIn.getMem_id().equals("admin"))) {%>
					<textarea readonly name="updateContent" placeholder="<%=notice.getNoticeContent()%>" value="update_notice"  cols="85"   name="content" style="height:200px" onKeyup="var m=50;var s=this.scrollHeight;if(s>=m)this.style.pixelHeight=s+4"></textarea>
					<input type="hidden" name="updateNo" value="<%=notice.getNoticeNo() %>"><p></p>
				<%}else if(memberLoggedIn !=null && memberLoggedIn.getMem_id().equals("admin")){ %>
					<textarea  name="updateContent" placeholder="<%=notice.getNoticeContent()%>" value="update_notice"  cols="85"   name="content" style="height:200px" onKeyup="var m=50;var s=this.scrollHeight;if(s>=m)this.style.pixelHeight=s+4"></textarea><p></p>
					<input type="hidden" name="updateNo" value="<%=notice.getNoticeNo() %>">
			 		<input type="button" value="수정" onclick="fn_updateNotice()" class="btn btn-default"/>
			 		<input type="button" value="삭제" onclick="deleteNotice()" class="btn btn-default " >
	 			<%} %>
	 			<input type="button" value="뒤로가기" onclick="fn_returnList()" class="btn btn-default" id="back">
	 			<b><hr></b>

	 		</form>
		</div>	 
	</div>
	
	<table id="tbl-comment">
	
	<%if(commentList !=null) { /* 값이있는지여부 */
		
		for(NoticeComment bc:commentList){ /* bc에 list담아서 포문 */
			
			
			if(bc.getNoticeCommentLevel()==1){%> <!-- bc가 가져왔으면  -->
			
				<tr class='level1' style="padding: 0px; margin: 0px;height: 120px;">
					<td >
						<sub class = 'comment-writer'><%=bc.getNoticeCommentWrite()%></sub>
						<br><br><br>
						<%= bc.getNoticeCommentContent() %>
					</td>
					<%if(memberLoggedIn !=null ) {%>
					<td>
						<sub class = 'comment-date'><%=bc.getNoticeCommentDate() %></sub><p></p>
						<%if(memberLoggedIn.getMem_id().equals(bc.getNoticeCommentWrite()) || memberLoggedIn.getMem_id().equals("admin")) {%>
						<form name="commentFrm1"  id="commentFrm1">
								<input type="hidden" name="h_CommentNo" value="<%=bc.getNoticeCommentNo() %>">
								<input type="hidden" name="h_noticeNo" value="<%=notice.getNoticeNo() %>">
								
								<button onclick="fn_delete()" class='comment-delete' ><img src="<%=request.getContextPath()%>/images/notice/delete2.png">삭제</button>
						</form>
						<%} %>												
								<button class="btn-reply " value="<%=bc.getNoticeCommentNo()%>"><img src="<%=request.getContextPath()%>/images/notice/comment.png"></img>답글</button>
						</td>
						<% }%>
				</tr>
			
			<%} else{%>
			<!-- style="padding: 0px; margin: 0px;height: 120px;" -->
				<tr class='level2' style="padding: 0px; margin: 0px;height: 120px;">
					<td >
						<img src="<%=request.getContextPath()%>/images/notice/notice.png">
						<sub class = 'comment-writer'><%=bc.getNoticeCommentWrite()%></sub>
						<br><br><br>
						<%= bc.getNoticeCommentContent() %>
					</td>
					<%if(memberLoggedIn !=null ) {%>
					<td>
						<sub class = 'comment-date'><%=bc.getNoticeCommentDate() %></sub><p></p>
						<%if(memberLoggedIn.getMem_id().equals(bc.getNoticeCommentWrite()) || memberLoggedIn.getMem_id().equals("admin")) {%>
						<form name="commentFrm2"  id="commentFrm2">
								<input type="hidden" name="h_CommentNo" value="<%=bc.getNoticeCommentNo() %>">
								<input type="hidden" name="h_noticeNo" value="<%=notice.getNoticeNo() %>">
								<button onclick="fn_delete2()" class=' glyphicon glyphicon-remove comment-delete' >삭제</button>
						</form>
						<%} %>
								<button class="btn-reply fa fa-cloud" value="<%=bc.getNoticeCommentNo()%>">답글</button>
						</td>
						<% }%>
				</tr>
		 	
			<%} /* else */
		} /* for */ 
	} %>  <!-- if -->

	</table><br><br>
	<hr class="colorgraph">
	<%if(memberLoggedIn !=null){ %>
	<div id="comment-container">
		<div class="comment-editor">
		 <!-- 게시물 버튼 -->
			<form  method="post" name="noticeCommentFrm" id="noticeCommentFrm" action="<%=request.getContextPath()%>/notice/noticeCommentInsert"/>
				<input type="hidden" name="noticeRef" value="<%=notice.getNoticeNo() %>"/>                    <!-- 실제 위 게시판의 번호 -->
				<input type="hidden" name="noticeCommentWriter" value="<%=memberLoggedIn.getMem_id() %>"/>  <!-- 작성자  = (접속한사람)userId -->
				<input type="hidden" name="noticeCommentLevel" value="1"/>  								   <!-- 깊이 ? 순서 ? -->
				<input type="hidden" name="noticeCommentRef" value="0"/> 								   <!-- 댓글의 번호?? -->
				<textarea rows="3" cols="60" name="noticeCommentContent"/></textarea>		
				<button type="submit" id="btn-insert" class="btn btn-default">등록 </button>
				
			</form>
		</div>
	</div>
	<%} %>
</div>
</section>
<%@ include file= '/views/common/footer.jsp' %>     
   
   
   
   
 




















