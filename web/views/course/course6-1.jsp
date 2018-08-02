<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= '/views/common/header.jsp' %>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Cute+Font|Do+Hyeon|Sunflower:300" rel="stylesheet">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/courseInfo.css">
<div class = "container">
	<div class = "row content">
		<%@ include file = '/views/course/side.jsp' %>
		<div class="col-sm-9 main">
			<h1>북한강(밝은광장 - 샛터삼거리)</h1>
	<div class = "space"></div>
	<div class = "course_image">
		<div class ="view">
			<div class = "mySlides">
				<img src = "../../images/course/course6-1/courseImage6-1.jpg" style ="width: 100%;height:100%;">
			</div>
			<div class = "mySlides">
				<img src = "../../images/course/course6-1/courseImage6-2.jpg" style ="width: 100%;height:100%;">
			</div>
			<div class = "mySlides">
				<img src = "../../images/course/course6-1/courseImage6-3.jpg" style ="width: 100%;height:100%;">
			</div>
			<div class = "mySlides">
				<img src = "../../images/course/course6-1/courseImage6-4.jpg" style ="width: 100%;height:100%;">
			</div>
		</div>
		<a class="prev" onclick="plusSlides(-1)">&lt;</a>
 		<a class="next" onclick="plusSlides(1)">></a>

 		<div class="row">
		    <div class="column">
		      <img class="demo cursor" src="../../images/course/course6-1/courseImage6-1.jpg" style="width:100%;height:100%" onclick="currentSlide(1)" alt="북한강 벚꽃길">
		    </div>
		    <div class="column">
		      <img class="demo cursor" src="../../images/course/course6-1/courseImage6-2.jpg" style="width:100%;height:100%" onclick="currentSlide(2)" alt="">
		    </div>
		    <div class="column">
		      <img class="demo cursor" src="../../images/course/course6-1/courseImage6-3.jpg" style="width:100%;height:100%" onclick="currentSlide(3)" alt="test3">
		    </div>
		    <div class="column">
		      <img class="demo cursor" src="../../images/course/course6-1/courseImage6-4.jpg" style="width:100%;height:100%" onclick="currentSlide(4)" alt="test4">
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
				<td> 밝은 광장 - 샛터삼거리</td>
			</tr>
			<tr>
				<th>전체거리 : </th>
				<td> 왕복 28.6km</td>
				
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
				 &nbsp; 자전거 문화의 상징, 밝은 광장</th>
			</tr>
			<tr>
				<td colspan="2">
				<br>남한강 자전거길과 북한강 자전거길이 만나는 두물머리 지역에 수변 데크 및 쉼터, 바이크 카페,
				화장실 등이 있는 밝은광장을 조성하여 자전거길의 대표 랜드마크로 재활용
				</td>
			</tr>
			<tr>
				<td> </td>
			</tr>
			<tr>
				<th style="color:orange;"><br><img class="point" src = "../../images/course/common/point2.PNG">
				&nbsp;추억과 낭만을 따라 달리는 자전거길</th>
			</tr>
		
			<tr>
				<td colspan="2">
				<br>젊은 사람들의 MT장소로 각광받는 대성리, 청평, 강촌, 춘천을 자전거로 달릴 수 있게 됨으로써
				젊은이들에게는 추억과 낭만을, 장년층에게는 추억과 향수를 떠올리게 함
				</td>
			</tr>
				<tr>
				<th style="color:blue;"><br><img class="point" src = "../../images/course/common/point3.PNG">
				&nbsp;'물과 안개의 도시' 춘천까지 자전거로..</th>
			</tr>
			<tr>
				<td colspan="2">
				<br>'물과 안개의 도시'로 유명한 춘천의 의암호반, 상중도, 하중도, 붕어섬과 애니메이션 박물관, 인형극장,
				막국수 체험박물관, 명동 닭길비 골몽 등 명소를 새롭게 체험할 수 있는 좋은 기회
				</td>
			</tr>
		</table>
	</div>
	
	<div class ="space"></div>
	<div class = "rough_map">
		<h2><img class="icon" src = "../../images/course/common/icon3.PNG"> 코스약도</h2>
		<hr>
		<img style="width:80%;margin-left:10%; " src = "../../images/course/course6-1/course6-1.jpg">
	</div>
	
	
	<div class ="space"></div>
	<div class = "come">
		<h2><img class="icon" src = "../../images/course/common/icon4.PNG"> 교통안내</h2>
		<hr>
		<img style="width:80%;margin-left:10%; " src = "../../images/course/course6-1/c6.PNG">
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