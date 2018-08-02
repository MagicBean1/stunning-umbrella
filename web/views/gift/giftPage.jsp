<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file= '/views/common/header.jsp' %>
<%! public int getRandom(){
	
	int random = 0;
	random=(int)Math.floor((Math.random()*(99999-10000+1)))+10000;
	return random;
} %> 

<!doctype html>
<html>
<head>

<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<title>lentPage</title>
	
		<!-- 공통 -->
       <link rel="stylesheet" href="css/skel-noscript.css" />
       <link rel="stylesheet" href="css/style.css" />
       <link rel="stylesheet" href="css/style-desktop.css" />
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
       
<!-- 서블릿  호출 -->
<script>
	function fn_callingJsp() {
		location.href="<%= request.getContextPath() %>/gift/giftSelectMemPhone"
	}
</script>


<!-- 자전거버튼이미지 클릭 시 이미지 변경 -->
<script type='text/javascript'>
        $(document).ready(function () {
            $('#a1,#a2,#a3,#a4,#a5,#a6,#a7,#a11,#a22,#a33,#a44,#a55,#a66,#a77').click(function () {
                $(this).attr('src', '<%=request.getContextPath() %>/images/button/bmx_02.jpg');
                return false;
            });
        });
</script>
<script type='text/javascript'>
        $(document).ready(function () {
            $('#b1,#b2,#b3,#b4,#b5,#b6,#b7,#b11,#b22,#b33,#b44,#b55,#b66,#b77').click(function () {
                $(this).attr('src', '<%=request.getContextPath() %>/images/button/mtb_02.jpg');
                return false;
            });
        });
</script>
<script type='text/javascript'>
        $(document).ready(function () {
            $('#c1,#c2,#c3,#c4,#c5,#c11,#c22,#c33,#c44,#c55').click(function () {
                $(this).attr('src', '<%=request.getContextPath() %>/images/button/road_02.jpg');
                return false;
            });
        });
</script>
<script type='text/javascript'>
        $(document).ready(function () {
            $('#d1,#d2,#d3,#d11,#d22,#d33').click(function () {
                $(this).attr('src', '<%=request.getContextPath() %>/images/button/re_02.jpg');
                return false;
            });
        });
</script>
<script type='text/javascript'>
        $(document).ready(function () {
            $('#e1,#e2,#e3,#e4,#e5,#e6,#e7,#e8,#e9,#e10,#e11,#e22,#e33,#e44,#e55,#e66,#e77,#e88,#e99,#e1010').click(function () {
                $(this).attr('src', '<%=request.getContextPath() %>/images/button/nor_02.jpg');
                return false;
            });
        });
</script>


<style>
td{ width:110px;
	height:110px}
</style>


</head>

<body>


