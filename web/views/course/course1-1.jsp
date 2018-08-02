<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= '/views/common/header.jsp' %>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Cute+Font|Do+Hyeon|Sunflower:300" rel="stylesheet">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/courseInfo.css">
<div class = "container">
	<div class = "row content">
		<%@ include file = '/views/course/side.jsp' %>
		<div class="col-sm-9 main">
			<h1>한강(잠실역 - 세빛섬)</h1>
	<div class = "space"></div>
	<div class = "course_image">
		<div class ="view">
			<div class = "mySlides">
				<img src = "../../images/course/course1-1/courseImage1-1.jpg" style ="width: 100%;height:100%;">
			</div>
			<div class = "mySlides">
				<img src = "../../images/course/course1-1/courseImage1-2.jpg" style ="width: 100%;height:100%;">
			</div>
			<div class = "mySlides">
				<img src = "../../images/course/course1-1/courseImage1-3.jpg" style ="width: 100%;height:100%;">
			</div>
			<div class = "mySlides">
				<img src = "../../images/course/course1-1/courseImage1-4.jpg" style ="width: 100%;height:100%;">
			</div>
		</div>
		<a class="prev" onclick="plusSlides(-1)">&#60;</a>
 		<a class="next" onclick="plusSlides(1)">></a>

 		<div class="row">
		    <div class="column">
		      <img class="demo cursor" src="../../images/course/course1-1/courseImage1-1.jpg" style="width:100%;height:100%" onclick="currentSlide(1)" alt="북한강 벚꽃길">
		    </div>
		    <div class="column">
		      <img class="demo cursor" src="../../images/course/course1-1/courseImage1-2.jpg" style="width:100%;height:100%" onclick="currentSlide(2)" alt="">
		    </div>
		    <div class="column">
		      <img class="demo cursor" src="../../images/course/course1-1/courseImage1-3.jpg" style="width:100%;height:100%" onclick="currentSlide(3)" alt="test3">
		    </div>
		    <div class="column">
		      <img class="demo cursor" src="../../images/course/course1-1/courseImage1-4.jpg" style="width:100%;height:100%" onclick="currentSlide(4)" alt="test4">
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
		<h2><img class="icon" src = "../../images/course/common/icon1.PNG"> 코스정보</h2>
		<hr/>
		<table>
			<tr>
				<th>코스정보 : </th>
				<td> 잠실역 - 세빛섬</td>
			</tr>
			<tr>
				<th>전체거리 : </th>
				<td> 왕복 22.9km</td>
				
			</tr>
			<tr>
				<th>예상시간 :  </th>
				<td> 2시간 </td>
			</tr>
			<tr>
				<th>난이도 : </th>
				<td><img class="level" src="../../images/course/common/star.png">
				<img class="level" src="../../images/course/common/star.png"></td>
			</tr>
		</table>
		
	</div>
	<div class ="space"></div>
	<div class = "point_div">
		<h2><img class="icon" src = "../../images/course/common/icon2.PNG"> 매력포인트</h2>
		<hr>
		<table>
			<tr>
				<th style="color:red;"><img class="point" src = "../../images/course/common/point1.PNG">
				 &nbsp; 세빛섬 : 세계최초 수중 문화공간</th>
			</tr>
			<tr>
				<td colspan="2">
				<br>아름다운 한강 위에서 즐기는 이색문화공간!!
				각종 공연과 행사, 이벤트 그리고 분위기 있는 레스토랑 등이 있는 복합문화공간!!
				</td>
			</tr>
			<tr>
				<td> </td>
			</tr>
			<tr>
				<th style="color:orange;"><br><img class="point" src = "../../images/course/common/point2.PNG">
				&nbsp; 코엑스 : 복합 문화 공간</th>
			</tr>
		
			<tr>
				<td colspan="2">
				<br>별마당 도서관, 영화관, 전시회 등 생각하는 모든 문화를 함꼐할 수 있는 문화센터!!
				접근성이 좋은 곳에 위치하여 라이딩중에 잠시 들러 문화를 즐겨보는 건 어떨까?
				</td>
			</tr>
				<tr>
				<th style="color:blue;"><br><img class="point" src = "../../images/course/common/point3.PNG">
				&nbsp; K STAR ROAD</th>
			</tr>
			<tr>
				<td colspan="2">
				<br>아티스트들의 느낌을 입힌 멋진 곰인형들이 서 있는 길
				그리고 스타들이 자주 가는 맛집 등 주변지역 정보, 스타들의 곰인형까지 구매할 수 있는 케이스타
				</td>
			</tr>
		</table>
	</div>
	
	<div class ="space"></div>
	<div class = "rough_map">
		<h2><img class="icon" src = "../../images/course/common/icon3.PNG"> 코스약도</h2>
		<hr>
		<img style="width:80%;margin-left:10%; " src = "../../images/course/course1-1/course1-1.jpg">
	</div>
	
	
	<div class ="space"></div>
	<div class = "come">
		<h2><img class="icon" src = "../../images/course/common/icon4.PNG"> 교통안내</h2>
		<hr>
		<img style="width:80%;margin-left:10%; " src = "../../images/course/course1-1/1.PNG">
	</div>
	
	<div class ="space"></div>
	<div class = "come">
		<h2><img class="icon" src = "../../images/course/common/icon5.PNG"> 체험후기</h2>
		<hr>
	</div>
		</div>
	</div>
</div>

<%@ include file= '/views/common/footer.jsp' %>