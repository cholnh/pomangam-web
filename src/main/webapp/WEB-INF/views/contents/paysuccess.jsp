<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="resources/img/favicon.ico" rel="shortcut icon">
</head>
<body>
	<%
		String payNumber = (String) request.getAttribute("payNumber");
		String payPassword = (String) request.getAttribute("payPassword");
		String boxNumber = (String) request.getAttribute("boxNumber");
		String totalPrice = (String) request.getAttribute("totalprice");
		
		String bank_name = (String) request.getAttribute("bank_name");
		String bank_account = (String) request.getAttribute("bank_account");
		String bank_username = (String) request.getAttribute("bank_username");
		
	%>
	<jsp:include page="../parts/header.jsp" /> 
	<div style="margin-top:50px;margin-bottom:70px">
		<center>
			<div class="n-center n-padding-32 n-margin-bottom">
				<a style="text-decoration:none; !important">
					<span class="n-xlarge n-bottombar" style="padding:5px">
						<span style="color:black; font-size:25px">
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
					</span><br> 
					<span style="font-size:13px">
						※ 교통상황이나 업체의 사정으로 인해 배달시간이 다소 지연될 수 있습니다.
					</span><br><br>
				</div>
				<%if(Integer.parseInt(totalPrice) > 0) { %>
				<div class="n-border">
					<br>
					<span style="font-size:23px; font-weight: bold">아래 금액을 이체해 주세요.</span><br>
					<span style="font-size:13px">
						※<b>5분</b> 이내 미입금 시 <b>자동주문취소</b>
					</span><br><br>
					<span style="font-size:32px; font-weight: bold"><%=totalPrice %>원</span><br> 
					<span style="font-size:15px;"><%=bank_name %> (<%=bank_username %>)<br> <%=bank_account %></span><br>
					<button class="btn btn-primary" style="font-size:13px" onclick="copy('<%=bank_account %>')">복사하기</button>
					<br><br>
					<textarea id="test"></textarea>
				</div>
				<%} %>
			</div>
			<!-- <button class="btn btn-primary" type="button" onclick="location.href='./'">홈</button> 
			<button class="btn btn-primary" style="font-size:20px;margin-top:32px" type="button" onclick="location.href='./'">홈으로</button>-->
		</center>
	</div>
	<%@ include file="../parts/footer.jsp" %>
	
	<script>
	$('#ob-mobileCartBtn').hide();
	$('#ob-footerBtn').hide();
	$('#test').hide();
	
	history.pushState(null, null, location.href);
	    window.onpopstate = function () {
	        history.go(1);
	};
	
	function copy(result) {
		$('#test').show();
		$('#test').val(result);
		$('#test')[0].select();
		//document.execCommand('copy');
		select_all_and_copy($('#test')[0]);
		$('#test').hide();
	}
	
	function select_all_and_copy(el) {
		if (document.body.createTextRange) {
	        // IE
			var textRange = document.body.createTextRange();
			textRange.moveToElementText(el);
			textRange.select();
			textRange.execCommand("Copy");   
		} else if (window.getSelection && document.createRange) {
	        // non-IE
			var editable = el.contentEditable; // Record contentEditable status of element
			var readOnly = el.readOnly; // Record readOnly status of element
			el.contentEditable = true; // iOS will only select text on non-form elements if contentEditable = true;
			el.readOnly = false; // iOS will not select in a read only form element
			var range = document.createRange();
			range.selectNodeContents(el);
			var sel = window.getSelection();
			sel.removeAllRanges();
			sel.addRange(range); // Does not work for Firefox if a textarea or input
			if (el.nodeName == "TEXTAREA" || el.nodeName == "INPUT")
				el.select(); // Firefox will only select a form element with select()
			if (el.setSelectionRange && navigator.userAgent.match(/ipad|ipod|iphone/i))
				el.setSelectionRange(0, 999999); // iOS only selects "form" elements with SelectionRange
			el.contentEditable = editable; // Restore previous contentEditable status
			el.readOnly = readOnly; // Restore previous readOnly status
			if (document.queryCommandSupported("copy")) {
				var successful = document.execCommand('copy'); 
			}  else {
				if (!navigator.userAgent.match(/ipad|ipod|iphone|android|silk/i))
					tooltip(el, "Press CTRL+C to copy");
			}
		}
	}
	
	</script>
	
</body>
</html>