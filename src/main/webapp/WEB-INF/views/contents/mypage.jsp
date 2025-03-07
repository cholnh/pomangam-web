<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<link href="resources/img/favicon.ico" rel="shortcut icon">
</head>
<body>

	<!-- Navbar -->
	<jsp:include page="../parts/header.jsp" /> 


	<div class="container" style="margin-top:150px">

	</div>
	
	<!-- Footer -->
	<%@ include file="../parts/footer.jsp" %>
	
	<!-- Core scripts -->
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/pixeladmin.min.js"></script>
	
	<!-- Landing page dependencies -->
	<script src="resources/js/jquery.waypoints.min.js"></script>
	<script src="resources/js/jquery.scrollTo.min.js"></script>
	<script src="resources/js/lazysizes.min.js"></script>
	
	<!-- Landing page JS -->
	<script src="resources/js/landing.js"></script>
	
	<script src="js/bootstrap-datepicker.min.js"></script>
	<script src="js/bootstrap-datepicker.ko.min.js"></script>

	<script>
	$('#ob-mobileCartBtn').hide();
	</script>
</body>
</html>
