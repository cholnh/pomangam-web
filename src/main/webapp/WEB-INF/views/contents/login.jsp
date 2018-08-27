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
		String username = (String) request.getParameter("username");
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
							<a class="" style="text-decoration:none; !important">
								<span class="n-xlarge n-bottombar" style="padding:5px"><span style="color:black">LOGIN</span></span>
							</a>
						</div>
						
						<div class="n-row-padding">
							<div class="n-twothird">
								<input type="text" class="n-input n-border" 
									id="username" name="username" type="text" placeholder="아이디" required>
								<input type="password" class="n-input n-border" 
									id="password" name="password" type="text" placeholder="비밀번호" required>
								<label class="custom-control custom-checkbox" style="margin-top:10px">
									<input type="checkbox" id="ob-remember" value="1" class="custom-control-input">
									<span class="custom-control-indicator"></span>
									로그인 상태 유지
								 </label>
							</div>
							<div class="n-third">
								<button id="submitBtn" class="n-btn n-round n-loginBtn" 
										style="background-color: #eb613e; color: white">로그인</button>
							</div>
						</div>
						
						<input type="hidden" id="rsaPublicKeyModulus" value="<%=publicKeyModulus%>" />
						<input type="hidden" id="rsaPublicKeyExponent" value="<%=publicKeyExponent%>" />
				        <form id="securedLoginForm" name="securedLoginForm" action="./j_spring_security_check" method="post" style="display: none;">
				            <input type="hidden" name="securedUsername" id="securedUsername" value="" />
				            <input type="hidden" name="securedPassword" id="securedPassword" value="" />
				            <input type="hidden" name="remember" id="remember" value="" />
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
							<a class="n-nodec" data-toggle="modal" data-target="#id-modal">아이디</a> / 
							<a class="n-nodec" data-toggle="modal" data-target="#pw-modal">비밀번호 찾기</a></span>
							<br>
						<span class="n-kor">계정이 없으신가요? 
							<a class="n-nodec" href="#" 
							   onclick="signup();"><b>회원가입</b></a>
						</span>
						
						<div id="signup" style="display:none;">
							<hr>
							<div style="padding:10px">
								<form id="form-signup" action="./signup.do" method="POST">
									<div class="form-group" style="text-align: left">
										<label>아이디</label>
										<input type="text" id="form_username" name="form_username" class="form-control" placeholder="" required>
										<span id="form_username_success" style="display:none;color:blue">사용가능한 아이디 입니다.</span>
										<span id="form_username_warning" style="display:none;color:red">중복되는 아이디가 있습니다.</span>
									</div>
									<div class="form-group" style="text-align: left">
										<label>비밀번호</label>
										<input type="password" id="form_password" name="form_password" class="form-control" placeholder="8~16자 영문, 숫자" required>
									</div>
									<div class="form-group" style="text-align: left">
										<label>비밀번호 확인</label>
										<input type="password" id="form_password_recheck" name="form_password_recheck" class="form-control" placeholder="" required>
										<span id="form_password_warning" style="display:none;color:red">비밀번호 불일치</span>
									</div>
									<div class="form-group" style="text-align: left">
										<label>이름</label>
										<input type="text" id="form_name" name="form_name" class="form-control" placeholder="홍길동" required>
									</div>
									<div class="form-group" style="text-align: left">
										<label>핸드폰 번호</label>
										<input type="tel"  pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}|[0-9]{11}" 
											id="form_tel" name="form_tel" class="form-control" placeholder="010-xxxx-xxxx" required>
									</div>
									<button type="submit" class="n-btn n-round n-signupBtn" 
											style="background-color: #eb613e; color: white">회원가입</button>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
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
			<h4 class="m-t-0">구현 중 </h4>
			관리자에게 문의 바랍니다.
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
			관리자에게 문의 바랍니다.
		  </div>

		</div>
	  </div>
	</div>
	
	<!-- Footer -->
	<%@ include file="../parts/footer.jsp" %>

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
		$('#form_username').focus();
	}
	
	</script>
	<script>
	var isDup = true;
	var userId = getCookie("cookieUsername"); 
    $("#username").val(userId); 
     
    if($("#username").val() != ""){
        $("#remember").attr("checked", true);
    }
    
 	$("#submitBtn").off('click').on('click', function() {
 		var username = document.getElementById("username").value;
	    var password = document.getElementById("password").value;
	    if(username.length==0) {
	    	alert('아이디를 입력해 주세요.');
	    	$('#username').focus();
	    } else if(password.length==0) {
	    	alert('비밀번호를 입력해 주세요.');
	    	$('#password').focus();
	    } else {
	    	 try {
	    		 	/*
			    	if($("#ob-remember").is(":checked")){
			            //var userId = $("#username").val();
			            //setCookie("cookieUsername", userId, 7); // 7일동안 쿠키 보관
			            
			        } else {
			            //deleteCookie("cookieUsername");
			        }
			    	*/
			    	var isRemember = $("#ob-remember").is(":checked");
			        var rsaPublicKeyModulus = document.getElementById("rsaPublicKeyModulus").value;
			        var rsaPublicKeyExponent = document.getElementById("rsaPublicKeyExponent").value;
			        submitEncryptedForm(username,password, rsaPublicKeyModulus, rsaPublicKeyExponent, isRemember);
			    } catch(err) {
			        alert(err);
		    	}
	    }
	    
	    return false;
 	});
    
	function submitEncryptedForm(username, password, rsaPublicKeyModulus, rsaPpublicKeyExponent, isRemember) {
	    var rsa = new RSAKey();
	    rsa.setPublic(rsaPublicKeyModulus, rsaPpublicKeyExponent);
	
	    // 사용자ID와 비밀번호를 RSA로 암호화한다.
	    var securedUsername = rsa.encrypt(username);
	    var securedPassword = rsa.encrypt(password);
	
	    // POST 로그인 폼에 값을 설정하고 발행(submit) 한다.
	    var securedLoginForm = document.getElementById("securedLoginForm");
	    securedLoginForm.securedUsername.value = securedUsername;
	    securedLoginForm.securedPassword.value = securedPassword;
	    securedLoginForm.remember.value = isRemember;
	    securedLoginForm.submit();
	}

	var status = <%=new Gson().toJson(request.getSession().getAttribute("status")) %>;
	var error = '${error}';
	var msg = '${msg}';
	<%if(username!=null){%>
	$('#username').val(<%=username%>);
	$('#password').focus();
	<%} else {%>
	$('#username').focus();
	<%}%>
	
	if(error != '') {
		alert(error);
	}
	if(msg != '') {
		alert(msg);
	}
	
	$('#form_username').focusout(function(){
		if($('#form_username').val().length<=0) {
			$('#form_username_success').hide();
			$('#form_username_warning').hide();
			return;
		}
		ajax('./login/check.do', 
				{
					username : $('#form_username').val()
				},
				true,
				function(tf) {
					isDup = tf;
					if(isDup) {
						$('#form_username_success').hide();
						$('#form_username_warning').show();
					} else {
						$('#form_username_success').show();
						$('#form_username_warning').hide();
					}
				},
				function() {
					alert('네트워크 오류');
				}
		);
	});
	function recheck(e) {
		if($(e).val() === $('#form_password').val()) {
			$('#form_password_warning').hide();
			return;
		} else {
			$('#form_password_warning').show();
		}
	}
	$('#form_password').focusout(function(){
		if($('#form_password_recheck').val().length>0) {
			recheck($('#form_password_recheck'));
		}
	});
	$('#form_password_recheck').focusout(function(){
		recheck(this);
	});
	
	$('#form-signup').submit(function() {
		if(isDup) {
			alert('아이디를 확인해 주세요.');
			$('#form_username').focus();
			return false;
		}
		if($('#form_password').val() !== $('#form_password_recheck').val()) {
			alert('비밀번호가 서로 다릅니다.');
			return false;
		}
		$('#form-signup').submit();
	});
	
	$('#password').on('keyup', function(e){
		if(e.keyCode==13) {
			$('#submitBtn').trigger('click'); 
		}
	});
	
	</script>
</body>
</html>
