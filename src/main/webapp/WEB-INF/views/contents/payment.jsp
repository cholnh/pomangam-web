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
			<h3 class="n-font">결제정보</h3>
            <div class="n-payment-info">
            <div class="center n-border">
            	<table class="n-payment-table2">
            		<thead>
            		</thead>
            		<colgroup>
		        		<col style="width:150px">
		                <col style="width: 150px;">
		                <col style="width: 50px;">
	            	</colgroup>
            		<tbody>
            			<tr>
            				<td>
            					주문 금액 :
            				</td>
            				<td>
            					20,000원
            				</td>
            				<td>
            					<button class="btn btn-primary" style="font-size:8px!important;padding:2px;margin-left:12px;margin-bottom:4px">상세</button>
            				</td>
            			</tr>
            			<tr>
            				<td>
            					배달 금액 :
            				</td>
            				<td>
            					2,000원
            				</td>
            				<td>
            					<button class="btn btn-primary" style="font-size:8px!important;padding:2px;margin-left:12px;margin-bottom:4px">상세</button>
            				</td>
            			</tr>
            			<tr>
            				<td>
            					할인 쿠폰 :
            				</td>
            				<td colspan=2>
            					<select class="form-control m-b-2 n-payment-select">
		                            <option>8월 할인 쿠폰</option>
		                            <option>8월 할인 쿠폰</option>
		                            <option>8월 할인 쿠폰</option>
		                        </select>
            				</td>
            			</tr>
            			<tr>
            				<td>
            					<b>최종 금액 :</b>
            				</td>
            				<td >
            					<b>22,000원</b>
            				</td>
            			</tr>
            		</tbody>
            	</table>
            	</div>
            </div>
		</div>
		
		<!-- Detail Description -->
        <hr class="n-payment-hr">
        <div class="n-center" style="margin-top:64px">
            <h3 class="n-font">배달정보</h3>
            <div class="center">
	            <table class="n-payment-table">
	            	<thead>
	            	</thead>
	            	<colgroup>
		        		<col style="width:100px">
		                <col style="width:150px;">
	            	</colgroup>
	            	<tbody>
	            		<tr>
		            		<td>
		            			<i class="fa fa-asterisk" style="color:#eb613e"></i> 받는 시간
		            		</td>
		            		<td>
		            			<select class="form-control n-payment-select" style="width:150px">
			                        <option>오후 12:00</option>
			                        <option>오후 1:00</option>
			                        <option>오후 6:00</option>
			                        <option>오후 9:45</option>
			                    </select>
		            		</td>
	            		</tr>
	            		<tr>
		            		<td>
		            			<i class="fa fa-asterisk" style="color:#eb613e"></i> 받는 위치
		            		</td>
		            		<td>
		            			<select class="form-control n-payment-select" style="width:150px">
			                        <option>학생회관 앞</option>
			                    </select>
		            		</td>
	            		</tr>
	            		<tr>
		            		<td>
		            			<i class="fa fa-asterisk" style="color:#eb613e"></i> 결제 수단
		            		</td>
		            		<td>
		            			<select class="form-control n-payment-select" style="width:150px">
			                        <option>카카오페이</option>
			                        <option>네이버페이</option>
			                        <option>카드결제</option>
			                        <option>계좌이체</option>
			                        <option>핸드폰결제</option>
			                        <option>무통장입금</option>
			                    </select>
		            		</td>
	            		</tr>
	            	</tbody>
	            </table>
	            <div class="center">
	            	<label class="custom-control custom-checkbox" style="width:150px;padding:0px">
	                    <input type="checkbox" class="custom-control-input" unchecked="">
	                    <span class="custom-control-indicator"></span>현금영수증 신청
	                </label>
                </div>
            </div>
		</div>
		
        <hr class="n-payment-hr">
		<div class="n-target-mobilebtn n-on-mobile">
			<button class="btn btn-primary" onclick="location.href=''"
			style="width:100%;height:100%;font-size:20px;font-weight:bold">
				22,000원 결제하기
			</button>
		</div>
        <div class="n-center n-on-pc" style="margin-bottom: 64px; margin-top:32px">
            <button class="btn btn-primary" onclick="location.href=''"
            style="width:40%;font-size:20px;font-weight:bold">
            22,000원 결제하기
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
	</script>

</body>
</html>
    