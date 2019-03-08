<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.mrporter.pomangam.product.vo.ProductBean"%>
<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="com.mrporter.pomangam.restaurant.vo.RestaurantBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mrporter.pomangam.cart.vo.CartBean"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.mrporter.pomangam.common.util.Number"%>
<!DOCTYPE html>

<html>
<head>
	<link href="resources/img/favicon.ico" rel="shortcut icon">
</head>
<body style="background-color: #FFF">
	<%
		String curTarget = (String) session.getAttribute("curTarget");
		String curRestaurant = (String) request.getParameter("idx");
		
		@SuppressWarnings({"unchecked"})
		List<ProductBean> productList = (List<ProductBean>) request.getAttribute("productList");
		@SuppressWarnings({"unchecked"})
		List<String> categoryList = (List<String>) request.getAttribute("categoryList");
		
		String category = (String) request.getAttribute("category");
		
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
			<!-- 
            <b>
            	<i class="pull-xs fa fa-star"></i>
	            <% out.print(Number.numberWithCommas(restaurant.getCnt_star())); %>&nbsp;&nbsp;
	            <i class="pull-xs fa fa-commenting"></i>
	            <% out.print(Number.numberWithCommas(restaurant.getCnt_comment())); %>
            </b>
            <br>
             -->
           	<span style="font-size:20px"><b><%=restaurant.getStart() %> ~ <%=restaurant.getEnd() %></b></span><br>
            <i class="pull-xs fa fa-location-arrow"></i>
            	<%=restaurant.getLocation() %>
	        <br>
	        <span>
	        	<%=restaurant.getDescription() %>
	        </span>
	        <br><br> 
	        <a href="#country_origin"><b>원산지 표기 보기</b></a>
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
		<div class="center">
			<div id="owl-carousel-basic" class="owl-carousel" style="display: inline-block!important">
				<div class="demo-item" onclick="location.href='./restaurant.do?idx=<%=curRestaurant %>'">
					<span class="n-target-category">
						<%if(category==null || category.length()==0) {%><u>전체</u><%} else {%>전체<%} %>
					</span>
				</div>
				<%
				if(categoryList != null) {
				for(String c : categoryList) {%>
				<div class="demo-item" style="display:none" onclick="categoryHref('<%=curRestaurant %>' , '<%=c%>')">
					<span class="n-target-category">
						<%if(c.equals(category)) {%><u><%=c %></u><%} else {%><%=c %><%} %>
					</span>
				</div>	
				<%}} %>
			</div>
			 
		</div>
		<br>
		<!-- Parter -->
		<div>
			<!-- 
			<h2 class="n-font landing-heading text-xs-center">
				주문 마감까지 <br><span id="ob-time" style="color:#eb613e"></span> 남았습니다.
			</h2>
			 -->
			<div class="container-fluid n-target-center" >
				<div class="row">
					<%
					if(productList==null||productList.isEmpty()) {%>
					<div class="n-center" style="margin-bottom:50px">
						<h2>준비중</h2>
						<span style="font-size:18px">죄송합니다.. 주문 가능한 메뉴가 없습니다.</span>
					</div>
					<%} else {
					for(int i=0; i<productList.size(); i++) {
						ProductBean bean = productList.get(i);
							if(bean.getIsActive() == 0) continue;	
					%>	

					<div class="col-xs-4 col-sm-3" style="padding:0px">
						<div class="box n-center" 
							<%if(bean.getType() == 1) {%>
								onclick="location.href='./product.do?idx=<%=bean.getIdx() %>'"
							<%} else {%>
								onclick="toast('포만감','메인메뉴 주문 단계에서 추가하실 수 있습니다.','warning')"
							<%} %>
						>
							<a class="valign-middle n-noborder" style="cursor: pointer;"> 
							<img src="<%=bean.getImgpath() %>" alt="<%=bean.getName() %>" class="n-restaurant-icon"
								style="margin-top: 3px" />

							</a>
							<div style="cursor: pointer;">
								<div style="margin-top: 3px; height:60px">
									<b><%=bean.getName() %></b> <br> <% out.print(Number.numberWithCommas(bean.getPrice())); %>원
								</div>
								<div style="">
								<!-- 
								<button class="btn btn-primary "
									style="font-size: 8px !important; padding: 2px; margin-bottom: 3px">마감임박</button>
								 -->
								</div>
							</div>
						</div>
					</div> 
					<%}} %>
					
				</div>
				<div class="n-center">
					<span>※ 위 가격은 배달가격이 포함된 가격입니다.<br>기존 업체가 제공하는 가격과 상이할 수 있습니다.</span>
					<br><br>
				</div>
				<hr>
				<div id="country_origin" class="n-center">
					<h3><b>원산지 표기</b></h3>
					<span><%=(restaurant.getCountry_origin()==null?"":restaurant.getCountry_origin()) %></span>
					<br><br>
				</div>
			</div>

			
		</div>
        

	</div>
	
	<!-- Footer -->
	<%@ include file="../parts/footer.jsp" %>

	<!-- Core scripts -->
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/pixeladmin.min.js"></script>
	
	<script>
	var curTarget = <%=curTarget%>;
	var curRestaurant = <%=curRestaurant%>;
	
	$('#header-home').hide();
	$('#header-back').show();
	$('#header-center').show();
	$('#header-back').prop('href', './target.do?idx='+curTarget);
	
	$('.demo-item').css("display", "block");
	$('#owl-carousel-basic').owlCarousel({
		loop:   false,
		margin: 10,

		responsive:{
			0:    { items: 5 },
			600:  { items: 5 },
			1000: { items: 5 },
		},

		rtl: $('html').attr('dir') === 'rtl',
	});
	
	function categoryHref(idx, category) {
		var t = encodeURI(category);
		console.log(t);
		location.href='./restaurant.do?idx='+idx+
					'&category='+t;
	}
	
	
	</script>

	
</body>
</html>