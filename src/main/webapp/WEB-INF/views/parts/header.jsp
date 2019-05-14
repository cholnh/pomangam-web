<%@page import="com.mrporter.pomangam.product.vo.AdditionalBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.mrporter.pomangam.cart.vo.CartBean"%>
<%@page import="com.mrporter.pomangam.product.vo.ProductBean"%>
<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mrporter.pomangam.target.dao.TargetCrudDAO"%>
<%@page import="com.mrporter.pomangam.restaurant.dao.RestaurantCrudDAO"%>
<%@page import="com.mrporter.pomangam.product.dao.ProductCrudDAO"%>
<%@page import="com.mrporter.pomangam.common.util.Number"%>
<%@page import="com.mrporter.pomangam.common.security.model.domain.User"%>
<html>
<head>
	<meta charset="utf-8">
	<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
	<!-- <meta http-equiv="refresh" content="0;url=https://localhost:8443">  -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
	
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>

	<link rel="canonical" href="https://www.pomangam.com">
	<meta name="description" content="행복은 배부름에서 온다 - 푸드 딜리버리 서비스 플랫폼, 포터가 만나러 감">
	
	<!-- open graph -->
	<meta property="og:type" content="website">
	<meta property="og:title" content="포만감">
	<meta property="og:description" content="행복은 배부름에서 온다 - 푸드 딜리버리 서비스 플랫폼, 포터가 만나러 감">
	<meta property="og:image" content="https://www.pomangam.com/resources/img/main/logo.png">
	<meta property="og:url" content="https://www.pomangam.com">

	<title>행복은 배부름에서 온다. 포만감</title>
	
	<!-- <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,600,700,300&subset=latin" rel="stylesheet" type="text/css">
	 -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400&amp;subset=korean" rel="stylesheet">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous"> 
	 
	<!-- <link href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css" rel="stylesheet" type="text/css">  -->
	
	<!-- Core stylesheets -->
	<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="resources/css/pixeladmin.min.css" rel="stylesheet" type="text/css">
	<link href="resources/css/widgets.min.css" rel="stylesheet" type="text/css">
	
	<!-- Theme -->
	<link href="resources/css/themes/candy-orange.min.css" rel="stylesheet" type="text/css">
	
	<!-- Landing page CSS -->
	<link href="resources/css/landing.css" rel="stylesheet" type="text/css">
	<link href="resources/css/custom.css?ver=1.1" rel="stylesheet" type="text/css">
	
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="resources/js/common.js"></script>
	<script src="resources/js/toastr.js"></script>
	
	<%	
	
	//@SuppressWarnings({"unchecked", "rawtypes"})
	//List<AdditionalBean> additionalList = (List) request.getAttribute("additionalList");
	
	List<CartBean> cartList = new ArrayList<>();
	Object obj = session.getAttribute("cartList");
	
	if(obj != null) {
		cartList = (ArrayList<CartBean>) obj;
	}
	
	String userjson = (String) request.getSession().getAttribute("user");
	User user = new Gson().fromJson(userjson, new TypeToken<User>() {}.getType());
	%>

</head>

