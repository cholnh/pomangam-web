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
<!DOCTYPE html>

<html>
<head>
</head>
<body style="background-color: #FFF">

	<%	
		List<CartBean> cartList = new ArrayList<>();
		Object obj = session.getAttribute("cartList");
		
		if(obj != null) {
			cartList = (ArrayList<CartBean>) obj;
		}
	%>
	
	<!-- Navbar -->
	<jsp:include page="../parts/header.jsp" /> 

	<div class="container center" style="margin-top:50px">
		<!-- Target Info -->
        
		<div class="n-center">
			<div class="n-center n-padding-32 n-margin-bottom">
				<a class="n-hover-opacity" href="" style="text-decoration:none; !important">
					<span class="n-xlarge n-bottombar" style="padding:5px"><span style="color:black">장바구니</span></span>
				</a>
			</div>
            <div class="center n-border">
            	<div style="text-align:right; margin-right:12px">
					<button class="btn btn-secondary n-small" onclick="removeAllCartProduct()">전체삭제</button>
				</div>
				<div style="text-align: left;margin:12px">
					<table id="cartTable2" class="table table-hover">
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
							
							if(cartList != null) {
							for(CartBean cart : cartList) {
								int idx_product = cart.getIdx_product();
								
								String json = new ProductCrudDAO().getBean(idx_product);
								List<ProductBean> list = new Gson().fromJson(
										json, 
										new TypeToken<List<ProductBean>>() {}.getType());
								ProductBean product = list.get(0);
								sumPrice += (product.getPrice() * cart.getAmount());
								
								int totalPrice = product.getPrice()*cart.getAmount();
							%>
								<tr id="cart2-<%=cart.getIdx()%>">
									<td>
										<a href="./product.do?idx=<%=product.getIdx() %>" class="valign-middle n-noborder">
			                                <img src="<%=product.getImgpath() %>" alt="<%=product.getName() %>" class="n-cart-icon" />
										</a>
									</td>
									<td>
										<div class="row" style="margin-left:12px">
											<span><b><%=product.getName() %></b></span>
										</div>
										<div class="row" style="margin-left:12px">
											<b><%=product.getPrice() %>원</b>
											<input type="number" min=1 value=<%=cart.getAmount() %> style="width:40px;margin-left:6px">
										</div>
									</td>
									<td>
										<i onclick="removeCartProduct(<%=cart.getIdx()%>, <%=totalPrice %>)" 
													class="fa fa-remove fa-2x"></i>
									</td>
								</tr>
							<%}}%>
						</tbody>
					</table>
					
					<div class="n-center" style="margin-top:32px;margin-bottom:32px">
						<h3 class="n-font">총 <span id="ob-sumPrice2">0</span>원</h3>
					</div>
				</div>
            </div>
		</div>
		
        <hr class="n-payment-hr">
		<div class="n-target-mobilebtn n-on-mobile">
			<button class="btn btn-primary" onclick="location.href='./payment.do'"
			style="width:100%;height:100%;font-size:20px;font-weight:bold">
				주문하기
			</button>
		</div>
        <div class="n-center n-on-pc" style="margin-bottom: 64px; margin-top:32px">
            <button class="btn btn-primary" onclick="location.href='./payment.do'"
            style="width:40%;font-size:20px;font-weight:bold">
            	주문하기
            </button>
        </div>
	</div>


	<!-- jQuery -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<!-- Core scripts -->
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/pixeladmin.min.js"></script>
	
	<script>
	$('#header-home').hide();
	$('#header-back').show();
	$('#header-back').prop('href', document.referrer);
	
	$('#ob-mobileCartBtn').hide();
	$('#ob-sumPrice2').text(numberWithCommas(<%=sumPrice%>));
	
	</script>

</body>
</html>
    