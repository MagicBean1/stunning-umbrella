<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='/views/common/header.jsp' %>

<style>
nav#bike{background-color: #fff !important;color:rgb(234, 234, 234) !important;}
ul#bike li a:hover {color:#344A5E !important;font-weight: bold !important;}
div.container div.row1 div.bike{float:left;position:relative;}
div#biketype div div div{margin-left:330px;align:center;}
div#biketype{margin-left:110px;}
h4, .h4, h5, .h5, h6, .h6 {margin-top: 30px;margin-bottom: 10px;}
h4, .h4 {font-size: 20px;}
div#rule{align:center;}
div.header div{background-color:#1E68CB !important; color:#FFFFFF !important; width:85%; height:120px;margin-left:180px;
font-family:"sans-serif";font-size:70px;font-style:italic;text-align:center;margin-top:10px;}
@media screen and (max-width: 767px) {
		div.header div{
			width : 50%;
			height : 60px;
			font-size : 50px;
			margin-left: 30%;}
    }
</style>
<div class="header">
	<div class="font">BIKETYPE</div>
</div>
<body data-target=".navbar" data-offset="50">
<nav id="bike" class="navbar navbar-fixed">
  <div class="container-fluid">
  <button type="button" class="navbar navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>                        
      </button>
    <div class="collapse navbar-collapse" id="myNavbar">
  	<ul id="bike" class="nav navbar-nav">
      <li class="active"><a href="#">자전거 생활</a></li> 
      <li class="active"><a class="bike" href="#bmx">BMX</a></li>
      <li class="active"><a class="bike" href="#mtb">MTB</a></li>
      <li class="active"><a class="bike" href="#road">ROAD</a></li>
      <li class="active"><a class="bike" href="#recumbent">RECUMBENT</a></li>
      <li class="active"><a class="bike" href="#normal">NORMAL</a></li>
    </ul>
  </div>
  </div>
</nav>

<div id="biketype" class="container-fluid">
    <h3>BMX</h3> 
    <div id="bmx" class="row text-center">
        <div class="col-sm-4 thumnail">
             <img src="<%=request.getContextPath() %>/images/bikeType/bike1.jpg" width="400" height="300">
             <h4>BMX rider size chat</h4>
        </div>
        <div class="col-sm-4 thumnail">
            <img src="<%=request.getContextPath() %>/images/bikeType/bike2.jpg" width="400" height="300">
            <h4>Amotion AmericanEaglestreet BMX minibello</h4>
        </div>
        <div class="col-sm- thumnail">
           <img src="<%=request.getContextPath() %>/images/bikeType/bike3.jpg" width="400" height="300">
           <h4>지오닉스 BMX MMX 20 minibello</h4>
        </div>
    </div>
    <br><br><br>
    <h3>MTB</h3>
    <div id="mtb" class="row text-center">
        <div class="col-sm-4 thumnail">
            <img src="<%=request.getContextPath() %>/images/bikeType/bike4.jpg" width="400" height="300">
            <h4>GIFT 18 GT 아발란체 일리트 MTB</h4>
        </div>
        <div class="col-sm-4 thumnail">
            <img src="<%=request.getContextPath() %>/images/bikeType/bike7.jpg" width="400" height="300">
            <h4>엠비에스코프레이션 엘파마 판타시아 G870 MTB</h4>
        </div>
        <div class="col-sm-4 thumnail">
            <img src="<%=request.getContextPath() %>/images/bikeType/bike6.jpg" width="400" height="300">
            <h4>메리다 빅세븐 팀이슈 MTB</h4>
        </div>
     </div>
        <br><br><br>
        <h3>ROAD</h3>
        <div id="road" class="row text-center">
        <div class="col-sm-4 thumnail">
            <img src="<%=request.getContextPath() %>/images/bikeType/bike9.jpg" width="400" height="300">
            <h4>ANM AE20R</h4>
        </div>
        <div class="col-sm-4 thumnail">
            <img src="<%=request.getContextPath() %>/images/bikeType/bike10.jpg" width="400" height="300">
            <h4>GAINT SCR1</h4>
        </div>
        <div class="col-sm-4 thumnail">
             <img src="<%=request.getContextPath() %>/images/bikeType/bike11.jpg" width="400" height="300">
             <h4>자이언트 TCR</h4>
        </div>
     </div>   
     <br><br><br>
        <h3>RECUMBENT</h3>
        <div id="recumbent" class="row text-center">
        <div class="col-sm-4 thumnail">
            <img src="<%=request.getContextPath() %>/images/bikeType/bike14.jpg" width="400" height="300">
            <h4>바체다 650 700C</h4>
        </div>
        <div class="col-sm-4 thumnail">
            <img src="<%=request.getContextPath() %>/images/bikeType/bike15.jpg" width="400" height="300">
            <h4>플서스팬션 폴딩 삼륜 리컴번트 트라이크</h4>
        </div> 
    </div>
       <br><br><br>
       <h3>NORMAL</h3>
       <div id="normal" class="row text-center">
       <div class="col-sm-4 thumnail">
          <img src="<%=request.getContextPath() %>/images/bikeType/bike16.jpg" width="400" height="300">
          <h4>2인용 자전거</h4>
       </div>
       <div class="col-sm-4 thumnail">
           <img src="<%=request.getContextPath() %>/images/bikeType/bike18.jpeg" width="400" height="300">
           <h4>안톤 콜바이크</h4>
       </div>
    </div> 
</div>


</body>
<br><br><br>
<%@ include file='/views/common/footer.jsp' %>