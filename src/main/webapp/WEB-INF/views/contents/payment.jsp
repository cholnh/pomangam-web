<%@page import="com.mrporter.pomangam.payment.vo.CouponBean"%>
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
<%@page import="com.mrporter.pomangam.product.vo.OrderTimeBean"%>
<%@page import="com.mrporter.pomangam.target.vo.TargetDetailBean"%>
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
		
		@SuppressWarnings({"unchecked", "rawtypes"})
		List<OrderTimeBean> orderTimeList = (List) request.getAttribute("orderTimeList");
		
		List<CartBean> cartList = new ArrayList<>();
		Object obj = session.getAttribute("cartList");
		
		@SuppressWarnings({"unchecked", "rawtypes"})
		List<TargetDetailBean> detailList = (List) request.getAttribute("detailList");
		
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
		
		@SuppressWarnings({"unchecked", "rawtypes"})
		List<CouponBean> cplist = (List) request.getAttribute("user_cp");
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
            			<tr>
            				<td colspan=3><hr></td>
            			</tr>
            			<%if(user != null && cplist!=null && !cplist.isEmpty()) {%>
            			<tr>
            				<td>
            					할인 쿠폰 :
            				</td>
            				<td colspan=2>
            					<select class="form-control m-b-2 n-payment-select" id="cpselect">
            						<option value="non">선택 안 함</option>
            						<%for(CouponBean cp : cplist) {%>
            						
            							<option value="<%=cp.getCpno()%>"><%=cp.getCpname() %></option>
            						<%}%>
		                        </select>
            				</td>
            			</tr>
            			<%} %>
            			<tr>
            				<td>
            					쿠폰 입력 :
            				</td>
            				<td>
            					<input class="form-control" type="text" id="cpinput" required>
            				</td>
            				<td>
            					<button class="btn btn-primary" id="cpbtn"
            						style="font-size:13px!important;padding:4px;margin-left:12px;margin-bottom:4px">적용</button>
            				</td>
            			</tr>
            			
            			<tr>
            				<td>
            				</td>
            				<td>
            					<span style="color:grey" id="cpinfo"></span>
            				</td>
            				<td>
            					<button class="btn btn-primary" id="cpcancle"
            						style="font-size:13px!important;padding:4px;margin-left:12px;margin-bottom:4px; display:none">취소</button>
            				</td>
            			</tr>
            			
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
            					<b><span class="totalp1"><%=finalPrice %></span>원</b>
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
		            			<i class="fa fa-asterisk" style="color:#FF866F"></i> 받는 날짜
		            		</td>
		            		<td>
		            			<select class="form-control n-payment-select" style="width:150px" id="ob-date">
			                    </select>
		            		</td>
	            		</tr>
	            		<tr>
		            		<td>
		            			<i class="fa fa-asterisk" style="color:#FF866F"></i> 받는 시간
		            		</td>
		            		<td>
		            			<select class="form-control n-payment-select" style="width:150px" id="ob-time">
			                    </select>
		            		</td>
	            		</tr>
	            		<tr>
		            		<td>
		            			<i class="fa fa-asterisk" style="color:#FF866F"></i> 받는 위치
		            		</td>
		            		<td>
		            			<select id="ob-where" class="form-control n-payment-select" style="width:150px">
		            				<%for(TargetDetailBean bean : detailList) { %>
		            					<option value="<%=bean.getIdx()%>"><%=bean.getName() %></option>
		            				<%} %>
			                    </select>
		            		</td>
		            		<td>
		            			<span id="increasingTxt" style="color:red;margin-left:10px"></span>
		            		</td>
	            		</tr>
	            		<tr>
		            		<td>
		            			<i class="fa fa-asterisk" style="color:#FF866F"></i> 결제 수단
		            		</td>
		            		<td>
		            			<select class="form-control n-payment-select" style="width:150px">
		            				<option>계좌이체</option>
		            				<option disabled="true">카드결제 &nbsp;&nbsp;&nbsp;(준비중)</option>
			                        <option disabled="true">카카오페이 (준비중)</option>
			                        <option disabled="true">네이버페이 (준비중)</option>
			                        <option disabled="true">핸드폰결제 (준비중)</option>
			                        <option disabled="true">무통장입금 (준비중)</option>
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
		            			<i class="fa fa-asterisk" style="color:#FF866F"></i> 이름
		            		</td>
		            		<td>
		            			<input class="form-control" type="text" id="guestname" required>
		            		</td>
	            		</tr>
	            		<tr>
		            		<td>
		            			<i class="fa fa-asterisk" style="color:#FF866F"></i> 핸드폰 번호
		            		</td>
		            		<td>
		            			<input class="form-control" type="tel" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}|[0-9]{11}"  id="phoneNumber" required>
		            		</td>
	            		</tr>
	            		<tr>
		            		<td>
		            			<i class="fa fa-asterisk" style="color:#FF866F"></i> 비밀번호 4자리
		            		</td>
		            		<td>
		            			<input class="form-control" type="tel" id="password" required>
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
        
        <div class="center agree-center" style="margin-bottom:64px;">
	        <label class="custom-control custom-checkbox" style="">
	           <input type="checkbox" id="agree" class="custom-control-input" checked="true" required>
	           <span class="custom-control-indicator"></span>
	           <span style="font-size:15px;font-weight:bold">약관 및 개인정보처리방침 동의 
	           <a onclick="$('#terms').show();$('#privacy').show();"><b style="font-size:11px;font-weight:bold">보기▽</b></a>
	           </span>
	        </label>
	        <a id="terms" style="display:none;" href="javascript:window.open('./terms.do', '이용약관 새창', 'width=1000, height=700, toolbar=no, menubar=no, resizable=yes')"><b>▶ 이용약관 확인</b></a><br>
	        <a id="privacy" style="display:none;" href="javascript:window.open('./privacy.do', '개인정보처리방침 새창', 'width=1000, height=700, toolbar=no, menubar=no, resizable=yes')"><b>▶ 개인정보처리방침 확인</b></a>
        </div>
        
		<div class="n-target-mobilebtn n-on-mobile">
			<button class="btn btn-primary" onclick="pay()" name="submitBtn"
			style="width:100%;height:100%;font-size:20px;font-weight:bold">
				<span class="totalp1"><%=finalPrice %></span>원 결제하기
			</button>
		</div>
        <div class="n-center n-on-pc" style="margin-bottom: 64px; margin-top:32px">
            <button class="btn btn-primary" onclick="pay()" name="submitBtn"
            style="width:40%;font-size:20px;font-weight:bold">
            	<span class="totalp1"><%=finalPrice %></span>원 결제하기
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
	var orderTimeList = <%=new Gson().toJson(orderTimeList)%>;
	var detailList = <%=new Gson().toJson(detailList)%>;
	
	$('#header-home').hide();
	$('#header-back').show();
	$('#header-center').show();
	$('#header-back').prop('href', './target.do?idx='+curTarget);
	
	$('#ob-mobileCartBtn').hide();
	changeTime();
	
	$('#ob-where').change(function() {
		var selectedIdx = $('#ob-where option:selected').val();
		for(var i=0; i<detailList.length; i++) {
			var detail = detailList[i];
			if(detail.idx == selectedIdx) {
				var txt;
				var min = detail.increasing_time.split(' ')[0].split(':')[1];
				txt = (min==0?"":"  +"+min+"분 추가");
			}
		}
		$('#increasingTxt').text(txt);
	});

	
	function LoadingWithMask() {
	    //화면의 높이와 너비
	    var maskHeight = $(document).height();
	    var maskWidth  = window.document.body.clientWidth;
	     
	    //화면에 출력할 마스크를 설정
	    var mask       = "<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'></div>";
	    var loadingImg = '';
	      
	    loadingImg += "<div id='loadingImg'>";
	    loadingImg += " <img src='resources/img/LoadingImg.gif' style='display: block; margin: 0px auto;  '/>";
	    loadingImg += "</div>"; 
	  
	    //화면에 레이어 추가
	    $('body')
	        .append(mask);
	       $('body')
	        .append(loadingImg);
	        
	    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채움
	    $('#mask').css({
	            'width' : maskWidth
	            , 'height': maskHeight
	            , 'opacity' : '0.3'
	    });
	    
	    $('#loadingImg').css({
	    	'position' : 'absolute',
	    
	       'top' : (($(window).height()-200)/2+$(window).scrollTop())+'px',
	       'left' : (($(window).width()-200)/2+$(window).scrollLeft())+'px',
	    
	       'opacity' : '1'
	    });

	  
	    //마스크 표시
	    $('#mask').show();  
	  
	    //로딩중 이미지 표시
	    $('#loadingImg').show();
	}

	function closeLoadingWithMask() {
	    $('#mask, #loadingImg').hide();
	    $('#mask, #loadingImg').remove(); 
	}
	
	function pay() {
		if(!$('input:checkbox[id="agree"]').is(":checked")) {
			toast('포만감','포만감 이용약관과 개인정보처리방침에 대한 안내에 동의해주세요.','warning');
			return;
		}
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
		var selected = $('#ob-where option:selected');
		<%if(user==null){%>
		if(!confirm('입금자 성함 : ' + $('#guestname').val() + '\n' + '받는 위치 : ' + selected.text() + '\n\n' + '계속하시겠습니까?' )) {
			return;
		}
		<%} else {%>
		if(!confirm('입금자 성함 : <%=user.getName()%> \n' + '받는 위치 : ' + selected.text() + '\n\n' + '계속하시겠습니까?' )) {
			return;
		}
		<%}%>
		
		LoadingWithMask();
		$('button[name=submitBtn]').html('결제 진행 중...');
		$('button[name=submitBtn]').attr('disabled', true);
		
		var idxList = []; 
		cartList.forEach(function(cart) {
			//console.log(cart);
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
							closeLoadingWithMask();
							$('button[name=submitBtn]').html('다시 시도');
							$('button[name=submitBtn]').attr('disabled', false);
							toast('포만감',status.message,'warning');
						}
					},
					function() {
						closeLoadingWithMask();
						$('button[name=submitBtn]').html('다시 시도');
						$('button[name=submitBtn]').attr('disabled', false);
						toast('포만감','네트워크 오류','warning');
					}
			);
		});
		var cur = new Date();
		var cpno = '';
		if($('#cpselect').length<=0) {
			cpno = $('#cpinput').val();
		} else {
			if($('#cpselect').val() == 'non') {
				cpno = $('#cpinput').val();
			} else {
				cpno = $('#cpselect').val();
			}
		}
		//console.log(cpno);
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
					where : $('#ob-where').val(),
					cpno : cpno
				},
				false,
				function(status) {
					if (status.code / 100 == 2) {
						checkPG();
					} else {
						closeLoadingWithMask();
						$('button[name=submitBtn]').html('다시 시도');
						$('button[name=submitBtn]').attr('disabled', false);
						toast('포만감',status.message,'warning');
					}
				},
				function() {
					closeLoadingWithMask();
					$('button[name=submitBtn]').html('다시 시도');
					$('button[name=submitBtn]').attr('disabled', false);
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
					closeLoadingWithMask();
					$('button[name=submitBtn]').html('다시 시도');
					$('button[name=submitBtn]').attr('disabled', false);
					toast('포만감','네트워크 오류','warning');
				}
		);
	}
	
	function twoDigits(input) {
		if(input.toString().length < 2) {
			return '0' + input;
		}
		return input;
	}
	
	var time_start = '<%=time_start %>'.split(':');
	var time_end = '<%=time_end %>'.split(':');
	var date;
	function changeTime() {
		//console.log(orderTimeList);
		var products = '<%=products %>';
		if(products.length <= 0) return;
		ajax('./product/getmaxtime.do', 
				{
					products : products
				},
				true,
				function(millis) {
					if(millis==-1) {
						alert('getmaxtime 오류');
						return;
					}
					var d = new Date(millis);
					d.setMilliseconds(0);
					date = d;
					$('#ob-date').append($('<option>', {
					    text: d.getFullYear()+'년 '+(d.getMonth()+1)+'월 '+d.getDate()+'일',
					    selected : true
					}));
					
					for(var i=0; i<orderTimeList.length; i++) {
						var orderTime = orderTimeList[i];
						var text = orderTime.arrivalTime.split(" ")[0].split(":");
						var arrivalTime = new Date();
						arrivalTime.setHours(text[0]);
						arrivalTime.setMinutes(text[1]);
						arrivalTime.setSeconds(text[2]);
						arrivalTime.setMilliseconds(0);
						
						var t = orderTime.arrivalTime.split(" ")[1] + ' ' + arrivalTime.getHours()+'시 '+(arrivalTime.getMinutes()>0?arrivalTime.getMinutes()+'분':'');
						var value = twoDigits(((orderTime.arrivalTime.split(" ")[1] == '오후' ? 12 : 0) + arrivalTime.getHours())) + ':' + twoDigits(arrivalTime.getMinutes()) + ':00';
							
						if(d < arrivalTime) {
							$('#ob-time').append($('<option>', {
								value: value,
							    text: t,
							    disabled : true
							}));
						} else if(d.getHours() == arrivalTime.getHours()) {
							$('#ob-time').append($('<option>', {
								value: value,
							    text: t,
							    selected : true
							}));
						} else {
							$('#ob-time').append($('<option>', {
								value: value,
							    text: t,
							    selected : false
							}));
						}
					}
					
					
					/*
					if(curWeek==0 || curWeek==6) {
						
						for(var i=time_start[0]+1; i<d.getHours(); i++) {
							$('#ob-time').append($('<option>', {
							    text: i+'시 ', //+(time_start[1]>0?time_start[1]+'분':''),
							    disabled : true
							}));
						}
						for(var i=d.getHours(); i<=parseInt(time_end[0])+1; i++) {
							if(i==15 || i==16) {
								continue;
							}
							var tf = i==d.getHours();
							$('#ob-time').append($('<option>', {
							    text: i+'시 ', //+(time_end[1]>0?time_end[1]+'분':''),
							    selected : tf
							}));
						}
							
					} else {
						// 평일
						
						for(var i=time_start[0]+1; i<d.getHours(); i++) {
							$('#ob-time').append($('<option>', {
							    text: i+'시 ', //+(time_start[1]>0?time_start[1]+'분':''),
							    disabled : true
							}));
						}
						for(var i=d.getHours(); i<=parseInt(time_end[0])+1; i++) {
							if(i==15 || i==16) {
								continue;
							}
							var tf = i==d.getHours();
							$('#ob-time').append($('<option>', {
							    text: i+'시 ', //+(time_end[1]>0?time_end[1]+'분':''),
							    selected : tf
							}));
						}
					}
					*/
						
					
					
				},
				function() {
					toast('포만감','네트워크 오류','warning');
				}
		);
	}
	
	$('#cpselect').change(function(e) {
		var cpno = $('#cpselect').val();
	
		if(!cpno) {
			return;
		}
		if(cpno && cpno == 'non') {
			$('#cpinfo').text('');
			$('.totalp1').text(numberWithCommas(<%=sumPrice%>));
			$('#cpcancle').hide();
			return;
		}
		
		ajax('./coupon/findbycpno.do', 
				{
					cpno : cpno
				},
				true,
				function(data) {
					if(data) {
						var cp_prc = data.discount_prc;
					
						if(data.cpname) {
							$('#cpinfo').text(data.cpname+' - '+numberWithCommas(cp_prc)+'원');
						} else {
							$('#cpinfo').text(numberWithCommas(data.discount_prc)+'원');
						}
						if(<%=sumPrice%> < cp_prc) {
							$('.totalp1').text(0);
						} else {
							$('.totalp1').text(numberWithCommas(<%=sumPrice%>-cp_prc));
						}
						$('#cpcancle').show();
						$('#cpinput').val('');
					} else {
						toast('포만감','사용 불가능 한 쿠폰입니다.','warning');
						$('#cpinfo').text('');
					}
				},
				function() {
					toast('포만감','네트워크 오류','warning');
				}
		);
		
	});
	
	$('#cpcancle').on('click', function(e) {
		$('#cpcancle').hide();
		$('#cpselect').val('non');
		$('#cpinput').val('');
		$('#cpinfo').text('');
		$('.totalp1').text(numberWithCommas(<%=sumPrice%>));
	});
	
	$('#cpbtn').on('click', function(e) {
		var cpno = $('#cpinput').val().replace(/\s/gi, "");
		if(cpno.length <= 0) {
			toast('포만감','쿠폰 번호를 입력해 주세요.','warning');
			return;
		}
		
		ajax('./coupon/findbycpno.do', 
				{
					cpno : cpno
				},
				true,
				function(data) {
					if(data) {
						var cp_prc = data.discount_prc;
					
						if(data.cpname) {
							$('#cpinfo').text(data.cpname+' - '+numberWithCommas(cp_prc)+'원');
						} else {
							$('#cpinfo').text(numberWithCommas(data.discount_prc)+'원');
						}
						if(<%=sumPrice%> < cp_prc) {
							$('.totalp1').text(0);
						} else {
							$('.totalp1').text(numberWithCommas(<%=sumPrice%>-cp_prc));
						}
						$('#cpcancle').show();
						$('#cpselect').val('non');
					} else {
						toast('포만감','사용 불가능 한 쿠폰입니다.','warning');
						$('#cpinfo').text('');
					}
				},
				function() {
					toast('포만감','네트워크 오류','warning');
				}
		);
	});
	
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