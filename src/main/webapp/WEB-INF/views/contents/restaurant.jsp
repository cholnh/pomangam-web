<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mrporter.pomangam.cart.vo.CartBean"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<!DOCTYPE html>

<html>
<head>
</head>
<body style="background-color: #FFF">
	<%
		String curTarget = (String) session.getAttribute("curTarget");
		String curRestaurant = (String) request.getParameter("idx");
	%>
	
	<!-- Navbar -->
	<jsp:include page="../parts/header.jsp" /> 

	<div class="container center" style="margin-top:50px">
		<!-- Target Info -->
		<div class="n-center n-padding-32 n-margin-bottom">
			<a href="" style="text-decoration:none; !important">
				<span class="n-xlarge n-bottombar" style="padding:5px">
                    <span style="color:black">
                        맘스터치 가라뫼점
                    </span>
                </span>
			</a>
		</div>
		<div class="n-center" style="font-size:13px">
            <b>
            	<i class="pull-xs fa fa-star"></i>
	            4.7&nbsp;&nbsp;
	            <i class="pull-xs fa fa-commenting"></i>
	            132
            </b>
            <br>
            <i class="pull-xs fa fa-location-arrow"></i>
            	가라뫼 사거리 32-15
	        <br>
	        <span>
	             <b>#</b>존맛탱 <b>#</b>친절 <b>#</b>맛집 <b>#</b>항공대
	        </span>
		</div>
		
		<!--
		<div class="n-center">
			<hr>
            <div>
                Event
            </div>
		</div>
		-->
		<hr>
		
		<!-- Parter -->
		<div>
			<h2 class="n-font landing-heading text-xs-center">주문 마감까지 <span style="color:#eb613e">35분</span> 남았습니다.</h2>
			
			<div class="container-fluid n-target-center" >
				<div class="row">
					<div class="col-xs-4 col-sm-3">
						<div class="box n-center n-hover-opacity" onclick="location.href='./product.do?idx=1'">
							<a href="#" class="valign-middle n-noborder"> <img
								src="resources/img/product/1.jpg" alt="엽기떡볶이" class="n-restaurant-icon"
								style="margin-top: 3px" />

							</a>
							<div style="margin-top: 3px">
								<b>화이트 갈릭버거</b> <br> 6,000원
							</div>
							<button class="btn btn-primary "
								style="font-size: 8px !important; padding: 2px; margin-bottom: 3px">마감임박</button>

						</div>
					</div>
					<div class="col-xs-4 col-sm-3">
						<div class="box n-center n-hover-opacity" onclick="location.href='./product.do?idx=1'">
							<a href="#" class="valign-middle n-noborder"> <img
								src="resources/img/product/2.jpg" alt="엽기떡볶이" class="n-restaurant-icon"
								style="margin-top: 3px" />

							</a>
							<div style="margin-top: 3px">
								<b>화이트 갈릭버거</b> <br> 6,000원
							</div>
							<button class="btn btn-primary "
								style="font-size: 8px !important; padding: 2px; margin-bottom: 3px">마감임박</button>

						</div>
					</div>
					<div class="col-xs-4 col-sm-3">
						<div class="box n-center n-hover-opacity" onclick="location.href='./product.do?idx=1'">
							<a href="#" class="valign-middle n-noborder"> <img
								src="resources/img/product/3.jpg" alt="엽기떡볶이" class="n-restaurant-icon"
								style="margin-top: 3px" />

							</a>
							<div style="margin-top: 3px">
								<b>화이트 갈릭버거</b> <br> 6,000원
							</div>
							<button class="btn btn-primary "
								style="font-size: 8px !important; padding: 2px; margin-bottom: 3px">마감임박</button>

						</div>
					</div>
					<div class="col-xs-4 col-sm-3">
						<div class="box n-center n-hover-opacity" onclick="location.href='./product.do?idx=1'">
							<a href="#" class="valign-middle n-noborder"> <img
								src="resources/img/product/4.jpg" alt="엽기떡볶이" class="n-restaurant-icon"
								style="margin-top: 3px" />

							</a>
							<div style="margin-top: 3px">
								<b>화이트 갈릭버거</b> <br> 6,000원
							</div>
							<button class="btn btn-primary "
								style="font-size: 8px !important; padding: 2px; margin-bottom: 3px">마감임박</button>

						</div>
					</div>
					<div class="col-xs-4 col-sm-3">
						<div class="box n-center n-hover-opacity" onclick="location.href='./product.do?idx=1'">
							<a href="#" class="valign-middle n-noborder"> <img
								src="resources/img/product/5.jpg" alt="엽기떡볶이" class="n-restaurant-icon"
								style="margin-top: 3px" />

							</a>
							<div style="margin-top: 3px">
								<b>화이트 갈릭버거</b> <br> 6,000원
							</div>
							<button class="btn btn-primary "
								style="font-size: 8px !important; padding: 2px; margin-bottom: 3px">마감임박</button>

						</div>
					</div>
				</div>
			</div>

			
		</div>
        
		<div class="n-target-mobilebtn">
			<button class="btn btn-primary" onclick="location.href='./cart.do'"
			style="width:100%;height:100%;font-size:20px;font-weight:bold">
				<i class="fa fa-shopping-cart" style="margin-right:6px"></i>
				장바구니 (3)
			</button>
		</div>
	</div>
	
	<!-- Footer -->
	<%@ include file="../parts/footer.jsp" %>


	<!-- jQuery -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<!-- Core scripts -->
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/pixeladmin.min.js"></script>
	
	<script>
	var curTarget = <%=curTarget%>;
	var curRestaurant = <%=curRestaurant%>;
	
	$('#header-home').hide();
	$('#header-back').show();
	$('#header-back').prop('href', './target.do?idx='+curTarget);
	</script>

	
</body>
</html>