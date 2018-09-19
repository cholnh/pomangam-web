<%@page import="com.mrporter.pomangam.product.vo.AdditionalBean"%>
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
	<link href="resources/img/favicon.ico" rel="shortcut icon">
</head>
<body style="background-color: #FFF">
	<%
		List<CartBean> cartList = new ArrayList<>();
		Object obj = session.getAttribute("cartList");
		int cartAmount = 0;
		if(obj != null) {
			cartList = (ArrayList<CartBean>) obj;
			for(CartBean cbean : cartList) {
				cartAmount += cbean.getAmount();
			}
		}
		
		String curTarget = (String) session.getAttribute("curTarget");
		String curRestaurant = (String) session.getAttribute("curRestaurant");
		String curProduct = (String) request.getParameter("idx");
		
		@SuppressWarnings({"unchecked"})
		List<ProductBean> recommend = (List<ProductBean>) request.getAttribute("recommend");
		@SuppressWarnings({"unchecked"})
		List<AdditionalBean> additionalList = (List<AdditionalBean>) request.getAttribute("additionalList");
		
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
            <div style="margin-top:0px"> 
            	<a class="btn-primary " style="font-size:15px!important;padding:7px" >
            		<b><span id="ob-time"></span> 도착</b> 
            	 </a>
            </div>
            <!-- 
            <a class="btn-primary " style="font-size:12px!important;padding:5px"></b>
            	<% //out.print(Number.numberWithCommas(product.getCnt_limit())); %>개 남음
            </a>
             -->
            <div style="margin-top:18px">
                <input id="ob-amount" type="number" pattern="[0-9]*" inputmode="numeric"
            		data-toggle="popover"  data-content="개수에 따라 도착시간이 달라집니다" data-placement="left"
                	 style="width:40px" min=1 value=1> 개
                <span style="color: #f3753a; font-weight: bold; margin-left: 12px; font-size: 15px;">
                    	<% out.print(Number.numberWithCommas(product.getPrice())); %>원
                </span>
            </div>
			<div class="n-margin">
				<button class="btn" onclick="modalDetail('cart')"
				style="background-color: darkgray; color:white;font-size:20px;font-weight:bold">장바구니 담기</button>
				<button class="btn btn-primary" onclick="modalDetail('direct')"
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
								<th scope="row">120</th>
								<td>60</td>
								<td>122(18)</td>
								<td>2</td>
								<td>0(2)</td>
								<td>38(69)</td>
								<td>60</td>
								<td>122</td>
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
	
	
	<div class="modal" id="modal" tabindex="-1" role="dialog" style="top:5%">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<span style="font-weight:bold;font-size:15px">주문 상세</span>
				</div>
				
				<div class="modal-body" style="padding:5%">
					<%if(additionalList!=null && !additionalList.isEmpty()){ %>
					<div style="text-align:center; margin-top:32px;margin-bottom:12px">
						<span style="font-weight:bold;font-size:18px;">추가사항</span>
					</div>
					<table class="table table-border" style="text-align:left">
						<tbody>
							<colgroup>
								<col style="width:70%">
								<col style="width:5%">
								<col style="width:25%">
							</colgroup>
							<tr>
								<th>
									품명
								</th>
								<th>
									개수
								</th>
								<th>
									가격
								</th>
							</tr>
							
							
							<%for(AdditionalBean bean : additionalList) {%>
							<tr>
								<td>
									<span id="detailname-<%=bean.getIdx()%>"><%=bean.getName() %></span> 추가 <span name="span-set"> (<span name="amount"></span>세트 적용) </span>
								</td>
								<td>
									<input name="detail" id="detail-<%=bean.getIdx()%>-<%=bean.getPrice() %>" type="number" pattern="[0-9]*" inputmode="numeric"
                						style="width:35px; margin-left:6px;" min=0 value=0>
								</td>
								<td>
									<%=bean.getPrice() %>원
								</td>
							</tr>
							<%} %>
						</tbody>
					</table>
					
					<div class="n-center">
						<span id="span-amount">
							주의 : <%=product.getName() %> <span id="m-amount"></span>개에 모두 적용됩니다.
						</span>
						<h3>추가금액
						<span id="m-add-total">0</span>원
						</h3>
					</div>
					
					<br>
					<br>
					<hr>
					<%} %>
					
					<div style="text-align:center;margin-bottom:12px">
						<span style="font-weight:bold;font-size:18px">요구사항</span>
					</div>
					<textarea id="ob_requirement" rows="3" placeholder="" style="margin-top:8px; width:100%;">
					</textarea>
					
					<br>
					<br>							
									
				</div>

				<div class="modal-footer">
					<div class="n-center">
						<button type="button" class="btn btn-primary" onclick="goNext()" style="font-size:20px;width:35%"> 다음
						</button>
						<button type="button" class="btn" data-dismiss="modal" aria-label="Close" style="font-size:20px;width:35%"> 취소
						</button>
					</div>
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
	var cartAmount = <%=cartAmount%>;
	var curTarget = <%=curTarget%>;
	var curRestaurant = <%=curRestaurant%>;
	var curProduct = <%=curProduct%>;
	
	$('#header-home').hide();
	$('#header-back').show();
	$('#header-center').show();
	$('#header-back').prop('href', './restaurant.do?idx='+curRestaurant);
	$('[data-toggle="popover"]').popover();
	
	popover();
	function popover() {
		if(!mobilecheck()) {
			$('#ob-amount').popover('show').off('click');
		} else {
			$('#ob-amount').off('click');
		}
	}
	
	
	var where;
	function modalDetail(w) {
		var amount = $('#ob-amount').val();
		where = w;
		if(where == 'cart') {
			if(cartAmount + parseInt(amount) > 5) {
				alert('죄송합니다...\n한번에 주문가능한 총 메뉴 개수는 최대 5개 입니다.\n\n'+
						'장바구니 안 메뉴 개수 : '+cartAmount+'개\n'+
						'선택하신 메뉴 개수 : '+amount+'개');
				return;
			}
		} else if (where == 'direct') {
			if(parseInt(amount) > 5) {
				alert('죄송합니다...\n한번에 주문가능한 총 메뉴 개수는 최대 5개 입니다.\n\n'+
						'선택하신 메뉴 개수 : '+amount+'개');
				return;
			}
		}
		
		
		if(amount <= 1) {
			$('span[name=span-set]').hide();
			$('#span-amount').hide();
		} else {
			$('span[name=span-set]').show();
			$('#span-amount').show();
			$('#m-amount').text(amount);
			$('span[name=amount]').text(amount);
		}
		$('input[name=detail]').val(0);
		$('#m-add-total').text(0);
		$('#ob-amount').popover('hide');
		
		$('#modal').modal();
	}
	
	$('#modal').on('hidden.bs.modal', function () {
		popover();
	});
	
	function goNext() {
		var detail = getDetail();
		var requirement = $('#ob_requirement').val().trim();
		
		//console.log('goNext: '+ detail + ' ' + requirement);
		
		if(where == 'direct') {
			goDirect(detail, requirement);
		} else if(where == 'cart') {
			insertCartProduct(detail, requirement);
		}
	}
	
	function goDirect(d,r) {
		getTime(curProduct, $('#ob-amount').val(), curRestaurant, false);
		
		if(confirm($('#ob-time').text()+' 까지 도착합니다. 계속하시겠습니까?')) {
			d = encodeURI(d);
			r = encodeURI(r);
			location.href='./payment.do?direct=true&amount='+$('#ob-amount').val()+'&additional='+d+'&requirement='+r;
			// post 변환 필요
		}
	}
	
	// 추가사항 계산
	$('input[name=detail]').on('change', function(e) {
		calTotal();
	});
	
	function calTotal() {
		var amount = $('#ob-amount').val();
		var $details = $('input[name=detail]');
		var addTotal = 0;
		for(var i=0; i<$details.length; i++){
			var detail = $details[i];
			if(detail.value > 0) {
				addTotal += (parseInt($(detail).val()) * parseInt(detail.id.split('-')[2]) * amount); 
			}
		}
		
		$('#m-add-total').text(addTotal);
	}
	
	function getDetail() {
		var result = [];
		var $details = $('input[name=detail]');
		for(var i=0; i<$details.length; i++){
			var detail = $details[i];
			//console.log(detail.id.split('detail-')[1]);
			//console.log(detail.value);
			if(detail.value > 0) {
				var amount = $('#ob-amount').val();
				result.push(detail.id.split('-')[1]+'-'+
							detail.value+'-'+
							detail.id.split('-')[2]+'-'+
							$('#detailname-'+detail.id.split('-')[1]).text());
			}
		};
		return result.toString();
	}
	
	$('#ob-amount').on('change', function() {
		var amount = $(this).val();
		if(isNaN(parseInt(amount))) {
			alert('숫자만 입력가능합니다.');
			$(this).val(1);
			return;
		}
			
		if(amount > 15) {
			alert('15개 이상 단체주문은 010-6478-4899로 문의주세요.');
			return;
		} 
		getTime(curProduct, amount, curRestaurant);
	});
	
	timer();
	
	function timer() {
		getTime(curProduct, $('#ob-amount').val(), curRestaurant, true);
		setTimeout("timer()", 1000*60);
	}
	</script>
</body>
</html>