<form class ='test111' name='GiftBike' action="<%=request.getContextPath()%>/gift/giftSelectMemPhone" method='post'>
    <div class="container-fluid">
	<div class="1">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2>선물하기</h2>
				<p>가까운 사람에게 바이키 이용권을  선물해보세요.</p>
				
				</div>
			</div>
		</div>
	
				
			<h3>선물할 회원 휴대폰번호 입력</h3>
			<hr>
			<p>바이키 회원에 한하여 선물이 가능합니다.</p>
			<input type='text' id = 'giftSelectPhone' name= 'giftSelectPhone' placeholder="휴대폰번호입력" maxlength="13" required>

		
			<h3>지점선택</h3>
			
			<hr>
			<div class="1">
				<div class="col-md-2">
					<div class="card">
						<img class="card-img-top" alt="Bootstrap Thumbnail First" src="http://jwnoin.org/bbs/pds/board/4/images/01-crop.jpg" width=250px height=200px/>
						<div class="card-block">
							<h5 class="card-title">
								성남탄천점
							</h5>
							<p class="card-text">
								<h6>경기도 성남시</h6>
							</p>
							<p>	
								<input type="radio" name="shopId" id="shopId" value="tc_01" checked/>
								<a href="#sungnam" >click</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="card">
						<img class="card-img-top" alt="Bootstrap Thumbnail Second" src="http://www.edjnews.co.kr/imgdata/edjnews_co_kr/201607/2016071109304448.jpg"  width=250px height=200px/>
						<div class="card-block">
							<h5 class="card-title">
								노량진역점
							</h5>
							<p class="card-text">
								<h6>서울시 동작구</h6>							
							</p>
							<p>
							<input type="radio" name="shopId" id="shopId" value="no_02" checked/>
								<a href="#nono" >click</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="card">
						<img class="card-img-top" alt="Bootstrap Thumbnail Third" src="http://bike.chosun.com/site/data/img_dir/2016/09/22/2016092201491_8.jpg" width=250px height=200px/>
						<div class="card-block">
							<h5 class="card-title">
								인천소래포구점
							</h5>
							<p class="card-text">
								<h6>인천시 소래포구</h6>
							</p>
							<p>
							<input type="radio" name="shopId" id="shopId" value="ic_03" checked/>
								<a href="#inin" >click</a>
							</p>
						</div>
					</div>
				</div>
			<div class="col-md-2">
					<div class="card">
						<img class="card-img-top" alt="Bootstrap Thumbnail First" src="http://tour.yp21.net/multi/uploadFile/20120202_0947(1).jpg" width=250px height=200px/>
						<div class="card-block">
							<h5 class="card-title">
								양평북한강점
							</h5>
							<p class="card-text">
								<h6>경기도 양평시</h6>
							</p>
							<p>
							<input type="radio" name="shopId" id="shopId" value="yp_04" checked/>
								<a href="#yang" >click</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="card">
						<img class="card-img-top" alt="Bootstrap Thumbnail Second" src="http://mblogthumb2.phinf.naver.net/20160609_213/homibike_14654066419411me3f_JPEG/DSC04632.jpg?type=w800"  width=250px height=200px/>
						<div class="card-block">
							<h5 class="card-title">
								잠실행복점
							</h5>
							<p class="card-text">
								<h6>서울시 송파구</h6>
							</p>
							<p>
								<input type="radio" name="shopId" id="shopId" value="gs_05" checked/>
								<a href="#jamsil" >click</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="card">
						<img class="card-img-top" alt="Bootstrap Thumbnail Third" src="https://i.ytimg.com/vi/iwCRc4xkTkw/maxresdefault.jpg"  width=250px height=200px/>
						<div class="card-block">
							<h5 class="card-title">
								하늘공원점
							</h5>
							<p class="card-text">
								<h6>서울시 마포구</h6>
							</p>
							<p>
								<input type="radio" name="shopId" id="shopId" value="ha_06" checked/>
								<a href="#mapo" >click</a>
							</p>
						</div>
					</div>
				</div>
				
				<pre>
				
				
				
				
				
				</pre>

				<!--성남탄천점 자전거 섹터 -->
			<a id ='sungnam'></a>
			<h3>자전거 선택</h3><p>성남탄천점 BIKEEBOX</p>
			<hr>
			</div>
				
				<table class="tc" id ='sungnam1'>
				<tr>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a1'/>
				<input type="radio" name="bikeId" id="bikeId" value="bmx101"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a2'/>
				<input type="radio" name="bikeId" id="bikeId" value="bmx102"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a3'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx103"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a4'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx104"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a5'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx105"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a6'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx106"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a7'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx107"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b1'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb101"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b2'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb102"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b3'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb103"/>
				<a href ="#time">click</a>
				</td>
				</tr>
				
				<tr>				
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b4'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb104"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b5'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb105"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c1'>
				<input type="radio" name="bikeId" id="bikeId" value="road101"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c2'>
				<input type="radio" name="bikeId" id="bikeId" value="road102"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c3'>
				<input type="radio" name="bikeId" id="bikeId" value="road103"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c4'>
				<input type="radio" name="bikeId" id="bikeId" value="road104"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c5'>
				<input type="radio" name="bikeId" id="bikeId" value="road105"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/re_01.jpg" width="100px" height="100px" id = 'd1'>
				<input type="radio" name="bikeId" id="bikeId" value="rcb101"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/re_01.jpg" width="100px" height="100px" id = 'd2'>
				<input type="radio" name="bikeId" id="bikeId" value="rcb102"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/re_01.jpg" width="100px" height="100px" id = 'd3'>
				<input type="radio" name="bikeId" id="bikeId" value="rcb103"/>
				<a href ="#time">click</a>
				</td>
				</tr>
				<tr>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e1'>
				<input type="radio" name="bikeId" id="bikeId" value="nm101"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e2'>				
				<input type="radio" name="bikeId" id="bikeId" value="nm102"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e3'>
				<input type="radio" name="bikeId" id="bikeId" value="nm103"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e4'>
				<input type="radio" name="bikeId" id="bikeId" value="nm104"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e5'>
				<input type="radio" name="bikeId" id="bikeId" value="nm105"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e6'>
				<input type="radio" name="bikeId" id="bikeId" value="nm106"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e7'>
				<input type="radio" name="bikeId" id="bikeId" value="nm107"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e8'>
				<input type="radio" name="bikeId" id="bikeId" value="nm108"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e9'>
				<input type="radio" name="bikeId" id="bikeId" value="nm109"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e10'>
				<input type="radio" name="bikeId" id="bikeId" value="nm110"/>
				<a href ="#time">click</a>
				</td>
				</tr>
				
				</table>
				
				<pre>
				
				
				
				
				
				
				
				
				</pre>

