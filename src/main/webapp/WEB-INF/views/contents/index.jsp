<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Map"%>
<%@page import="com.mrporter.pomangam.notice.vo.NoticeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.mrporter.pomangam.target.vo.TargetBean"%>
<!DOCTYPE html>

<html>
<head>
	<link href="resources/img/favicon.ico" rel="shortcut icon">
</head>
<body>
	<%
		//int sumOrder = (int) request.getAttribute("sumOrder");
		//int todayOrder = (int) request.getAttribute("todayOrder");
		//int sumRestaurant = (int) request.getAttribute("sumRestaurant");

		@SuppressWarnings({ "unchecked", "rawtypes" })
		List<TargetBean> targetList = (List) request.getAttribute("targetList");
		
		@SuppressWarnings({ "unchecked", "rawtypes" })
		List<NoticeBean> noticeList = (List) request.getAttribute("noticeList");

		@SuppressWarnings({ "unchecked", "rawtypes" })
		Map<Integer, Integer> countMap = (Map) request.getAttribute("targetCountMap");
		
		DecimalFormat decimalFormat = new DecimalFormat("###,###.##");
 	%>

	<!-- Navbar -->
	<jsp:include page="../parts/header.jsp" />

	<!-- Hero block -->

	<a class="position-relative" name="home"></a>
	<div id="landing-hero" class="text-xs-center clearfix">
		<jsp:include page="main-ground-floor.jsp"></jsp:include>
	</div>

	<!-- Features -->

	<a class="position-relative" name="features"></a>
	<div class="landing-section landing-features-grid bg-white b-y-1">
		<div class="container">
			<div class="n-center n-padding-32">
				<a class="" style="text-decoration: none; !important"> <span
					class="n-xlarge n-bottombar" style="padding: 5px"><span
						style="color: black; font-size: 30px; font-weight: 700">포터가
							가는 곳</span></span>
				</a>
			</div>
			<div class="n-subtitle n-center">미스터포터와 제휴를 맺어 배달이 가능한 곳입니다.</div>

			<div class="text-xs-center"
				style="margin-top: 64px; margin-bottom: 12px">
				<a href="#" class="n-main-category"><b><u>전체</u></b></a> <a href="#"
					class="n-main-category">서울</a> <a href="#" class="n-main-category">경기</a>
				<a href="#" class="n-main-category">충청</a> <a href="#"
					class="n-main-category">강원</a> <a href="#" class="n-main-category">전라</a>
				<a href="#" class="n-main-category">경상</a> <a href="#"
					class="n-main-category">제주</a>
			</div>

			<div class="row">
				<div class="col-md-4">
					<div class="n-card" style="cursor: pointer;"
						onclick="location.href='./target.do?idx=1'">
						<img class="n-school-img lazyload image"
							src="resources/img/main/school.jpg" alt="kau">
						<div class="n-container">
							<p style="font-size: 18px;">
								<b>항공대학교</b>
							</p>
							<p class="n-opacity" style="font-size: 11px;">
								경기도 고양시 덕양구 항공대학로 76<br>누적 주문 수 <B><%=countMap.get(1) == null ? 0 : decimalFormat.format(countMap.get(1)) %>건</B>
							</p>
						</div>
					</div>
				</div>
				<!--  -->
				<div class="col-md-4">
					<div class="n-card" style="cursor: pointer;"
						onclick="location.href='./target.do?idx=2'">
						<img class="n-school-img lazyload image"
							src="resources/img/main/knu.jpg" alt="knu">
						<div class="n-container">
							<p style="font-size: 18px;">
								<b>군산대학교</b>
							</p>
							<p class="n-opacity" style="font-size: 11px;">
								전라북도 군산시 나운3동 대학로 558<br>누적 주문 수 <B><%=countMap.get(2) == null ? 0 : decimalFormat.format(countMap.get(2)) %>건</B>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="n-card" style="cursor: pointer;"
						onclick="location.href='./target.do?idx=3'">
						<img class="n-school-img lazyload image"
							src="resources/img/main/hu.jpg" alt="hu">
						<div class="n-container">
							<p style="font-size: 18px;">
								<b>호원대학교</b>
							</p>
							<p class="n-opacity" style="font-size: 11px;">
								전라북도 군산시 임피면 호원대3길 64<br>누적 주문 수 <B><%=countMap.get(3) == null ? 0 : decimalFormat.format(countMap.get(3)) %>건</B>
							</p>
						</div>
					</div>
				</div>
			</div>

			<div class="row n-desktop-show">
				<div class="col-md-4">
					<div class="n-card" style="cursor: pointer;"
						onclick="toast('죄송합니다...','제휴 준비 중 입니다.','warning');">
						<img class="n-school-img lazyload image"
							src="resources/img/main/school4.jpg" alt="kau">
						<div class="n-container">
							<p style="font-size: 18px;">
								<b>호서대학교</b>
							</p>
							<p class="n-opacity" style="font-size: 11px;">
								충청남도 천안시 동남구 신안동 호서대길 12<br>누적 주문 수 <B>13,723건</B>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="n-card" style="cursor: pointer;"
						onclick="toast('죄송합니다...','제휴 준비 중 입니다.','warning');">
						<img class="n-school-img lazyload image"
							src="resources/img/main/school5.jpg" alt="kau">
						<div class="n-container">
							<p style="font-size: 18px;">
								<b>장안대학교</b>
							</p>
							<p class="n-opacity" style="font-size: 11px;">
								경기도 화성시 봉담읍 상리 460<br>누적 주문 수 <B>2,957건</B>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="n-card" style="cursor: pointer;"
						onclick="toast('죄송합니다...','제휴 준비 중 입니다.','warning');">
						<img class="n-school-img lazyload image"
							src="resources/img/main/school6.jpg" alt="kau">
						<div class="n-container">
							<p style="font-size: 18px;">
								<b>인천대학교</b>
							</p>
							<p class="n-opacity" style="font-size: 11px;">
								인천광역시 연수구 송도1동 아카데미로 119<br>누적 주문 수 <B>1,050건</B>
							</p>
						</div>
					</div>
				</div>
			</div>

			<!-- 
		<div class="n-search">
		  <form action="" class="input-group input-group-lg" style="margin-top:48px">
			<input type="text" class="form-control" placeholder="찾으시는 학교가 없으신가요?">
			<span class="input-group-btn">
			  <button type="submit" class="btn btn-primary font-weight-semibold font-size-14 ">검색</button>
			</span>
		  </form>
		</div>
		-->
		</div>

	</div>

	<!-- Mobile support -->

	<div class="landing-section landing-features">
		<div class="container">
			<div class="col-md-4 text-xs-center">
				<img data-src="resources/img/main/iphone2.png" class="lazyload image">
			</div>

			<!-- spacer -->
			<div class="n-desktop-show col-md-1 p-y-4"></div>

			<div id="mobileTitle" class="n-mobile-head col-md-7">
				<div>
					<h1 class="n-font landing-heading text-xs-center">
						<a href="javascript:void(0)" onclick="showMobileSupport()"
							style="color: #FF866F"><i class="fa fa-download"
							style="font-size: 24px;"></i> 포만감 앱 받기</a>
					</h1>
					<h3 class="n-font landing-subheading text-muted text-xs-center"
						style="margin-top: -40px">모바일을 통해 더 편리하게 배달을 받아보세요!</h3>
				</div>
				<div class="panel-group p-t-3 font-size-14" id="mobileContents"
					style="display: none">
					<div class="panel">
						<div id="forfocus"
							class="container text-xs-center n-mobilesupport">
							<h3 class="n-font">
								전화번호를 입력하시면<br>	
								<u>설치 주소</u>를 보내드립니다.
							</h3>
							<div class="n-mobilesupport-form">
								<form action="" class="input-group input-group-md">
									<input id="appinput" type="tel" class="form-control"
										placeholder="어플 제작 중 입니다!"> <span
										class="input-group-btn">
										<button type="submit"
											class="btn btn-primary font-weight-semibold font-size-14 " disabled>전송</button>
									</span>
								</form>
								<input type="checkbox" style="margin: 12px">개인정보 수집/이용에
								동의 <a style="margin-left: 12px"><u>내용보기</u></a>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<hr class="m-a-0">
	
	<!-- Footer -->
	<%@ include file="../parts/footer.jsp" %>

	<%if(noticeList != null && !noticeList.isEmpty()) {%>
	<!-- notice popup modal -->
	<div class="modal" id="notice_modal" tabindex="-1" role="dialog" style="top:5%">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<span style="font-weight:bold;font-size:15px">공지사항</span>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body" >
					<div id="notice_carousel" class="owl-carousel">
						
						<%for(NoticeBean bean : noticeList){ %>
						<div class="demo-item" style="margin-bottom:26px">
							<img src="<%=bean.getImgpath() %>" alt="공지이미지">
							<div class="n-center" style="margin-top:12px"><%=bean.getContents() %></div>
						</div>
						<%} %>
						
					</div>
				</div>
				
				<div class="modal-footer n-center">
					<button class="btn btn-primary" style="width:45%;font-size:17px;" onclick="noticeClose()">오늘하루 보지않기
					</button>
					<button class="btn btn-primary" style="width:45%;font-size:17px;" data-dismiss="modal">닫기
					</button>
				</div>
			</div>
		</div>
	</div>
	<%} %>
	
	<!-- Core scripts -->
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/pixeladmin.min.js"></script>
	
	<!-- Landing page dependencies -->
	<script src="resources/js/jquery.waypoints.min.js"></script>
	<script src="resources/js/jquery.scrollTo.min.js"></script>
	<script src="resources/js/lazysizes.min.js"></script>
	
	<!-- Landing page JS -->
	<script src="resources/js/landing.js"></script>
	
	<script src="resources/js/bookmark.js"></script>
	
	<script>
		var targetList = <%=new Gson().toJson(targetList)%>;
		
	</script>
	
	<!-- notice script -->
	<%if(noticeList != null && !noticeList.isEmpty()) {%>
	<script>
		$(function() {
			cookiedata = document.cookie;
		    if(cookiedata.indexOf("close=Y")<0) {
		        $("#notice_modal").modal();
		    } else {
		        $("#notice_modal").modal('hide');
		    }
		});
		
		$('#notice_carousel').owlCarousel({
			loop:   false,
			margin: 10,
			nav:    true,
		
			responsive:{
				0:    { items: 1 },
				600:  { items: 1 },
				1000: { items: 1 },
			},
		
			rtl: $('html').attr('dir') === 'rtl',
	    });
		
		function getCookieForNotice(cname) {
		    var name = cname + "=";
		    var ca = document.cookie.split(';');
		    for(var i=0; i<ca.length; i++) {
		        var c = ca[i];
		        while (c.charAt(0)==' ') c = c.substring(1);
		        if (c.indexOf(name) != -1) return c.substring(name.length,c.length);
		    }
		    return "";
		}
		function setCookieForNotice(cname, cvalue, exdays) {
		    var d = new Date();
		    d.setTime(d.getTime() + (exdays*24*60*60*1000));
		    var expires = "expires="+d.toUTCString();
		    document.cookie = cname + "=" + cvalue + "; " + expires;
		}
		
		function noticeClose(){
			 setCookie("close","Y",1);
		    $("#notice_modal").modal('hide');
		}
	</script>
	<%} %>
	
	<script>
		$('#nav').removeClass('sticky');
		//$('.px-navbar .navbar-header').css('background', 'white'); 
		//$('.px-navbar .navbar-header').css('color', 'black'); 
		
		function showMobileSupport() {
			$('#mobileTitle').css('margin-top', '48px');
			$('#mobileContents').fadeIn();
			
			if(mobilecheck()) {
				var offset = $('#forfocus').offset();
				$('html, body').animate({scrollTop : offset.top-150}, 400);
			} else {
				var offset = $('#mobileTitle').offset();
				$('html, body').animate({scrollTop : offset.top-200}, 400);
			}
			
			$('#appinput').focus();
		}
	</script>

</body>
</html>
