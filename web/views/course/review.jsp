<%@page import="review.model.vo.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <div class = "come">
      <h2><img class="icon" src = "../images/course/common/icon5.PNG"> 체험후기</h2>
      <hr>
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
                     <%for(Review r :rlist) {%>
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
   </div>