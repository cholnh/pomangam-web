<%@page import="com.mrporter.pomangam.target.vo.TargetAdBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="com.mrporter.pomangam.target.vo.TargetBean"%>
<%@page import="com.mrporter.pomangam.product.vo.OrderTimeBean"%>
<%@page import="com.mrporter.pomangam.target.vo.TargetDetailBean"%>
<%@page import="java.util.List"%>
<%@page import="com.mrporter.pomangam.restaurant.vo.RestaurantBean"%>
<%@page import="com.mrporter.pomangam.common.util.Number"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<link href="resources/img/favicon.ico" rel="shortcut icon">
</head>
<body style="background-color: #FFF">

	<%	
		String curTarget = (String) request.getParameter("idx");
		
		@SuppressWarnings({"unchecked", "rawtypes"})
		List<RestaurantBean> restaurantList = (List) request.getAttribute("restaurantList");
		
		@SuppressWarnings({"unchecked", "rawtypes"})
		List<TargetAdBean> targetAdList = (List) request.getAttribute("targetAdList");
		
		@SuppressWarnings({"unchecked", "rawtypes"})
		List<OrderTimeBean> orderTimeList = (List) request.getAttribute("orderTimeList");
		
		@SuppressWarnings({"unchecked", "rawtypes"})
		List<TargetDetailBean> detailList = (List) request.getAttribute("detailList");
		
		String json = (String) request.getAttribute("target");
		List<TargetBean> list = new Gson().fromJson(
				json, 
				new TypeToken<List<TargetBean>>() {}.getType());
		TargetBean target = list.get(0);
		
	%>
	
	<!-- Navbar -->
	<jsp:include page="../parts/header.jsp" /> 
	
	<!-- Content -->
	<div class="container center" style="margin-top:40px; margin-bottom: 1px">
		<!-- Target Info 
		<div class="n-center n-padding-24">
			<a href="" style="text-decoration:none; !important">
				<span class="n-xlarge n-bottombar" style="padding:5px">
					<span style="color:black">
					<%=target.getName() %>
					</span>
				</span>
			</a>
		</div>
		-->
		<div class="n-center" style="margin-top:28px">
			<table style="display:inline-block">
			<colgroup>
				<col style="width: 70px;">
				<col style="width: auto;">
			</colgroup>
			<tbody>
				<tr>
					<td>
						<div class="n-dropdown-hover hoverTrigger" style="width:auto; text-align:center;">
							<a id="hoverBtn1" class="btn btn-primary">이벤트</a>
							<div class="n-dropdown-content n-card-4 n-target-detailinfo hoverContents">
								<div class="n-container">
									<h3 class="n-font">진행중인 이벤트가 없습니다.</h3>
								</div>
							</div>
						</div>
					</td>
					<td>
						<div class="n-dropdown-hover hoverTrigger" style="width:auto; text-align:center">
							<a id="hoverBtn2" class="btn btn-primary">배달 장소 / 시간</a>
							<div class="n-dropdown-content n-card-4 n-target-detailinfo hoverContents">
								<div class="n-container" style="padding:0px">
									<h3 class="n-font">배달 도착</h3>
									<table class="table table-hover" style="text-align:left">
										<tbody>
											<tr>
												<th>
													장소
												</th>
												<th>
													점심 시간
												</th>
												<th>
													저녁 시간
												</th>
											</tr>
											<tr>
												<%if(curTarget.equals("1")) {%>
					            					<td>
														학생회관 뒤
													</td>
													<td>
														오후 12시 / 1시 / 2시
													</td>
													<td>
														오후 5시 / 6시 / 7시
													</td>
					            				<%} else if(curTarget.equals("2")) {%>
					            					<td>
														기숙사 정문
													</td>
													<td>
														오후 12시 / 1시 / 2시
													</td>
													<td>
														오후 5시 / 6시 / 7시
													</td>
					            				<%} else if(curTarget.equals("3")) {%>
					            					<td>
														연암관
													</td>
													<td>
														오후 9시 20분
													</td>
					            				
					            				<%} %>
											</tr>
											<tr>
												<%if(curTarget.equals("1")) {%>
												<tr>
													<td>
														기숙사 식당 (+10분)
													</td>
													<td>
														오후 12시 / 1시 / 2시
													</td>
													<td>
														오후 5시 / 6시 / 7시
													</td>
												</tr>
					            				<%} else if(curTarget.equals("2")) {%>
					            					<td>
														제2학생회관
													</td>
													<td>
														오후 12시 / 1시 / 2시  (+5분)
													</td>
													<td>
														오후 5시 / 6시 / 7시  (+5분)
													</td>
					            				<%} else if(curTarget.equals("3")) {%>
					            					<td>
														다산관 / 반계관
													</td>
													<td>
														오후 9시 23분
													</td>
					            				
					            				<%} %>
											</tr>
											<tr>
												<%if(curTarget.equals("1")) {%>
					            				<%} else if(curTarget.equals("2")) {%>
					            					<td>
														아카데미홀
													</td>
													<td>
														오후 12시 / 1시 / 2시  (+10분)
													</td>
													<td>
														오후 5시 / 6시 / 7시  (+10분)
													</td>
					            				<%} else if(curTarget.equals("3")) {%>
					            					<td>
														오륜관 / 난설허관
													</td>
													<td>
														오후 9시 26분
													</td>
					            				
					            				<%} %>
											</tr>
										</tbody>
									</table>
									
									<br>
									
									<h3 class="n-font">주문 설명</h3>
									
									<span>
										<b>배달 도착 30분 전에 주문이 마감됩니다.</b><br>
										그 후로 들어온 주문은 자동으로 <u>다음 배달 도착시간</u>에 배정됩니다!<br>
										예시1) 11시 10분 주문 시 12시에 배달<br>
										예시2) 11시 31분 주문 시 1시에 배달<br>
										<hr style="width:50%">
										주문 대기시간에 따라 도착 시간이 달라질 수 있습니다.<br>
										예시1) 11시 00분 (30분마감) 주문 가능 수량 : 20개<br>
										예시2) 11시 29분 (30분마감) 주문 가능 수량 : 1개<br>
										<hr style="width:50%">
										또한 주문 사정에 따라 주문 가능 수량이 달라질 수 있습니다!
										
									</span>
									
									<br>
									<br>
									
								</div>
							</div>
						</div>
					</td>
				</tr>
			</tbody>
			</table>
		</div>
		 
		<%if(targetAdList!=null && targetAdList.size()>0) {%>
		<hr>
		<div class="n-center">
			
			<div id="owl-carousel-basic" class="owl-carousel" style="display: inline-block!important">
				<% for(TargetAdBean bean : targetAdList) {
					if(bean.getIsactive() == 0) continue;
				%>
						<img class="ad-img demo-item" style="display:none" alt="<%=bean.getName() %>" src="<%=bean.getImgpath() %>">
				<%} %>
			</div>
		</div>
		
		<%} %>
		<hr>
		<!-- Parter -->
		<div>
			<!-- 
			<h2 class="n-font landing-heading text-xs-center">주문 마감까지 <br> <span id="ob-time" style="color:#eb613e"></span> 남았습니다.</h2>
			 -->
			
			<ul class="list-group n-target-center">
		<%
		boolean tf = true;
		if(restaurantList != null) {
		for(int i=0; i<restaurantList.size(); i++) {
			RestaurantBean bean = restaurantList.get(i);
			if(bean.getIsActive() == 0) continue;
			if(tf) {%>
				<li class="list-group-item n-noborder" style="padding:0px;">
					<div class="row">	
			<%}%>
						<div class="col-md-6">
							<div class="box" style="cursor: pointer;" 
								<%if(bean.getIsPause() == 0) {%>
								onclick="location.href='./restaurant.do?idx=<%=bean.getIdx() %>'"
								<%} else { %>
								onclick="alert('죄송합니다.\n<%=bean.getPause_description() %>\n더 나은 서비스로 찾아 뵙겠습니다.');"
								<%} %>
							>
								<a class="box-cell col-xs-4 b-r-1 valign-middle text-xs-center font-size-24 n-noborder" 
									style="height:90px; <%if(bean.getIsPause() == 1) {%>opacity:0.5<%}%>">
									<img src="<%=bean.getImgpath() %>" alt="<%=bean.getName() %>" class="n-target-icon" />
								</a>

								<div class="box-cell">
									<div class="box-container">
										<div class="box-row">
											<span class="box-cell valign-middle n-target-title"
												style="<%if(bean.getIsPause() == 1) {%>opacity:0.5<%}%>"><%=bean.getName() %></span>
										</div>
										<!-- 
										<div class="box-row">
											<div class="box-cell valign-middle n-nodec">
												<i class="pull-xs fa fa-star"></i>
												<% out.print(Number.numberWithCommas(bean.getCnt_star())); %>&nbsp;&nbsp;
												<i class="pull-xs fa fa-commenting"></i>
												<% out.print(Number.numberWithCommas(bean.getCnt_comment())); %>
											</div>
										</div>
										 -->
										 <%if(bean.getIsPause() == 1) {%>
										<div class="box-row">
											<span class="box-cell valign-middle n-target-subtitle" style="color:red;font-weight:bold;">
												<%=bean.getPause_description() %>
											</span>
										</div>
										<%} else if(bean.getSub_description() != null) {%>
										<div class="box-row">
											<span class="box-cell valign-middle n-target-subtitle" style="color:red;font-weight:bold;">
												<%=bean.getSub_description() %>
											</span>
										</div>
										<%} %>
									</div>
								</div>

								<div class="box-cell col-xs-1 b-r-1 valign-middle text-xs-center font-size-24 n-noborder n-nodec">
									<i class="fa fa-angle-right"></i>
								</div>
							</div>
						</div>
			<%if(!tf) {%>
					</div>
				</li>
			<%} tf = !tf;%>	
		<%}
		}%>

			</ul>
		</div>
	</div>

	<div class="modal" id="modal1" tabindex="-1" role="dialog" style="top:30%">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<span style="font-weight:bold;font-size:15px">이벤트</span>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" >
					<h5>진행중인 이벤트가 없습니다..</h5>
				</div>

			</div>
		</div>
	</div>
	
	<div class="modal" id="modal2" tabindex="-1" role="dialog" style="top:30%">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<span style="font-weight:bold;font-size:15px">배달 받는 장소 / 시간</span>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body" style="padding:0px">
					<div style="text-align:center; margin-top:32px;margin-bottom:12px">
						<span style="font-weight:bold;font-size:18px;">배달 도착</span>
					</div>
					
					<table class="table table-hover" style="text-align:left">
						<tbody>
							<tr>
								<th>
									장소
								</th>
								<th>
									점심 시간
								</th>
								<th>
									저녁 시간
								</th>
							</tr>
							<tr>
								<%if(curTarget.equals("1")) {%>
	            					<td>
										학생회관 뒤
									</td>
									<td>
										오후 12시 / 1시 / 2시
									</td>
									<td>
										오후 5시 / 6시 / 7시
									</td>
	            				<%} else if(curTarget.equals("2")) {%>
	            					<td>
										기숙사 정문
									</td>
									<td>
										오후 12시 / 1시 / 2시
									</td>
									<td>
										오후 5시 / 6시 / 7시
									</td>
	            				<%} else if(curTarget.equals("3")) {%>
	            					<td>
										연암관
									</td>
									<td>
										오후 9시 20분
									</td>
	            				<%} %>
							</tr>
							<tr>
								<%if(curTarget.equals("1")) {%>
								<tr>
									<td>
										기숙사 식당 (+10분)
									</td>
									<td>
										오후 12시 / 1시 / 2시
									</td>
									<td>
										오후 5시 / 6시 / 7시
									</td>
								</tr>
	            				<%} else if(curTarget.equals("2")) {%>
	            					<td>
										제2학생회관
									</td>
									<td>
										오후 12시 / 1시 / 2시  (+5분)
									</td>
									<td>
										오후 5시 / 6시 / 7시  (+5분)
									</td>
	            				<%} else if(curTarget.equals("3")) {%>
	            					<td>
										다산관 / 반계관
									</td>
									<td>
										오후 9시 23분
									</td>
	            				<%} %>
								
							</tr>
							<tr>
								<%if(curTarget.equals("1")) {%>
	            				<%} else if(curTarget.equals("2")) {%>
	            					<td>
										아카데미홀
									</td>
									<td>
										오후 12시 / 1시 / 2시  (+10분)
									</td>
									<td>
										오후 5시 / 6시 / 7시  (+10분)
									</td>
	            				<%} else if(curTarget.equals("3")) {%>
	            					<td>
										오륜관 / 난설허관
									</td>
									<td>
										오후 9시 26분
									</td>
	            				<%} %>
							</tr>
						</tbody>
					</table>
					
					<br>
					
					<div style="text-align:center;margin-bottom:12px">
						<span style="font-weight:bold;font-size:18px">주문 설명</span>
					</div>
					<div style="text-align:center">
						<span>
							<b>배달 도착 30분 전에 주문이 마감됩니다.</b><br>
							그 후로 들어온 주문은 자동으로 <u>다음 배달 도착시간</u>에 배정됩니다!<br>
							예시1) 11시 10분 주문 시 12시에 배달<br>
							예시2) 11시 31분 주문 시 1시에 배달<br>
							<hr style="width:50%">
							주문 대기시간에 따라 도착 시간이 달라질 수 있습니다.<br>
							예시1) 11시 00분 (30분마감) 주문 가능 수량 : 20개<br>
							예시2) 11시 29분 (30분마감) 주문 가능 수량 : 1개<br>
							<hr style="width:50%">
							▷ 또한 매장의 주문 사정에 따라 주문 가능 수량이 달라질 수 있습니다! ◁
							
						</span>
					</div>
					
					<br>
					<br>							
									
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
	
	$('#header-home').text('<%=target.getName() %>'); 
	//$('#header-home').prop('href', '');
	
	var curTarget = <%=curTarget%>;
	
	if(mobilecheck()) {
		$('.hoverTrigger').removeClass('n-dropdown-hover');
		$('#hoverBtn1').off('click').on('click', function(e) {
			$('#modal1').modal();
		});
		$('#hoverBtn2').off('click').on('click', function(e) {
			$('#modal2').modal();
		});
	} 
	
	</script>
	<script>
	<%if(targetAdList!=null && targetAdList.size()>0) {%>
	$(function() {
		$('.demo-item').css("display", "block");
		$('#owl-carousel-basic').owlCarousel({
			loop:   true,
			margin: 10,
			autoplay:        true,
			autoplayTimeout: 4000,
			
			responsive: {
				0:    { items: 1 },
				600:  { items: 1 },
				1000: { items: 1 },
			},

			rtl: $('html').attr('dir') === 'rtl',
		});
	});
	<%}%>
	</script>
	
</body>
</html>
