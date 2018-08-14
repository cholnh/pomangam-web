<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
</head>
<body style="background-color: #FFF">

	<!-- Navbar -->
	<%@ include file="../parts/header.jsp" %>

	<div class="container center" style="margin-top:50px">
		<!-- Target Info -->
        <div class="n-center" style="margin-top:16px">
            <a class="n-hover-opacity" href="" style="text-decoration:none; !important">
				<span class="n-xlarge n-bottombar n-padding-16"><span style="color:black">총 22,000원</span></span>
			</a>
        </div>
		<div class="n-center" style="margin-top:64px">
            <h3>배달정보</h3>
            <div style="display:inline-block">
                <div class="box-cell">
                     <i class="fa fa-asterisk" style="color:#eb613e"></i> 받는 시간
                </div>
                <div class="box-cell">
                    <select class="form-control m-b-2 n-payment-select">
                        <option>오후 12:00</option>
                        <option>오후 1:00</option>
                        <option>오후 6:00</option>
                        <option>오후 9:45</option>
                    </select>
                </div>               
            </div>
            <br>
            <div style="display:inline-block">
                <div class="box-cell">
                     <i class="fa fa-asterisk" style="color:#eb613e"></i> 받는 위치
                </div>
                <div class="box-cell">
                    <select class="form-control m-b-2 n-payment-select">
                        <option>학생회관 앞</option>
                    </select>
                </div>               
            </div>
            <br>
            <div style="display:inline-block">
                <div class="box-cell">
                     <i class="fa fa-asterisk" style="color:#eb613e"></i> 결제 수단
                </div>
                <div class="box-cell">
                    <select class="form-control m-b-2 n-payment-select">
                        <option>카카오페이</option>
                        <option>네이버페이</option>
                        <option>카드결제</option>
                        <option>계좌이체</option>
                        <option>핸드폰결제</option>
                        <option>무통장입금</option>
                    </select>
                </div>               
            </div>
            <br>
            <div style="display:inline-block; text-align: left">
                <label class="custom-control custom-checkbox" style="width:150px">
                    <input type="checkbox" class="custom-control-input" unchecked="">
                    <span class="custom-control-indicator"></span>
                    현금영수증 신청
                </label>
            </div>
		</div>
		<!-- Detail Description -->
        <hr class="n-payment-hr">
		<div class="n-center">
			<h3>결제정보</h3>
            <div class="n-payment-info">
                <div style="display:inline-block">
                    <div class="box-cell">
                         - 주문 금액 :&nbsp;&nbsp;&nbsp;
                    </div>
                    <div class="box-cell">
                        20,000원
                    </div>
                    <div class="box-cell">
                        <button class="btn btn-primary" style="font-size:8px!important;padding:2px;margin-left:12px;margin-bottom:4px">상세</button>
                    </div>
                </div>
                <br>
                <div style="display:inline-block">
                    <div class="box-cell">
                         - 배달 금액 :&nbsp;&nbsp;&nbsp;
                    </div>
                    <div class="box-cell">
                        2,000원
                    </div>
                    <div class="box-cell">
                        <button class="btn btn-primary" style="font-size:8px!important;padding:2px;margin-left:12px;margin-bottom:4px">상세</button>
                    </div>
                </div>
                <div style="display:inline-block">
                    <div class="box-cell">
                         - 할인 쿠폰
                    </div>
                    <div class="box-cell">
                        <select class="form-control m-b-2 n-payment-select">
                            <option>8월 할인 쿠폰</option>
                            <option>8월 할인 쿠폰</option>
                            <option>8월 할인 쿠폰</option>
                        </select>
                    </div>               
                </div>
                <br><br>
                <div style="display:inline-block">
                    <div class="box-cell">
                         <b>- 총 금액 :</b>&nbsp;&nbsp;&nbsp;
                    </div>
                    <div class="box-cell">
                        <b>22,000원</b>
                    </div>
                </div>
            </div>
		</div>
        <hr class="n-payment-hr">
        <div class="n-center" style="margin-bottom: 64px; margin-top:32px">
            <button class="btn btn-primary border-round" style="width:200px">결제하기</button>
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


</body>
</html>
    