<!--노량진역점 자전거 섹터 no_02-->
		
			<a id='nono'></a>
			<br>
			<h3>자전거 선택</h3><p>노량진역점 BIKEEBOX</p>
			<hr>				
				<table class="no" id = 'nono1'>
				<tr>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a11'/>
				<input type="radio" name="bikeId" id="bikeId" value="bmx201"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a22'/>
				<input type="radio" name="bikeId" id="bikeId" value="bmx202"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a33'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx203"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a44'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx204"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a55'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx205"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a66'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx206"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a77'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx207"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b11'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb201"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b22'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb202"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b33'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb203"/>
				<a href ="#time">click</a>
				</td>
				</tr>
				
				<tr>				
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b44'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb204"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b55'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb205"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c11'>
				<input type="radio" name="bikeId" id="bikeId" value="road201"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c22'>
				<input type="radio" name="bikeId" id="bikeId" value="road202"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c33'>
				<input type="radio" name="bikeId" id="bikeId" value="road203"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c44'>
				<input type="radio" name="bikeId" id="bikeId" value="road204"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c55'>
				<input type="radio" name="bikeId" id="bikeId" value="road205"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/re_01.jpg" width="100px" height="100px" id = 'd11'>
				<input type="radio" name="bikeId" id="bikeId" value="rcb201"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/re_01.jpg" width="100px" height="100px" id = 'd22'>
				<input type="radio" name="bikeId" id="bikeId" value="rcb202"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/re_01.jpg" width="100px" height="100px" id = 'd33'>
				<input type="radio" name="bikeId" id="bikeId" value="rcb203"/>
				<a href ="#time">click</a>
				</td>
				</tr>
				<tr>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e11'>
				<input type="radio" name="bikeId" id="bikeId" value="nm201"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e22'>				
				<input type="radio" name="bikeId" id="bikeId" value="nm202"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e33'>
				<input type="radio" name="bikeId" id="bikeId" value="nm203"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e44'>
				<input type="radio" name="bikeId" id="bikeId" value="nm204"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e55'>
				<input type="radio" name="bikeId" id="bikeId" value="nm205"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e66'>
				<input type="radio" name="bikeId" id="bikeId" value="nm206"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e77'>
				<input type="radio" name="bikeId" id="bikeId" value="nm207"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e88'>
				<input type="radio" name="bikeId" id="bikeId" value="nm208"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e99'>
				<input type="radio" name="bikeId" id="bikeId" value="nm209"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e1010'>
				<input type="radio" name="bikeId" id="bikeId" value="nm210"/>
				<a href ="#time">click</a>
				</td>
				</tr>
				
				</table>
				
				<pre>
				
				
				
				
				
				</pre>
				

