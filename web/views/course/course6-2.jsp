<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= '/views/common/header.jsp' %>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Cute+Font|Do+Hyeon|Sunflower:300" rel="stylesheet">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/courseInfo.css">
<div class = "container">
	<div class = "row content">
		<%@ include file = '/views/course/side.jsp' %>
		<div class="col-sm-9 main">
			<h1>남한강(밝은광장 - 양평군립미술관)</h1>
	<div class = "space"></div>
	<div class = "course_image">
		<div class ="view">
			<div class = "mySlides">
				<img src = "../../images/course/course6-2/courseImage6-5.jpg" style ="width: 100%;height:100%;">
			</div>
			<div class = "mySlides">
				<img src = "../../images/course/course6-2/courseImage6-6.jpg" style ="width: 100%;height:100%;">
			</div>
			<div class = "mySlides">
				<img src = "../../images/course/course6-2/courseImage6-7.jpg" style ="width: 100%;height:100%;">
			</div>
			<div class = "mySlides">
				<img src = "../../images/course/course6-2/courseImage6-8.jpg" style ="width: 100%;height:100%;">
			</div>
		</div>
		<a class="prev" onclick="plusSlides(-1)">&lt;</a>
 		<a class="next" onclick="plusSlides(1)">></a>

 		<div class="row">
		    <div class="column">
		      <img class="demo cursor" src="../../images/course/course6-2/courseImage6-5.jpg" style="width:100%;height:100%" onclick="currentSlide(1)" alt="북한강 벚꽃길">
		    </div>
		    <div class="column">
		      <img class="demo cursor" src="../../images/course/course6-2/courseImage6-6.jpg" style="width:100%;height:100%" onclick="currentSlide(2)" alt="">
		    </div>
		    <div class="column">
		      <img class="demo cursor" src="../../images/course/course6-2/courseImage6-7.jpg" style="width:100%;height:100%" onclick="currentSlide(3)" alt="test3">
		    </div>
		    <div class="column">
		      <img class="demo cursor" src="../../images/course/course6-2/courseImage6-8.jpg" style="width:100%;height:100%" onclick="currentSlide(4)" alt="test4">
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
				<td> 밝은 광장 - 양평군립미술관</td>
			</tr>
			<tr>
				<th>전체거리 : </th>
				<td> 왕복 40km</td>
				
			</tr>
			<tr>
				<th>예상시간 :  </th>
				<td> 3시간 </td>
			</tr>
			<tr>
				<th>난이도 : </th>
				<td><img class="level" src="../../images/course/common/star.png">
				<img class="level" src="../../images/course/common/star.png">
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
				 &nbsp; 중앙선 폐선 따라 남한강 절경이..</th>
			</tr>
			<tr>
				<td colspan="2">
				<br>남양주 팔당에서 양평까지 이어지는 27km 길이의 중앙선 폐철로 구간은 전국에서 가장 아름다운 자전거길.
				녹슨 기찻길을 사이에 두고 말끔하게 포장된 자전거길과 터널과 강변을 달려 지금은 쉼터역할을 하는 추억의 간이역을 만날 수 있다.
				</td>
			</tr>
			<tr>
				<td> </td>
			</tr>
			<tr>
				<th style="color:orange;"><br><img class="point" src = "../../images/course/common/point2.PNG">
				&nbsp; 두물머리 물안개가 그리는 풍경화</th>
			</tr>
		
			<tr>
				<td colspan="2">
				<br>북한강 철교에서 내려다보이는 마을은 한강팔경 중 제 1경인 양평 두물머리이다.
				강마을 풍경이 아름다워 웨딩, 영화 , 광고, 드라마 촬영장소로 유명한 두물머리의 몽환적인 물안개를
				감상하며 라이딩을 즐길 수 있다.
				</td>
			</tr>
				<tr>
				<th style="color:blue;"><br><img class="point" src = "../../images/course/common/point3.PNG">
				&nbsp; 양성온천에서 탄산기포로 휴양</th>
			</tr>
			<tr>
				<td colspan="2">
				<br>탄산성분의 양성온천은 국내는 물론 세계적으로도 희귀한 온천수.
				욕탕에 2분정도만 있으면 피부가 따끔거리고 5분정도면 온몸이 탄산기포로 뒤덮인다.
				10분정도 지나면 피부가 붉게 변하면서 온몸이 따뜻해져 피로가 씻은 듯이 사라진다.
				</td>
			</tr>
		</table>
	</div>
	
	<div class ="space"></div>
	<div class = "rough_map">
		<h2><img class="icon" src = "../../images/course/common/icon3.PNG"> 코스약도</h2>
		<hr>
		<img style="width:80%;margin-left:10%; " src = "../../images/course/course6-2/course6-2.jpg">
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