<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="review.model.vo.Review"%>
<%@ include file='/views/common/header.jsp' %>
<link rel="stylesheet" type="text/css" href="star-rating-svg.css">
<%
   Review r = (Review)request.getAttribute("c");
%>
<style>
   div.container-fluid{padding-top:10px; padding-bottom:10px}
   div.col-lg-2 {background-color:white;height:800px}
   div.main_title{font:italic normal normal 50px/1.4em dinneuzeitgroteskltw01-_812426,sans-serif;background-color:#1E68CB;color:white;height:100px;
       padding-top:10px}
   div.sub_title{font:italic normal normal 35px/1.4em dinneuzeitgroteskltw01-_812426,sans-serif;color:#1E68CB;padding-top:55px}
   div.div_title{border:1px solid #1E68CB; width:644.32px; height:40px; padding-top:7px; color:#1E68CB}
/*    div.div_content{border:1px solid #1E68CB; width:644.32px; height:450px; padding-top:7px;color:#1E68CB} */
   span.font{font:italic normal normal 200px}
   div.content{background-color:#F0F0F0}
   	button#btn1{ width:100px; height:35px}
	button#btn2{ width:100px; height:35px;margin-left:35px}
	button#btn3{ width:100px; height:35px;margin-left:35px}
   .rating-stars ul {
  list-style-type:none;
  padding:0;
  
  -moz-user-select:none;
  -webkit-user-select:none;
}
.rating-stars ul > li.star {
  display:inline-block;
  
}
/* Idle State of the stars */
.rating-stars ul > li.star > i.fa {
  font-size:1em; /* Change the size of the stars */
  color:#ccc; /* Color on idle state */
}
/* Hover state of the stars */
.rating-stars ul > li.star.hover > i.fa {
  color:#FFCC36;
}
/* Selected state of the stars */
.rating-stars ul > li.star.selected > i.fa {
  color:#FF912C;
}
</style>
<script src="jquery.star-rating-svg.js"></script>

<script>
   function fn_update(){
      $(".update").attr("action","<%=request.getContextPath()%>/views/review/reviewUpdate.jsp");
      return true;
      
   }
   function fn_delete(){
      var result = confirm("해당 글을 삭제하시겠습니까?");
      if(result){
         $('.update').attr("action","<%=request.getContextPath()%>/reviewDelete");
         return true;
      }else{
         return false;
      }
      
   }
   function fn_cancel(){
      location.href="<%=request.getContextPath()%>/reviewList";
   }
   
   $(document).ready(function(){
      <%--  $("ul li[value='<%=r.getReviewStar()%>']").attr("selected", true); --%>
       var onStar = <%=r.getReviewStar()%> // The star currently selected
       var stars = $('#stars li').parent().children('li.star');
       for (i = 0; i < onStar; i++) {
            $(stars[i]).addClass('selected');
          }
   });
</script>
<section>

<div class="container-fluid">       
     <div class="row">
          <div class="col-lg-2 sidenav">
          </div>
          <div class="row" >
             <div class="col-lg-8 main_title text-center">
                CONSUMER REVIEWS
             </div>
             <div class="col-lg-8 content"> 
                
                  <div class="row">
                     <div class="text-center sub_title">Content Impormation</div>
                  </div>
                  <form action="" class="update" method="post">
                  <div class="row" style="padding-top:40px">
                     <div class="col-lg-3"></div>
                     <div class="col-lg-3" style="border:1px solid #1E68CB; height:40px; padding-top:7px;color:#1E68CB" ><span style="font-weight:bold">NO.</span><%=r.getReviewNo()%>
                        <input type="hidden"name="no" value="<%=r.getReviewNo()%>"/>
                     </div>
                     <div class="col-lg-3" style="border:1px solid #1E68CB;height:40px; padding-top:7px;color:#1E68CB"><span style="font-weight:bold">WRITER</span> <%=r.getReviewWriter() %>
                        <input type="hidden" name="writer" value="<%=r.getReviewWriter() %>"/>
                     </div>
                     <div class="col-lg-3"></div>
                  </div>
                  
                  <div class="row" style="padding-top:40px">
                     <div class="col-lg-3"></div>
                     <div class="col-lg-6 div_title"style="width:50%"><span style="font-weight:bold">TITLE</span><%=r.getReviewTitle() %>
                        <input type="hidden" name="title" value="<%=r.getReviewTitle() %>"/>
                     </div>
                     <div class="col-lg-3"></div>
                  </div>
                  
                  <div class="row" style="padding-top:40px">
                     <div class="col-lg-3"></div>
                     <%if(r.getOriginalFileName()!=null){ %>
                     <div class="col-lg-6 div_content" style="border:1px solid #1E68CB; height:80% padding-top:7px;color:#1E68CB"><span style="font-weight:bold">CONTENT</span><br><br><br>
                           <p style="text-align:center;">
                         <img style="width:350px; height:250px"src='<%=request.getContextPath() %>/upload/review/<%=r.getOriginalFileName()%>' width='16px'>
                         </p>
                      <br><br>
                      <label style="font-weight:bold; padding:0px;width:50px" class="control-label col-sm-2">[<%=r.getCourseType()%>]</label>
                      <div class="col-sm-10">
                              <section class='rating-widget'>
              
                             <!-- Rating Stars Box -->
                             <div class='rating-stars col'>
                               <ul id='stars'>
                                 <li class='star'  title='Poor' data-value='1'>
                                   <i class='fa fa-star fa-fw'></i>
                                 </li>
                                 <li class='star' title='Fair' data-value='2'>
                                   <i class='fa fa-star fa-fw'></i>
                                 </li>
                                 <li class='star'  title='Good' data-value='3'>
                                   <i class='fa fa-star fa-fw'></i>
                                 </li>
                                 <li class='star'  title='Excellent' data-value='4'>
                                   <i class='fa fa-star fa-fw'></i>
                                 </li>
                                 <li class='star'  title='WOW!!!' data-value='5'>
                                   <i class='fa fa-star fa-fw'></i>
                                 </li>
                                 
                               </ul>
                                   <div class='success-box'>
                                  <div class='clearfix'></div>
                                  
                                  <div class='text-message'></div>
                                  <input type="hidden" name="star" value=""/>
                                  <div class='clearfix'></div>
                                </div>
                             </div>
                             
                           </section>
                           </div>

                      <input type="hidden" name="course" value="<%=r.getCourseType()%>"/>
                        <p name="content" ><%=r.getReviewContent() %></p>
                        <input type="hidden" name="content" value="<%=r.getReviewContent() %>"/>
                        
                     </div>
                     <%} else{%>
        
                     <div class="col-lg-6 div_content" style="border:1px solid #1E68CB;height:250px; padding-top:7px;color:#1E68CB"><span style="font-weight:bold">CONTENT</span><br><br>
                      
                           <label style="font-weight:bold; padding:0px;width:50px" class="control-label col-sm-2">[<%=r.getCourseType()%>]</label>
                      <div class="col-sm-10">
                              <section class='rating-widget'>
              
                             <!-- Rating Stars Box -->
                             <div class='rating-stars col'>
                               <ul id='stars'>
                                 <li class='star'  title='Poor' data-value='1'>
                                   <i class='fa fa-star fa-fw'></i>
                                 </li>
                                 <li class='star' title='Fair' data-value='2'>
                                   <i class='fa fa-star fa-fw'></i>
                                 </li>
                                 <li class='star'  title='Good' data-value='3'>
                                   <i class='fa fa-star fa-fw'></i>
                                 </li>
                                 <li class='star'  title='Excellent' data-value='4'>
                                   <i class='fa fa-star fa-fw'></i>
                                 </li>
                                 <li class='star'  title='WOW!!!' data-value='5'>
                                   <i class='fa fa-star fa-fw'></i>
                                 </li>
                                 
                               </ul>
                                   <div class='success-box'>
                                  <div class='clearfix'></div>
                                  
                                  <div class='text-message'></div>
                                  <input type="hidden" name="star" value=""/>
                                  <div class='clearfix'></div>
                                </div>
                             </div>
                             
                           </section>
                           </div>
                        
                        <input type="hidden" name="course" value="<%=r.getCourseType()%>"/>
                        <br><br>
                        <p name="content"><%=r.getReviewContent() %></p>
                        <input type="hidden" name="content" value="<%=r.getReviewContent() %>"/>
                        </div>
                      <%} %>
                     <div class="col-lg-3"></div>
                  </div>
                  
                  
                  <%if(memberLoggedIn!=null) {%> 
                     <%if(memberLoggedIn.getMem_id().equals("admin")){ %>
                        <div class="row" style="padding-top:40px;padding-bottom:80px">
                           
                              <button type="submit" class="btn btn-primary" style="width:110px; height:35px;margin-left:44%" onclick="fn_delete()">delete</button>
                              
                        </div>
                     <%}else if(memberLoggedIn.getMem_id().equals(r.getReviewWriter())) {%> 
                  <div class="row" style="padding-top:50px;padding-bottom:70px;margin-left:27%">
           
                        <button type="submit" class="btn btn-primary" id="btn1" onclick="fn_update()">update</button>
                        <button type="submit" class="btn btn-primary" id="btn2" onclick="fn_delete()">delete</button>
                        <button type="button" class="btn btn-primary" id="btn3" onclick="fn_cancel()">cancel</button>
                   
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