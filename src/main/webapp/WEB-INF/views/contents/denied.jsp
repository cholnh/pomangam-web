<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
	<jsp:include page="../parts/header.jsp" />
	
	<div style="margin-top:160px;margin-bottom:160px">
		<center>
			
			<div class="n-center n-padding-32 n-margin-bottom">
				<a style="text-decoration:none; !important">
					<span class="n-xlarge n-bottombar" style="padding:5px">
						<span style="color:black; font-size:48px">
							접근 거부
						</span>
					</span>
				</a>
			</div>
			<h1 class="n-font">페이지 접근 권한이 없습니다.</h1>
			
			<!-- <button class="btn btn-primary" type="button" onclick="location.href='./'">홈</button> -->
			<button class="btn btn-primary" style="font-size:20px" type="button" onclick="history.back()">뒤로 가기</button>
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