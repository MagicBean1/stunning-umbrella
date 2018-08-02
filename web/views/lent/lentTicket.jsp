<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file= '/views/common/header.jsp' %>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/lentIntro.css?ver=3"> <!-- purchase.css -->

<script>
</script>

<div class="container-fluid cf">
	<div class="text-center">
		<h2>이용권 구매하기</h2>
		<h4>다양한 종류의 이용권을 통해 BIKEE를 만나보세요.</h4>
	</div>
	<div id="conPanel" class="row">
		<!-- 정기권 -->
		<div class="col-sm-6">
			<div class="panel panel-default text-center">
				<div class="panel-heading">
					<h1>이용권 구매</h1>
				</div>
				<div class="panel-body">
					
				</div>
				<div class="panel-footer">
					<ul>
						<li>1회 1매씩 구매가 가능합니다.</li>
						<li>기본대여시간은 1시간권(60분)입니다.</li>
						<li>초과시 5분마다 추가요금(200원)과금됩니다.</li>
						<li>예시) 기본 초과 1분 ~ 5분 : 200원, 6분 ~ 10분 : 400원</li>
						<li>추가요금은 이용권 결제수단으로 자동결제됩니다.</li>
					</ul>
					<form action="<%= request.getContextPath() %>/lent/lentSelect" method="post">
						<input type="hidden" name="methodNum" value="1">
						<input type="submit" value="구매하기" class="btn btn-lg">
					</form>
				</div>
			</div>
		</div>
		
		<!-- 선물하기 -->
		<div class="col-sm-6">
			<div class="panel panel-default text-center">
				<div class="panel-heading">
					<h1>선물하기</h1>
				</div>
				<div class="panel-body">
				</div>
				<div class="panel-footer">
					<ul>
						<li>가입된 바이키 회원에 한해 선물이 가능합니다</li>
						<li>기본대여시간은 1시간권(60분)입니다.</li>
						<li>초과시 5분마다 추가요금(200원)과금됩니다.</li>
						<li>예시) 기본 초과 1분 ~ 5분 : 200원, 6분 ~ 10분 : 400원</li>
						<li>추가요금은 이용권 결제수단으로 자동결제됩니다.</li>
					</ul>
					<form action="<%= request.getContextPath() %>/lent/lentSelect" method="post">
						<input type="hidden" name="methodNum" value="2">
						<input type="submit" value="구매하기" class="btn btn-lg">
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file= '/views/common/footer.jsp' %>