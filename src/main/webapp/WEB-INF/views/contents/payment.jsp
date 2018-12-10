<%@page import="com.mrporter.pomangam.common.security.model.domain.User"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
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
<body style="background-color: #FFF">

	<%	
		String curTarget = (String) session.getAttribute("curTarget");
	
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
		
		String time_start = (String) request.getAttribute("time_start");
		String time_end = (String) request.getAttribute("time_end");
		
		String bank_name = (String) request.getAttribute("bank_name");
		String bank_account = (String) request.getAttribute("bank_account");
		String bank_username = (String) request.getAttribute("bank_username");
		
		String userjson = (String) request.getSession().getAttribute("user");
		User user = new Gson().fromJson(userjson, new TypeToken<User>() {}.getType());
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
						String products = "";
						int sumPrice = 0;
						if(cartList != null) {
						for(CartBean cart : cartList) {
							int idx_product = cart.getIdx_product();
							
							String json = new ProductCrudDAO().getBean(idx_product);
							List<ProductBean> list = new Gson().fromJson(
									json, 
									new TypeToken<List<ProductBean>>() {}.getType());
							ProductBean product = list.get(0);
							
							int totalPrice = product.getPrice()*cart.getAmount();
							
							products += idx_product+"-"+cart.getAmount()+"-"+cart.getIdx_restaurant()+",";
							
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
							<%
							int sum_addPrice = 0;
							String add = cart.getAdditional();
						
							if(add!=null && add.length()>0) {
								String[] parts = add.split(",");
								for(String part : parts) {
									//Integer idx_product_additional = Integer.parseInt(part.split("-")[0]);
									int amount = Integer.parseInt(part.split("-")[1]);
									if(amount<=0) continue;
									int addPrice = Integer.parseInt(part.split("-")[2]);
									String name = part.split("-")[3];
									sum_addPrice += (addPrice * amount);
									
									%>
										<tr>
											<th>
												(추가) <%=name %> 
											</th>
											<th>
												<% out.print(Number.numberWithCommas(addPrice)); %>원
											</th>
											<th>
												<% out.print(Number.numberWithCommas(amount*cart.getAmount())); %>개
											</th>
											<th>
												<b><% out.print(Number.numberWithCommas(addPrice * amount * cart.getAmount())); %>원</b>
											</th>
										</tr>
									<%
								}
							}
							sumPrice += ((product.getPrice()+sum_addPrice) * cart.getAmount());
							%>
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
                        <col style="width: 50px">
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
            						style="font-size:13px!important;padding:4px;margin-left:12px;margin-bottom:4px">상세</button>
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
            						String finalPrice = Number.numberWithCommas(sumPrice); %>
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
		            			<i class="fa fa-asterisk" style="color:#eb613e"></i> 받는 날짜
		            		</td>
		            		<td>
		            			<select class="form-control n-payment-select" style="width:150px" id="ob-date">
			                    </select>
		            		</td>
	            		</tr>
	            		<tr>
		            		<td>
		            			<i class="fa fa-asterisk" style="color:#eb613e"></i> 받는 시간
		            		</td>
		            		<td>
		            			<select class="form-control n-payment-select" style="width:150px" id="ob-time">
			                    </select>
		            		</td>
	            		</tr>
	            		<tr>
		            		<td>
		            			<i class="fa fa-asterisk" style="color:#eb613e"></i> 받는 위치
		            		</td>
		            		<td>
		            			<select id="ob-where" class="form-control n-payment-select" style="width:150px">
		            				<option>학생회관 뒤</option>
		            				<option>기숙사 식당 (도착시간 +10분)</option>
			                    </select>
		            		</td>
	            		</tr>
	            		<tr>
		            		<td>
		            			<i class="fa fa-asterisk" style="color:#eb613e"></i> 결제 수단
		            		</td>
		            		<td>
		            			<select class="form-control n-payment-select" style="width:150px">
		            				<option>계좌이체</option>
		            				<option disabled="true">카드결제 &nbsp;&nbsp;&nbsp;(준비중입니다ㅠㅠ)</option>
			                        <option disabled="true">카카오페이 (준비중입니다ㅠㅠ)</option>
			                        <option disabled="true">네이버페이 (준비중입니다ㅠㅠ)</option>
			                        <option disabled="true">핸드폰결제 (준비중입니다ㅠㅠ)</option>
			                        <option disabled="true">무통장입금 (준비중입니다ㅠㅠ)</option>
			                    </select>
		            		</td>
	            		</tr>
	            		<tr>
	            			<td colspan=2 style="text-align:right">
	            				<span><%=bank_name %> <%=bank_account %>(<%=bank_username %>)</span>
	            			</td>
	            		</tr>
	            		<%
	            		if(user == null) {%>
	            		<tr>
	            			<td colspan=2><hr></td>
	            		</tr>
	            		<tr>
		            		<td>
		            			<i class="fa fa-asterisk" style="color:#eb613e"></i> 이름
		            		</td>
		            		<td>
		            			<input class="form-control" type="text" id="guestname" required>
		            		</td>
	            		</tr>
	            		<tr>
		            		<td>
		            			<i class="fa fa-asterisk" style="color:#eb613e"></i> 핸드폰 번호
		            		</td>
		            		<td>
		            			<input class="form-control" type="tel" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}|[0-9]{11}"  id="phoneNumber" required>
		            		</td>
	            		</tr>
	            		<tr>
		            		<td>
		            			<i class="fa fa-asterisk" style="color:#eb613e"></i> 비밀번호 4자리
		            		</td>
		            		<td>
		            			<input class="form-control" type="password" id="password" required>
		            		</td>
	            		</tr>
	            		<%} %>
	            	</tbody>
	            </table>
	          
	            <div class="center">
	            	<label class="custom-control custom-checkbox" style="width:150px;padding:0px">
	                    <input id="cashReceipt" type="checkbox" class="custom-control-input" unchecked="">
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
	
	<!-- Core scripts -->
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/pixeladmin.min.js"></script>
	<!-- 
	<script src="resources/js/bootstrap-datepicker.js"></script>
	<script src="resources/js/bootstrap-datepicker.ko.min.js"></script>
	-->
	<script>
	var curTarget = <%=curTarget%>;
	var cartList = <%=new Gson().toJson(cartList)%>;
	
	$('#header-home').hide();
	$('#header-back').show();
	$('#header-center').show();
	$('#header-back').prop('href', './target.do?idx='+curTarget);
	
	$('#ob-mobileCartBtn').hide();
	changeTime();
	
	
	function  pay() {
		if(!$('#ob-time').val()) {
			$('#ob-time').focus();
			toast('포만감','받는 시간을 확인해 주세요.','warning');
			return;
		}
		if($('#phoneNumber').length>0) {
			if(!$('#guestname').val()) {
				$('#guestname').focus();
				toast('포만감','비회원은 성함 입력이 필수입니다.','warning');
				return;
			}
			if(!$('#phoneNumber').val()) {
				$('#phoneNumber').focus();
				toast('포만감','비회원은 핸드폰번호 입력이 필수입니다.','warning');
				return;
			}
			$('#phoneNumber').val($('#phoneNumber').val().replace(/-/g,''));
			if($('#phoneNumber').val().length != 11) {
				$('#phoneNumber').focus();
				toast('포만감','잘못된 핸드폰번호 형식 입니다.','warning');
				return;
			}
		}
		<%if(user==null){%>
		if(!confirm('입금자 성함 : ' + $('#guestname').val() + '\n' + '받는 위치 : ' + $('#ob-where').val() + '\n\n' + '계속하시겠습니까?' )) {
			return;
		}
		<%} else {%>
		if(!confirm('입금자 성함 : <%=user.getName()%> \n' + '받는 위치 : ' + $('#ob-where').val() + '\n\n' + '계속하시겠습니까?' )) {
			return;
		}
		<%}%>
		
		var idxList = []; 
		cartList.forEach(function(cart) {
			console.log(cart);
			ajax('./payment/insert.do', 
					{
						idx_target : cart.idx_target,
						idx_restaurant : cart.idx_restaurant,
						idx_product : cart.idx_product,
						amount : cart.amount,
						additional : cart.additional,
						requirement : cart.requirement
					},
					false,
					function(status) {
						if (status.code / 100 == 2) {
							idxList.push(parseInt(status.message));
						} else {
							toast('포만감',status.message,'warning');
						}
					},
					function() {
						toast('포만감','네트워크 오류','warning');
					}
			);
		});
		var cur = new Date();
		
		ajax('./payment/insertindex.do', 
				{
					<%if(user == null) {%>
					guestname : $('#guestname').val(),
					phonenumber : $('#phoneNumber').val(),
					<%}%>
					idxes_payment : idxList.toString(),
					idx_target : curTarget,
					receive_date : date.getDate() - cur.getDate(),
					receive_time : $('#ob-time').val(),
					password : $('#password').val(),
					cashreceipt : $("input:checkbox[id='cashReceipt']").is(":checked") ? 'true' : 'false',
					where : $('#ob-where').val()
				},
				false,
				function(status) {
					if (status.code / 100 == 2) {
						checkPG();
					} else {
						toast('포만감',status.message,'warning');
					}
				},
				function() {
					toast('포만감','네트워크 오류','warning');
				}
		);
	}
	
	function checkPG() {
		ajax('./payment/checkpg.do', 
				{
					PG_price : <%=sumPrice %>
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
					toast('포만감','네트워크 오류','warning');
				}
		);
	}
	
	var time_start = '<%=time_start %>'.split(':');
	var time_end = '<%=time_end %>'.split(':');
	var date;
	function changeTime() {
		var products = '<%=products %>';
		if(products.length <= 0) return;
		ajax('./product/getmaxtime.do', 
				{
					products : products
				},
				true,
				function(millis) {
					var d = new Date(millis);
					date = d;
					$('#ob-date').append($('<option>', {
					    text: d.getFullYear()+'년 '+(d.getMonth()+1)+'월 '+d.getDate()+'일',
					    selected : true
					}));
					
					for(var i=time_start[0]+1; i<d.getHours(); i++) {
						$('#ob-time').append($('<option>', {
						    text: i+'시 ', //+(time_start[1]>0?time_start[1]+'분':''),
						    disabled : true
						}));
					}
					for(var i=d.getHours(); i<=parseInt(time_end[0])+1; i++) {
						if(i==14 || i==15 || i==16) {
							continue;
						}
						var tf = i==d.getHours();
						$('#ob-time').append($('<option>', {
						    text: i+'시 ', //+(time_end[1]>0?time_end[1]+'분':''),
						    selected : tf
						}));
					}
					
				},
				function() {
					toast('포만감','네트워크 오류','warning');
				}
		);
	}
	
	/*
	changeTime();
	$('.datepicker').datepicker({
        autoclose : true,
		format: 'yyyy-mm-dd',
		language : 'ko',
		todayHighlight : true
	});
	$('.datepicker').datepicker().on('changeDate', function(e) {
    	var dates = new Date(e.format('yyyy-mm-dd'));
    	var cur = new Date();
    	$('#ob-time').text('');
    	if(cur.getDate() == dates.getDate()) {
    		changeTime();
    	} else {
    		ordertime.forEach(function(e) {
    			$('#ob-time').append($('<option>', {
    			    text: e.text
    			}));
    		});
    		
    	} 
    });
	$('.datepicker').datepicker('update', new Date());
	
	function changeTime() {
		var cur = new Date();
		var tf = true;
		for(var i=0; i<=ordertime.length; i++) {
			if(tf && i==ordertime.length) {
				$('#ob-time').append($('<option>', {
				    text: '이용 가능한 시간이 없습니다.',
				    disabled : true
				}));
				return;
			}
			if(ordertime[i]) {
				var o = new Date();
    			o.setHours(ordertime[i].hour);
    			o.setMinutes(ordertime[i].minute);
    			o.setSeconds(0);
    			if(cur > o) {
    				continue;
    			} else {
    				tf = false;
    				$('#ob-time').append($('<option>', {
    				    text: ordertime[i].text
    				}));
    			}
			}
		}
	}
	*/
	
	</script>

</body>
</html>
    