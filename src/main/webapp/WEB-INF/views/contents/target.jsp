<%@page import="com.mrporter.pomangam.target.vo.OrdertimeBean"%>
<%@page import="com.mrporter.pomangam.target.vo.DestinationBean"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="com.mrporter.pomangam.target.vo.TargetBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.mrporter.pomangam.restaurant.vo.RestaurantBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
</head>
<body style="background-color: #FFF">

	<%	
		String curTarget = (String) request.getParameter("idx");
		
		@SuppressWarnings({"unchecked", "rawtypes"})
		List<DestinationBean> destination = (List) request.getAttribute("destination");
		@SuppressWarnings({"unchecked", "rawtypes"})
		List<OrdertimeBean> ordertime = (List) request.getAttribute("ordertime");
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
	<div class="container center" style="margin-top:50px">
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
			<span style="font-size:13px">누적 주문 수 : <b><%=target.getCnt_order() %></b>건<br>구독 회원 수 : <b>25</b>명
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
									<h3 class="n-font">주문 마감</h3>
									
									<table class="table table-hover" style="text-align:left">
										<tbody>
											<tr>
												<th>
													점심 주문
												</th>
												<th>
													저녁 주문
												</th>
												<th>
													야식 주문
												</th>
											</tr>
											<tr>
												<td>
													<%=ordertime.get(0).getEnd() %>
													마감
												</td>
												<td>
													<%=ordertime.get(1).getEnd() %>
													마감
												</td>
												<td>
													<%=ordertime.get(2).getEnd() %>
													마감
												</td>
											</tr>
										</tbody>
									</table>
									
									<br>
									
									<h3 class="n-font">배달 도착</h3>
									<table class="table table-hover" style="text-align:left">
										<tbody>
											<tr>
												<th>
													장소
												</th>
												<th>
													점심
												</th>
												<th>
													저녁
												</th>
												<th>
													야식
												</th>
											</tr>
											<tr>
												<td>
													<%=destination.get(0).getDestination() %>
												</td>
												<td>
													<%=destination.get(0).getArrival() %>
												</td>
												<td>
													<%=destination.get(1).getArrival() %>
												</td>
												<td>
													<%=destination.get(2).getArrival() %>
												</td>
											</tr>
											<tr>
												<td>
													<%=destination.get(3).getDestination() %>
												</td>
												<td>
													<%=destination.get(3).getArrival() %>
												</td>
												<td>
													<%=destination.get(4).getArrival() %>
												</td>
												<td>
													<%=destination.get(5).getArrival() %>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</td>
				</tr>
			</tbody>
			</table>
			
		</div>
			
		
		<!-- Category -->
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
			<hr>
		</div>
		
		<!-- Parter -->
		<div>
			<h2 class="n-font landing-heading text-xs-center">주문 마감까지 <br> <span id="ob-time" style="color:#eb613e"></span> 남았습니다.</h2>
			
			
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
							<div class="box n-hover-opacity" onclick="location.href='./restaurant.do?idx=<%=bean.getIdx() %>'">
								<a class="box-cell col-xs-4 b-r-1 valign-middle text-xs-center font-size-24 n-noborder" style="height:90px">
									<img src="<%=bean.getImgpath() %>" alt="<%=bean.getName() %>" class="n-target-icon" />
								</a>

								<div class="box-cell">
									<div class="box-container">
										<div class="box-row">
											<span class="box-cell valign-middle n-target-title"><%=bean.getName() %></span>
										</div>
										<div class="box-row">
											<a class="box-cell valign-middle n-nodec">
												<i class="pull-xs fa fa-star"></i>
												<%=bean.getCnt_star() %>&nbsp;&nbsp;
												<i class="pull-xs fa fa-commenting"></i>
												<%=bean.getCnt_comment() %>
											</a>
										</div>
										<div class="box-row">
											<span class="box-cell valign-middle n-target-subtitle">남은 수량 : <b><%=bean.getSum_limit() %>개</b></span>
										</div>
									</div>
								</div>

								<a href="#" class="box-cell col-xs-1 b-r-1 valign-middle text-xs-center font-size-24 n-noborder n-nodec">
									<i class="fa fa-angle-right"></i>
								</a>
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
						<span style="font-weight:bold;font-size:13px;">주문 마감</span>
					</div>
					
					<table class="table table-hover" style="text-align:left;font-size:11px;">
						<tbody>
							<tr>
								<th>
									점심 주문
								</th>
								<th>
									저녁 주문
								</th>
								<th>
									야식 주문
								</th>
							</tr>
							<tr>
								<td>
									오전 11:00 마감
								</td>
								<td>
									오후 5:00 마감
								</td>
								<td>
									오후 8:45 마감
								</td>
							</tr>
						</tbody>
					</table>
					
					<br>
					
					<div style="text-align:center;margin-bottom:12px">
						<span style="font-weight:bold;font-size:13px">배달 도착</span>
					</div>
					<table class="table table-hover" style="text-align:left;font-size:11px;">
						<tbody>
							<tr>
								<th>
									장소
								</th>
								<th>
									점심
								</th>
								<th>
									저녁
								</th>
								<th>
									야식
								</th>
							</tr>
							<tr>
								<td>
									학생회관 앞
								</td>
								<td>
									오후 12:00
								</td>
								<td>
									오후 6:00
								</td>
								<td>
									오후 9:45
								</td>
							</tr>
							<tr>
								<td>
									도서관 앞
								</td>
								<td>
									오후 12:25
								</td>
								<td>
									오후 6:25
								</td>
								<td>
									오후 10:00
								</td>
							</tr>
						</tbody>
					</table>
				</div>

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
	
	if(mobilecheck()) {
		$('.hoverTrigger').removeClass('n-dropdown-hover');
		$('#hoverBtn1').off('click').on('click', function(e) {
			$('#modal1').modal();
		});
		$('#hoverBtn2').off('click').on('click', function(e) {
			$('#modal2').modal();
		});
	} 
	
	var tmp = <%=new Gson().toJson(ordertime) %>;
	var ordertime = [];
	tmp.forEach(function(e){
		var time = {};
		if(e.end.substring(0, 2) == '오전') {
			var t = e.end.substring(3);
			time.hour = parseInt(t.substring(0, t.indexOf(':')));
			time.minute = 	parseInt(t.substring(t.indexOf(':')+1));
		} else if(e.end.substring(0, 2) == '오후') {
			var t = e.end.substring(3);
			time.hour = parseInt(t.substring(0, t.indexOf(':'))) + 12;
			time.minute = 	parseInt(t.substring(t.indexOf(':')+1));
		}
		ordertime.push(time);
	});

	realtimeClock();
	
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
