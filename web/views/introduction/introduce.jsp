<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- Header.jsp -->
<%@ include file= '/views/common/header.jsp' %> <!-- 파일 include. header.jsp 파일을 읽어들인다 -->
      
     
     
      <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700,500,900' rel='stylesheet' type='text/css'>
      <!-- //카로셀 -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <!--메인테마-->
      <script src="../../js/skel.min.js"></script>
      <script src="../../js/skel-panels.min.js"></script>
      <script src="../../js/init.js"></script>

 <style>
/*
   Linear by TEMPLATED
    templated.co @templatedco
    Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
*/

@charset 'UTF-8';

@font-face{font-family:'FontAwesome';src:url('/Bikee_project/web/css/font/fontawesome-webfont.eot?v=4.0.1');src:url('/Bikee_project/web/css/font/fontawesome-webfont.eot?#iefix&v=4.0.1') format('embedded-opentype'),url('/Bikee_project/web/css/font/fontawesome-webfont.woff?v=4.0.1') format('woff'),url('/Bikee_project/web/css/font/fontawesome-webfont.ttf?v=4.0.1') format('truetype'),url('/Bikee_project/web/css/font/fontawesome-webfont.svg?v=4.0.1#fontawesomeregular') format('svg');font-weight:normal;font-style:normal}

/*********************************************************************************/
/* Basic                                                                         */
/*********************************************************************************/

   body
   {
      margin: 0;
      padding: 0;
   }

   body,input,textarea,select
   {
      font-family: 'Roboto', sans-serif;
      font-size: 11pt;
      font-weight: 300;
      line-height: 1.75em;
      color: #777;
   }

   h1,h2,h3,h4,h5,h6
   {
      font-weight: 300;
      color: #777;
   }
   
      h2
      {
         letter-spacing: -0.025em;
      }
   
      h1 a, h2 a, h3 a, h4 a, h5 a, h6 a
      {
         color: inherit;
         text-decoration: none;
      }
      
   strong, b
   {
      font-weight: 500;
      color: #000000;
   }
   
   em, i
   {
      font-style: italic;
   }

   a
   {
      text-decoration: none;
      color: #80BA8E;
   }
   
   a:hover
   {
      text-decoration: underline;
   }

   sub
   {
      position: relative;
      top: 0.5em;
      font-size: 0.8em;
   }
   
   sup
   {
      position: relative;
      top: -0.5em;
      font-size: 0.8em;
   }
   
   hr
   {
      border: 0;
      border-top: solid 1px #ddd;
      margin: 6em 0 0 0;
      padding: 6em 0 0 0;
   }
   
   blockquote
   {
      border-left: solid 0.5em #ddd;
      padding: 1em 0 1em 2em;
      font-style: italic;
   }
   
   p, ul, ol, dl, table
   {
      margin-bottom: 1em;
   }

   header
   {
      margin-bottom: 1.6em;
   }
   
      header h2
      {
      }

      header .byline
      {
         display: block;
         margin: 1.5em 0 0 0;
         padding: 0 0 0.5em 0;
      }
      
   footer
   {
      margin-top: 1em;
   }

   br.clear
   {
      clear: both;
   }

   .pennant
   {
      color: #bbb;
   }

   /* Sections/Articles */
   
      section,
      article
      {
         margin-bottom: 3em;
      }
      
      section > :last-child,
      article > :last-child
      {
         margin-bottom: 0;
      }

      section:last-child,
      article:last-child
      {
         margin-bottom: 0;
      }

      .row > section,
      .row > article
      {
         margin-bottom: 0;
      }

   /* Images */

      .image
      {
         display: inline-block;
      }
      
         .image img
         {
            display: block;
            width: 100%;
         }

         .image.featured
         {
            display: block;
            width: 100%;
            margin: 0 0 2em 0;
         }
         
         .image.full
         {
            display: block;
            width: 100%;
            margin-bottom: 2em;
         }
         
         .image.left
         {
            float: left;
            margin: 0 2em 2em 0;
         }
         
         .image.centered
         {
            display: block;
            margin: 0 0 2em 0;
         }

            .image.centered img
            {
               margin: 0 auto;
               width: auto;
            }

   /* Lists */

      ul.default
      {
         margin: 0;
         padding: 0em 0em 1.5em 0em;
         list-style: none;
      }
      
         ul.default li
         {
            padding: 0.60em 0em;
            font-size: 0.95em;
            border-top: 1px solid;
            border-color: rgba(0,0,0,.1);
         }      
      
         ul.default li:first-child
         {
            padding-top: 0;
            border-top: none;
         }
   
         ul.default {
         }
      
      ul.style li {
         margin: 0;
         padding: 2em 0em 1.5em 0em;
         border-top: 1px solid;
         border-color: rgba(0,0,0,.1);
      }
      
      ul.style li:first-child
      {
         padding-top: 0;
         border-top: none;
      }
      
      ul.style img {
         float: left;
         margin-right: 20px;
      }
      
      ul.style a {
         color: #434343;
      }
      
      ul.style .posted {
         padding: 0em 0em 1em 0em;
         letter-spacing: 1px;
         text-transform: uppercase;
         font-size: 8pt;
         color: #A2A2A2;
      }
      
      ul.style .first {
         padding-top: 0px;
         border-top: none;
      }
                     

   /* Buttons */
      
   .button
   {
      position: relative;
      display: inline-block;
      background: #80BA8E;
      padding: 0.8em 2em;
      text-decoration: none !important;
      font-size: 1.2em;
      font-weight: 300;
      color: #FFF !important;
      -moz-transition: color 0.35s ease-in-out, background-color 0.35s ease-in-out;
      -webkit-transition: color 0.35s ease-in-out, background-color 0.35s ease-in-out;
      -o-transition: color 0.35s ease-in-out, background-color 0.35s ease-in-out;
      -ms-transition: color 0.35s ease-in-out, background-color 0.35s ease-in-out;
      transition: color 0.35s ease-in-out, background-color 0.35s ease-in-out;
      text-align: center;
      border-radius: 0.25em;
   }

   .button:hover
   {
      background: #70AA7E;
      color: #FFF !important;
   }
