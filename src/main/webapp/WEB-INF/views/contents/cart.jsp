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
<!DOCTYPE html>

<html>
<head>
	<link href="resources/img/favicon.ico" rel="shortcut icon">
</head>
<body style="background-color: #FFF;">

	<%	
		String curTarget = (String) session.getAttribute("curTarget");
	
		List<CartBean> cartList = new ArrayList<>();
		Object obj = session.getAttribute("cartList");
		if(obj != null) {
			cartList = (ArrayList<CartBean>) obj;
		}
	%>
	
	<!-- Navbar -->
	<jsp:include page="../parts/header.jsp" /> 

	<div class="container center" style="margin-top:50px;padding:0px">
		<!-- Target Info -->
        
		<div class="n-center">
			<div class="n-center n-padding-32 n-margin-bottom">
				<a style="text-decoration:none; !important">
					<span class="n-xlarge n-bottombar" style="padding:5px"><span style="color:black">장바구니</span></span>
				</a>
			</div>
            <div class="center n-border" style="padding:0px">
            	<%
				if(cartList != null && !cartList.isEmpty()) {
				%>
				<br>
				<span style="font-size:15px;font-weight:bold;">
					배달 <span class="ob-time-max"></span>도착 
				</span>
            	<div style="text-align:right; margin-right:12px">
					<button class="btn btn-secondary n-small" onclick="removeAllCartProduct()">전체삭제</button>
				</div>
				
				<%} %>
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
							
							if(cartList == null || cartList.isEmpty()) {
							%>	
							<tr style="text-align:center">
								<td colspan=3>
									<h3 class="n-font">장바구니가 비어있습니다.</h3>
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
								<tr id="cart2-<%=cart.getIdx()%>">
									<td>
										<a href="./product.do?idx=<%=product.getIdx() %>" class="valign-middle n-noborder">
			                                <img src="<%=product.getImgpath() %>" alt="<%=product.getName() %>" class="n-cart-icon" />
										</a>
									</td>
									<td>
										<div class="row" style="margin-left:12px;margin-top:8px">
											<span><b><%=product.getName() %></b></span>
										</div>
										<%if(!nameList.isEmpty()) { %>
										<div class="row" style="margin-left:12px">
											<span>
												<%=nameList.toString() %>
											</span>
										</div>
										<%} %>
										<div class="row" style="margin-left:12px">
											<span>
												<b><% out.print(Number.numberWithCommas(product.getPrice()+sum_addPrice)); %>원</b>
											</span>
											<input class="c-amount" id="amount-<%=cart.getIdx() %>" 
												type="number" pattern="[0-9]*" inputmode="numeric" min=1 value=<%=cart.getAmount() %> 
												style="width:40px;margin-left:6px">개
										</div>
										<div class="row" style="margin-left:12px">
											<span style="font-size:13px!important" >
							            		(<span class="ob-time-<%=idx_product %>"></span> 도착)
							            	</span>
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
						<h3 class="n-font">총 <span id="ob-sumPrice2">0</span>원</h3>
					</div>
					<%} %>
				</div>
            </div>
		</div>
		
        <hr class="n-payment-hr">
        <%
		if(cartList != null && !cartList.isEmpty()) {
		%>
		<div class="n-target-mobilebtn n-on-mobile">
			<button class="btn btn-primary" onclick="goPayment()"
			style="width:100%;height:100%;font-size:20px;font-weight:bold">
				주문하기
			</button>
		</div>
        <div class="n-center n-on-pc" style="margin-bottom: 64px; margin-top:32px">
            <button class="btn btn-primary" onclick="goPayment()"
            style="width:40%;font-size:20px;font-weight:bold">
            	주문하기
            </button>
        </div>
        <%} else {%>
        <div class="n-target-mobilebtn n-on-mobile">
			<button class="btn btn-primary" onclick="location.href='./'"
			style="width:100%;height:100%;font-size:20px;font-weight:bold">
				홈으로
			</button>
		</div>
        <div class="n-center n-on-pc" style="margin-bottom: 64px; margin-top:32px">
            <button class="btn btn-primary" onclick="location.href='./'"
            style="width:40%;font-size:20px;font-weight:bold">
            	홈으로
            </button>
        </div>
        <%} %>
	</div>

	<!-- Footer -->
	<%@ include file="../parts/footer.jsp" %>
	
	<!-- Core scripts -->
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/pixeladmin.min.js"></script>
	
	<script>
	var curTarget = <%=curTarget%>;
	
	$('#header-home').hide();
	$('#header-back').show();
	$('#header-center').show();
	$('#header-back').prop('href', (curTarget?'./target.do?idx='+curTarget:'./'));
	
	$('#ob-mobileCartBtn').hide();
	$('#ob-sumPrice2').text(numberWithCommas(<%=sumPrice%>));
	
	
	$('.c-amount').change(function() {
		var $this = $(this);
		var amount = $this[0].value;
		if(isNaN(parseInt(amount))) {
			alert('숫자만 입력가능합니다.');
			return;
		}
		
		var rem = 0;
		var cartAmount = 0;
		var amounts = $('.c-amount');
		for(var i=0; i<amounts.length; i++) {
			cartAmount += parseInt(amounts[i].value);
			if($this[0].id != amounts[i].id) {
				rem += parseInt(amounts[i].value);
			}
		}
		
		if(cartAmount > 5) {
			alert('죄송합니다...\n한번에 주문가능한 총 메뉴 개수는 최대 5개 입니다.\n\n');
			$this.val(5-rem);
			return;
		}
		
		if(amount > 15) {
			alert('15개 이상 단체주문은 010-6478-4899로 문의주세요.');
			$this.val(15);
			amount = 15;
		} 
		
		if($this.length > 0) {
			var idx = $this[0].id.split('amount-')[1];
			console.log(idx + ' ' + amount);
			updateCartProduct(idx, amount);
		}
	});
	</script>

</body>
</html>
    