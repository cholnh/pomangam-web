<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

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

	<div class="container center" style="margin-top:50px">
		<!-- Target Info -->
        <div class="n-center" style="margin-top:16px">
            <a href="#" class="valign-middle n-noborder">
                <img src="resources/img/menu/20.jpg" alt="엽기떡볶이" class="n-product-icon n-card" />
            </a>
            <div style="margin:12px">
                <span style="font-size: 20px; font-weight: bold;">화이트 갈릭버거</span>
            </div>
            <a class="btn btn-primary " style="font-size:10px!important;padding:3px">57개 남음</a>
            <div style="margin-top:18px">
                
                <input type="number" style="width:40px" min=0 value=1> 개
                <span style="color: #f3753a; font-weight: bold; margin-left: 12px; font-size: 15px;">
                    6,000원
                </span>
            </div>
			<div class="n-margin">
				<button class="btn border-round" style="background-color: darkgray; color:white">장바구니 담기</button>
				<button class="btn btn-primary border-round">바로 주문</button>
			</div>
			
        </div>
		
		<!-- Detail Description -->
        <hr>
		<div class="n-center" style="">
			<div class="n-product-desc">
				크림처럼 부드러운 화이트 갈릭 소스에<br>
				프리미엄 더블햄과 통가슴살 패티까지<br>
				하나에 다 담은 묵직한 버거!<br>
			</div>
			<div style="width:60%!important;margin-top:64px; display: inline-block;text-align: left">
				<div class="n-on-pc">
					<b>영양성분</b> (1일 영양소 기준치에 대한 비율)
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
								<th scope="row">247</th>
								<td>572</td>
								<td>911(46)</td>
								<td>2</td>
								<td>7(47)</td>
								<td>38(69)</td>
								<td>647</td>
								<td>1022</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
            <div class="" style="margin-top:32px">
                <h2 class="landing-heading text-xs-center">추천상품</h2>
                <a href="#" class="valign-middle n-noborder">
                    <img src="resources/img/menu/3.jpg" alt="엽기떡볶이" class="n-product-recommand n-card" />
                </a>
                 <a href="#" class="valign-middle n-noborder">
                    <img src="resources/img/menu/5.JPG" alt="엽기떡볶이" class="n-product-recommand n-card" />
                </a>
                 <a href="#" class="valign-middle n-noborder">
                    <img src="resources/img/menu/7.jpg" alt="엽기떡볶이" class="n-product-recommand n-card" />
                </a>
                 <a href="#" class="valign-middle n-noborder">
                    <img src="resources/img/menu/12.jpg" alt="엽기떡볶이" class="n-product-recommand n-card" />
                </a>
            </div>
		</div>
       
        <div class="n-menu-bottombtn n-on-mobile">
            <button class="btn btn-primary border-round">17,000원 결제하기</button>
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


</body>
</html>