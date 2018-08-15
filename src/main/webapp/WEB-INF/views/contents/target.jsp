<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
</head>
<body style="background-color: #FFF">

	<!-- Navbar -->
	<jsp:include page="../parts/header.jsp" /> 
	
	<!-- Content -->
	<div class="container center" style="margin-top:50px">
		<!-- Target Info -->
		<div class="n-center n-padding-32 n-margin-bottom">
			<a class="n-hover-opacity" href="" style="text-decoration:none; !important">
				<span class="n-xlarge n-bottombar n-padding-16"><span style="color:black">한국 항공대학교</span></span>
			</a>
		</div>
		<h3 class="landing-subheading text-xs-center text-muted ">누적 주문 수 : <b>14,934</b>건<br>구독 회원 수 : <b>295</b>명
		</h3>
		<div id="nn"></div>
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
									<h3>진행중인 이벤트가 없습니다.</h3>
								</div>
							</div>
						</div>
					</td>
					<td>
						<div class="n-dropdown-hover hoverTrigger" style="width:auto; text-align:center">
							<a id="hoverBtn2" class="btn btn-primary">배달 장소 / 시간</a>
							<div class="n-dropdown-content n-card-4 n-target-detailinfo hoverContents">
								<div class="n-container" style="padding:0px">
									<h3>주문 마감</h3>
									
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
									
									<h3>배달 도착</h3>
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
			<h2 class="landing-heading text-xs-center">주문 마감까지 <span style="color:#eb613e"><u>35분</u></span> 남았습니다.</h2>
			
			
			<ul class="list-group n-target-center">
				<li class="list-group-item n-noborder">
					<div class="row">
						<div class="col-md-6">
							<div class="box n-hover-shadow" onclick="location.href='./restaurant.do'">
								<a class="box-cell col-xs-4 b-r-1 valign-middle text-xs-center font-size-24 n-noborder" style="height:90px">
									<img src="resources/img/target/1/1.png" alt="베스킨라빈스" class="n-target-icon" />
								</a>

								<div class="box-cell">
									<div class="box-container">
										<div class="box-row">
											<span class="box-cell valign-middle n-target-title">베스킨 라빈스</span>
										</div>
										<div class="box-row">
											<a href="./restaurant.do" class="box-cell valign-middle n-nodec">
												<i class="pull-xs fa fa-star"></i>
												4.7&nbsp;&nbsp;
												<i class="pull-xs fa fa-commenting"></i>
												132
											</a>
										</div>
										<div class="box-row">
											<span class="box-cell valign-middle n-target-subtitle">남은 수량 : <b>47개</b></span>
										</div>
									</div>
								</div>

								<a href="#" class="box-cell col-xs-1 b-r-1 valign-middle text-xs-center font-size-24 n-noborder n-nodec">
									<i class="fa fa-angle-right"></i>
								</a>
							</div>
						</div>
						<div class="col-md-6">
							<div class="box">
								<a href="#" class="box-cell col-xs-4 b-r-1 valign-middle text-xs-center font-size-24 n-noborder" style="height:90px">
									<img src="resources/img/target/1/2.png" alt="서브웨이" class="n-target-icon" />
								</a>

								<div class="box-cell">
									<div class="box-container">
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec n-target-title">
												서브웨이
											</a>
										</div>
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec">
												<i class="pull-xs fa fa-star"></i>
												4.7&nbsp;&nbsp;
												<i class="pull-xs fa fa-commenting"></i>
												132
											</a>
										</div>
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec">
												<span class="n-target-subtitle">남은 수량 : <b>47개</b></span>
											</a>
										</div>
									</div>
								</div>

								<a href="#" class="box-cell col-xs-1 b-r-1 valign-middle text-xs-center font-size-24 n-noborder n-nodec">
									<i class="fa fa-angle-right"></i>
								</a>
							</div>
						</div>
					</div>
				</li>
				
				<li class="list-group-item n-noborder">
					<div class="row">
						<div class="col-md-6">
							<div class="box">
								<a href="#" class="box-cell col-xs-4 b-r-1 valign-middle text-xs-center font-size-24 n-noborder" style="height:90px">
									<img src="resources/img/target/1/3.png" alt="설빙" class="n-target-icon" />
								</a>

								<div class="box-cell">
									<div class="box-container">
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec n-target-title">
												설빙
											</a>
										</div>
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec">
												<i class="pull-xs fa fa-star"></i>
												4.7&nbsp;&nbsp;
												<i class="pull-xs fa fa-commenting"></i>
												132
											</a>
										</div>
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec">
												<span class="n-target-subtitle">남은 수량 : <b>47개</b></span>
											</a>
										</div>
									</div>
								</div>

								<a href="#" class="box-cell col-xs-1 b-r-1 valign-middle text-xs-center font-size-24 n-noborder n-nodec">
									<i class="fa fa-angle-right"></i>
								</a>
							</div>
						</div>
						<div class="col-md-6">
							<div class="box">
								<a href="#" class="box-cell col-xs-4 b-r-1 valign-middle text-xs-center font-size-24 n-noborder" style="height:90px">
									<img src="resources/img/target/1/4.png" alt="할매순대국" class="n-target-icon" />
								</a>

								<div class="box-cell">
									<div class="box-container">
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec n-target-title">
												큰맘 할매순대국
											</a>
										</div>
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec">
												<i class="pull-xs fa fa-star"></i>
												4.7&nbsp;&nbsp;
												<i class="pull-xs fa fa-commenting"></i>
												132
											</a>
										</div>
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec">
												<span class="n-target-subtitle">남은 수량 : <b>47개</b></span>
											</a>
										</div>
									</div>
								</div>

								<a href="#" class="box-cell col-xs-1 b-r-1 valign-middle text-xs-center font-size-24 n-noborder n-nodec">
									<i class="fa fa-angle-right"></i>
								</a>
							</div>
						</div>
					</div>
				</li>
				
				<li class="list-group-item n-noborder">
					<div class="row">
						<div class="col-md-6">
							<div class="box">
								<a href="#" class="box-cell col-xs-4 b-r-1 valign-middle text-xs-center font-size-24 n-noborder" style="height:90px">
									<img src="resources/img/target/1/5.png" alt="피자스쿨" class="n-target-icon" />
								</a>

								<div class="box-cell">
									<div class="box-container">
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec n-target-title">
												피자스쿨
											</a>
										</div>
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec">
												<i class="pull-xs fa fa-star"></i>
												4.7&nbsp;&nbsp;
												<i class="pull-xs fa fa-commenting"></i>
												132
											</a>
										</div>
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec">
												<span class="n-target-subtitle">남은 수량 : <b>47개</b></span>
											</a>
										</div>
									</div>
								</div>

								<a href="#" class="box-cell col-xs-1 b-r-1 valign-middle text-xs-center font-size-24 n-noborder n-nodec">
									<i class="fa fa-angle-right"></i>
								</a>
							</div>
						</div>
						<div class="col-md-6">
							<div class="box">
								<a href="#" class="box-cell col-xs-4 b-r-1 valign-middle text-xs-center font-size-24 n-noborder" style="height:90px">
									<img src="resources/img/target/1/6.png" alt="버거킹" class="n-target-icon" />
								</a>

								<div class="box-cell">
									<div class="box-container">
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec n-target-title">
												버거킹
											</a>
										</div>
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec">
												<i class="pull-xs fa fa-star"></i>
												4.7&nbsp;&nbsp;
												<i class="pull-xs fa fa-commenting"></i>
												132
											</a>
										</div>
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec">
												<span class="n-target-subtitle">남은 수량 : <b>47개</b></span>
											</a>
										</div>
									</div>
								</div>

								<a href="#" class="box-cell col-xs-1 b-r-1 valign-middle text-xs-center font-size-24 n-noborder n-nodec">
									<i class="fa fa-angle-right"></i>
								</a>
							</div>
						</div>
					</div>
				</li>
				
				<li class="list-group-item n-noborder">
					<div class="row">
						<div class="col-md-6">
							<div class="box">
								<a href="#" class="box-cell col-xs-4 b-r-1 valign-middle text-xs-center font-size-24 n-noborder" style="height:90px">
									<img src="resources/img/target/1/7.png" alt="KFC" class="n-target-icon" />
								</a>

								<div class="box-cell">
									<div class="box-container">
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec n-target-title">
												KFC
											</a>
										</div>
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec">
												<i class="pull-xs fa fa-star"></i>
												4.7&nbsp;&nbsp;
												<i class="pull-xs fa fa-commenting"></i>
												132
											</a>
										</div>
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec">
												<span class="n-target-subtitle">남은 수량 : <b>47개</b></span>
											</a>
										</div>
									</div>
								</div>

								<a href="#" class="box-cell col-xs-1 b-r-1 valign-middle text-xs-center font-size-24 n-noborder n-nodec">
									<i class="fa fa-angle-right"></i>
								</a>
							</div>
						</div>
						<div class="col-md-6">
							<div class="box">
								<a href="#" class="box-cell col-xs-4 b-r-1 valign-middle 
												   text-xs-center font-size-24 n-noborder" style="height:90px">
									<img src="resources/img/target/1/8.jpg" alt="한솥 도시락" class="n-target-icon" />
								</a>

								<div class="box-cell">
									<div class="box-container">
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec n-target-title">
												한솥 도시락
											</a>
										</div>
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec">
												<i class="pull-xs fa fa-star"></i>
												4.7&nbsp;&nbsp;
												<i class="pull-xs fa fa-commenting"></i>
												132
											</a>
										</div>
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec">
												<span class="n-target-subtitle">남은 수량 : <b>47개</b></span>
											</a>
										</div>
									</div>
								</div>

								<a href="#" class="box-cell col-xs-1 b-r-1 valign-middle text-xs-center font-size-24 n-noborder n-nodec">
									<i class="fa fa-angle-right"></i>
								</a>
							</div>
						</div>
					</div>
				</li>

				<li class="list-group-item n-noborder">
					<div class="row">
						<div class="col-md-6">
							<div class="box">
								<a href="#" class="box-cell col-xs-4 b-r-1 valign-middle text-xs-center font-size-24 n-noborder" style="height:90px">
									<img src="resources/img/target/1/9.png" alt="엽기떡볶이" class="n-target-icon" />
								</a>

								<div class="box-cell">
									<div class="box-container">
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec n-target-title">
												엽기떡볶이
											</a>
										</div>
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec">
												<i class="pull-xs fa fa-star"></i>
												4.7&nbsp;&nbsp;
												<i class="pull-xs fa fa-commenting"></i>
												132
											</a>
										</div>
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec">
												<span class="n-target-subtitle">남은 수량 : <b>47개</b></span>
											</a>
										</div>
									</div>
								</div>

								<a href="#" class="box-cell col-xs-1 b-r-1 valign-middle text-xs-center font-size-24 n-noborder n-nodec">
									<i class="fa fa-angle-right"></i>
								</a>
							</div>
						</div>
						<div class="col-md-6">
							<div class="box">
								<a href="#" class="box-cell col-xs-4 b-r-1 valign-middle 
												   text-xs-center font-size-24 n-noborder" style="height:90px">
									<img src="resources/img/target/1/10.png" alt="교촌치킨" class="n-target-icon" />
								</a>

								<div class="box-cell">
									<div class="box-container">
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec n-target-title">
												교촌치킨
											</a>
										</div>
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec">
												<i class="pull-xs fa fa-star"></i>
												4.7&nbsp;&nbsp;
												<i class="pull-xs fa fa-commenting"></i>
												132
											</a>
										</div>
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec">
												<span class="n-target-subtitle">남은 수량 : <b>47개</b></span>
											</a>
										</div>
									</div>
								</div>

								<a href="#" class="box-cell col-xs-1 b-r-1 valign-middle text-xs-center font-size-24 n-noborder n-nodec">
									<i class="fa fa-angle-right"></i>
								</a>
							</div>
						</div>
					</div>
				</li>
				
				<li class="list-group-item n-noborder">
					<div class="row">
						<div class="col-md-6">
							<div class="box">
								<a href="#" class="box-cell col-xs-4 b-r-1 valign-middle text-xs-center font-size-24 n-noborder" style="height:90px">
									<img src="resources/img/target/1/11.png" alt="도미노피자" class="n-target-icon " />
								</a>

								<div class="box-cell">
									<div class="box-container">
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec n-target-title">
												도미노피자
											</a>
										</div>
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec">
												<i class="pull-xs fa fa-star"></i>
												4.7&nbsp;&nbsp;
												<i class="pull-xs fa fa-commenting"></i>
												132
											</a>
										</div>
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec">
												<span class="n-target-subtitle">남은 수량 : <b>47개</b></span>
											</a>
										</div>
									</div>
								</div>

								<a href="#" class="box-cell col-xs-1 b-r-1 valign-middle text-xs-center font-size-24 n-noborder n-nodec">
									<i class="fa fa-angle-right"></i>
								</a>
							</div>
						</div>

					</div>
				</li>
				
			</ul>
		</div>
	</div>
	
	<div class="n-target-mobilebtn">
		<button class="btn btn-primary" onclick="location.href='./cart.do'"
		style="width:100%;height:100%;font-size:20px;font-weight:bold">
			<i class="fa fa-shopping-cart" style="margin-right:6px"></i>
			장바구니 (3)
		</button>
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
	
	<script src="resources/js/common.js"></script>

	<script>
	
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
