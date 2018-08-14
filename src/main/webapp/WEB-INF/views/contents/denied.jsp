<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
	<%@ include file="../parts/header.jsp" %>
	<center>
		<br>
		<h1>???</h1>
		<br>
		<p>관리자에게 문의하세요.</p>
		<button type="button" onclick="location = location.origin + '/' + location.pathname.split('/')[1]">홈</button>
		<button type="button" onclick="history.back()">뒤로</button>
	</center>
	<%@ include file="../parts/footer.jsp" %>
</body>
</html>