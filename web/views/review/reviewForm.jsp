<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='/views/common/header.jsp' %>
<link rel="stylesheet" type="text/css" href="star-rating-svg.css">
<style>
	div.container-fluid{padding-top:10px; padding-bottom:10px}
	div.col-lg-2 {background-color:white;height:800px}
	div.main_title{font:italic normal normal 50px/1.4em dinneuzeitgroteskltw01-_812426,sans-serif;background-color:#1E68CB;color:white;height:100px;
	    padding-top:10px}
	div.sub_title{font:italic normal normal 35px/1.4em dinneuzeitgroteskltw01-_812426,sans-serif;color:#1E68CB;padding-top:55px}
	span.font{font:italic normal normal 200px}
	div.content{background-color:#F0F0F0}
	div#subContent{margin-left:20%}

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
  font-size:2em; /* Change the size of the stars */
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
    	function fn_formDate(){
    		var content=$("[name=content]").val();
    		var title=$("[name=title]").val();
    		
    		if(title.trim().length==0){
    			alert("제목을 입력하세요");
    			return false;
    		}
    		else if(content.trim().length==0){
    			alert("내용을 입력하세요");
    			return false;
    		}
    		return true;
    	}
    	
    	function fn_cancel(){
    		location.href="<%=request.getContextPath()%>/reviewList";
    	}
    	
    	
    	$(document).ready(function(){
    		  /* 1. Visualizing things on Hover - See next part for action on click */
    		  $('#stars li').on('mouseover', function(){
    		    var onStar = parseInt($(this).data('value'), 10); // The star currently mouse on
    		   
    		    // Now highlight all the stars that's not after the current hovered star
    		    $(this).parent().children('li.star').each(function(e){
    		      if (e < onStar) {
    		        $(this).addClass('hover');
    		      }
    		      else {
    		        $(this).removeClass('hover');
    		      }
    		    });
    		    
    		  }).on('mouseout', function(){
    		    $(this).parent().children('li.star').each(function(e){
    		      $(this).removeClass('hover');
    		    });
    		  });
    		  
    		  
    		  /* 2. Action to perform on click */
    		  $('#stars li').on('click', function(){
    		    var onStar = parseInt($(this).data('value'), 10); // The star currently selected
    		    var stars = $(this).parent().children('li.star');
    		    
    		    for (i = 0; i < stars.length; i++) {
    		      $(stars[i]).removeClass('selected');
    		    }
    		    
    		    for (i = 0; i < onStar; i++) {
    		      $(stars[i]).addClass('selected');
    		    }
    		    
    		    // JUST RESPONSE (Not needed)
    		    var ratingValue = parseInt($('#stars li.selected').last().data('value'), 10);
    		    var msg = "";
    		    if (ratingValue > 1) {
    		        msg =  ratingValue;
    		    }
    		    else {
    		        msg =ratingValue ;
    		    }
    		    responseMessage(msg);
    		    
    		  });
    		  
    		  
    		});


    		 function responseMessage(msg) {
    		  $('.success-box').fadeIn(200);  
    		/*    $('.success-box div.text-message').html("<span>" + msg + "</span>");   */
    		 $('[name=star]').val(msg);
    		 }
    </script>
<section>

<div class="container-fluid">    
  <form class="form-horizontal" action="<%=request.getContextPath()%>/reviewFormEnd" method="post" enctype="multipart/form-data">
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
 
   		<div class="row form-group" style="padding-top:40px">
   			
   			<div class="col-lg-7" id="subContent">
   				<label class="control-label col-sm-2">NAME</label>
   				<div class="col-sm-9">
   					<input type="text" class="form-control" name="writer" readonly value="<%=memberLoggedIn.getMem_id()%>"/>
   				</div>
   			</div>
   			<div class="col-lg-3"></div>   			
   		</div>
   		
   		
   		<div class="row form-group" style="padding-top:40px">
   			
   			<div class="col-lg-7" id="subContent">
   				<label class="control-label col-sm-2">TYPE</label>
   				<div class="col-sm-9">
   					 <select class="form-control" name="course">
   						<option value="코스1">코스1</option>
   						<option value="코스2">코스2</option>
   						<option value="코스3">코스3</option>
   						<option value="코스4">코스4</option>
   						<option value="코스5">코스5</option>
   						<option value="코스6">코스6</option>
   						<option value="코스7">코스7</option>
   						<option value="코스8">코스8</option>
   					</select> 
   				</div>
   			</div>
   			<div class="col-lg-3"></div>   			
   		</div>
   		
   		<div class="row form-group" style="padding-top:40px">
   			
   			<div class="col-lg-7"id="subContent">
   				<label class="control-label col-sm-2">SCORE</label>
   				<div class="col-sm-9">
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
   			</div>
   			<div class="col-lg-3"></div>   			
   		</div>
   		
   		
   		<div class="row form-group" style="padding-top:40px">
   			
   			<div class="col-lg-7"id="subContent">
   				<label class="control-label col-sm-2">TITLE</label>
   				<div class="col-sm-9">
   					<input type="text" class="form-control" name="title" placeholder="Enter title" required/>
   				</div>
   			</div>
   			<div class="col-lg-3"></div>
   		</div>
   		
   		<div class="row form-group" style="padding-top:40px">
   			
   			<div class="col-lg-7"id="subContent">
   				<label for="file" class="control-label col-sm-2">FILE</label>
   				<div class="col-sm-9">
   				<input type="file"  class="form-control" placeholder="file" name="file"></textarea>
   				</div>
   			</div>
   			<div class="col-lg-3"></div>
   		</div>
   		
   		<div class="row form-group" style="padding-top:40px">
   			
   			<div class="col-lg-7"id="subContent"style="margin-left:18%">
   				<label for="comment" class="control-label col-sm-2"style="padding-right:17%;">CONTENT</label>
   				<div class="col-sm-9">
   				<textarea rows="6" class="form-control" placeholder="Enter comment" name="content"></textarea>
   				</div>
   			</div>
   			<div class="col-lg-3"></div>
   		</div>
   		<div class="row" style="padding-top:40px;padding-bottom:80px;margin-left:31%">
   			
   					<div class="col-lg-3">
   						<button type="submit" class="btn btn-primary" value="등록하기" onclick="return fn_formDate();" style=" height:40px;width:130px " >save</button>
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