/*********************************************************************************/
/* Social Icon Styles                                                            */
/*********************************************************************************/

   ul.contact
   {
      padding: 1.5em 0 0 0;
      list-style: none;
      cursor: default;
   }
   
   ul.contact li
   {
      display: inline-block;
      margin: 0 1em;
   }
   
   ul.contact li span
   {
      display: none;
      margin: 0;
      padding: 0;
   }
   
   ul.contact li a
   {
      color: inherit;
      font-size: 1.75em;
      display: inline-block;
      -moz-transition: color 0.35s ease-in-out, background-color 0.35s ease-in-out;
      -webkit-transition: color 0.35s ease-in-out, background-color 0.35s ease-in-out;
      -o-transition: color 0.35s ease-in-out, background-color 0.35s ease-in-out;
      -ms-transition: color 0.35s ease-in-out, background-color 0.35s ease-in-out;
      transition: color 0.35s ease-in-out, background-color 0.35s ease-in-out;
   }
   
   ul.contact li a:hover
   {
      color: #fff;
   }

/*********************************************************************************/
/* Header                      이미지존재                                       */
/*********************************************************************************/

   #header
   {
      position: relative;
      background: url(images/header.jpg) no-repeat bottom center;
      background-attachment: fixed;
      background-size: cover;
      text-align: center;
   }
   
      #header:before
      {
         content: '';
         position: absolute;
         left: 0;
         top: 0;
         width: 100%;
         height: 100%;
         background: rgba(64,64,64,0.125);
         
      }


/*********************************************************************************/
/* Main                                                                          */
/*********************************************************************************/

   #main
   {
      position: relative;
      background: #fff;
   }
   
   .homepage #content
   {
      text-align: center;
   }
   
   .homepage #content header h2
   {
   }

   #sidebar h2
   {
      display: block;
      padding-bottom: 0.50em;
   }

   
/*********************************************************************************/
/* Featured                                                                      */
/*********************************************************************************/
   
   #featured
   {
      position: relative;
      background: #f2f2f2;
      text-align: center;
   }
   
   #featured h3
   {
      display: block;
      font-weight: 300;
   }

   #featured .pennant
   {
      font-size: 4em;
   }
   
   #featured .button
   {
      margin-top: 1.5em;
   }


 </style>

