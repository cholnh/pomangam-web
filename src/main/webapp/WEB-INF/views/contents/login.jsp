<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.google.gson.Gson"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.n.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body style="background-color: #FFF">

	<%	
		String publicKeyModulus = (String) request.getAttribute("publicKeyModulus");
		String publicKeyExponent = (String) request.getAttribute("publicKeyExponent");
	%>
	
	<!-- Navbar -->
	<jsp:include page="../parts/header.jsp" /> 

	<!-- Content -->
	<div class="n-content">
		<div class="n-loginContent">
			<div class="n-login-container">
				<div class="n-border center n-card">
					<div class="n-margin">
						<div class="n-center n-padding-32 n-margin-bottom">
							<a class="n-hover-opacity" href="" style="text-decoration:none; !important">
								<span class="n-xlarge n-bottombar" style="padding:5px"><span style="color:black">LOGIN</span></span>
							</a>
						</div>
						<form id="login-form">
							<div class="n-row-padding">
								<div class="n-twothird">
									<input type="email" class="n-input n-border" 
										id="username" name="username" type="text" placeholder="아이디" required>
									<input type="password" class="n-input n-border" 
										id="password" name="password" type="text" placeholder="비밀번호" required>
								</div>
								<div class="n-third">
									<button type="submit" class="n-btn n-round n-loginBtn" 
											style="background-color: #eb613e; color: white">로그인</button>
								</div>
							</div>
						</form>
						<input type="hidden" id="rsaPublicKeyModulus" value="<%=publicKeyModulus%>" />
						<input type="hidden" id="rsaPublicKeyExponent" value="<%=publicKeyExponent%>" />
				        <form id="securedLoginForm" name="securedLoginForm" action="./j_spring_security_check" method="post" style="display: none;">
				            <input type="hidden" name="securedUsername" id="securedUsername" value="" />
				            <input type="hidden" name="securedPassword" id="securedPassword" value="" />
				            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				        </form>
				        
						<div class="n-or-container">
							<hr class="n-or-hr">
							<div id="or">or</div>
						</div>
						<!-- social login -->
						<div class="n-row n-container n-center">
							<div class="n-half">
								<a class="n-hover-shadow" href=""><img class="n-socialLogin" src="resources/img/login/naverlogin.PNG" ></a>
							</div>
						</div> 
					</div>
				</div>

				<div class="n-border center n-card n-center" style="margin-top:32px;">
					<div id="focusPanel" class="n-padding">
						<span class="n-kor-bold">
							<a class="n-nodec" href="#" data-toggle="modal" data-target="#id-modal">아이디</a> / 
							<a class="n-nodec" href="#" data-toggle="modal" data-target="#pw-modal">비밀번호 찾기</a></span>
							<br>
						<span class="n-kor">계정이 없으신가요? 
							<a class="n-nodec" href="#" 
							   onclick="signup();"><b>회원가입</b></a>
						</span>
						
						<div id="signup" style="display:none;">
							<hr>
							<div style="padding:10px">
								<form action="" target="_blank">
									<div class="form-group" style="text-align: left">
										<label for="grid-input-17">아이디</label>
										<input type="email" id="input-id" class="form-control" placeholder="이메일주소">
									</div>
									<div class="form-group" style="text-align: left">
										<label for="grid-input-17">비밀번호</label>
										<input type="password" id="input-pw" class="form-control" placeholder="8~16자 영문, 숫자">
									</div>
									<div class="form-group" style="text-align: left">
										<label for="grid-input-17">비밀번호 확인</label>
										<input type="password" id="input-pwchk" class="form-control" placeholder="">
									</div>
									<div class="form-group" style="text-align: left">
										<label for="grid-input-17">이름</label>
										<input type="text" id="input-name" class="form-control" placeholder="홍길동">
									</div>
									<button type="submit" class="n-btn n-round n-signupBtn" 
											style="background-color: #eb613e; color: white">회원가입</button>
								</form>
								
								<div class="n-or-container">
									<hr class="n-or-hr">
									<div id="or">or</div>
								</div>
								<!-- social login -->
								<div class="n-row n-container n-center">
									<div class="n-half">
										<a class="n-hover-shadow" href=""><img class="n-socialLogin" src="resources/img/login/naverlogin.PNG" style="width:110%"></a>
									</div>
								</div> 
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade in" id="id-modal" tabindex="-1" style="display: none;">
	  <div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h4 class="modal-title" id="myModalLabel">아이디 찾기</h4>
		  </div>
		  <div class="modal-body">
			<h4 class="m-t-0">구현 중</h4>

		  </div>

		</div>
	  </div>
	</div>
	
	<div class="modal fade in" id="pw-modal" tabindex="-1" style="display: none;">
	  <div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h4 class="modal-title" id="myModalLabel">비밀번호 찾기</h4>
		  </div>
		  <div class="modal-body">
			<h4 class="m-t-0">구현 중</h4>

		  </div>

		</div>
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
	
	<script src="js/rsa/jsbn.js"></script>
	<script src="js/rsa/rsa.js"></script>
	<script src="js/rsa/prng4.js"></script>
	<script src="js/rsa/rng.js"></script>
	<script src='js/sha512.js'></script>
	
	<script>
	$('#ob-mobileCartBtn').hide();
	
	function signup() {
		$('#signup').fadeIn('slow');
		var offset = $('#focusPanel').offset();
       	$('html, body').animate({scrollTop : offset.top-100}, 400);
		$('#input-id').focus();
	}
	</script>
	<script>
	 	$("#login-form").submit(function() {
	 		var username = document.getElementById("username").value;
		    var password = document.getElementById("password").value;
		    if(username.length!=0 && password.length!=0) {
			    try {
			        var rsaPublicKeyModulus = document.getElementById("rsaPublicKeyModulus").value;
			        var rsaPublicKeyExponent = document.getElementById("rsaPublicKeyExponent").value;
			        submitEncryptedForm(username,password, rsaPublicKeyModulus, rsaPublicKeyExponent);
			    } catch(err) {
			        alert(err);
		    	}
		    }
		    
		    return false;
	 	});
	    
		function submitEncryptedForm(username, password, rsaPublicKeyModulus, rsaPpublicKeyExponent) {
		    var rsa = new RSAKey();
		    rsa.setPublic(rsaPublicKeyModulus, rsaPpublicKeyExponent);
		
		    // 사용자ID와 비밀번호를 RSA로 암호화한다.
		    var securedUsername = rsa.encrypt(username);
		    var securedPassword = rsa.encrypt(password);
		
		    // POST 로그인 폼에 값을 설정하고 발행(submit) 한다.
		    var securedLoginForm = document.getElementById("securedLoginForm");
		    securedLoginForm.securedUsername.value = securedUsername;
		    securedLoginForm.securedPassword.value = securedPassword;
		    securedLoginForm.submit();
		}
	
		var status = <%=new Gson().toJson(request.getSession().getAttribute("status")) %>;
		var error = '${error}';
		var msg = '${msg}';
		
		if(error != '') {
			alert(error);
		}
		if(msg != '') {
			alert(msg);
		}
	</script>
</body>
</html>
