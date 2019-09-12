<%@page import="com.mrporter.pomangam.payment.vo.PaymentIndexBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="resources/img/favicon.ico" rel="shortcut icon">
</head>
<body>
	<%	
		String tf = request.getParameter("error");
		boolean error = tf==null?false:tf.equals("true");
	%>
	<jsp:include page="../parts/header.jsp" /> 

	<div class="n-content">
		<div class="n-loginContent">
			<div class="n-login-container">
				<div class="n-border center n-card">
					<div class="n-margin">
						<div class="n-center n-padding-32 n-margin-bottom">
							<a class="" style="text-decoration:none; !important">
								<span class="n-xlarge n-bottombar" style="padding:5px"><span style="color:black">비회원 주문확인</span></span>
							</a>
						</div>
						
						<form id="orderForm" action="./myorder.do" method="post">
							<div class="n-row-padding">
								<div class="n-twothird">
									<input type="text" class="n-input n-border" 
										id="guestname" name="guestname" type="text" placeholder="이름" required>
									<input type="tel" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}|[0-9]{11}" class="n-input n-border" 
										id="phonenumber" name="phonenumber" type="text" placeholder="핸드폰 번호" required>
									<input type="password" class="n-input n-border"
										id="password" name="password" type="text" placeholder="비밀번호 4자리" required>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								</div>
								<div class="n-third">
									<button type="submit" id="submitBtn" class="n-btn n-round n-loginBtn" 
											style="background-color: #FF866F; color: white">주문확인</button>
								</div>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>

	<%@ include file="../parts/footer.jsp" %>
	
	<script>
	$('#ob-mobileCartBtn').hide();
	$('#ob-footerBtn').hide();
	
	var error = <%=error %>;
	
	if(error) {
		toast('포만감','일치하는 주문이 없습니다.','warning');
	}
	
	$('#orderForm').submit(function() {
		$('#phonenumber').val($('#phonenumber').val().replace(/-/g,''));
	});
	
	</script>
	
</body>
</html>