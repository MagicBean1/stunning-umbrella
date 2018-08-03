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
			<h1>탄천(탄천물놀이장 - 양재천)</h1>
	<div class = "space"></div>
	<div class = "course_image">
		<div class ="view">
			<div class = "mySlides">
				<img src = "../images/course/course3-1/courseImage3-1.jpg" style ="width: 100%;height:100%;">
			</div>
			<div class = "mySlides">
				<img src = "../images/course/course3-1/courseImage3-2.jpg" style ="width: 100%;height:100%;">
			</div>
			<div class = "mySlides">
				<img src = "../images/course/course3-1/courseImage3-3.jpg" style ="width: 100%;height:100%;">
			</div>
			<div class = "mySlides">
				<img src = "../images/course/course3-1/courseImage3-4.jpg" style ="width: 100%;height:100%;">
			</div>
		</div>
		<a class="prev" onclick="plusSlides(-1)">&lt;</a>
 		<a class="next" onclick="plusSlides(1)">></a>

 		<div class="row">
		    <div class="column">
		      <img class="demo cursor" src="../images/course/course3-1/courseImage3-1.jpg" style="width:100%;height:100%" onclick="currentSlide(1)" alt="북한강 벚꽃길">
		    </div>
		    <div class="column">
		      <img class="demo cursor" src="../images/course/course3-1/courseImage3-2.jpg" style="width:100%;height:100%" onclick="currentSlide(2)" alt="">
		    </div>
		    <div class="column">
		      <img class="demo cursor" src="../images/course/course3-1/courseImage3-3.jpg" style="width:100%;height:100%" onclick="currentSlide(3)" alt="test3">
		    </div>
		    <div class="column">
		      <img class="demo cursor" src="../images/course/course3-1/courseImage3-4.jpg" style="width:100%;height:100%" onclick="currentSlide(4)" alt="test4">
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
				<td> 탄천물놀이장 - 양재천</td>
			</tr>
			<tr>
				<th>전체거리 : </th>
				<td> 왕복 24.6km</td>
				
			</tr>
			<tr>
				<th>예상시간 :  </th>
				<td> 1시간 15분 </td>
			</tr>
			<tr>
				<th>난이도 : </th>
				<td><img class="level" src="../images/course/common/star.png">
				
				</td>
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
				 &nbsp; 탄천 물놀이장</th>
			</tr>
			<tr>
				<td colspan="2">
				<br>아름다운 탄천의 풍경과 함께 즐거운 웃음소리를 들을 수 있는 구간입니다. 페달을 잠시
				멈추고 눈과 귀가 즐거워지는 탄천 물놀이장에서 잠시 쉬었다 가볼까요!
				</td>
			</tr>
			<tr>
				<td> </td>
			</tr>
			<tr>
				<th style="color:orange;"><br><img class="point" src = "../images/course/common/point2.PNG">
				&nbsp; 습지생태원</th>
			</tr>
		
			<tr>
				<td colspan="2">
				<br>물놀이장을 지나 5분정도 페달을 밟다 보면 자전거도로를 바로 앞에 두고 작은 습지생태원이 있습니다.
				가족 또는 연인과 주말에 함께 라이딩하기 좋아요.
				</td>
			</tr>
				<tr>
				<th style="color:blue;"><br><img class="point" src = "../images/course/common/point3.PNG">
				&nbsp; 양재시민의 숲</th>
			</tr>
			<tr>
				<td colspan="2">
				<br>서울특별시의 관문인 양재 톨게이트 주변에 조성한 공원으로, 다양한 수종의 숲이 장관을 이룹니다.
 					조경시설로 잔디광장과 파고라(그늘막) 등이 있고 운동시설로 배구장·배드민턴장·테니스장이 있습니다. 라이딩 후 가벼운 운동까지 가능해서 운동마니아들에게는 더할나위 없이 좋은 공간입니다.
				</td>
			</tr>
		</table>
	</div>
	
	<div class ="space"></div>
	<div class = "rough_map">
		<h2><img class="icon" src = "../images/course/common/icon3.PNG"> 코스약도</h2>
		<hr>
		<img style="width:80%;margin-left:10%; " src = "../images/course/course3-1/course3-1.PNG">
	</div>
	
	
	<div class ="space"></div>
	<div class = "come">
		<h2><img class="icon" src = "../images/course/common/icon4.PNG"> 교통안내</h2>
		<hr>
		<img style="width:80%;margin-left:10%; " src = "../images/course/course3-1/3.PNG">
	</div>
	
	<div class ="space"></div>
		<%@ include file='/views/course/review.jsp' %>
		</div>
	</div>
</div>

<%@ include file= '/views/common/footer.jsp' %>