<!--인천소래포구점 자전거 섹터 -->
			<a id='inin'></a>
			<h3>자전거 선택</h3><p>인천소래포구점 BIKEEBOX</p>
			<hr>				
				<table class="ic_03" id = 'inin1'>
				<tr>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a1'/>
				<input type="radio" name="bikeId" id="bikeId" value="bmx301"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a2'/>
				<input type="radio" name="bikeId" id="bikeId" value="bmx302"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a3'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx303"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a4'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx304"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a5'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx305"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a6'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx306"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a7'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx307"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b1'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb301"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b2'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb302"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b3'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb303"/>
				<a href ="#time">click</a>
				</td>
				</tr>
				
				<tr>				
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b4'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb304"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b5'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb305"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c1'>
				<input type="radio" name="bikeId" id="bikeId" value="road301"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c2'>
				<input type="radio" name="bikeId" id="bikeId" value="road302"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c3'>
				<input type="radio" name="bikeId" id="bikeId" value="road303"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c4'>
				<input type="radio" name="bikeId" id="bikeId" value="road304"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c5'>
				<input type="radio" name="bikeId" id="bikeId" value="road305"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/re_01.jpg" width="100px" height="100px" id = 'd1'>
				<input type="radio" name="bikeId" id="bikeId" value="rcb301"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/re_01.jpg" width="100px" height="100px" id = 'd2'>
				<input type="radio" name="bikeId" id="bikeId" value="rcb302"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/re_01.jpg" width="100px" height="100px" id = 'd3'>
				<input type="radio" name="bikeId" id="bikeId" value="rcb303"/>
				<a href ="#time">click</a>
				</td>
				</tr>
				<tr>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e1'>
				<input type="radio" name="bikeId" id="bikeId" value="nm301"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e2'>				
				<input type="radio" name="bikeId" id="bikeId" value="nm302"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e3'>
				<input type="radio" name="bikeId" id="bikeId" value="nm303"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e4'>
				<input type="radio" name="bikeId" id="bikeId" value="nm304"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e5'>
				<input type="radio" name="bikeId" id="bikeId" value="nm305"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e6'>
				<input type="radio" name="bikeId" id="bikeId" value="nm306"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e7'>
				<input type="radio" name="bikeId" id="bikeId" value="nm307"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e8'>
				<input type="radio" name="bikeId" id="bikeId" value="nm308"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e9'>
				<input type="radio" name="bikeId" id="bikeId" value="nm309"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e10'>
				<input type="radio" name="bikeId" id="bikeId" value="nm310"/>
				<a href ="#time">click</a>
				</td>
				</tr>
				
				</table>
				
				<pre>
				
				
				
				
				
				</pre>
				

<!--양평북한강점 자전거 섹터 yp_04-->
				<a id='yang'></a>				
				<h3>자전거 선택</h3><p>양평북한강점 BIKEEBOX</p>
				<hr>				
				
				<table class="yp" id = 'yang'>
				<tr>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a1'/>
				<input type="radio" name="bikeId" id="bikeId" value="bmx401"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a2'/>
				<input type="radio" name="bikeId" id="bikeId" value="bmx402"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a3'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx403"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a4'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx404"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a5'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx405"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a6'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx406"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a7'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx407"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b1'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb401"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b2'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb402"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b3'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb403"/>
				<a href ="#time">click</a>
				</td>
				</tr>
				
				<tr>				
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b4'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb404"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b5'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb405"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c1'>
				<input type="radio" name="bikeId" id="bikeId" value="road401"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c2'>
				<input type="radio" name="bikeId" id="bikeId" value="road402"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c3'>
				<input type="radio" name="bikeId" id="bikeId" value="road403"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c4'>
				<input type="radio" name="bikeId" id="bikeId" value="road404"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c5'>
				<input type="radio" name="bikeId" id="bikeId" value="road405"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/re_01.jpg" width="100px" height="100px" id = 'd1'>
				<input type="radio" name="bikeId" id="bikeId" value="rcb401"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/re_01.jpg" width="100px" height="100px" id = 'd2'>
				<input type="radio" name="bikeId" id="bikeId" value="rcb402"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/re_01.jpg" width="100px" height="100px" id = 'd3'>
				<input type="radio" name="bikeId" id="bikeId" value="rcb403"/>
				<a href ="#time">click</a>
				</td>
				</tr>
				<tr>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e1'>
				<input type="radio" name="bikeId" id="bikeId" value="nm401"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e2'>				
				<input type="radio" name="bikeId" id="bikeId" value="nm402"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e3'>
				<input type="radio" name="bikeId" id="bikeId" value="nm403"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e4'>
				<input type="radio" name="bikeId" id="bikeId" value="nm404"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e5'>
				<input type="radio" name="bikeId" id="bikeId" value="nm405"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e6'>
				<input type="radio" name="bikeId" id="bikeId" value="nm406"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e7'>
				<input type="radio" name="bikeId" id="bikeId" value="nm407"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e8'>
				<input type="radio" name="bikeId" id="bikeId" value="nm408"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e9'>
				<input type="radio" name="bikeId" id="bikeId" value="nm409"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e10'>
				<input type="radio" name="bikeId" id="bikeId" value="nm410"/>
				<a href ="#time">click</a>
				</td>
				</tr>
				
				</table>
				
				<pre>
				
				
				
				
				
				</pre>
				
