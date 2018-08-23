<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
	<%
		String payNumber = (String) request.getAttribute("payNumber");
		String payPassword = (String) request.getAttribute("payPassword");
		String boxNumber = (String) request.getAttribute("boxNumber");
		
	%>
	<jsp:include page="../parts/header.jsp" /> 
	<div style="margin-top:100px;margin-bottom:160px">
		<center>
			
			<div class="n-center n-padding-32 n-margin-bottom">
				<a style="text-decoration:none; !important">
					<span class="n-xlarge n-bottombar" style="padding:5px">
						<span style="color:black; font-size:32px">
							주문 완료
						</span>
					</span>
				</a>
			</div>
			<div class="center">
				<div style="text-align:left;margin:6px">
						<span style="font-size:14px; color:gray">
							주문번호 : no.<%=payNumber %>
						</span>
					</div>
				<div class="n-border">
					<br>
					<span style="font-size:23px; font-weight: bold">아래 번호를 꼭 기억해 주세요.</span><br> 
					<span style="font-size:13px">
						※ 음식 교환 시 사용되는 번호입니다.
					</span><br> 
					<span style="margin-top:16px; font-size:128px; "> 
						<%=boxNumber %>
					</span>
				</div>
			</div>
			<!-- <button class="btn btn-primary" type="button" onclick="location.href='./'">홈</button> -->
			<button class="btn btn-primary" style="font-size:20px;margin-top:32px" type="button" onclick="location.href='./'">홈으로</button>
		</center>
	</div>
	<%@ include file="../parts/footer.jsp" %>
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
	$('#ob-mobileCartBtn').hide();
	$('#ob-footerBtn').hide();
	
	</script>
	
</body>
</html>