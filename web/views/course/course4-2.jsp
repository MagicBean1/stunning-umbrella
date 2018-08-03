<%@page import="review.model.vo.Review"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= '/views/common/header.jsp' %>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Cute+Font|Do+Hyeon|Sunflower:300" rel="stylesheet">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/courseInfo.css">
<%
   List<Review> rlist = (List<Review>)request.getAttribute("rlist");
%>
<div class = "container">
	<div class = "row content">
		<%@ include file = '/views/course/side.jsp' %>
		<div class="col-sm-9 main">
			<h1>인천대공원(소래포구역 - 송도MTB파크)</h1>
	<div class = "space"></div>
	<div class = "course_image">
		<div class ="view">
			<div class = "mySlides">
				<img src = "../images/course/course4-2/courseImage4-1.jpg" style ="width: 100%;height:100%;">
			</div>
			<div class = "mySlides">
				<img src = "../images/course/course4-2/courseImage4-2.JPG" style ="width: 100%;height:100%;">
			</div>
			<div class = "mySlides">
				<img src = "../images/course/course4-2/courseImage4-3.PNG" style ="width: 100%;height:100%;">
			</div>
			<div class = "mySlides">
				<img src = "../images/course/course4-2/courseImage4-4.jpg" style ="width: 100%;height:100%;">
			</div>
		</div>
		<a class="prev" onclick="plusSlides(-1)">&lt;</a>
 		<a class="next" onclick="plusSlides(1)">></a>

 		<div class="row">
		    <div class="column">
		      <img class="demo cursor" src="../images/course/course4-2/courseImage4-1.jpg" style="width:100%;height:100%" onclick="currentSlide(1)" alt="북한강 벚꽃길">
		    </div>
		    <div class="column">
		      <img class="demo cursor" src="../images/course/course4-2/courseImage4-2.JPG" style="width:100%;height:100%" onclick="currentSlide(2)" alt="">
		    </div>
		    <div class="column">
		      <img class="demo cursor" src="../images/course/course4-2/courseImage4-3.PNG" style="width:100%;height:100%" onclick="currentSlide(3)" alt="test3">
		    </div>
		    <div class="column">
		      <img class="demo cursor" src="../images/course/course4-2/courseImage4-4.jpg" style="width:100%;height:100%" onclick="currentSlide(4)" alt="test4">
		</div>
		   <script>
			var slideIndex = 1;
			showSlides(slideIndex);
			
			function plusSlides(n) {
			  showSlides(slideIndex += n);
			}
			
			function currentSlide(n) {
			  showSlides(slideIndex = n);
			}
			
			function showSlides(n) {
			  var i;
			  var slides = document.getElementsByClassName("mySlides");
			  var dots = document.getElementsByClassName("demo");
			  var captionText = document.getElementById("caption");
			  if (n > slides.length) {slideIndex = 1}
			  if (n < 1) {slideIndex = slides.length}
			  for (i = 0; i < slides.length; i++) {
			      slides[i].style.display = "none";
			  }
			  for (i = 0; i < dots.length; i++) {
			      dots[i].className = dots[i].className.replace(" active", "");
			  }
			  slides[slideIndex-1].style.display = "block";
			  dots[slideIndex-1].className += " active";
			  captionText.innerHTML = dots[slideIndex-1].alt;
			}
		</script>
		</div>
	</div>
	<div class ="space"></div>
	<div class = "course_info">
		<h2><img class="icon" src = "../images/course/common/icon1.PNG"> 코스정보</h2>
		<hr/>
		<table>
			<tr>
				<th>코스정보 : </th>
				<td> 소래포구역 - 송도 MTB파크</td>
			</tr>
			<tr>
				<th>전체거리 : </th>
				<td> 왕복 15km</td>
				
			</tr>
			<tr>
				<th>예상시간 :  </th>
				<td> 1시간 </td>
			</tr>
			<tr>
				<th>난이도 : </th>
				<td><img class="level" src="../images/course/common/star.png">
				<img class="level" src="../images/course/common/star.png">
				<img class="level" src="../images/course/common/star.png">
				<img class="level" src="../images/course/common/star.png"></td>
			</tr>
		</table>
		
	</div>
	<div class ="space"></div>
	<div class = "point_div">
		<h2><img class="icon" src = "../images/course/common/icon2.PNG"> 매력포인트</h2>
		<hr>
		<table>
			<tr>
				<th style="color:red;"><img class="point" src = "../images/course/common/point1.PNG">
				 &nbsp; 44개의 산악자전거 코스</th>
			</tr>
			<tr>
				<td colspan="2">
				<br>송도 MTB파크에는 44개의 산악자전거 코스가 있으며, 이곳에서 산악자전거만의 스릴과 짜릿한 매력을 느낄 수 있습니다.
				</td>
			</tr>
			<tr>
				<td> </td>
			</tr>
			<tr>
				<th style="color:orange;"><br><img class="point" src = "../images/course/common/point2.PNG">
				&nbsp; 센트럴파크</th>
			</tr>
		
			<tr>
				<td colspan="2">
				<br>미국의 센트럴파크를 벤치마킹하여 만들어진 곳으로 이국적인 분위를 느껴 볼 수 있으며 밤에는 낮과 다른 야경으로 힐링을 할 수 있습니다.
				</td>
			</tr>
		</table>
	</div>
	
	<div class ="space"></div>
	<div class = "rough_map">
		<h2><img class="icon" src = "../images/course/common/icon3.PNG"> 코스약도</h2>
		<hr>
		<img style="width:80%;margin-left:10%; " src = "../images/course/course4-2/course4-2.jpg">
	</div>
	
	
	<div class ="space"></div>
	<div class = "come">
		<h2><img class="icon" src = "../images/course/common/icon4.PNG"> 교통안내</h2>
		<hr>
		<img style="width:80%;margin-left:10%; " src = "../images/course/course4-1/4.PNG">
	</div>
	
	<div class ="space"></div>
		<%@ include file='/views/course/review.jsp' %>
		</div>
	</div>
</div>

<%@ include file= '/views/common/footer.jsp' %>