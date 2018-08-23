<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="com.mrporter.pomangam.product.vo.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mrporter.pomangam.cart.vo.CartBean"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.mrporter.pomangam.common.util.Number"%>
<!DOCTYPE html>

<html>
<head>	
</head>
<body style="background-color: #FFF">
	<%
		String curTarget = (String) session.getAttribute("curTarget");
		String curRestaurant = (String) session.getAttribute("curRestaurant");
		String curProduct = (String) request.getParameter("idx");
		
		@SuppressWarnings({"unchecked"})
		List<ProductBean> recommend = (List<ProductBean>) request.getAttribute("recommend");
		
		String json = (String) request.getAttribute("product");
		List<ProductBean> list = new Gson().fromJson(
				json, 
				new TypeToken<List<ProductBean>>() {}.getType());
		ProductBean product = list.get(0);
	%>
	
	<!-- Navbar -->
	<jsp:include page="../parts/header.jsp" /> 

	<div class="container center" style="margin-top:50px">
		<!-- Target Info -->
        <div class="n-center" style="margin-top:16px">
            <a class="valign-middle n-noborder">
                <img src="<%=product.getImgpath() %>" alt="<%=product.getName() %>" class="n-product-icon n-card" />
            </a>
            <div style="margin:12px">
                <span style="font-size: 20px; font-weight: bold;"><%=product.getName() %></span>
            </div>
            <a class="btn-primary " style="font-size:12px!important;padding:5px"></b>
            	<% out.print(Number.numberWithCommas(product.getCnt_limit())); %>개 남음
            </a>
            <div style="margin-top:18px">
                
                <input id="ob-amount" type="number" style="width:40px" min=1 value=1> 개
                <span style="color: #f3753a; font-weight: bold; margin-left: 12px; font-size: 15px;">
                    	<% out.print(Number.numberWithCommas(product.getPrice())); %>원
                </span>
            </div>
			<div class="n-margin">
				<button class="btn" onclick="insertCartProduct()"
				style="background-color: darkgray; color:white;font-size:20px;font-weight:bold">장바구니 담기</button>
				<button class="btn btn-primary" onclick="goDirect()"
				style="font-size:20px;font-weight:bold">바로 주문</button>
			</div>
			
        </div>
		
		<!-- Detail Description -->
        <hr>
		<div class="n-center" style="">
			<div class="n-product-desc">
				<%=product.getDescription() %>
			</div>
			<div class="n-product-nutrient">
				<b>영양성분</b> (1일 영양소 기준치에 대한 비율) <b>테스트 데이터 입니다.</b>
				<div class="table-responsive">
					<table class="table table-striped n-border">
						<thead>
							<tr>
								<th>1회제공량(g)</th>
								<th>칼로리(kcal)</th>
								<th>나트륨(mg)</th>
								<th>당류(g)</th>
								<th>포화지방(g)</th>
								<th>단백질(g)</th>
								<th>세트중량</th>
								<th>세트칼로리</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">247</th>
								<td>572</td>
								<td>911(46)</td>
								<td>2</td>
								<td>7(47)</td>
								<td>38(69)</td>
								<td>647</td>
								<td>1022</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
            <div class="" style="margin-top:32px">
            <%if(recommend != null) { %>
                <h2 class="n-font landing-heading text-xs-center">추천상품</h2>
                <%
                for(ProductBean bean : recommend) {
                %>
                <a href="./product.do?idx=<%=bean.getIdx() %>" class="valign-middle n-noborder">
                    <img src="<%=bean.getImgpath() %>" alt="<%=bean.getName() %>" class="n-product-recommand n-card" />
                </a>
                <%}%>
            <%}%>    
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
	var curProduct = <%=curProduct%>;
	
	$('#header-home').hide();
	$('#header-back').show();
	$('#header-center').show();
	$('#header-back').prop('href', './restaurant.do?idx='+curRestaurant);
	
	function goDirect() {
		location.href='./payment.do?direct=true&amount='+$('#ob-amount').val();
	}
	
	
	</script>
</body>
</html>