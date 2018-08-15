<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
</head>
<body style="background-color: #FFF">

	<!-- Navbar -->
	<jsp:include page="../parts/header.jsp" /> 

	<div class="container center" style="margin-top:50px">
		<!-- Target Info -->
		<div class="n-center n-padding-32 n-margin-bottom">
			<a class="n-hover-opacity" href="" style="text-decoration:none; !important">
				<span class="n-xlarge n-bottombar n-padding-16">
                    <span style="color:black">
                        맘스터치 가라뫼점
                    </span>
                </span>
			</a>
		</div>
		<h3 class="landing-subheading text-xs-center text-muted ">
            <i class="pull-xs fa fa-commenting"></i>
             #존맛탱 #친절 #맛집 #항공대
        </h3>
		<div class="n-center">
            <i class="pull-xs fa fa-star"></i>
            4.7&nbsp;&nbsp;
            <i class="pull-xs fa fa-commenting"></i>
            132
		</div>
        <div class="n-center">   
             <i class="pull-xs fa fa-star"></i>
            가라뫼 사거리 32-15
        </div>
		
		<!-- Category -->
		<div class="n-center">
			<hr>
            <div>
                Event
            </div>
			<hr>
		</div>
		
		<!-- Parter -->
		<div>
			<h2 class="landing-heading text-xs-center">주문 마감까지 <span style="color:#eb613e"><u>35분</u></span> 남았습니다.</h2>
			
			<div class="container-fluid n-target-center" >
				<div class="row">
					<div class="col-xs-4 col-sm-3">
						<div class="box n-center n-hover-opacity" onclick="location.href='./product.do'">
							<a href="#" class="valign-middle n-noborder"> <img
								src="resources/img/restaurant/1.jpg" alt="엽기떡볶이" class="n-restaurant-icon"
								style="margin-top: 3px" />

							</a>
							<div style="margin-top: 3px">
								<b>화이트 갈릭버거</b> <br> 6,000원
							</div>
							<button class="btn btn-primary "
								style="font-size: 8px !important; padding: 2px; margin-bottom: 3px">마감임박</button>

						</div>
					</div>
					<div class="col-xs-4 col-sm-3">
						<div class="box n-center n-hover-opacity" onclick="location.href='./product.do'">
							<a href="#" class="valign-middle n-noborder"> <img
								src="resources/img/restaurant/1.jpg" alt="엽기떡볶이" class="n-restaurant-icon"
								style="margin-top: 3px" />

							</a>
							<div style="margin-top: 3px">
								<b>화이트 갈릭버거</b> <br> 6,000원
							</div>
							<button class="btn btn-primary "
								style="font-size: 8px !important; padding: 2px; margin-bottom: 3px">마감임박</button>

						</div>
					</div>
					<div class="col-xs-4 col-sm-3">
						<div class="box n-center n-hover-opacity" onclick="location.href='./product.do'">
							<a href="#" class="valign-middle n-noborder"> <img
								src="resources/img/restaurant/1.jpg" alt="엽기떡볶이" class="n-restaurant-icon"
								style="margin-top: 3px" />

							</a>
							<div style="margin-top: 3px">
								<b>화이트 갈릭버거</b> <br> 6,000원
							</div>
							<button class="btn btn-primary "
								style="font-size: 8px !important; padding: 2px; margin-bottom: 3px">마감임박</button>

						</div>
					</div>
					<div class="col-xs-4 col-sm-3">
						<div class="box n-center n-hover-opacity" onclick="location.href='./product.do'">
							<a href="#" class="valign-middle n-noborder"> <img
								src="resources/img/restaurant/1.jpg" alt="엽기떡볶이" class="n-restaurant-icon"
								style="margin-top: 3px" />

							</a>
							<div style="margin-top: 3px">
								<b>화이트 갈릭버거</b> <br> 6,000원
							</div>
							<button class="btn btn-primary "
								style="font-size: 8px !important; padding: 2px; margin-bottom: 3px">마감임박</button>

						</div>
					</div>
					<div class="col-xs-4 col-sm-3">
						<div class="box n-center n-hover-opacity" onclick="location.href='./product.do'">
							<a href="#" class="valign-middle n-noborder"> <img
								src="resources/img/restaurant/1.jpg" alt="엽기떡볶이" class="n-restaurant-icon"
								style="margin-top: 3px" />

							</a>
							<div style="margin-top: 3px">
								<b>화이트 갈릭버거</b> <br> 6,000원
							</div>
							<button class="btn btn-primary "
								style="font-size: 8px !important; padding: 2px; margin-bottom: 3px">마감임박</button>

						</div>
					</div>
				</div>
			</div>

			
		</div>
        
		<div class="n-target-mobilebtn">
			<button class="btn btn-primary" onclick="location.href='./cart.do'"
			style="width:100%;height:100%;font-size:20px;font-weight:bold">
				<i class="fa fa-shopping-cart" style="margin-right:6px"></i>
				장바구니 (3)
			</button>
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
	$('#header-home').hide();
	$('#header-back').show();
	$('#header-back').prop('href', './target.do?');
	</script>
</body>
</html>