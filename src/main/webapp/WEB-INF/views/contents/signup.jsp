<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="resources/img/favicon.ico" rel="shortcut icon">
</head>ad>
<body>
	<%
	String username = (String) request.getAttribute("username");
	String name = (String) request.getAttribute("name");
	%>
	<jsp:include page="../parts/header.jsp" /> 
	<div style="margin-top:160px;margin-bottom:160px">
		<center>
			
			<div class="n-center n-padding-32 n-margin-bottom">
				<a style="text-decoration:none; !important">
					<span class="n-xlarge n-bottombar" style="padding:5px">
						<span style="color:black; font-size:48px">
							회원가입 완료
						</span>
					</span>
				</a>
			</div>
			<h1 class="n-font"><%=name %> 회원님, 포만감 가입을 축하드립니다!</h1>
			
			<!-- <button class="btn btn-primary" type="button" onclick="location.href='./'">홈</button> -->
			<button class="btn btn-primary" style="font-size:20px" type="button" onclick="location.href='./login.do?username=<%=username%>'">로그인</button>
		</center>
	</div>
	<%@ include file="../parts/footer.jsp" %>
	
	<script>
	$('#ob-mobileCartBtn').hide();
	$('#ob-footerBtn').hide();
	
	</script>
	
</body>
</html>