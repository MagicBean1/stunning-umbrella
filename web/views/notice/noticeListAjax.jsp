<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,notice.model.vo.Notice"%>
    
<% List<Notice> list = (List)request.getAttribute("list"); %>


	        
<legend class="glyphicon glyphicon-flash" >공지사항</legend>	           
	<div class="notice-container"  style="background-color: #F3F3F3;" >
		   <table id="tickets" class="table table-hover">
		   <thead>
			      <tr>
			         <th style="width: 130px;">번호</th>
			         <td style="text-align: left;">제목</td>
			         </tr>
			</thead>
		 
			<%for(Notice n :list){%>
			 <tbody id="myTable">
				<tr>	
					<td><%=n.getNoticeNo() %></td>
					<td ><a  id="noticeViewConnect" href="<%=request.getContextPath()%>/notice/noticeView?no=<%=n.getNoticeNo() %> " ><%=n.getNoticeTitle() %></a></td>
				</tr>
			</tbody>
		<%}%>
		  </table>
	</div>
             