<!--잠실행복점 자전거 섹터 gs_05-->
				<a id='jamsil'></a>			
				<h3>자전거 선택</h3><p>잠실행복점 BIKEEBOX</p>
				<hr>																	
				<table class="js" id = 'jamsil'>
				<tr>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a1'/>
				<input type="radio" name="bikeId" id="bikeId" value="bmx501"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a2'/>
				<input type="radio" name="bikeId" id="bikeId" value="bmx502"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a3'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx503"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a4'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx504"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a5'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx505"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a6'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx506"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a7'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx507"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b1'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb501"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b2'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb502"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b3'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb503"/>
				<a href ="#time">click</a>
				</td>
				</tr>
				
				<tr>				
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b4'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb504"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b5'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb505"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c1'>
				<input type="radio" name="bikeId" id="bikeId" value="road501"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c2'>
				<input type="radio" name="bikeId" id="bikeId" value="road502"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c3'>
				<input type="radio" name="bikeId" id="bikeId" value="road503"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c4'>
				<input type="radio" name="bikeId" id="bikeId" value="road504"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c5'>
				<input type="radio" name="bikeId" id="bikeId" value="road505"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/re_01.jpg" width="100px" height="100px" id = 'd1'>
				<input type="radio" name="bikeId" id="bikeId" value="rcb501"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/re_01.jpg" width="100px" height="100px" id = 'd2'>
				<input type="radio" name="bikeId" id="bikeId" value="rcb502"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/re_01.jpg" width="100px" height="100px" id = 'd3'>
				<input type="radio" name="bikeId" id="bikeId" value="rcb503"/>
				<a href ="#time">click</a>
				</td>
				</tr>
				<tr>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e1'>
				<input type="radio" name="bikeId" id="bikeId" value="nm501"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e2'>				
				<input type="radio" name="bikeId" id="bikeId" value="nm502"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e3'>
				<input type="radio" name="bikeId" id="bikeId" value="nm503"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e4'>
				<input type="radio" name="bikeId" id="bikeId" value="nm504"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e5'>
				<input type="radio" name="bikeId" id="bikeId" value="nm505"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e6'>
				<input type="radio" name="bikeId" id="bikeId" value="nm506"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e7'>
				<input type="radio" name="bikeId" id="bikeId" value="nm507"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e8'>
				<input type="radio" name="bikeId" id="bikeId" value="nm508"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e9'>
				<input type="radio" name="bikeId" id="bikeId" value="nm509"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e10'>
				<input type="radio" name="bikeId" id="bikeId" value="nm510"/>
				<a href ="#time">click</a>
				</td>
				</tr>
				
				</table>
				
				<pre>
				
				
				
				
				
				</pre>
				
