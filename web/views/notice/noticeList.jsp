<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*,notice.model.vo.Notice"  %>
    
<%@ include file= '/views/common/header.jsp' %>
<%
   List<Notice> list = (List<Notice>) request.getAttribute("list");  
   int cPage = (int) request.getAttribute("cPage");
   String pageBar = (String) request.getAttribute("pageBar");
%>


<style>
div.main_title{font:italic normal normal 50px/1.4em dinneuzeitgroteskltw01-_812426,sans-serif;background-color:#1E68CB;color:white;height:100px;
       padding-top:10px; margin-left: 250px;}

@media( max-width: 640px ) {
	#tickets,
	#tickets thead,
	#tickets tbody,
	#tickets tr,
	#tickets th,
	#tickets td {
		display: block;
	}

	#tickets tr {
		border-bottom: 1px solid #ddd;
	}

	#tickets th,
	#tickets td {
		border-top: none;
		border-bottom: none;
	}
	#tickets{
		width: 450px;
	}
}/* 

.c{width: 150px;}
	
   @media screen and (max-width: 700px) {

	.a {width: 100%;}
	.c{display: none;}
	table#tbl-board.table.table-hover{
	   width: 450px;
	   margin: 30px 10px 30px 10px; 
	   position: absolute; 
	   left:3%;
	} */
	
	#conten{height: 400px;width: 200px;}
	/* div#board-container{width:1000px;height:700px; margin: 70px 50px 50px 150px auto; text-align:center;}  */
   .notice-container{margin-top: 100px; } 
	
    div#pageBar{ text-align:center; width: 200px;} 
   /* 공지사항 공간 */
   div#list_table{
	   
	width:auto;
    height: auto;
    margin: 10px 10px 10px 10px;
   	display: inline-block;
   	position: relative;
   	
    }
    /* 공지사항 */
    #h2Title{position: absolutes;size:auto; text-align: center; }
	/*테이블  */
	/* #tbl-board{position: absolute; left: 20%; margin: 30px 10px 30px 10px;  } */
   
   table#tbl-board th, table#tbl-board td {border:1px solid; padding: 5px 0; text-align:center;}
  	/* 글쓰기 버튼 */
 	#button-div{display: flex;margin-top: 50px;}
   #btn-add{ width:100px;;position:absolute;right: 30%; display: inline; font-size: 15px;}
   #h2Title{left: 250px;}
   #pp{ text-align: right; }
	#bad{background-color: rgba(125,125,125,0.5) ;font-size: 12px;}
</style>


<script>
	//글쓰기 기능
	
	function fn_goNotice() {
									/* 일단 서블릿을 만든다. BoardFormServlet  글쓰기*/
		location.href="<%=request.getContextPath()%>/notice/noticeForm";
	}
	//글 찾기 기능
  $(document).ready(function(){
	   $("#myInput").on("keyup", function() {
	     var value = $(this).val();
	     
	     $("#myTable tr").filter(function() {
	       $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	     });
	   });
	 }); 
	//메인공지사항
	
	
	
   
	
</script>

  
<div class="container">
	<div id="button-div">
		<div class="col-lg-6 main_title text-center">N o t i c e </div>
	</div>
	<hr>
	<%if(session.getAttribute("memberLoggedIn") !=null && memberLoggedIn.getMem_id().equals("admin")) {%>
					
		<button onclick="fn_goNotice()" id="btn-add"  class="btn btn-default">글쓰기</button><br>
				 	   
	<%} %>
 	<div class="notice-container"  >
	   <table id="tickets" class="table table-hover">
	      <thead>
		      <tr>
		         <th style="width: 130px;">번호</th>
		         <td style="text-align: left;">제목</td>
		  		 <td>작성자</td>
		         <td style="width: 100px">작성일</td>
		         <td>조회수</td>
		      </tr>
	      </thead>
	      <% for(Notice n : list)  { %>
	      <tbody id="myTable">
		      <tr>																																
		         <th ><%= n.getNoticeNo() %></th>
		         <td style="text-align: left;" >
			         <a class="noticeViewConnect" href='<%= request.getContextPath() %>/notice/noticeView?no=<%= n.getNoticeNo() %>'>
			         <%= n.getNoticeTitle() %>&nbsp;
			         <%if(n.getNoticeCommentCount() !=0){ %>
			         	<img src="<%=request.getContextPath()%>/images/notice/new.png">&nbsp;&nbsp;<span id='bad' class="badge badge-info" ><%=n.getNoticeCommentCount() %></span> 
			         <%} %>
			         </a>
			     </td>
		        
		     
		         <!-- <li role="presentation"><a href="#">Messages </a></li> -->
		         <td class="c"><%= n.getNoticeWriter() %></td>
		         <td class="c"><%= n.getNoticeDate() %></td>
		         <td class="c"><%= n.getNoticeReadcount() %></td>
		      </tr>
	      </tbody>
	      <% } %>
	   </table>
	   <div>
	   		 <input class="form-control" id="myInput" style="width: 150px;" type="text" placeholder="Search..." > 
	   		<p id="pp"><%= "총 게시물 :" + request.getAttribute("totalContent") %>   </p>
	   </div>
	    <div style="height: 130px; width: 300px; margin-bottom: 20px;">
  			<div id="pageBar" style="width: 300px;display: inline;">
		     <%=request.getAttribute("pageBar") %>   
		   </div>
		    
		</div>
		
	</div>
	
	

</div>
	
	
	

<%@ include file= '/views/common/footer.jsp' %>







