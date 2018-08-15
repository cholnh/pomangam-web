<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<!-- Icon -->
	<link href="images/favicon.ico" rel="shortcut icon">	
</head>

<body>
	<nav id="nav" class="navbar px-navbar sticky">
		<div class="container">
			<div class="navbar-header">
				<a id="header-home" href="./" class="scroll-to navbar-brand"><b>Mr. Porter</b></a>
				<a id="header-back" href="javascript:history.back()" class="scroll-to navbar-brand" style="display:none">
					<i class="fa fa-arrow-left" style="font-size:20px!important"></i>
				</a>
			</div>

			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target=".navbar-collapse"
				aria-expanded="false">
				<i class="navbar-toggle-icon"></i>
			</button>

			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li>
						<div class="n-dropdown-hover n-transparent n-right n-on-pc" style="width:100px; text-align:center">
							<a href="./cart.do" class="scroll-to">장바구니&nbsp;(3)</a>
							<div class="n-dropdown-content n-card-4"
								style="width: 350px; right: 0">
								<div class="" style="text-align: center">
									<h4><b>총 22,000원</b></h4>
								</div>
								
								<div style="text-align:right; margin-right:12px">
									<button class="btn btn-secondary n-small">전체삭제</button>
								</div>
								<div style="text-align: left;margin:12px">
									<table class="table table-hover">
										<thead>
										</thead>
										<colgroup>
					                        <col style="width:70px">
					                        <col style="width: 220px;">
					                        <col style="width: 20px">
					                    </colgroup>
										<tbody>
											<tr>
												<td>
													<a href="#" class="valign-middle n-noborder">
						                                <img src="resources/img/restaurant/1.jpg" alt="화이트 갈릭버거" class="n-cart-icon" />
													</a>
												</td>
												<td>
													<div class="row" style="margin-left:12px">
														<span><b>화이트 갈릭버거</b></span>
													</div>
													<div class="row" style="margin-left:12px">
														<b>6,000원</b>
														<input type="number" min=1 value=1 style="width:40px;margin-left:6px">
													</div>
												</td>
												<td>
													<i class="fa fa-remove"></i>
												</td>
											</tr>
											<tr>
												<td>
													<a href="#" class="valign-middle n-noborder">
						                                <img src="resources/img/restaurant/2.jpg" alt="화이트 갈릭버거" class="n-cart-icon" />
													</a>
												</td>
												<td>
													<div class="row" style="margin-left:12px">
														<span><b>화이트 갈릭버거</b></span>
													</div>
													<div class="row" style="margin-left:12px">
														<b>6,000원</b>
														<input type="number" min=1 value=1 style="width:40px;margin-left:6px">
													</div>
												</td>
												<td>
													<i class="fa fa-remove"></i>
												</td>
											</tr>
											<tr>
												<td>
													<a href="#" class="valign-middle n-noborder">
						                                <img src="resources/img/restaurant/3.jpg" alt="화이트 갈릭버거" class="n-cart-icon" />
													</a>
												</td>
												<td>
													<div class="row" style="margin-left:12px">
														<span><b>화이트 갈릭버거</b></span>
													</div>
													<div class="row" style="margin-left:12px">
														<b>6,000원</b>
														<input type="number" min=1 value=1 style="width:40px;margin-left:6px">
													</div>
												</td>
												<td>
													<i class="fa fa-remove"></i>
												</td>
											</tr>
										</tbody>
									</table>
									
									<div class="n-center" style="margin-top:32px;margin-bottom:32px">
										<button class="btn btn-primary" style="width:60%;font-size:20px;font-weight:bold" 
											onclick="location.href='./payment.do'">결제하기</button>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li><a href="./login.do" class="scroll-to">로그인</a></li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>