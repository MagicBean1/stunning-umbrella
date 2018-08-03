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
			<h1>하늘공원, 노을공원</h1>
	<div class = "space"></div>
	<div class = "course_image">
		<div class ="view">
			<div class = "mySlides">
				<img src = "../images/course/course5-1/courseImage5-1.JPG" style ="width: 100%;height:100%;">
			</div>
			<div class = "mySlides">
				<img src = "../images/course/course5-1/courseImage5-2.JPG" style ="width: 100%;height:100%;">
			</div>
			<div class = "mySlides">
				<img src = "../images/course/course5-1/courseImage5-3.JPG" style ="width: 100%;height:100%;">
			</div>
			<div class = "mySlides">
				<img src = "../images/course/course5-1/courseImage5-4.JPG" style ="width: 100%;height:100%;">
			</div>
		</div>
		<a class="prev" onclick="plusSlides(-1)">&lt;</a>
 		<a class="next" onclick="plusSlides(1)">></a>

 		<div class="row">
		    <div class="column">
		      <img class="demo cursor" src="../images/course/course5-1/courseImage5-1.JPG" style="width:100%;height:100%" onclick="currentSlide(1)" alt="북한강 벚꽃길">
		    </div>
		    <div class="column">
		      <img class="demo cursor" src="../images/course/course5-1/courseImage5-2.JPG" style="width:100%;height:100%" onclick="currentSlide(2)" alt="">
		    </div>
		    <div class="column">
		      <img class="demo cursor" src="../images/course/course5-1/courseImage5-3.JPG" style="width:100%;height:100%" onclick="currentSlide(3)" alt="test3">
		    </div>
		    <div class="column">
		      <img class="demo cursor" src="../images/course/course5-1/courseImage5-4.JPG" style="width:100%;height:100%" onclick="currentSlide(4)" alt="test4">
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
				<td> 하늘공원 - 메타세콰이어길 - 노을공원</td>
			</tr>
			<tr>
				<th>전체거리 : </th>
				<td> 왕복 25km</td>
				
			</tr>
			<tr>
				<th>예상시간 :  </th>
				<td> 2시간 </td>
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
				 &nbsp; 노을이 일렁일때 가장아름다운 노을공원</th>
			</tr>
			<tr>
				<td colspan="2">
				<br>캠핑장, 남강댐 물문화관, 전망 테라스에서 망원경으로 지리산 천왕봉, 황매산, 집현산 등 볼 수 있음
진양호 풍경과 노을을 보며 문화, 예술, 휴식 등을 즐길 수 잇는 공간이다
				</td>
			</tr>
			<tr>
				<td> </td>
			</tr>
			<tr>
				<th style="color:orange;"><br><img class="point" src = "../images/course/common/point2.PNG">
				&nbsp; 초록 물결, 메타쉐콰이어 길</th>
			</tr>
		
			<tr>
				<td colspan="2">
				<br>비포장도로와 경사도가 있는 편이지만, 도심 라이딩을 하면서 초록의 싱그러움을 만끽할수있다
				</td>
			</tr>
				<tr>
				<th style="color:blue;"><br><img class="point" src = "../images/course/common/point3.PNG">
				&nbsp; 하늘을 가장 넓게 볼 수 있는 곳, 하늘공원</th>
			</tr>
			<tr>
				<td colspan="2">
				<br>하늘공원의 상징인 '하늘을 담는 그룻'의 전망대에 올라 하늘공원의 전망을 한눈에 즐길수있음.
10월에 열리는 억새축제에서는 억새와 코스모스를 볼수있음.
				</td>
			</tr>
		</table>
	</div>
	
	<div class ="space"></div>
	<div class = "rough_map">
		<h2><img class="icon" src = "../images/course/common/icon3.PNG"> 코스약도</h2>
		<hr>
		<img style="width:80%;margin-left:10%; " src = "../images/course/course5-1/course5-1.PNG">
	</div>
	
	
	<div class ="space"></div>
	<div class = "come">
		<h2><img class="icon" src = "../images/course/common/icon4.PNG"> 교통안내</h2>
		<hr>
		<img style="width:80%;margin-left:10%; " src = "../images/course/course5-1/5.PNG">
	</div>
	
	<div class ="space"></div>
		<%@ include file='/views/course/review.jsp' %>
		</div>
	</div>
</div>

<%@ include file= '/views/common/footer.jsp' %>