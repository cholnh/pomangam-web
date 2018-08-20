<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="com.mrporter.pomangam.target.vo.OrdertimeBean"%>
<%@page import="com.mrporter.pomangam.target.vo.DestinationBean"%>
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
</head>
<body style="background-color: #FFF">

	<%	
		String curTarget = (String) session.getAttribute("curTarget");
	
		@SuppressWarnings({"unchecked", "rawtypes"})
		List<DestinationBean> destination = (List) request.getAttribute("destination");
		@SuppressWarnings({"unchecked", "rawtypes"})
		List<OrdertimeBean> ordertime = (List) request.getAttribute("ordertime");
		@SuppressWarnings({"unchecked", "rawtypes"})
		List<CartBean> directList = (List) request.getAttribute("directList");

		List<CartBean> cartList = new ArrayList<>();
		Object obj = session.getAttribute("cartList");
		
		if(directList != null && !directList.isEmpty()) {
			cartList = directList;
		} else {
			if(obj != null) {
				cartList = (ArrayList<CartBean>) obj;
			}
		}
	%>

	<!-- Navbar -->
	<jsp:include page="../parts/header.jsp" /> 

	<!-- Modal -->	
	<div class="modal" id="modal" tabindex="-1" role="dialog" style="top:30%">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<span style="font-weight:bold;font-size:15px">주문 가격 상세</span>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body" style="padding:0px">
					
					<table class="table table-hover" style="text-align:center;font-size:11px;">
						<tbody>
							<tr>
								<th>품명</th>
								<th>가격</th> 
								<th>수량</th>
								<th>합계</th>
							</tr>
						<%
						int sumPrice = 0;
						int sumAmount = 0;
						if(cartList != null) {
						for(CartBean cart : cartList) {
							int idx_product = cart.getIdx_product();
							
							String json = new ProductCrudDAO().getBean(idx_product);
							List<ProductBean> list = new Gson().fromJson(
									json, 
									new TypeToken<List<ProductBean>>() {}.getType());
							ProductBean product = list.get(0);
							sumPrice += (product.getPrice() * cart.getAmount());
							sumAmount += cart.getAmount();
							int totalPrice = product.getPrice()*cart.getAmount();
						%>
							<tr>
								<th>
									<%=product.getName() %>
								</th>
								<th>
									<% out.print(Number.numberWithCommas(product.getPrice())); %>원
								</th>
								<th>
									<% out.print(Number.numberWithCommas(cart.getAmount())); %>개
								</th>
								<th>
									<b><% out.print(Number.numberWithCommas(totalPrice)); %>원</b>
								</th>
							</tr>
						<%}} %>


						</tbody>
					</table>
					<div style="text-align:center">
						<h3>합계 : <span><% out.print(Number.numberWithCommas(sumPrice)); %></span>원</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal2 -->	
	<div class="modal" id="modal2" tabindex="-1" role="dialog" style="top:30%">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<span style="font-weight:bold;font-size:15px">배달 가격 상세</span>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body" style="padding:0px">
					
					<table class="table table-hover" style="text-align:center;font-size:11px;">
						<tbody>
							<tr>
								<th>종류</th>
								<th>가격</th> 
								<th>수량</th>
								<th>합계</th>
							</tr>
							<tr>
								<th>
									기본료
								</th>
								<th>
									-
								</th>
								<th>
									-
								</th>
								<th>
									2,000원
								</th>
							</tr>
							<tr>
								<%
									int tamount = sumAmount>1?sumAmount-1:0;
									int tmp = tamount*500;
									int tprice = tmp > 2000 ? 2000 : tmp;
									int total = tprice + 2000;
								%>
								<th>
									메뉴추가
								</th>
								<th>
								<%	if(tamount>0) { %>
									500원
								<%	} else {%>
									-
								<%	} %>
								</th>
								<th>
								<%	if(tamount>0) { %>
									<%=tamount %>개
								<%	} else {%>
									-
								<%	} %>
								</th>
								<th>
									<% out.print(Number.numberWithCommas(tprice)); %>원
								</th>
							</tr>
							
						</tbody>
					</table>
					<div style="text-align:center;margin-bottom:12px">
						<h3>합계 : <span><% out.print(Number.numberWithCommas(total)); %></span>원</h3>
						<span style="color:gray">※ 배달료는 최대 4,000원까지 만 부과됩니다.</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container center" style="margin-top:50px">
		<!-- Target Info -->
		<div class="n-center">
			<h3 class="n-font">결제정보</h3>
            <div class="n-payment-info">
            <div class="center n-border">
            	<table class="n-payment-table2">
            		<thead>
            		</thead>
            		<colgroup>
		        		<col style="width:150px">
		                <col style="width: 150px;">
		                <col style="width: 50px;">
	            	</colgroup>
            		<tbody>
            			<tr>
            				<td>
            					주문 금액 :
            				</td>
            				<td>
            					<% out.print(Number.numberWithCommas(sumPrice)); %>원
            				</td>
            				<td>
            					<button class="btn btn-primary" data-toggle="modal" data-target="#modal"
            						style="font-size:8px!important;padding:2px;margin-left:12px;margin-bottom:4px">상세</button>
            				</td>
            			</tr>
            			<tr>
            				<td>
            					배달 금액 :
            				</td>
            				<td>
            					<% out.print(Number.numberWithCommas(total)); %>원
            				</td>
            				<td>
            					<button class="btn btn-primary" data-toggle="modal" data-target="#modal2"
            						style="font-size:8px!important;padding:2px;margin-left:12px;margin-bottom:4px">상세</button>
            				</td>
            			</tr>
            			<!-- 
            			<tr>
            				<td>
            					할인 쿠폰 :
            				</td>
            				<td colspan=2>
            					<select class="form-control m-b-2 n-payment-select">
		                            <option>8월 할인 쿠폰</option>
		                            <option>8월 할인 쿠폰</option>
		                            <option>8월 할인 쿠폰</option>
		                        </select>
            				</td>
            			</tr>
            			 -->
            			<tr>
            				<td colspan=3><hr></td>
            			</tr>
            			<tr>
            				<td>
            					<b>최종 금액 :</b>
            				</td>
            				<td >
            					<% 
            						int finalPrice2 = sumPrice + total;
            						String finalPrice = Number.numberWithCommas(sumPrice + total); %>
            					<b><%=finalPrice %>원</b>
            				</td>
            			</tr>
            		</tbody>
            	</table>
            	</div>
            </div>
		</div>
		
		<!-- Detail Description -->
        <hr class="n-payment-hr">
        <div class="n-center" style="margin-top:64px">
            <h3 class="n-font">배달정보</h3>
            <div class="center">
	            <table class="n-payment-table">
	            	<thead>
	            	</thead>
	            	<colgroup>
		        		<col style="width:100px">
		                <col style="width:150px;">
	            	</colgroup>
	            	<tbody>
	            		<tr>
		            		<td>
		            			<i class="fa fa-asterisk" style="color:#eb613e"></i> 받는 시간
		            		</td>
		            		<td>
		            			<input class="datepicker" 
		            				data-date-format="yyyy-mm-dd" 
		            				data-date-start-date="0d"
		            				data-date-end-date="+7d"
		            				>
		            			<select class="form-control n-payment-select" style="width:150px">
		            				<option>
		            					오전 11:00
		            				</option>
			                    </select>
		            		</td>
	            		</tr>
	            		<tr>
		            		<td>
		            			<i class="fa fa-asterisk" style="color:#eb613e"></i> 받는 위치
		            		</td>
		            		<td>
		            			<select class="form-control n-payment-select" style="width:150px">
			                        <option>학생회관 앞</option>
			                    </select>
		            		</td>
	            		</tr>
	            		<tr>
		            		<td>
		            			<i class="fa fa-asterisk" style="color:#eb613e"></i> 결제 수단
		            		</td>
		            		<td>
		            			<select class="form-control n-payment-select" style="width:150px">
			                        <option>카카오페이</option>
			                        <option>네이버페이</option>
			                        <option>카드결제</option>
			                        <option>계좌이체</option>
			                        <option>핸드폰결제</option>
			                        <option>무통장입금</option>
			                    </select>
		            		</td>
	            		</tr>
	            	</tbody>
	            </table>
	            <div class="center">
	            	<label class="custom-control custom-checkbox" style="width:150px;padding:0px">
	                    <input type="checkbox" class="custom-control-input" unchecked="">
	                    <span class="custom-control-indicator"></span>현금영수증 신청
	                </label>
                </div>
            </div>
		</div>
		
        <hr class="n-payment-hr">
		<div class="n-target-mobilebtn n-on-mobile">
			<button class="btn btn-primary" onclick="pay()"
			style="width:100%;height:100%;font-size:20px;font-weight:bold">
				<%=finalPrice %>원 결제하기
			</button>
		</div>
        <div class="n-center n-on-pc" style="margin-bottom: 64px; margin-top:32px">
            <button class="btn btn-primary" onclick="pay()"
            style="width:40%;font-size:20px;font-weight:bold">
            	<%=finalPrice %>원 결제하기
            </button>
        </div>
	</div>


	<!-- jQuery -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<!-- Core scripts -->
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/pixeladmin.min.js"></script>
	
	<script src="resources/js/bootstrap-datepicker.js"></script>
	<script src="resources/js/bootstrap-datepicker.kr.min.js"></script>
	
	<script>
	var curTarget = <%=curTarget%>;
	var cartList = <%=new Gson().toJson(cartList)%>;
	
	$('#header-home').hide();
	$('#header-back').show();
	$('#header-back').prop('href', './target.do?idx='+curTarget);
	
	$('#ob-mobileCartBtn').hide();
	
	function  pay() {
		var idxList = [];
		cartList.forEach(function(cart) {
			ajax('./payment/insert.do', 
					{
						idx_target : cart.idx_target,
						idx_restaurant : cart.idx_restaurant,
						idx_product : cart.idx_product,
						amount : cart.amount
					},
					false,
					function(status) {
						if (status.code / 100 == 2) {
							idxList.push(parseInt(status.message));
						} else {
							alert(status.message);
						}
					},
					function() {
						alert('네트워크 오류');
					}
			);
		});
		ajax('./payment/insertindex.do', 
				{
					idxes_payment : idxList.toString()
				},
				false,
				function(status) {
					if (status.code / 100 == 2) {
						check();
					} else {
						alert(status.message);
					}
				},
				function() {
					alert('네트워크 오류');
				}
		);
	}
	
	
	function check() {
		ajax('./payment/check.do', 
				{
					PG_price : <%=finalPrice2 %>
				},
				true,
				function(status) {
					if (status.code / 100 == 2) {
						location.href='./paysuccess.do';
					} else {
						location.href='./payerror.do';
					}
				},
				function() {
					alert('네트워크 오류');
				}
		);
	}
	
	$('.datepicker').datepicker({
        autoclose : true,
		format: 'yyyy-mm-dd',
		language : 'kr',
		todayHighlight : true
	});
	$('.datepicker').datepicker().on('changeDate', function(e) {
    	console.log(e);
    });
	
	$('.datepicker').datepicker('update', new Date());
	</script>

</body>
</html>
    