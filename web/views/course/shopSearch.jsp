<%@page import="shop.model.vo.Shop"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= '/views/common/header.jsp' %>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=38dbe520351223d7e0dbf19bedaa6d68&libraries=services"></script>
   <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Cute+Font|Do+Hyeon|Sunflower:300" rel="stylesheet">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <%
      Shop s = (Shop)request.getAttribute("shop");
   %>
   <link rel="stylesheet" href="<%= request.getContextPath()%>/css/weather-icons-master/css/weather-icons.min.css">
   <style>
      p{
         font-family: 'Cute Font', cursive;
         font-size : 30px;
         }
      span{
         font-family : font-family: 'Do Hyeon', sans-serif;
         }
      .wi{
         font-size: 50px;
         margin: 5px;
         }
       .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 155px;margin-left: -144px;text-align: left;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
       .wrap * {padding: 0;margin: 0;}
       .wrap .info {width: 286px;height: 140px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;background: #fff;}
       .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
       .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
       .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
       .info .close:hover {cursor: pointer;}
       .info .body {position: relative;}
       .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
       .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
       .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
       .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
       .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
       .info .link {color: #5085BB;}
   </style>
   <script>
   function drawMap(addr,con){
      var container = document.getElementById('map');
      var options = {
         center: new daum.maps.LatLng(33.450701, 126.570667),
         level: 5
      };
      var map = new daum.maps.Map(container, options);
      // 주소-좌표 변환 객체를 생성합니다
      var geocoder = new daum.maps.services.Geocoder();
         // 주소로 좌표를 검색합니다
         geocoder.addressSearch(addr, function(result, status) {

              // 정상적으로 검색이 완료됐으면 
              if (status === daum.maps.services.Status.OK) {

                 var coords = new daum.maps.LatLng(result[0].y, result[0].x);
                  // 결과값으로 받은 위치를 마커로 표시합니다
                 var marker = new daum.maps.Marker({
                     map: map,
                     position: coords
                 });
                 // 인포윈도우로 장소에 대한 설명을 표시합니다
                var overlay = new daum.maps.CustomOverlay({
                   content: con,
                   map: map,
                   position: marker.getPosition()       
               });
                 

                 // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                 map.setCenter(coords);
             } 
         });
   }
   function writeShopInfo(code){
      $.ajax({
         url:"<%=request.getContextPath()%>/course/changeShopInfo",
         data : {shopId:code},
         type:"get",
         success : function(data){
            var s = data.shop;
            
            
            /* info = "<h4> 대여소 정보</h4>";
            info += "<table><tr><td>"+s.shopName+"</td><td>(tel."+s.shopPhone+")</td></tr>";
            info += "<tr><td>주소 :</td><td>"+s.shopAddr+"</td></tr>";
            info += "<tr><td>운영 시간 : </td><td>"+s.runTime+"</td></tr>";
            info += "<tr><td>보유 자전거 종류 : </td><td>"+s.bikeKind+"</td></tr>";
            info += "<tr><td rowspan='2'>코스정보</td></tr></table>";
            $('#test').html(info); */
            $.ajax({
               url:"<%=request.getContextPath()%>/course/courseInfo",
               data : {shopId:code},
               type:"get",
               success : function(data){
                  var course ="";
                  var con = '<div class="wrap">' + 
                     '    <div class="info">' + 
                     '        <div class="title">' + 
                              s.shopName +'('+s.shopPhone+')'+
                     '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
                     '        </div>' + 
                     '        <div class="body">' + 
                     '            <div class="img">' +
                     '                <img src="../images/logo.jpg" width="60" height="50">' +
                     '           </div>' + 
                     '            <div class="desc">' + 
                     '                <div class="ellipsis">'+s.shopAddr+'</div>' + 
                     '                <div class="ellipsis">운영시간 : '+s.runTime+'</div>' + 
                     '                <div class="ellipsis">코스정보</div>' +
                     '                <div>';
                  for(var i=0;i<data.length;i++){
                     con += '<a href="<%=request.getContextPath()%>/course/courseChange?co='
                           +data[i].courseNum+'"><i class="fa fa-bicycle" style="font-size:20px;color:blue"></i><span>  '+data[i].courseName+' 코스</span></a><br>';
                     
                  }
                     con += '</div>' + 
                     '            </div>' + 
                     '        </div>' + 
                     '    </div>' +    
                     '</div>';
                     console.log(con);
                  drawMap(s.shopAddr,con);
                  drawWeather(s.shopAddr);
               }
               
            })
            
         },
         error:function(jxhr,textStatus,error)
         {
            console.log("ajax실패!");
            console.log(jxhr);
            console.log(textStatus);
            console.log(error);
         }
      });
   }
   function drawWeather(addr){
      
      var geocoder = new daum.maps.services.Geocoder();
      geocoder.addressSearch(addr, function(result, status) {

           // 정상적으로 검색이 완료됐으면 
           if (status === daum.maps.services.Status.OK) {

              var coords = new daum.maps.LatLng(result[0].y, result[0].x);
              $.ajax({
               type : "get",
               crossDomain:true,
               url : "https://api2.sktelecom.com/weather/summary?version=",
               dataType: "text",
               async : false,
               data : { lon:coords.ib,lat:coords.jb,stnid:"",version:1 },
               headers   :   { appkey:"1bc9580f-f425-442e-889c-5fd3a8f694f2"},
               beforeSend: function(){
               },
               success : function(data){
                  var obj = JSON.parse(data);
                  //obj.hourly
                  console.log(coords);
                  console.log(obj.weather);
                  
                  var loc = "<h5>주소 : "+obj.weather.summary[0].grid.city+" "+obj.weather.summary[0].grid.county+"</h5>";
                  var cWeather = "<h5>오늘날씨</h5>";
                  var tWeather = "<h5>내일날씨</h5>";
                  switch(obj.weather.summary[0].today.sky.name){
                  case '맑음' : cWeather += "<i class='wi wi-day-sunny'></i>";break;
                  case '구름조금' : cWeather += "<i class='wi wi-day-cloudy'></i>"; break;
                  case '구름많음' : cWeather += "<i class='wi wi-cloudy'></i>"; break;
                  case '흐림' : cWeather += "<i class='wi wi-day-fog'></i>"; break;
                  case '비' : cWeather += "<i class='wi wi-day-rain'></i>"; break;
                  case '눈' : cWeather += "<i class='wi wi-day-snow'></i>"; break;
                  case '비 또는 눈' : cWeather += "<i class='wi wi-day-rain-mix'></i>"; break;
                  }
                  switch(obj.weather.summary[0].tomorrow.sky.name){
                  case '맑음' : tWeather += "<i class='wi wi-day-sunny'></i>";break;
                  case '구름조금' : tWeather += "<i class='wi wi-day-cloudy'></i>"; break;
                  case '구름많음' : tWeather += "<i class='wi wi-cloudy'></i>"; break;
                  case '흐림' : tWeather += "<i class='wi wi-day-fog'></i>"; break;
                  case '비' : tWeather += "<i class='wi wi-day-rain'></i>"; break;
                  case '눈' : tWeather += "<i class='wi wi-day-snow'></i>"; break;
                  case '비 또는 눈' : tWeather += "<i class='wi wi-day-rain-mix'></i>"; break;
                  }
                  
                  cWeather += "<h5>최고기온 : "+obj.weather.summary[0].today.temperature.tmax+"</h5>";
                  cWeather += "<h5>최저기온 : "+obj.weather.summary[0].today.temperature.tmin+"</h5>";
                  tWeather += "<h5>최고기온 : "+obj.weather.summary[0].tomorrow.temperature.tmax+"</h5>";
                  tWeather += "<h5>최저기온 : "+obj.weather.summary[0].tomorrow.temperature.tmin+"</h5>";
                  $('#weather_title').html("<h4>대여소 날씨 정보</h4>");
                  $('#location').html(loc);
                  $('#today_weather').html(cWeather);
                  $('#tomorrow_weather').html(tWeather);
                  
               },
               complete: function(){
               },
               error   : function(xhr, status, error){
               alert(error);
               }
            });
              
           }
      });
      
   }
   $(function(){
      var code = "<%=s.getShopId()%>"
      writeShopInfo(code);

      $('.shop_name').click(function(){
         code = $(this).attr("alt");
         writeShopInfo(code);

         
         
      });
   });
   </script>
   <style>
   /* sidenav style */

      .shop_name:hover{
         font-weight : bolder;
      }
      h2{
         font-family: 'Do Hyeon', sans-serif;
      }
      
      /* shop button design */
      .btn-group{width:100%;
          margin: 2px;}
       .btn-group .btn{width:100%;
            font-size: 20px;
            font-family: 'Sunflower', sans-serif;
         }
      .shop1{
       background-color: red;
       color : white;
       }
       
      .shop2{
          background-color: orange;
          color : white;
          }
      
      .shop3{
          background-color: blue;
          color : white;
          }
       
      .shop4{
          background-color: green;
          color : white;
          }
       
      .shop5{
          background-color: hotpink;
          color : white;
          }
      
      .shop6{
          background-color: silver;
          color : white;
          }
       
       /* map style */
       .divMap {
          padding-top: 7%;
          padding-left : 10px;}
       #map {
          height: 70vh;
       }
          
   </style>
   
   <div class = "container">
      <div class = "row">
         <div class = "col-sm-3 sidenav">
            <h2>대여소목록</h2>
            <hr>
            <div class="btn-group">
           <button type="button" class="btn shop1 shop_name" alt="gs_05" >
             잠실행복점
           </button>
         </div>
         <div class="btn-group">
           <button type="button" class="btn shop2 shop_name" alt="no_02">
             노량진역점
           </button>
         </div>
         <div class="btn-group">
           <button type="button" class="btn shop3 shop_name" alt="tc_01">
             성남탄천점
           </button>
         </div>
         <div class="btn-group">
           <button type="button" class="btn shop4 shop_name" alt="ic_03">
             인천소래포구역점
           </button>
         </div>
         <div class="btn-group">
           <button type="button" class="btn shop5 shop_name" alt = "ha_06">
             하늘공원점
           </button>
         </div>
         <div class="btn-group">
           <button type="button" class="btn shop6 shop_name" alt="yp_04">
             양평북한강점
           </button>
           </div>
              <div id = "weather_title"></div>
            <div id="location"></div>
            <div class ="row">
               <div id="today_weather" class ="col-sm-6"></div>
               <div id ="tomorrow_weather" class = col-sm-6></div>
            </div>
         </div>
         
         <style>
            #info{
            display:relative !important;
            top:100px !important;
            left:200px !important;
            z-index:999 !important;
            };
            #map{display:relative;z-index:1 !important;};
         </style>
         
         <div class = "col-sm-9 divMap">
            <div id ="map">
               <div id="info"></div>
            </div>
            
            
         </div>      
      </div>
   </div>
<%@ include file= '/views/common/footer.jsp' %>