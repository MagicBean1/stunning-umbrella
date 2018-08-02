<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "member.model.vo.Member" %>
<%
	Member memberLoggedIn = (Member) session.getAttribute("memberLoggedIn");
	
	Cookie[] cookies =  request.getCookies();
	String saveId = null;
	
	
	if(cookies != null) {
		for(Cookie c : cookies) {
			if(c.getName().equals("saveId")) { // c.getName() ==> c의 key값. saveId와 같으면
				saveId = c.getValue(); // c.getValue() ==> c의 value값. String saveId에 값을 넣어라 
			}
		}
	}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>BIKEE</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script> <!-- jQuery -->
<script src="<%= request.getContextPath() %>/js/bootstrap.js"></script> <!-- bootstrap.js -->
<!-- 아이콘 모음집! -->
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/bootstrap/bootstrap.css" rel="stylesheet"> <!-- bootstrap.css -->
<link href="<%= request.getContextPath() %>/css/bootstrap/bootstrap-theme.css" rel="stylesheet"> <!-- bootstrap-theme.css -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css?ver=1"> <!-- common.css -->
   
<style>

.navbar .dropdown ul {
    background-color: rgb(52, 73, 94);
	
}
div a#findId{font-weight:bold;margin-left:370px;}
div a#findPw{font-weight:bold;}


</style>
</head>

<script>
function validate() {
	// 아이디를 적었는지 체크.         
	if($('#memId').val().trim().length == 0) { // val() => 값. trim() => 공백 제거. '    ' 와 같은 경우를 막기 위함 
		alert("아이디를 입력하세요!");
		$('#memId').focus(); // focus() => 커서를 위치시킨다.
		return false;
	}
	
	// 비밀번호 적었는지 체크
	if($('#memPw').val().trim().length == 0) {
		alert("비밀번호를 입력하세요!");
		$('#memPw').focus();
		return false;
	}
	return true;
}





</script>

