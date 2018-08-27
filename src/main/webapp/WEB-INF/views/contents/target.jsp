<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="com.mrporter.pomangam.target.vo.TargetBean"%>
<%@page import="java.util.List"%>
<%@page import="com.mrporter.pomangam.restaurant.vo.RestaurantBean"%>
<%@page import="com.mrporter.pomangam.common.util.Number"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
</head>
<body style="background-color: #FFF">

	<%	
		String curTarget = (String) request.getParameter("idx");
		
		@SuppressWarnings({"unchecked", "rawtypes"})
		List<RestaurantBean> restaurantList = (List) request.getAttribute("restaurantList");
		
		String json = (String) request.getAttribute("target");
		List<TargetBean> list = new Gson().fromJson(
				json, 
				new TypeToken<List<TargetBean>>() {}.getType());
		TargetBean target = list.get(0);
	%>
	
	<!-- Navbar -->
	<jsp:include page="../parts/header.jsp" /> 
	
	<!-- Content -->
	<div class="container center" style="margin-top:50px; margin-bottom: 1px">
		<!-- Target Info -->
		<div class="n-center n-padding-32 n-margin-bottom">
			<a href="" style="text-decoration:none; !important">
				<span class="n-xlarge n-bottombar" style="padding:5px">
					<span style="color:black">
					<%=target.getName() %>
					</span>
				</span>
			</a>
		</div>
		<div class="n-center">
			<span style="font-size:13px">
				누적 주문 수 : <b><% out.print(Number.numberWithCommas(target.getCnt_order())); %></b>건 <br>
				구독 회원 수 : <b>25</b>명
			</span>
		</div>
		
		
		<div class="n-center">
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
													도착 시간
												</th>
												<th>
													배차 간격
												</th>
											</tr>
											<tr>
												<td>
													학생회관 앞
												</td>
												<td>
													오후 12시 부터 ~ 오후 10시 까지 
												</td>
												<td>
													1시간 간격
												</td>
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
										예시1) 11시 00분 주문 가능 수량 : 20개<br>
										예시2) 11시 29분 주문 가능 수량 : 1개<br>
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
			
		
		<!-- Category 
		<div class="n-center">
			<hr>
			<div id="owl-carousel-basic" class="owl-carousel" style="display: inline-block!important">
				<div class="demo-item"><span class="n-target-category"><u>전체</u></span></div>
				<div class="demo-item"><span class="n-target-category">한식</span></div>
				<div class="demo-item"><span class="n-target-category">분식</span></div>
				<div class="demo-item"><span class="n-target-category">치킨</span></div>
				<div class="demo-item"><span class="n-target-category">피자</span></div>
				<div class="demo-item"><span class="n-target-category">중식</span></div>
				<div class="demo-item"><span class="n-target-category">양식</span></div>
				<div class="demo-item"><span class="n-target-category">패스트푸드</span></div>
				<div class="demo-item"><span class="n-target-category">야식</span></div>
				<div class="demo-item"><span class="n-target-category">디저트</span></div>
			</div>
			
		</div>
		-->
		<hr>
		<!-- Parter -->
		<div>
			<!-- 
			<h2 class="n-font landing-heading text-xs-center">주문 마감까지 <br> <span id="ob-time" style="color:#eb613e"></span> 남았습니다.</h2>
			 -->
			
			<ul class="list-group n-target-center">
		<%
		boolean tf = true;
		for(int i=0; i<restaurantList.size(); i++) {
			RestaurantBean bean = restaurantList.get(i);
			if(tf) {%>
				<li class="list-group-item n-noborder" style="padding:0px">
					<div class="row">	
			<%}%>
						<div class="col-md-6">
							<div class="box" style="cursor: pointer;" onclick="location.href='./restaurant.do?idx=<%=bean.getIdx() %>'">
								<a class="box-cell col-xs-4 b-r-1 valign-middle text-xs-center font-size-24 n-noborder" style="height:90px">
									<img src="<%=bean.getImgpath() %>" alt="<%=bean.getName() %>" class="n-target-icon" />
								</a>

								<div class="box-cell">
									<div class="box-container">
										<div class="box-row">
											<span class="box-cell valign-middle n-target-title"><%=bean.getName() %></span>
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
										
										<div class="box-row">
											<span class="box-cell valign-middle n-target-subtitle">
												남은 수량 : <b><% //out.print(Number.numberWithCommas(bean.getSum_limit())); %>개</b>
											</span>
										</div>
										 -->
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
		<%}%>

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
									도착 시간
								</th>
								<th>
									배차 간격
								</th>
							</tr>
							<tr>
								<td>
									학생회관 앞
								</td>
								<td>
									오후 12시 부터 ~ 오후 10시 까지 
								</td>
								<td>
									1시간 간격
								</td>
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
							예시1) 11시 00분 주문 가능 수량 : 20개<br>
							예시2) 11시 29분 주문 가능 수량 : 1개<br>
							<hr style="width:50%">
							또한 주문 사정에 따라 주문 가능 수량이 달라질 수 있습니다!
							
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
	$(function() {
		$('#owl-carousel-basic').owlCarousel({
			loop:   false,
			margin: 10,

			responsive:{
				0:    { items: 5 },
				600:  { items: 8 },
				1000: { items: 12 },
			},

			rtl: $('html').attr('dir') === 'rtl',
		});
	});
	</script>
	
</body>
</html>
