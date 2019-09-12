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
	<style>
		body.modal-open {
		    overflow: hidden;
		    position: fixed;
		}
		body.viewport-lg {
		    position: absolute; 
		}
		body {
		    overflow-x: hidden;
		    overflow-y: scroll !important;
		}
	</style>
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
		//String curRestaurant = (String) session.getAttribute("curRestaurant");
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
		
		String curRestaurant = product.getIdx_restaurant()+"";
	%>
	
	<!-- Navbar -->
	<jsp:include page="../parts/header.jsp" /> 

	<div class="container center" style="margin-top:50px">
		<!-- Target Info -->
        <div class="n-center" style="margin-top:16px">
            <a class="valign-middle n-noborder">
                <img src="<%=product.getImgpath() %>" alt="<%=product.getName() %>" class="n-product-icon n-card" />
            </a>
            <div style="margin-top:12px"> 
                <span style="font-size: 20px; font-weight: bold;"><%=product.getName() %></span>
            </div>
             <div style="margin-bottom:25px">
                <span style="font-size: 13px; color: #b3b3b3; "><%=(product.getSub_description()==null?"":product.getSub_description()) %></span>
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
			<div class="n-margin" style="margin-top:16px">
				<button class="btn" onclick="modalDetail('cart')"
				style="background-color: darkgray; color:white;font-size:20px;font-weight:bold">장바구니 담기</button>
				<button class="btn btn-primary" onclick="modalDetail('direct')"
				style="font-size:20px;font-weight:bold">바로 주문</button>
				<br><br>
				<span style="color:#b3b3b3">
	            	※각 업체마다 생산량이 한정되어있어, 선착순 주문제로 주문을 받고 있습니다.<br>
					이로 인해 주문이 조기 마감될 수 있습니다.
				</span>
				<br>
			</div>
			
        </div>
		
		<!-- Detail Description -->
        <hr>
        
		<div class="n-center" style="">
			<div class="center" style="margin-top:32px">
			
				<%if(additionalList != null && !additionalList.isEmpty()) { %>
				<div class="row">
					<h2 class="n-font landing-heading text-xs-center">서브메뉴</h2>
					
					<%
		            for(AdditionalBean bean : additionalList) {
		            %>
					<div class="col-xs-4 col-sm-3" style="padding:0px">
						<div class="box n-center">
							<a class="valign-middle n-noborder" onclick="toast('포만감','장바구니 또는 바로 주문 단계에서 추가할 수 있습니다.','warning');"> 
							<img src="<%=bean.getImgpath() %>" alt="<%=bean.getName() %>" class="n-restaurant-icon"
								style="margin-top: 3px" />
							</a>
							<div >
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
					<%}%>
	   			</div>
	   			<%} %>
            </div>
            <br><br>
            <h2 class="n-font landing-heading text-xs-center">상품설명</h2>
			<div class="n-product-desc">
				<%=product.getDescription() %>
			</div>
			<br><br>
			<!-- 
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
			 -->
			<!-- 
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
             -->
		</div>

        
	</div>
	
	
	<div class="modal" id="modal" tabindex="-1" role="dialog" style="top:5%">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<span style="font-weight:bold;font-size:15px">주문 상세</span>
				</div>
				
				<div class="modal-body" style="padding:5%">
					<%if(product.getIdx_restaurant().intValue() == 26){ %>
					<div style="text-align:center; margin-top:32px;margin-bottom:12px">
						<span style="font-weight:bold;font-size:18px;">매운맛 조절</span>
					</div>
					<div class="slider-danger">
						<input id="nouislider" type="text" data-slider-value="2" data-slider-ticks-snap-bounds="1" >
					</div>
					<br>
					
					<%} %>
					
				
					<%if(additionalList!=null && !additionalList.isEmpty()){ %>
					<div style="text-align:center; margin-top:32px;margin-bottom:12px">
						<span style="font-weight:bold;font-size:18px;">추가사항</span>
					</div>
					<%} %>
					
					<%if(additionalList!=null && !additionalList.isEmpty()){ %>
					
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
									<input class="additionalDetail" name="detail" id="detail-<%=bean.getIdx()%>-<%=bean.getPrice() %>" type="number" pattern="[0-9]*" inputmode="numeric"
                						style="width:35px; margin-left:6px;" 
                						<%if(bean.getMinimum()!=null) {%>
                							min=<%=bean.getMinimum() %>
                						<%} else {%>
                							min=0
                						<%} %>
                						<%if(bean.getMaximum()!=null) {%>
                							max=<%=bean.getMaximum() %>
                						<%} %>
                							value=0>
								</td>
								<td>
									<%=bean.getPrice() %>원
								</td>
							</tr>
							<%} %>
							<%if(product.getIdx_restaurant().intValue() == 4){ %>
							<tr>
								<td colspan="2">
									<span id="detailname-set">세트 메뉴</span> 추가 (콜라 + 쿠키) <span name="span-set"> (<span name="amount"></span>세트 적용) </span>
									<select class="form-control input-lg" id="cookie" name="cookie" required>
										<option name="cookiename" value="1">선택 안함</option>
										<option name="cookiename" value="2">초코칩</option>
										<!-- <option name="cookiename" value="3">라즈베리 치즈케익</option>  -->
										<option name="cookiename" value="4">더블 초코칩</option>
										<option name="cookiename" value="5">오트밀 레이즌</option>
										<option name="cookiename" value="6">화이트 마카다미아</option>
										<option name="cookiename" value="7">감자칩</option>
										<option name="cookiename" value="8">추천</option>
									</select>
								</td>
								<td>
									1900원
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
					<hr>
					<br>
					<br>
					<%} %>
					
					<div style="text-align:center;margin-bottom:12px">
						<span style="font-weight:bold;font-size:18px">요구사항</span>
					</div>
					<textarea id="ob_requirement" rows="3" placeholder="" style="margin-top:8px; width:100%;"></textarea>
					
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
	
	<%if(product.getIdx_restaurant().intValue() == 4){ %>
	<div class="modal" id="modal2" tabindex="-1" role="dialog" style="overflow-y: scroll !important;overflow-x: scroll !important;">
		<div class="modal-dialog" >
			<div class="modal-content">
				<div class="modal-header">
					<span style="font-weight:bold;font-size:15px">주문 상세</span>
				</div>
				
				<div class="modal-body" style="padding:5%;overflow-y: scroll !important;overflow-x: scroll !important;">
					
					<div style="text-align:center; margin-top:32px;margin-bottom:12px">
						<span style="font-weight:bold;font-size:18px;">서브웨이 레시피</span>
					</div>
					<br>
					<div class="form-group" style="text-align: left;">
						<label class="custom-control custom-checkbox">
			                <input type="checkbox" id="rec" class="custom-control-input" required>
			                <span class="custom-control-indicator"></span>
			                <span style="font-size:13px;font-weight:bold">추천레시피로 받아볼래요.</span>
			             </label>
					</div>
					<br>
					<div class="form-group">
						<label class=" control-label">빵 종류</label>
						<div class="">
							<select class="form-control input-lg" id="bread" name="bread" required>
								<option name="breadname" value="1">플랫 브래드</option>
								<option name="breadname" value="2">화이트</option>
								<option name="breadname" value="3">하티 이탈리안</option>
								<option name="breadname" value="4">파마산 오레가노</option>
								<option name="breadname" value="5">허니오트</option>
								<option name="breadname" value="6">위트</option>
								<option name="breadname" value="7">추천</option>
							</select>
						</div>
					</div>
					<br>
					<div class="form-group">
						<label class=" control-label">야채</label>
						<div class="">
							<label class="custom-control custom-checkbox checkbox-inline">
								<input type="checkbox" id="checkall" class="custom-control-input" checked> <span
								class="custom-control-indicator"></span>전체
							</label>
						</div>
						<div class=""></div>
						<div class="">
							<div>
								<label class="custom-control custom-checkbox checkbox-inline">
									<input type="checkbox" class="custom-control-input" name="mapping"  value="피망" checked> 
									<span class="custom-control-indicator"></span>
									피망
								</label>
								<label class="custom-control custom-checkbox checkbox-inline">
									<input type="checkbox" class="custom-control-input" name="mapping" value="양파" checked> 
									<span class="custom-control-indicator"></span>
									양파
								</label>
								<label class="custom-control custom-checkbox checkbox-inline">
									<input type="checkbox" class="custom-control-input" name="mapping" value="오이" checked> 
									<span class="custom-control-indicator"></span>
									오이
								</label>
							</div>
							<div>
								<label class="custom-control custom-checkbox checkbox-inline">
									<input type="checkbox" class="custom-control-input" name="mapping" value="피클" checked> 
									<span class="custom-control-indicator"></span>
									피클
								</label>
								<label class="custom-control custom-checkbox checkbox-inline">
									<input type="checkbox" class="custom-control-input" name="mapping" value="토마토" checked> 
									<span class="custom-control-indicator"></span>
									토마토
								</label>
								<label class="custom-control custom-checkbox checkbox-inline">
									<input type="checkbox" class="custom-control-input" name="mapping" value="양상추" checked> 
									<span class="custom-control-indicator"></span>
									양상추
								</label>
							</div>
							<div>
								<label class="custom-control custom-checkbox checkbox-inline">
									<input type="checkbox" class="custom-control-input" name="mapping" value="올리브" checked> 
									<span class="custom-control-indicator"></span>
									올리브
								</label>
								<label class="custom-control custom-checkbox checkbox-inline">
									<input type="checkbox" class="custom-control-input" name="mapping" value="할라피뇨" checked> 
									<span class="custom-control-indicator"></span>
									할라피뇨
								</label>
							</div>
						</div>
					</div>
					<br>
					<div class="form-group">
						<label class=" control-label">치즈 종류</label>
						<div class="">
							<select class="form-control input-lg" id="cheese" name="cheese" required>
								<option value="1">아메리칸 치즈</option>
								<option value="2">슈레드 치즈</option>
								<option value="3">치즈 제외</option>
								<option value="4">추천</option>
							</select>
						</div>
					</div>
					<br>
					<div class="form-group">
						<label class=" control-label">오븐굽기</label>
						<div class="">
							<label
								class="switcher switcher-rounded switcher-lg switcher-primary switcher-blank">
								<input type="checkbox" id="istempSelector" name="istemp">
								<div class="switcher-indicator">
									<div class="switcher-yes">O</div>
									<div class="switcher-no">X</div>
								</div>
							</label>
						</div>
					</div>
					<br>	
					<div class="form-group">
						<label class=" control-label">소스</label>
						<div class="">
							<label class="custom-control custom-checkbox checkbox-inline">
								<input type="checkbox" id="recsauce" class="custom-control-input" checked> <span
								class="custom-control-indicator"></span>추천
							</label>
						</div>
						<div class=""></div>
						<div class="">
							<div>
								<label class="custom-control custom-checkbox checkbox-inline">
									<input type="checkbox" class="custom-control-input" name="sauce" value="바베큐"> 
									<span class="custom-control-indicator"></span>
									바베큐
								</label>
								<label class="custom-control custom-checkbox checkbox-inline">
									<input type="checkbox" class="custom-control-input" name="sauce" value="허니머스타드"> 
									<span class="custom-control-indicator"></span>
									허니머스타드
								</label>
								<label class="custom-control custom-checkbox checkbox-inline">
									<input type="checkbox" class="custom-control-input" name="sauce" value="랜치드레싱"> 
									<span class="custom-control-indicator"></span>
									랜치드레싱
								</label>
							</div>
							<div>
								<label class="custom-control custom-checkbox checkbox-inline">
									<input type="checkbox" class="custom-control-input" name="sauce" value="핫칠리"> 
									<span class="custom-control-indicator"></span>
									핫칠리
								</label>
								<label class="custom-control custom-checkbox checkbox-inline">
									<input type="checkbox" class="custom-control-input" name="sauce" value="마요네즈"> 
									<span class="custom-control-indicator"></span>
									마요네즈
								</label>
								<label class="custom-control custom-checkbox checkbox-inline">
									<input type="checkbox" class="custom-control-input" name="sauce" value="디종홀스래디쉬"> 
									<span class="custom-control-indicator"></span>
									디종홀스래디쉬
								</label>
							</div>
							<div>
								<label class="custom-control custom-checkbox checkbox-inline">
									<input type="checkbox" class="custom-control-input" name="sauce" value="머스타드"> 
									<span class="custom-control-indicator"></span>
									머스타드
								</label>
								<label class="custom-control custom-checkbox checkbox-inline">
									<input type="checkbox" class="custom-control-input" name="sauce" value="올리브오일"> 
									<span class="custom-control-indicator"></span>
									올리브오일
								</label>
								<label class="custom-control custom-checkbox checkbox-inline">
									<input type="checkbox" class="custom-control-input" name="sauce" value="스위트어니언"> 
									<span class="custom-control-indicator"></span>
									스위트어니언
								</label>
							</div>
							<div>
								<label class="custom-control custom-checkbox checkbox-inline">
									<input type="checkbox" class="custom-control-input" name="sauce" value="후추"> 
									<span class="custom-control-indicator"></span>
									후추
								</label>
								<label class="custom-control custom-checkbox checkbox-inline">
									<input type="checkbox" class="custom-control-input" name="sauce" value="스위트 칠리"> 
									<span class="custom-control-indicator"></span>
									스위트 칠리
								</label>
								<label class="custom-control custom-checkbox checkbox-inline">
									<input type="checkbox" class="custom-control-input" name="sauce" value="사우스웨스트"> 
									<span class="custom-control-indicator"></span>
									사우스웨스트
								</label>
							</div>
							<div>
								<label class="custom-control custom-checkbox checkbox-inline">
									<input type="checkbox" class="custom-control-input" name="sauce" value="소금"> 
									<span class="custom-control-indicator"></span>
									소금
								</label>
								<label class="custom-control custom-checkbox checkbox-inline">
									<input type="checkbox" class="custom-control-input" name="sauce" value="레드와인 식초"> 
									<span class="custom-control-indicator"></span>
									레드와인 식초
								</label>
								<label class="custom-control custom-checkbox checkbox-inline">
									<input type="checkbox" class="custom-control-input" name="sauce" value="이탈리안 드레싱"> 
									<span class="custom-control-indicator"></span>
									이탈리안 드레싱
								</label>
							</div>
							<div>
								<label class="custom-control custom-checkbox checkbox-inline">
									<input type="checkbox" class="custom-control-input" name="sauce" value="마리나라소스"> 
									<span class="custom-control-indicator"></span>
									마리나라소스
								</label>
								<label class="custom-control custom-checkbox checkbox-inline">
									<input type="checkbox" class="custom-control-input" name="sauce" value="사우전 아일랜드"> 
									<span class="custom-control-indicator"></span>
									사우전 아일랜드
								</label>
							</div>
						</div>
					</div>
					<br>
				</div>

				<div class="modal-footer">
					<div class="n-center">
						<button type="button" class="btn btn-primary" onclick="goNextModal()" style="font-size:20px;width:35%"> 다음
						</button>
						<button type="button" class="btn" data-dismiss="modal" aria-label="Close" style="font-size:20px;width:35%"> 취소
						</button>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<%} %>
	
	<!-- Footer -->
	<%@ include file="../parts/footer.jsp" %>

	<!-- Core scripts -->
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/pixeladmin.min.js"></script>
	
	<script>
	$(function() {
		var _isRtl = $('html').attr('dir') === 'rtl';
		if (_isRtl) { $('#').wrap('<div class="slider-reversed"></div>') }
	
		$('#nouislider').slider({
			ticks:        [0, 1, 2, 3, 4],
			ticks_labels: ['<span style="color:red">착한맛<br>🌶</span>', 
							'<span style="color:red">엽떡초보맛<br>🌶🌶</span>', 
							'<span style="color:red">덜매운맛<br>🌶🌶🌶</span>', 
							'<span style="color:red">오리지널<br>🌶🌶🌶🌶</span>', 
							'<span style="color:red">매운맛<br>🌶🌶🌶🌶🌶</span>'],
			reversed:     _isRtl,
			tooltip:      'hide'
		});
		
	
		$('#modal').on('shown.bs.modal', function (event) {
		  setTimeout(function() {
			  $("#nouislider").slider('relayout');
		  }, 0);
		});
		
	});
	
	
	</script>
	
	<script>
	
	$('#header-center').text('<%=product.getName() %>');
	$('#header-center').prop('href', '');
	
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
	
	function goNextModal() {
		$('#modal2').modal('hide');
		$('#modal').modal();
	}
	
	var where;
	function modalDetail(w) {
		var amount = $('#ob-amount').val();
		where = w;
		if(where == 'cart') {
			/*
			if(cartAmount + parseInt(amount) > 5) {
				alert('죄송합니다...\n한번에 주문가능한 총 메뉴 개수는 최대 5개 입니다.\n\n'+
						'장바구니 안 메뉴 개수 : '+cartAmount+'개\n'+
						'선택하신 메뉴 개수 : '+amount+'개');
				return;
			}
			*/
			if(parseInt(amount) > 5) {
				toast('죄송합니다...','최대 5개 까지 선택가능합니다.','warning');
				return;
			}
		} else if (where == 'direct') {
			if(parseInt(amount) > 5) {
				toast('죄송합니다...','최대 5개 까지 선택가능합니다.','warning');
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
		
		<%if(product.getIdx_restaurant() == 4){ %>
			$('#modal2').modal();
		<%} else {%>
			$('#modal').modal();
		<%}%>
		
	}
	
	$('#modal').on('hidden.bs.modal', function () {
		popover();
	});
	
	function goNext() {
		var detail = getDetail();
		var requirement = '';
		
		
		<%if(product.getIdx_restaurant() == 4){ %>
		if($('#rec').is(":checked")) {
			requirement += '추천레시피\n';
		} else {
			
			/*
			var vegtext = '';
			if($("#checkall").is(":checked")) {
				vegtext = '모두';
			} else {
				var vegs = $('input:checked[name=mapping]');
				for(var i=0; i<vegs.length; i++){
					vegtext += $(vegs[i]).val();
					if(i!=vegs.length-1) {
						vegtext += ', ';
					}
				}
			}
			*/
			var vegtext = '';
			
			var vegs = $('input:unchecked[name=mapping]');
			for(var i=0; i<vegs.length; i++){
				vegtext += $(vegs[i]).val();
				if(i!=vegs.length-1) {
					vegtext += ', ';
				}
			}
			
			
			var toasttext = '';
			if($("#istempSelector").is(":checked")) {
				toasttext = '(토스팅 O)';
			} else {
				toasttext = '(토스팅 X)';
			}
			
			var saucetext = '';
			if($("#recsauce").is(":checked")) {
				saucetext = '추천';
			} else {
				var sauces = $('input:checked[name=sauce]');
				for(var i=0; i<sauces.length; i++){
					saucetext += $(sauces[i]).val();
					if(i!=sauces.length-1) {
						saucetext += ', ';
					}
				}
			}
			
			requirement += '\n빵 : ' + $("#bread option:selected" ).text() + '\n';
			requirement += '치즈 : ' + $("#cheese option:selected" ).text() + ' ' + toasttext + '\n';
			requirement += '야채(빼는것) : ' + vegtext + '\n';
			requirement += '소스 : ' + saucetext + '\n';
		}
		<%}%>
		
		
		if($('#ob_requirement').val().length > 0) {
			requirement += ''+$('#ob_requirement').val().trim();
		}
		
		
		<%if(product.getIdx_restaurant().intValue() == 26){ %>
			requirement += '\n맵기선택 : ';
			var ht = $("#nouislider").slider('getValue');		
			switch(ht) {
			case 0: requirement += '착한맛'; break;
			case 1: requirement += '엽떡초보맛'; break;
			case 2: requirement += '덜매운맛'; break;
			case 3: requirement += '오리지널'; break;
			case 4: requirement += '매운맛'; break;
			default : requirement += '덜매운맛'; break;
			}
		
		<%}%>
		
		//console.log('goNext: '+ detail + ' ' + requirement);
		
		
		
		if(where == 'direct') {
			goDirect(detail, requirement);
		} else if(where == 'cart') {
			insertCartProduct(detail, requirement);
		}
	}
	
	function goDirect(d,r) {
		getTime(curProduct, $('#ob-amount').val(), curRestaurant, false);
		
		if(confirm($('#ob-time').text()+' 까지 도착합니다. 계속하시겠습니까?\n\n(교통상황이나 업체의 사정으로 인해 배달시간이 다소 지연될 수 있습니다)')) {
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
	
	$('#cookie').on('change', function(e) {
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
		
		<%if(product.getIdx_restaurant().intValue() == 4){ %>
		var cookie = parseInt($('#cookie').val());
		if(cookie != 1) {
			addTotal += (amount * 1900);
		}
		<%}%>
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
		
		<%if(product.getIdx_restaurant().intValue() == 4){ %>
		var cookie = parseInt($('#cookie').val());
		if(cookie != 1) {
			result.push('set-1-1900-세트(' + $("#cookie option:selected" ).text() + ')');
		}
		<%}%>
		return result.toString();
	}
	
	$('#ob-amount').on('change', function() {
		var amount = $(this).val();
		if(isNaN(parseInt(amount))) {
			toast('포만감','숫자만 입력가능합니다.','warning');
			$(this).val(1);
			return;
		}
			
		if(amount > 5) {
			//toast('단체주문','15개 이상 단체주문은 010-6478-4899로 문의주세요.','warning');
			toast('죄송합니다...','최대 5개 까지 선택가능합니다.','warning');
			return;
		} 
		getTime(curProduct, amount, curRestaurant);
	});
	
	timer();
	
	function timer() {
		getTime(curProduct, $('#ob-amount').val(), curRestaurant, true);
		setTimeout("timer()", 1000*60);
	}
	
	
	<%if(product.getIdx_restaurant() == 4){ %>
	
	$('#rec').on('change', function() {
		var tf = $(this).is(':checked');
		
		$('#bread').val("7").prop("selected", true);
		$("#bread option").not(":selected").attr("disabled", tf);
		$("#checkall").prop("disabled", tf);
		$('input[name=mapping]').each(function(e) {
		      	$(this).prop("disabled", tf);
		});
		$('#recsauce').prop("checked", tf);
		$('#recsauce').prop("disabled", tf);
		$('input[name=sauce]').each(function(e) {
			$(this).prop("checked", false);
	      	$(this).prop("disabled", tf);
		});
		$('#istempSelector').prop("disabled", tf);
		$('#cheese').val("3").prop("selected", true);
		$("#cheese option").not(":selected").attr("disabled", tf);
	});
	
	$("#checkall").on('change', function() {
		var tf;
        if($("#checkall").is(":checked")){
            tf = true;
        }else{
            tf = false;
        }
        $('input[name=mapping]').each(function(e) {
        	$(this).prop("checked", tf);
        });
    });
	
	$('#recsauce').on('change', function() {
		$('input[name=sauce]').prop("checked", false);
	});
	
	$('input[name=sauce]').on('change', function() {
		var beans =$('input[name=sauce]');
		var n = 0;
		for(var i=0; i<beans.length; i++) {
			if($(beans[i]).is(":checked")){
				n++;
			}
		}
		if(n>4) {
			toast('포만감','소스는 최대 4개까지 선택 가능합니다.','warning');
			$(this).prop("checked", false);
		}
		$('#recsauce').prop("checked", false);
	});
	
	$('input[name=mapping]').on('change', function() {
		var beans = $('input[name=mapping]');
		for(var i=0; i<beans.length; i++) {
			if(!$(beans[i]).is(":checked")){
				$("#checkall").prop("checked", false);
				return;
			}
		}
		$("#checkall").prop("checked", true);
	});
	
	<%}%>
	
	
	$('.additionalDetail').on('mouseup', function() { $(this).select(); });
	$('.additionalDetail').on('change', function() { 
		
		if(this.min && (this.min > this.value)) {
			this.value = this.min;
			toast('포만감','최소 ' + this.min + '개 까지 선택 가능합니다.','warning');
		}
		if(this.max && (this.value > this.max)) {
			this.value = this.max;
			toast('포만감','최대 ' + this.max + '개 까지 선택 가능합니다.','warning');
		}

	});
	
	</script>
</body>
</html>