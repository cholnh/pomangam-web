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
        
		<div class="n-center">
			<div class="n-center n-padding-32 n-margin-bottom">
				<a class="n-hover-opacity" href="" style="text-decoration:none; !important">
					<span class="n-xlarge n-bottombar" style="padding:5px"><span style="color:black">장바구니</span></span>
				</a>
			</div>
            <div class="center n-border">
            	<div style="text-align:right; margin-right:12px">
					<button class="btn btn-secondary n-small" onclick="removeAllCart()">전체삭제</button>
				</div>
				<div style="text-align: left;margin:12px">
					<table id="cartTable" class="table table-hover">
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
						<h3 class="n-font">총 <span id="total">22,000</span>원</h3>
					</div>
				</div>
            </div>
		</div>
		
        <hr class="n-payment-hr">
		<div class="n-target-mobilebtn n-on-mobile">
			<button class="btn btn-primary" onclick="location.href='./payment.do'"
			style="width:100%;height:100%;font-size:20px;font-weight:bold">
				주문하기
			</button>
		</div>
        <div class="n-center n-on-pc" style="margin-bottom: 64px; margin-top:32px">
            <button class="btn btn-primary" onclick="location.href='./payment.do'"
            style="width:40%;font-size:20px;font-weight:bold">
            	주문하기
            </button>
        </div>
	</div>


	<!-- jQuery -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<!-- Core scripts -->
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/pixeladmin.min.js"></script>
	
	<script>
	$('#header-home').hide();
	$('#header-back').show();
	$('#header-back').prop('href', 'javascript:history.back()');
	
	function removeAllCart() {
		// do server part	
	
		$('#cartTable').empty();
		$('#total').text('0');
	}
	</script>

</body>
</html>
    