<!--하늘공원점 자전거 섹터 ha_06-->
				<a id='mapo'></a>				
				<h3>자전거 선택</h3><p>하늘공원점 BIKEEBOX</p>
				<hr>				
								
				<table class="ha" id = 'mapo'>
				<tr>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a1'/>
				<input type="radio" name="bikeId" id="bikeId" value="bmx601"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a2'/>
				<input type="radio" name="bikeId" id="bikeId" value="bmx602"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a3'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx603"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a4'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx604"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a5'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx605"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a6'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx606"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/bmx_01.jpg" width="100px" height="100px" id = 'a7'>
				<input type="radio" name="bikeId" id="bikeId" value="bmx607"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b1'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb601"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b2'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb602"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b3'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb603"/>
				<a href ="#time">click</a>
				</td>
				</tr>
				
				<tr>				
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b4'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb604"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/mtb_01.jpg" width="100px" height="100px" id = 'b5'>
				<input type="radio" name="bikeId" id="bikeId" value="mtb605"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c1'>
				<input type="radio" name="bikeId" id="bikeId" value="road601"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c2'>
				<input type="radio" name="bikeId" id="bikeId" value="road602"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c3'>
				<input type="radio" name="bikeId" id="bikeId" value="road603"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c4'>
				<input type="radio" name="bikeId" id="bikeId" value="road604"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/road_01.jpg" width="100px" height="100px" id = 'c5'>
				<input type="radio" name="bikeId" id="bikeId" value="road605"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/re_01.jpg" width="100px" height="100px" id = 'd1'>
				<input type="radio" name="bikeId" id="bikeId" value="rcb601"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/re_01.jpg" width="100px" height="100px" id = 'd2'>
				<input type="radio" name="bikeId" id="bikeId" value="rcb602"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/re_01.jpg" width="100px" height="100px" id = 'd3'>
				<input type="radio" name="bikeId" id="bikeId" value="rcb603"/>
				<a href ="#time">click</a>
				</td>
				</tr>
				<tr>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e1'>
				<input type="radio" name="bikeId" id="bikeId" value="nm601"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e2'>				
				<input type="radio" name="bikeId" id="bikeId" value="nm602"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e3'>
				<input type="radio" name="bikeId" id="bikeId" value="nm603"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e4'>
				<input type="radio" name="bikeId" id="bikeId" value="nm604"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e5'>
				<input type="radio" name="bikeId" id="bikeId" value="nm605"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e6'>
				<input type="radio" name="bikeId" id="bikeId" value="nm606"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e7'>
				<input type="radio" name="bikeId" id="bikeId" value="nm607"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e8'>
				<input type="radio" name="bikeId" id="bikeId" value="nm608"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e9'>
				<input type="radio" name="bikeId" id="bikeId" value="nm609"/>
				<a href ="#time">click</a>
				</td>
				<td>
				<img src ="<%=request.getContextPath() %>/images/button/nor_01.jpg" width="100px" height="100px" id = 'e10'>
				<input type="radio" name="bikeId" id="bikeId" value="nm610"/>
				<a href ="#time">click</a>
				</td>
				</tr>
				
				</table>
				<pre>
				
				
				
				
				
				
				
				
				
				
				</pre>
				
				<a id ='time'></a>
				<div id='time1'>
				<h3>대여일/반납일</h3>
		 		  <input type="date" name="bDate"><input type="time" name="bTime"/>	
		 		  <input type="date" name="rDate"><input type="time" name="rTime"/>
		 		  
		 		<hr>	
		 		</div>
		 		
		 		


<!-- 			
				<input type='hidden' name ='merchantUid' value='uid0039dateTest6'>
				<input type='hidden' name ="buyerId" value ='eunbyul'>
				<input type='hidden' name ='lentPrice' value='10000'> -->
				<input type="hidden" name="methodNum" value="2">
				<input type="hidden" readonly="readonly" id ="presentUid" name="presentUid" value="<%=getRandom() %>"/>
				<input type="submit" value="결제"  onclick="fn_callingJsp()">
				<input type="reset" value="취소">
				
				<br><br><br><br>
				</div>
				</form>

			    <script src="js/jquery.min.js"></script>
			    <script src="js/bootstrap.min.js"></script>
			    <script src="js/scripts.js"></script>
			
  </body>
</html>

<%@ include file= '/views/common/footer.jsp' %>