<body>
	<nav id="nav" class="navbar px-navbar sticky">
		<div class="container">
			<div class="navbar-header">
				<a id="header-home" href="./" class="scroll-to navbar-brand"><b>Mr. Porter</b></a>
				<a id="header-back" href="javascript:history.back()" class="scroll-to navbar-brand" style="display:none">
					<i class="fa fa-arrow-left" style="font-size:20px!important"></i>
				</a>
			</div>
			<a id="header-center" href="./" class="n-header-center" style="display:none"><b>Mr. Porter</b></a>
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target=".navbar-collapse"
				aria-expanded="false">
				<i class="navbar-toggle-icon"></i>
			</button>

			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li>
						<%if(user==null) {%>
						<a href="./guestcheck.do" class="scroll-to">내 주문</a>
						<%} else { %>
						<a href="./myorder.do" class="scroll-to">내 주문</a>
						<%} %>
					</li>
					
					<li>
						<div class="n-on-mobile" style="margin:10px 15px 10px 15px">
							<a href="./cart.do" class="scroll-to">장바구니</a>
						</div>
						
						<div class="n-dropdown-hover n-transparent n-right n-on-pc" style="width:100px; text-align:center">
							<a href="./cart.do" class="scroll-to">장바구니&nbsp;
								<%if(cartList.size() > 0 ) { %>
								(<span id="ob-cartSize"><%=cartList.size() %></span>)
								<%} %>
							</a>
							<div class="n-dropdown-content n-card-4"
								style="width: 350px; right: 0">
								<%
								if(cartList != null && !cartList.isEmpty()) {
								%>
								<div class="" style="text-align: center">
									<h4><b>총 <span id="ob-sumPrice">0</span>원</b></h4>
									<span>
										( 배달 <span class="ob-time-max"></span>도착 )
									</span>
								</div>
								<div style="text-align:right; margin-right:12px">
									<button class="btn btn-secondary n-small" onclick="removeAllCartProduct()">전체삭제</button>
								</div>
								<%} %>
								<div style="text-align: left;margin:12px">
									<table id="cartTable" class="table"> 
										<thead>
										</thead>
										<colgroup>
					                        <col style="width:70px">
					                        <col style="width: 220px;">
					                        <col style="width: 20px">
					                    </colgroup>
										<tbody>
											
											<%
											int sumPrice = 0;
											
											if(cartList == null || cartList.isEmpty()) {
											%>	
											<tr style="text-align:center">
												<td colspan=3>
													장바구니가 비어있습니다.
												</td>
											</tr>
											<%}
											if(cartList != null) {
											for(CartBean cart : cartList) {
												int idx_product = cart.getIdx_product();
												
												String json = new ProductCrudDAO().getBean(idx_product);
												List<ProductBean> list = new Gson().fromJson(
														json, 
														new TypeToken<List<ProductBean>>() {}.getType());
												ProductBean product = list.get(0);
												
												List<String> nameList = new ArrayList<>();
												int sum_addPrice = 0;
												String add = cart.getAdditional();
											
												if(add!=null && add.length()>0) {
													String[] parts = add.split(",");
													for(String part : parts) {
														//Integer idx_product_additional = Integer.parseInt(part.split("-")[0]);
														int amount = Integer.parseInt(part.split("-")[1]);
														int addPrice = Integer.parseInt(part.split("-")[2]);
														nameList.add(part.split("-")[3]+" "+amount+"개 추가");
														sum_addPrice += (addPrice * amount);
													}
												}
												sumPrice += ((product.getPrice()+sum_addPrice) * cart.getAmount());
											%>
											<tr id="cart-<%=cart.getIdx()%>">
												<td>
													<a href="./product.do?idx=<%=product.getIdx() %>" class="valign-middle n-noborder">
						                                <img src="<%=product.getImgpath() %>" alt="<%=product.getName() %>" class="n-cart-icon" />
													</a>
												</td>
												<td>
													<div class="row" style="margin-left:12px;margin-top:8px;">
														<span><b><%=product.getName() %></b></span>
														<span style="font-size:13px!important" >
										            		(<span class="ob-time-<%=idx_product %>"></span> 도착)
										            	</span>
													</div>
													<%if(!nameList.isEmpty()) {%>
													<div class="row" style="margin-left:12px">
														<span>
															<%=nameList.toString() %>
														</span>
													</div>
													<%} %>
													<div class="row" style="margin-left:12px">
														<span style="font-weight:bold"></b>
											            	<% out.print(Number.numberWithCommas(cart.getAmount())); %>개 
											            </span>
														<span style="margin-left:12px">
															<b><% out.print(Number.numberWithCommas(product.getPrice()+sum_addPrice)); %>원</b>
														</span>
														
														<!-- <input type="number" min=1 value="" style="width:40px;margin-left:6px">개  -->
													</div>
												</td>
												<td>
													<i onclick="removeCartProduct(<%=cart.getIdx()%>)" 
													class="fa fa-remove fa-2x" style="margin-top:16px"></i>
												</td>
											</tr>	
											<%}}%> 

										</tbody>
									</table>
									<%
									if(cartList != null && !cartList.isEmpty()) {
									%>
									<div class="n-center" style="margin-top:32px;margin-bottom:32px">
										<button class="btn btn-primary" style="width:60%;font-size:20px;font-weight:bold" 
											onclick="goPayment()">주문하기</button>
									</div>
									<%} %>
								</div>
							</div>
						</div>
					</li>
					<li>
						<%if(user==null) {%>
						<a href="./login.do" class="scroll-to">로그인</a>
						<%} else {%>
						<a href="./logout.do" class="scroll-to">로그아웃</a>
						<%} %>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	
	<%if(cartList.size() > 0 ) { %>
	<div id="ob-mobileCartBtn" class="n-target-mobilebtn n-on-mobile" style="background-color: white;border-color: white">
		<button class="btn" onclick="location.href='./cart.do'"
		style="width:100%;height:100%;font-size:20px;font-weight:bold;background-color: white;color: #e84a22">
			장바구니 (<span id="ob-cartSize2"><%=cartList.size() %></span>)
		</button>
	</div>
	<%} %>
	
	<script>
	var ob = document.getElementById('ob-sumPrice');
	if(ob) {
		ob.innerText = numberWithCommas(<%=sumPrice%>);
	}
	
	<%
	if(cartList != null) {
	for(CartBean cart : cartList) {
	%>
		getTime2(<%=cart.getIdx_product()%>, <%=cart.getAmount()%>, <%=cart.getIdx_restaurant() %>, true);
		setTimeout("getTime2(<%=cart.getIdx_product()%>, <%=cart.getAmount()%>, <%=cart.getIdx_restaurant() %>, true)", 1000*60);
	<%}}%>
	
	var maxtime = 0;
	function getTime2(idx_product, amount, idx_restaurant, tf) {
		ajax('./product/gettime.do', 
				{
					idx_product : idx_product,
					amount : amount,
					idx_restaurant : idx_restaurant
				},
				tf,
				function(t) {
					maxtime = maxtime < t ? t : maxtime;
					var d = new Date(t);
					$('.ob-time-'+idx_product).text(d.getHours()+'시 '+ (d.getMinutes() > 0 ? d.getMinutes()+'분' : ''));
					var max = new Date(maxtime);
					$('.ob-time-max').text(max.getHours()+'시 '+(max.getMinutes() > 0 ? max.getMinutes()+'분' : ''))
				},
				function() {
					alert('네트워크 오류');
				}
		);
	}
	</script>
	
</body>
</html>