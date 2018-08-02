<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- Header.jsp -->
<%@ include file= 'views/common/header.jsp' %> <!-- 파일 include. header.jsp 파일을 읽어들인다 -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/index.css?ver=2"> <!-- index.css -->

<style>
.join{color: papayawhip;}
</style>

<!-- 스크립트 -->
<script>
$(function() {
	$("#myCarousel").carousel({
	    interval : 3000,
	    
	    
	});
})

$(function() {
	$.ajax({
		url:"<%=request.getContextPath()%>/notice/noticeListAjax",
		type:"get",	
		dataType:"html",    /*리턴받는 형식 */
		success:function(data){
			$('#noticeListAjaxTable').html(data);
		}
	});
});


</script>
<!-- Carousel -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
        
    <div class="carousel-inner" role="listbox">
        <div class="item active">
	        <a href="#"><img src="<%=request.getContextPath() %>/images/index/carousel_1.jpg"></a>
	        <div class="carousel-caption">
	            <h2>누구나</h2>
	            <p>BIKEE는 남녀노소 누구나 이용 가능합니다111.</p>
	        </div>
	    </div>

    	<div class="item">
	        <a href="#"><img src="<%=request.getContextPath() %>/images/index/carousel_2.jpg"></a>
	        <div class="carousel-caption">
	            <h2>언제나</h2>
	            <p>BIKEE를 이용하길 원하는 분은 언제나 이용할 수 있습니다.</p>
	        </div>
    	</div>
    	<div class="item">
            <a href="#"><img src="<%=request.getContextPath() %>/images/index/carousel_3.png"></a>
       		<div class="carousel-caption">
            	<h2>어디서나</h2>
            	<p>BIKEE 대여소는 경기도 곳곳에 자리잡고 있습니다.</p>
        	</div>
    	</div>
	</div>

    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>


<div id="point" class="row text-center">
	<div class="col-sm-1">
	</div>
	<div class="col-sm-5">
		<a href="#"><i class="fa fa-leaf"></i></a>
		<h1>ECO</h1>
		<br>
		<p>바이키는 교통체증, 대기오염, 고유가 문제를 해결하기위해 노력합니다.</p>
		<p>자전거 교통수단 분담률을 향상시켜 CO2 발생 감소를 실현하고</p>
		<p>국가 비전인 저탄소 녹색성장을 추구합니다</p>
	</div>
	
	<div class="col-sm-5">
		<a href="#"><i class="fa fa-bicycle"></i></a>
		<h1>HEALTH</h1>
		<br>
		<p>자전거 이용의 생활화를 통한 시민 건강 증진의 실현과</p>
		<p>건강한 사회 및 시민들의 삶의 질을 높이고자 마련되었습니다.</p>
		<p>더 가치있는 서비스로 불편함이 없도록 노력하겠습니다.</p>
	</div>
	<div class="col-sm-1">
	</div> 
</div>

<%@ include file= 'views/common/footer.jsp' %>