<title>Introduce</title>
</head>
<body class="homepage">

  	<!-- Featured -->
		<div id="featured">
			<div class="container">
				<header>
					<h2>Introduce to BIKEE</h2>
				</header>
				<p>바쁘게 살아가는 일상 속에서 건강을 잃어버리고 있진 않나요?
				 신개념 이동수단 바이키. 바이키는 당신의 고민을 해결 해 줄 수 있습니다. </p>
				<hr />
				<div class="row">
					<section class="4u">
						<span class="pennant"><span class="fa fa-briefcase"></span></span>
						<h3>BEFORE RIDING</h3>
						<p>자전거를 타기 전에 알아야 할 간단한 상식들을 알아볼까요? 바이키를 더 안전하게 즐길 수 있습니다.</p>
						<a href="#myCarousel" class="button button-style1">Read More</a>
					</section>
					<section class="4u">
						<span class="pennant"><span class="fa fa-lock"></span></span>
						<h3>HOW TO USE</h3>
						<p>바이키의 대여방법과 반납방법에 대한 자세한 안내사항을 확인해보세요. 바이키가 더 쉬워집니다.</p>
						<a href="#how" class="button button-style1">Read More</a>
					</section>
					<section class="4u">
						<span class="pennant"><span class="fa fa-globe"></span></span>
						<h3>BIKEEBOX</h3>
						<p>경기도 내 80여개의 대여소 보유, 대여소를 조회하여 대여소와 코스 정보를 확인 할 수 있습니다.</p>
						<a href="<%= request.getContextPath() %>/course/searchShop?shopId=gs_05" class="button button-style1">Read More</a>
					</section>

				</div>
			</div>
		</div>
	<style>
		#content{
			
         margin-top: 30px; 
			}
	</style>
	<!-- Main -->
		<div id="main">
			<div id="content" class="container">
				<div class="row">
					<section class="6u">
						<a href="#" class="image full"><img src="../../images/pic01.jpg" alt=""></a>
						<header>
							<h2>Riding</h2>
						</header>
						<p>바이키는 자전거도로를 누구보다 잘 알고 있습니다. 바이키가 추천하는 자전거도로는 많은 라이더들에게 호평받는 코스가 되어가고 있습니다.</p>
					</section>				
					<section class="6u">
						<a href="#" class="image full"><img src="../../images/pic02.jpg" alt=""></a>
						<header>
							<h2>Various</h2>
						</header>
						<p>바이키는 기본 레저용 자전거 뿐 아니라  MTB, 리컴번트, 원바이크등 다양한 종류와 기능을 가진 자전거를 보유하고 있습니다.</p>
					</section>				
				</div>

				<div class="row">
					<section class="6u">
						<a href="#" class="image full"><img src="../../images/pic03.jpg" alt=""></a>
						<header>
							<h2>System</h2>
						</header>
							<p>한번의 터치로 손안에서 이루어지는 간단한 예약과정, 예약번호를 바이키박스 앞 직원에게 제시하기만 하면  바이키를 탈 수 있습니다.</p>
						</section>				
					<section class="6u">
						<a href="#" class="image full"><img src="../../images/pic04.jpg" alt=""></a>
						<header>
							<h2>Facilities</h2>
						</header>
						<p>바이키박스에서 바이커들과 휴식하며 이야기를 나누어보세요. 더위를 피할 수 있는 3피트의 차광막은 갑작스런 우천도 두렵지 않아요!</p>
					</section>				
				</div>
			
			</div>
		</div>
			
			<br>
			<br>
			

		<div id='featured' class="container">
		<header>
				<h2>Safty Rules</h2>
		</header>
			
	<br>
 
	<!-- <div class="container"> -->
  	<div id="myCarousel" class="carousel slide" data-ride="carousel" style="width:100%;">
    <!-- 안전수칙 카로셀부분 : Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
      <li data-target="#myCarousel" data-slide-to="4"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="../../images/introduce_0.jpg" alt="0" style="width:100%;">
      </div>

      <div class="item">
        <img src="../../images/introduce_1.jpg" alt="1" style="width:100%;">
      </div>
    
      <div class="item">
        <img src="../../images/introduce_2.jpg" alt="2" style="width:100%;">
      </div>
      
       <div class="item">
        <img src="../../images/introduce_3.jpg" alt="3" style="width:100%;">
      </div>
      
       <div class="item">
        <img src="../../images/introduce_4.jpg" alt="4" style="width:100%;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>

 </div>
 </div> 
		
		
		<br>
		<br>

		<div id='featured' class="container">
		<header>
				<h2>HOW TO USE</h2>
		</header>
		
		<div id='how'>
		<img src ='../../images/introuduce_how.jpg' width="85%">	
		</div>
		</div>




<%@ include file= '/views/common/footer.jsp' %>