<%@page import="java.util.ArrayList"%>
<%@page import="com.mrporter.pomangam.cart.vo.CartBean"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>	
</head>
<body style="background-color: #FFF">
	<%
		String curTarget = (String) session.getAttribute("curTarget");
		String curRestaurant = (String) session.getAttribute("curRestaurant");
		String curProduct = (String) request.getParameter("idx");
	%>
	
	<!-- Navbar -->
	<jsp:include page="../parts/header.jsp" /> 

	<div class="container center" style="margin-top:50px">
		<!-- Target Info -->
        <div class="n-center" style="margin-top:16px">
            <a href="#" class="valign-middle n-noborder">
                <img src="resources/img/product/20.jpg" alt="엽기떡볶이" class="n-product-icon n-card" />
            </a>
            <div style="margin:12px">
                <span style="font-size: 20px; font-weight: bold;">화이트 갈릭버거</span>
            </div>
            <a class="btn btn-primary " style="font-size:10px!important;padding:3px">57개 남음</a>
            <div style="margin-top:18px">
                
                <input id="ob-amount" type="number" style="width:40px" min=0 value=1> 개
                <span style="color: #f3753a; font-weight: bold; margin-left: 12px; font-size: 15px;">
                    6,000원
                </span>
            </div>
			<div class="n-margin">
				<button class="btn" onclick="insertCartProduct()"
				style="background-color: darkgray; color:white;font-size:20px;font-weight:bold">장바구니 담기</button>
				<button class="btn btn-primary" onclick="location.href='./payment.do?'"
				style="font-size:20px;font-weight:bold">바로 주문</button>
			</div>
			
        </div>
		
		<!-- Detail Description -->
        <hr>
		<div class="n-center" style="">
			<div class="n-product-desc">
				크림처럼 부드러운 화이트 갈릭 소스에<br>
				프리미엄 더블햄과 통가슴살 패티까지<br>
				하나에 다 담은 묵직한 버거!<br>
			</div>
			<div class="n-product-nutrient">
				<b>영양성분</b> (1일 영양소 기준치에 대한 비율)
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
                <h2 class="n-font landing-heading text-xs-center">추천상품</h2>
                <a href="#" class="valign-middle n-noborder">
                    <img src="resources/img/product/3.jpg" alt="엽기떡볶이" class="n-product-recommand n-card" />
                </a>
                 <a href="#" class="valign-middle n-noborder">
                    <img src="resources/img/product/5.jpg" alt="엽기떡볶이" class="n-product-recommand n-card" />
                </a>
                 <a href="#" class="valign-middle n-noborder">
                    <img src="resources/img/product/7.jpg" alt="엽기떡볶이" class="n-product-recommand n-card" />
                </a>
                 <a href="#" class="valign-middle n-noborder">
                    <img src="resources/img/product/12.jpg" alt="엽기떡볶이" class="n-product-recommand n-card" />
                </a>
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
	$('#header-back').prop('href', './restaurant.do?idx='+curRestaurant);
	
	</script>
</body>
</html>