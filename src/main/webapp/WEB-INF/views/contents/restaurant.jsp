<%@page import="com.mrporter.pomangam.target.vo.OrdertimeBean"%>
<%@page import="com.mrporter.pomangam.product.vo.ProductBean"%>
<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="com.mrporter.pomangam.restaurant.vo.RestaurantBean"%>
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
		
		@SuppressWarnings({"unchecked", "rawtypes"})
		List<String> ordertime = (List) request.getAttribute("ordertime");
		@SuppressWarnings({"unchecked"})
		List<ProductBean> productList = (List<ProductBean>) request.getAttribute("productList");
		
		String json = (String) request.getAttribute("restaurant");
		List<RestaurantBean> list = new Gson().fromJson(
				json, 
				new TypeToken<List<RestaurantBean>>() {}.getType());
		RestaurantBean restaurant = list.get(0);
	%>
	
	<!-- Navbar -->
	<jsp:include page="../parts/header.jsp" /> 

	<div class="container center" style="margin-top:50px">
		<!-- Target Info -->
		<div class="n-center n-padding-32 n-margin-bottom">
			<a href="" style="text-decoration:none; !important">
				<span class="n-xlarge n-bottombar" style="padding:5px">
                    <span style="color:black">
                        <%=restaurant.getName() %>
                    </span>
                </span>
			</a>
		</div>
		<div class="n-center" style="font-size:13px">
            <b>
            	<i class="pull-xs fa fa-star"></i>
	            <%=restaurant.getCnt_star() %>&nbsp;&nbsp;
	            <i class="pull-xs fa fa-commenting"></i>
	            <%=restaurant.getCnt_comment() %>
            </b>
            <br>
            <i class="pull-xs fa fa-location-arrow"></i>
            	<%=restaurant.getLocation() %>
	        <br>
	        <span>
	        	<%=restaurant.getDescription() %>
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
			<h2 class="n-font landing-heading text-xs-center">
				주문 마감까지 <br><span id="ob-time" style="color:#eb613e"></span> 남았습니다.
			</h2>
			
			<div class="container-fluid n-target-center" >
				<div class="row">
					<%
					if(productList.isEmpty()) {%>
					
					<span>주문 가능한 메뉴가 없습니다.</span>
					
					<%}
					for(int i=0; i<productList.size(); i++) {
						ProductBean bean = productList.get(i);%>	

					<div class="col-xs-4 col-sm-3" style="padding:0px">
						<div class="box n-center n-hover-opacity" onclick="location.href='./product.do?idx=<%=bean.getIdx() %>'">
							<a class="valign-middle n-noborder"> <img
								src="<%=bean.getImgpath() %>" alt="<%=bean.getName() %>" class="n-restaurant-icon"
								style="margin-top: 3px" />

							</a>
							<div style="margin-top: 3px">
								<b><%=bean.getName() %></b> <br> <%=bean.getPrice() %>원
							</div>
							<div style="height:25px">
							<%if(bean.getCnt_limit() <= 5) {%>
							<button class="btn btn-primary "
								style="font-size: 8px !important; padding: 2px; margin-bottom: 3px">마감임박</button>
							<%} %>
							</div>
						</div>
					</div>
					<%} %>
					
				</div>
			</div>

			
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
	
	var tmp = <%=new Gson().toJson(ordertime) %>;
	var ordertime = [];
	tmp.forEach(function(e){
		var time = {};
		if(e.end.substring(0, 2) == '오전') {
			var t = e.end.substring(3);
			time.hour = parseInt(t.substring(0, t.indexOf(':')));
			time.minute = 	parseInt(t.substring(t.indexOf(':')+1));
		} else if(e.end.substring(0, 2) == '오후') {
			var t = e.end.substring(3);
			time.hour = parseInt(t.substring(0, t.indexOf(':'))) + 12;
			time.minute = 	parseInt(t.substring(t.indexOf(':')+1));
		}
		ordertime.push(time);
	});

	realtimeClock();
	
	</script>

	
</body>
</html>