<body>
	<!-- mainLogo -->
	<div class="row mainLogo">
        <div class="col-sm-4">
            <a href="<%=request.getContextPath() %>/"><img src="<%=request.getContextPath() %>/images/logo.jpg"></a>
        </div>
        <div class="col-sm-8">
        </div>
    </div>
    
	<!-- navbar -->
	<nav class="navbar navbar-invarse">
	    <div class="container">
	        <div class="navbar-header">
	            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	            </button>
	            <a class="navbar-brand" href="<%= request.getContextPath() %>">HOME</a>
	        </div>
	        <div class="collapse navbar-collapse" id="myNavbar">
	            <ul class="nav navbar-nav">
	                <li class="dropdown">
                    	<a class="dropdown-toggle" data-toggle="dropdown" href="#" >소개<span class="caret"></span></a>
			                <ul class="dropdown-menu">
			                <li><a href="<%=request.getContextPath()%>/GoIntroServlet">사업소개</a></li>
							<li><a href="<%=request.getContextPath()%>/GoBikeIntroServlet">자전거종류</a></li>
							</ul>
	                	
					<li><a href="<%= request.getContextPath() %>/notice/noticeList">공지사항</a></li>

	                <li><a href="<%= request.getContextPath() %>/views/lent/lentTicket.jsp">이용권 구매</a></li>
	                <li><a href="<%= request.getContextPath() %>/course/searchShop?shopId=gs_05">대여소 조회</a></li>
                    <!-- href="<%=request.getContextPath()%>/community/communityList" -->
                    <li class="dropdown">
                    	<a class="dropdown-toggle" data-toggle="dropdown" href="#" >커뮤니티<span class="caret"></span></a>
                    	<ul class="dropdown-menu">
                    		<li><a href="<%=request.getContextPath()%>/community/communityList">자유게시판</a></li>
                    		<li><a href="<%=request.getContextPath()%>/reviewList">이용후기</a></li>
                   		</ul>
                    </li>
                    <li><a href="<%=request.getContextPath()%>/centerList">고객센터</a></li>
	            </ul>
	            
	            <ul class="nav navbar-nav navbar-right">
                <% if(memberLoggedIn != null) { %>
                    
                    <li class="dropdown">

                    	<a class="dropdown-toggle" data-toggle="dropdown" ><span class="glyphicon glyphicon-lock"> 마이페이지<span class="caret"></span></span></a>
                    	<ul class="dropdown-menu">
                    		<li><a onclick="location.href='<%= request.getContextPath() %>/memberUpdate?memId=<%= memberLoggedIn.getMem_id() %>'"><span class="glyphicon glyphicon-repeat"> 회원정보수정</span></a></li>
                    		<li><a onclick="location.href='<%= request.getContextPath() %>/memberPassUpdate?memId=<%= memberLoggedIn.getMem_id() %>'"><span class="glyphicon glyphicon-pencil"> 비밀번호수정</span></a></li>
                    		<% if(memberLoggedIn != null && !memberLoggedIn.getMem_id().equals("admin")) { %>
                    		<li><a onclick="location.href='<%= request.getContextPath() %>/memberLentHistory?memId=<%= memberLoggedIn.getMem_id() %>'"><span class="glyphicon glyphicon-search"> 구매내역확인</span></a></li>
                    		<% } %>
                   		</ul>
                    </li>
                    <li><a href="<%= request.getContextPath() %>/member/memberLogout"><span class="glyphicon glyphicon-user"> Logout</span></a></li>
                <% } else { %>
               		<li><a href="#" data-toggle="modal" data-target="#loginModal" data-backdroup="static"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                    <li><a href="<%= request.getContextPath() %>/views/member/joinTerms.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                <% } %>
                <% if(memberLoggedIn!=null && memberLoggedIn.getMem_id().equals("admin")) { %>
				<li class='dropdown admin-member'>
				<a href='#' class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> 관리자<span class="caret"></span></a>
					<ul class="dropdown-menu">
		         <li><a href="<%=request.getContextPath() %>/memberView">회원관리</a></li>
						<li><a href="<%=request.getContextPath() %>/bikeList">자전거관리</a></li>

						<li><a href="<%=request.getContextPath()%>/member/PayHistory">결제관리</a></li>
						<li><a href="<%=request.getContextPath()%>/lent/lentCancelServletA">결제취소관리</a></li>
					</ul>
				</li>
				<%} %>
               </ul>
	        </div>
	    </div>
	</nav>
	<!-- loginModal -->
    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="LogIn" aria-hidden="true" data-backdrop="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">LogIn</h4>
                </div>
                <!-- FORM 시작 -->
                <form action="<%=request.getContextPath()%>/member/memberLogin" id="loginModalFrm" method="post" onsubmit="return validate()">
                	<div class="modal-body">
        	            <div class="form-group">
        	            	<i class="fa fa-user icon"></i>
	                        <label for="userId"> UserId</label>
	                        <input type="text" class="form-control" name="memId" id="memId" placeholder="Enter userId" value="<%= saveId!=null ? saveId : "" %>">
	              		    </div>
	                    
	                    	<div class="form-group">
	                    	<i class="fa fa-key icon"></i>
	                        <label for="password"> Password</label>
	                        <input type="password" class="form-control" name="memPw" id="memPw" placeholder="Enter Password"><br>
	                        <input type="checkbox" name="saveId" id="saveId" <%= saveId!=null ? "checked" : "" %>>
							<label for="saveId">Remember Id</label>
							<a style="color:white" id="findId" href="<%=request.getContextPath() %>/views/member/findId.jsp"/>Find ID</a>
							<a style="color:white" id="findPw" href="<%=request.getContextPath()%>/views/member/findPw.jsp"/>/ PW</a>
	                    	</div>
		                	
		                	<div class="modal-footer">
		                    <button type="submit" class="btn btn-default text-center">Submit</button>
		                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                   		</div>
                  	</div>
                </form>
            </div>
        </div>
    </div>
