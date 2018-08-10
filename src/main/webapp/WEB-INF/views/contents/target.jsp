<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">

  <title>Mr. Porter</title>

  <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,600,700,300&subset=latin" rel="stylesheet" type="text/css">
  <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <link href="http://cdn.linearicons.com/free/1.0.0/icon-font.min.css" rel="stylesheet" type="text/css">

  <!-- Core stylesheets -->
  <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="resources/css/pixeladmin.min.css" rel="stylesheet" type="text/css">
  <link href="resources/css/widgets.min.css" rel="stylesheet" type="text/css">

  <!-- Theme -->
  <link href="resources/css/themes/candy-orange.min.css" rel="stylesheet" type="text/css">

  <!-- Landing page CSS -->
  <link href="resources/css/landing.css" rel="stylesheet" type="text/css">
  <link href="resources/css/custom.css" rel="stylesheet" type="text/css">
	
</head>
<body style="background-color: #FFF">

  <!-- Navbar -->
  <nav class="navbar px-navbar sticky">
    <div class="container">
      <div class="navbar-header">
        <a href="./" class="scroll-to navbar-brand"><b>Mr. Porter</b></a>
      </div>

      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse" aria-expanded="false"><i class="navbar-toggle-icon"></i></button>

      <div class="collapse navbar-collapse">
        <ul class="nav navbar-nav navbar-right">
          <li><a href="./" class="scroll-to">주문하기</a></li>
          <li><a href="./" class="scroll-to">고객센터</a></li>
          <li><a href="./login.do" class="scroll-to">로그인</a></li>
        </ul>
      </div>
    </div>
  </nav>


	
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
		<div class="n-center">
			<button class="btn btn-primary">배달 장소 / 시간</button>
			<button class="btn btn-primary">이벤트</button>
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
							<div class="box">
								<a href="#" class="box-cell col-xs-4 b-r-1 valign-middle text-xs-center font-size-24 n-noborder">
									<img src="resources/img/target/1/1.png" alt="베스킨라빈스" class="n-target-icon" />
								</a>

								<div class="box-cell">
									<div class="box-container">
										<div class="box-row">
											<a href="#" class="box-cell valign-middle n-nodec n-target-title">
												베스킨 라빈스
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
								<a href="#" class="box-cell col-xs-4 b-r-1 valign-middle text-xs-center font-size-24 n-noborder">
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
								<a href="#" class="box-cell col-xs-4 b-r-1 valign-middle text-xs-center font-size-24 n-noborder">
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
								<a href="#" class="box-cell col-xs-4 b-r-1 valign-middle text-xs-center font-size-24 n-noborder">
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
								<a href="#" class="box-cell col-xs-4 b-r-1 valign-middle text-xs-center font-size-24 n-noborder">
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
								<a href="#" class="box-cell col-xs-4 b-r-1 valign-middle text-xs-center font-size-24 n-noborder">
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
								<a href="#" class="box-cell col-xs-4 b-r-1 valign-middle text-xs-center font-size-24 n-noborder">
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
												   text-xs-center font-size-24 n-noborder">
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
								<a href="#" class="box-cell col-xs-4 b-r-1 valign-middle text-xs-center font-size-24 n-noborder">
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
												   text-xs-center font-size-24 n-noborder">
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
								<a href="#" class="box-cell col-xs-4 b-r-1 valign-middle text-xs-center font-size-24 n-noborder">
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
	
	
  <!-- Footer -->
<footer class="n-footer">
  <button type="button" class="btn btn-primary btn-3d" onclick="goTop()">
	  <i class="fa fa-arrow-up" style="margin-right: 12px"></i>To the top
  </button>
  <div class=" " style="font-size:24px!important;margin-top:16px!important;margin-bottom:16px!important">
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-envelope w3-hover-opacity"></i>
    <i class="fa fa-bookmark w3-hover-opacity"></i>
  </div>
  <p style="font-size:11px; color:darkgray">123-45 JANGDANG-DONG , GANGNAM-GU, SEOUL, KOREA<br>
      TEL +82.10-5843-0627 / FAX +82.2.123.4567 / BUSSINESS NO. 546 05 00933<br>
      REPRESENTATIVE. CHOI, EUN SEONG</p>
  <p style="font-size:11px; color:black">
      COPYRIGHT © <b>Mr.Porter Corp.</b>
      ALL RIGHTS RESERVED.
  </p>
</footer>

  <!-- ==============================================================================
  |
  |  SCRIPTS
  |
  =============================================================================== -->

  <!-- jQuery -->
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

  <!-- Core scripts -->
  <script src="resources/js/bootstrap.min.js"></script>
  <script src="resources/js/pixeladmin.min.js"></script>

  <script src="resources/js/common.js"></script>

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
