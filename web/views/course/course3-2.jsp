<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= '/views/common/header.jsp' %>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Cute+Font|Do+Hyeon|Sunflower:300" rel="stylesheet">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/courseInfo.css">
<div class = "container">
	<div class = "row content">
		<%@ include file = '/views/course/side.jsp' %>
		<div class="col-sm-9 main">
			<h1>탄천(탄천물놀이장 - 분당중앙공원)</h1>
	<div class = "space"></div>
	<div class = "course_image">
		<div class ="view">
			<div class = "mySlides">
				<img src = "../../images/course/course3-2/courseImage3-1.jpg" style ="width: 100%;height:100%;">
			</div>
			<div class = "mySlides">
				<img src = "../../images/course/course3-2/courseImage3-2.jpg" style ="width: 100%;height:100%;">
			</div>
			<div class = "mySlides">
				<img src = "../../images/course/course3-2/courseImage3-3.JPG" style ="width: 100%;height:100%;">
			</div>
			<div class = "mySlides">
				<img src = "../../images/course/course3-2/courseImage3-4.JPG" style ="width: 100%;height:100%;">
			</div>
		</div>
		<a class="prev" onclick="plusSlides(-1)">&lt;</a>
 		<a class="next" onclick="plusSlides(1)">></a>

 		<div class="row">
		    <div class="column">
		      <img class="demo cursor" src="../../images/course/course3-2/courseImage3-1.jpg" style="width:100%;height:100%" onclick="currentSlide(1)" alt="북한강 벚꽃길">
		    </div>
		    <div class="column">
		      <img class="demo cursor" src="../../images/course/course3-2/courseImage3-2.jpg" style="width:100%;height:100%" onclick="currentSlide(2)" alt="">
		    </div>
		    <div class="column">
		      <img class="demo cursor" src="../../images/course/course3-2/courseImage3-3.JPG" style="width:100%;height:100%" onclick="currentSlide(3)" alt="test3">
		    </div>
		    <div class="column">
		      <img class="demo cursor" src="../../images/course/course3-2/courseImage3-4.JPG" style="width:100%;height:100%" onclick="currentSlide(4)" alt="test4">
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
				<td> 탄천물놀이장 - 분당중앙공원</td>
			</tr>
			<tr>
				<th>전체거리 : </th>
				<td> 왕복 18kmkm</td>
				
			</tr>
			<tr>
				<th>예상시간 :  </th>
				<td> 1시간 </td>
			</tr>
			<tr>
				<th>난이도 : </th>
				<td><img class="level" src="../../images/course/common/star.png">
				</td>
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
				 &nbsp; 여수 교각 주말공연</th>
			</tr>
			<tr>
				<td colspan="2">
				<br>주말 여수교 밑에서는 작은 연주회가 열립니다. 다양한 음악 관련 동호회 회원들이 아름다운
공연을 펼칩니다. 무더위 속 지친 마음을 잔잔한 클래식으로 달래보아요:)
				</td>
			</tr>
			<tr>
				<td> </td>
			</tr>
			<tr>
				<th style="color:orange;"><br><img class="point" src = "../../images/course/common/point2.PNG">
				&nbsp; 중앙공원</th>
			</tr>
		
			<tr>
				<td colspan="2">
				<br>4곳의 잔디광장과 상록수광장, 역말광장, 황새울광장은 다채로운 경험과 편안함을 드리고, 3000평 부지위에 세워진 야외공연장은 시민여러분께 각종 문화행사와 공연을 제공합니다.
고인돌 10기를 모아 만든 고인돌 정원과 수내동 가옥 등 지방문화재를 복원하여 도심에서 볼 수 없는 향토적 정취와 옛문화를 공원내에서 느낄 수 있게 하였고, 자연스러운 조경시설이 자랑입니다.
				</td>
			</tr>
		</table>
	</div>
	
	<div class ="space"></div>
	<div class = "rough_map">
		<h2><img class="icon" src = "../../images/course/common/icon3.PNG"> 코스약도</h2>
		<hr>
		<img style="width:80%;margin-left:10%; " src = "../../images/course/course3-2/course3-2.PNG">
	</div>
	
	
	<div class ="space"></div>
	<div class = "come">
		<h2><img class="icon" src = "../../images/course/common/icon4.PNG"> 교통안내</h2>
		<hr>
		<img style="width:80%;margin-left:10%; " src = "../../images/course/course3-1/3.PNG">
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