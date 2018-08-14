<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
</head>
<body>

	<!-- Navbar -->
	<%@ include file="../parts/header.jsp" %> 

  <!-- Hero block -->

  <a class="position-relative" name="home"></a>
  <div id="landing-hero" class="text-xs-center clearfix">
    <div class="container" style="margin-top:128px">
      <!-- Header -->
      <!--<h1 class="font-weight-semibold">포 만 감</h1>-->
		
		<span class="font-weight-semibold" style="color:white">
			<span class="n-title-bigchar">
				포
			</span>
			<span style="font-size:18px; margin-right:12px">
				터가
			</span>
			<span class="n-title-bigchar">
				만
			</span>
			<span style="font-size:18px; margin-right:12px">
				나러
			</span>
			<span class="n-title-bigchar">
				감
			</span>
		</span>
      <h2 class="font-weight-light" style="opacity: 0.5 !important">
		  정해진 시간과 장소로 <b><u>무엇이든 배달</u></b>해 드립니다.
      </h2>
		
      <!-- Buttons -->
      <div class="row">
		<div class="col-md-4"></div>
        <div class="col-md-4">
			<form action="./target.do" class="input-group input-group-lg">
				<input type="text" class="form-control" placeholder="어디로 배달해 드릴까요?" style="margin:10px">
				<span class="input-group-btn">
				  <button type="submit" class="btn btn-primary font-weight-semibold">검색</button>
				</span>
			</form>
		</div>
      </div>
		
      <!-- App sample -->
      <div class="sample">
		  <div class="row" style="color:aliceblue">
			<div class="col-md-4">
				<div>
					<span class="n-number-bigchar">1,373,102</span>
					<span style="font-size:32px">건</span>
				</div>
				<div style="margin-bottom: 16px;">
					<span style="font-size:16px; opacity: 0.5">누적 주문 수</span>
				</div>
			</div>
			<div class="col-md-4">
				<div>
					<span class="n-number-bigchar">6,086</span>
					<span style="font-size:32px">건</span>
				</div>
				<div style="margin-bottom: 16px;">
					<span style="font-size:16px; opacity: 0.5">오늘 주문 수</span>
				</div>
			</div>
			<div class="col-md-4">
				<div>
					<span class="n-number-bigchar">13,417</span>
					<span style="font-size:32px">곳</span>
				</div>
				<div style="margin-bottom: 16px;">
					<span style="font-size:16px; opacity: 0.5">등록된 업체</span>
				</div>
			</div>
		  </div>
      </div>
    </div>
  </div>

  <!-- Features -->

  <a class="position-relative" name="features"></a>
  <div class="landing-section landing-features-grid bg-white b-y-1">
    <div class="container">
		<div class="n-center n-padding-32 n-margin-bottom">
			<a class="n-hover-opacity" href="" style="text-decoration:none; !important">
				<span class="n-xlarge n-bottombar n-padding-16"><span style="color:black;font-size:30px;font-weight: 700">포터가 가는 곳</span></span>
			</a>
		</div>
      <h3 class="landing-subheading text-xs-center text-muted ">Mr. Porter와 제휴를 맺어 배달이 가능한 곳입니다.</h3>
	
	   <div class="text-xs-center" style="margin-top:64px;margin-bottom: 12px">
		<a href="#" style="margin:12px; text-decoration:none; !important; color:black"><b><u>전체</u></b></a>
		<a href="#" style="margin:12px; text-decoration:none; !important; color:black">서울</a>
		<a href="#" style="margin:12px; text-decoration:none; !important; color:black">경기</a>
		<a href="#" style="margin:12px; text-decoration:none; !important; color:black">충청</a>
		<a href="#" style="margin:12px; text-decoration:none; !important; color:black">강원</a>
		<a href="#" style="margin:12px; text-decoration:none; !important; color:black">전라</a>
		<a href="#" style="margin:12px; text-decoration:none; !important; color:black">경상</a>
		<a href="#" style="margin:12px; text-decoration:none; !important; color:black">제주</a>
	  </div>
    
	  <div class="row">
        <div class="col-md-4" >
		  <div class="n-card n-hover-opacity" onclick="location.href='./target.do'">
            <img class="n-school-img lazyload image" src="resources/img/main/school.jpg" alt="kau">
            <div class="n-container">
              <p style="font-size: 18px;"><b>한국항공대학교</b></p>
			  <p class="n-opacity" style="font-size: 11px;">경기도 고양시 덕양구 항공대학로 76<br>누적 주문 수 <B>14,723건</B></p>
            </div>
          </div>
        </div>
        <div class="col-md-4">
		  <div class="n-card n-hover-opacity" onclick="location.href='./target.do'">
            <img class="n-school-img lazyload image" src="resources/img/main/school3.jpg" alt="kau">
            <div class="n-container">
              <p style="font-size: 18px;"><b>경기대학교</b></p>
			  <p class="n-opacity" style="font-size: 11px;">경기도 수원시 영통구 광교산로 154-42<br>누적 주문 수 <B>11,957건</B></p>
            </div>
          </div>
        </div>
        <div class="col-md-4">
		  <div class="n-card n-hover-opacity" onclick="location.href='./target.do'">
            <img class="n-school-img lazyload image" src="resources/img/main/school2.jpg" alt="kau">
            <div class="n-container">
              <p style="font-size: 18px;"><b>강원대학교</b></p>
			  <p class="n-opacity" style="font-size: 11px;">강원도 춘천시 석사동 강원대학길 1<br>누적 주문 수 <B>5,050건</B></p>
            </div>
          </div>
        </div>
      </div>

      <div class="row n-desktop-show">
        <div class="col-md-4" >
		  <div class="n-card n-hover-opacity" onclick="location.href='./target.do'">
            <img class="n-school-img lazyload image" src="resources/img/main/school4.jpg" alt="kau">
            <div class="n-container">
              <p style="font-size: 18px;"><b>호서대학교</b></p>
			  <p class="n-opacity" style="font-size: 11px;">충청남도 천안시 동남구 신안동 호서대길 12<br>누적 주문 수 <B>13,723건</B></p>
            </div>
          </div>
        </div>
        <div class="col-md-4">
		  <div class="n-card n-hover-opacity" onclick="location.href='./target.do'">
            <img class="n-school-img lazyload image" src="resources/img/main/school5.jpg" alt="kau">
            <div class="n-container">
              <p style="font-size: 18px;"><b>장안대학교</b></p>
			  <p class="n-opacity" style="font-size: 11px;">경기도 화성시 봉담읍 상리 460<br>누적 주문 수 <B>2,957건</B></p>
            </div>
          </div>
        </div>
        <div class="col-md-4">
		  <div class="n-card n-hover-opacity" onclick="location.href='./target.do'">
            <img class="n-school-img lazyload image" src="resources/img/main/school6.jpg" alt="kau">
            <div class="n-container">
              <p style="font-size: 18px;"><b>인천대학교</b></p>
			  <p class="n-opacity" style="font-size: 11px;">인천광역시 연수구 송도1동 아카데미로 119<br>누적 주문 수 <B>1,050건</B></p>
            </div>
          </div>
        </div>
      </div>
		
		<div class="n-search">
		  <form action="" class="input-group input-group-lg" style="margin-top:48px">
			<input type="text" class="form-control" placeholder="찾으시는 학교가 없으신가요?">
			<span class="input-group-btn">
			  <button type="submit" class="btn btn-primary font-weight-semibold font-size-14 ">검색</button>
			</span>
		  </form>
		</div>
    </div>
	  
  </div>

  <!-- Mobile support -->

  <div class="landing-section landing-features ">
    <div class="container">
      <div class="col-md-4 text-xs-center">
        <img data-src="resources/img/main/iphone.png" class="lazyload image">
      </div>

      <!-- spacer -->
      <div class="n-desktop-show col-md-1 p-y-4"></div>

      <div id="mobileTitle" class="n-mobile-head col-md-7">
		  <div>
			<h1 class="landing-heading text-xs-center">
				<a href="javascript:void(0)" onclick="showMobileSupport()" style="color:#f3753a"><i class="fa fa-download" style="font-size:24px;"></i> 포만감 앱 받기</a>
			</h1>
			<h3 class="landing-subheading text-muted text-xs-center" style="margin-top:-40px">모바일을 통해 더 편리하게 배달을 받아보세요!</h3>
		  </div>
        <div class="panel-group p-t-3 font-size-14" id="mobileContents" style="display:none">
          <div class="panel">
			  <div id="forfocus" class="container text-xs-center n-mobilesupport">
			  	<h3>전화번호를 입력하시면<br><u>설치 주소</u>를 보내드립니다.</h3>
				<div class="n-mobilesupport-form">
				  <form action="" class="input-group input-group-md">
					<input id="appinput" type="tel" class="form-control" placeholder="번호를 입력해주세요.">
					<span class="input-group-btn">
					  <button type="submit" class="btn btn-primary font-weight-semibold font-size-14 ">전송</button>
					</span>
				  </form>
				  <input type="checkbox" style="margin:12px">개인정보 수집/이용에 동의 <a href="" style="margin-left:12px"><u>내용보기</u></a>
				</div>
			  </div>
		  </div>
        </div>

      </div>
    </div>
  </div>

  <hr class="m-a-0">

  <!-- How to -->
  <a class="position-relative" name="pricing"></a>
  <div class="landing-section bg-white">
    <div class="container">
		<div class="n-center n-padding-32 n-margin-bottom">
			<a class="n-hover-opacity" href="" style="text-decoration:none; !important">
				<span class="n-xlarge n-bottombar n-padding-16">
					<span style="color:black;font-size:30px;font-weight: 700">How To ?</span>
				</span>
			</a>
		</div>
      <h3 class="landing-subheading text-xs-center text-muted ">포만감을 이용하는 방법입니다.</h3>

	  <div class="text-xs-center">
        <!-- start -->
			<div class="container" style="margin-top:64px; padding:0px">
				<div class="row form-group">
					<div class="col-xs-12">
						<ul class="nav nav-pills nav-justified thumbnail setup-panel">
							<li class="active"><a href="#step-1">
								<h4 class="list-group-item-heading">Step 1</h4>
								<p class="list-group-item-text">학교 선택</p>
							</a></li>
							<li class="disabled"><a href="#step-2">
								<h4 class="list-group-item-heading">Step 2</h4>
								<p class="list-group-item-text">메뉴 선택</p>
							</a></li>
							<li class="disabled"><a href="#step-3">
								<h4 class="list-group-item-heading">Step 3</h4>
								<p class="list-group-item-text">간편 결제</p>
							</a></li>
							<li class="disabled"><a href="#step-4">
								<h4 class="list-group-item-heading">Step 4</h4>
								<p class="list-group-item-text">음식 전달</p>
							</a></li>
						</ul>
					</div>
				</div>
				<div class="row setup-content" id="step-1">
					<div class="col-xs-12">
						<div class="col-md-12 well text-center">
							<h2> 우선, 자신이 속한 <span style="color:#eb613e">학교</span>를 선택합니다.</h2>
							<br><hr>
							<div class="bootstrap-tagsinput-lg" style="margin: auto;">
								<!--<input type="text" class="form-control" id="bs-tagsinput-1">-->
								<div style="margin-top: 32px; padding:12px">
									<button type="button" class="btn btn-xl btn-danger btn-outline"
											style="margin-bottom:8px" onclick="toggle(this)">한국항공대</button>
									<button type="button" class="btn btn-xl btn-danger btn-outline"
											style="margin-bottom:8px" onclick="toggle(this)">경기대</button>
									<button type="button" class="btn btn-xl btn-danger btn-outline"
											style="margin-bottom:8px" onclick="toggle(this)">장안대</button>
									<button type="button" class="btn btn-xl btn-danger btn-outline"
											style="margin-bottom:8px" onclick="toggle(this)">수원대</button>
									<button type="button" class="btn btn-xl btn-danger btn-outline"
											style="margin-bottom:8px" onclick="toggle(this)">인천대</button>
									<button type="button" class="btn btn-xl btn-danger btn-outline"
											style="margin-bottom:8px" onclick="toggle(this)">강원대</button>
									<button type="button" class="btn btn-xl btn-danger btn-outline"
											style="margin-bottom:8px" onclick="toggle(this)">호서대</button>
									<button type="button" class="btn btn-xl btn-danger btn-outline"
											style="margin-bottom:8px" onclick="toggle(this)">국제대</button>
									<button type="button" class="btn btn-xl btn-danger btn-outline"
											style="margin-bottom:8px" onclick="toggle(this)">단국대</button>
									<button type="button" class="btn btn-xl btn-danger btn-outline"
											style="margin-bottom:8px" onclick="toggle(this)">우리 학교가 없어요...</button>
								</div>

							</div>
							
							<div style="margin: 64px">
								<button id="activate-step-2" class="btn btn-primary btn-lg">다음</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row setup-content" id="step-2">
					<div class="col-xs-12">
						<div class="col-md-12 well text-center">
							<h2 class="text-center"> <span style="color:#eb613e">여러 업체</span>의 다양한 메뉴들을 골라 담습니다! </h2>
							<br><hr>
							<div style="margin-top: 32px; padding:12px; margin: auto; width:90%;">
								<div id="owl-carousel-autoplay" class="owl-carousel" style="margin-top:24px;margin-bottom:24px">
									<div class="demo-item"><img class="lazyload image n-main-icon" src="resources/img/target/1/1.png" ></div>
									<div class="demo-item"><img class="lazyload image n-main-icon" src="resources/img/target/1/2.png" ></div>
									<div class="demo-item"><img class="lazyload image n-main-icon" src="resources/img/target/1/3.png"></div>
									<div class="demo-item"><img class="lazyload image n-main-icon" src="resources/img/target/1/4.png"></div>
									<div class="demo-item"><img class="lazyload image n-main-icon" src="resources/img/target/1/5.png"></div>
									<div class="demo-item"><img class="lazyload image n-main-icon" src="resources/img/target/1/6.png"></div>
									<div class="demo-item"><img class="lazyload image n-main-icon" src="resources/img/target/1/7.png"></div>
									<div class="demo-item"><img class="lazyload image n-main-icon" src="resources/img/target/1/8.jpg"></div>
									<div class="demo-item"><img class="lazyload image n-main-icon" src="resources/img/target/1/9.png"></div>
									<div class="demo-item"><img class="lazyload image n-main-icon" src="resources/img/target/1/10.png"></div>
									<div class="demo-item"><img class="lazyload image n-main-icon" src="resources/img/target/1/11.png"></div>
								</div>
								<img class="lazyload image" src="resources/img/main/down.png" width="100px">
							</div>
							<div style="margin: 64px">
								<button id="activate-step-2-back" class="btn btn-primary btn-lg">이전</button>
								<button id="activate-step-3" class="btn btn-primary btn-lg">다음</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row setup-content" id="step-3">
					<div class="col-xs-12">
						<div class="col-md-12 well text-center">
							<h2 class="text-center">다양하고 <span style="color:#eb613e">간편한</span> 결제 수단을 선택합니다.</h2>
							<br><hr>
							<div style="padding:12px; margin: auto; width:80%;">
								<div class="panel-group p-t-3 font-size-14" id="accordion-example" >
								  <div class="panel">
									<div class="panel-heading" style="background-color: #eb613e">
									  <a class="accordion-toggle font-size-14" data-toggle="collapse" data-parent="#accordion-example" href="#collapseOne" style="color:white;font-weight: 700">
										더치 페이
									  </a>
									</div>
									<div id="collapseOne" class="panel-collapse collapse">
									  <div class="panel-body">
										  Lorem ipsum dolor sit amet, hendrerit quaerendum cu nam. Elitr sensibus incorrupte nam ex. Nusquam civibus sit ei, vel quem mucius cu. Nullam tibique an vel. Ne vix quodsi euismod, ei explicari efficiendi sea.
									  </div>
									</div>
								  </div>
								  <div class="panel">
									<div class="panel-heading" style="background-color: #eb613e">
									  <a class="accordion-toggle font-size-14 collapsed" data-toggle="collapse" data-parent="#accordion-example" href="#collapseTwo" style="color:white;font-weight: 700">
										카카오 페이 / 네이버 페이
									  </a>
									</div>
									<div id="collapseTwo" class="panel-collapse collapse">
									  <div class="panel-body">
										Lorem ipsum dolor sit amet, hendrerit quaerendum cu nam. Elitr sensibus incorrupte nam ex. Nusquam civibus sit ei, vel quem mucius cu. Nullam tibique an vel. Ne vix quodsi euismod, ei explicari efficiendi sea.
									  </div>
									</div>
								  </div>
								  <div class="panel">
									<div class="panel-heading" style="background-color: #eb613e">
									  <a class="accordion-toggle font-size-14 collapsed" data-toggle="collapse" data-parent="#accordion-example" href="#collapseThree" style="color:white;font-weight: 700">
										카드 결제 / 핸드폰 결제
									  </a>
									</div>
									<div id="collapseThree" class="panel-collapse collapse">
									  <div class="panel-body">
										Lorem ipsum dolor sit amet, hendrerit quaerendum cu nam. Elitr sensibus incorrupte nam ex. Nusquam civibus sit ei, vel quem mucius cu. Nullam tibique an vel. Ne vix quodsi euismod, ei explicari efficiendi sea.
									  </div>
									</div>
								  </div>
								</div>
								 
							</div>
							<div style="margin: 64px">
								<button id="activate-step-3-back" class="btn btn-primary btn-lg">이전</button>
								<button id="activate-step-4" class="btn btn-primary btn-lg">다음</button>
							</div>
						</div>
						
					</div>
				</div>
				<div class="row setup-content" id="step-4">
					<div class="col-xs-12">
						<div class="col-md-12 well text-center">
							<h2 class="text-center"><span style="color:#eb613e">정해진 장소</span>로 <span style="color:#eb613e">정해진 시간</span>까지 Mr.Porter가 찾아갑니다. </h2>
							<br><hr>
							<div class="n-center" style="margin-top:64px">
								<i class="fa fa-wpforms" style="font-size:128px;margin-right:32px"></i>
								<i class="fa fa-refresh" style="font-size:128px;margin-right:32px"></i>
								<i class="fa fa-truck" style="font-size:128px;"></i>
								<h4><u>주문번호</u>를 알려주시면 음식을 꺼내드립니다.</h4>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		<!-- end -->  
      </div>
    </div>
  </div>

  <!-- Clients -->

  <a class="position-relative" name="customers"></a>
  <div class="landing-section landing-clients bg-white">
    <div class="container">
      <h1 class="landing-heading text-xs-center">이 달의 식신</h1>

      <div class="owl-carousel owl-carousel-inverted" style="touch-action: none;">
        <div class="landing-clients-review">
          <blockquote>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut a quam ac lacus varius suscipit. Donec vitae consectetur est. Vestibulum rhoncus, libero et ornare porta, elit neque imperdiet metus, id imperdiet lorem nunc eget lorem.
          </blockquote>
          <footer>
            <img src="resources/img/avatars/2.jpg">
            공민택<br>
            <a href="#">호서대학교 12학번</a>
          </footer>
        </div>
        <div class="landing-clients-review">
          <blockquote>
            Praesent viverra et nibh a volutpat. Phasellus ultrices tristique magna vitae vulputate.
          </blockquote>
          <footer>
            <img src="resources/img/avatars/3.jpg">
            김다현<br>
            <a href="#">한국항공대학교 17학번</a>
          </footer>
        </div>
        <div class="landing-clients-review">
          <blockquote>
            Cras elementum, felis eget eleifend volutpat, urna mauris cursus orci, vitae interdum turpis arcu in erat. Donec sollicitudin scelerisque metus ac volutpat.
          </blockquote>
          <footer>
            <img src="resources/img/avatars/4.jpg">
            정준하<br>
            <a href="#">경기대학교 15학번</a>
          </footer>
        </div>
        <div class="landing-clients-review">
          <blockquote>
            Vivamus accumsan libero mi, nec aliquam mi pretium eget. Donec a ex id tortor gravida lacinia nec sit amet mauris. Sed eros erat, hendrerit sed justo id, facilisis consequat metus.
          </blockquote>
          <footer>
            <img src="resources/img/avatars/5.jpg">
            배수지<br>
            <a href="#">연세대학교 18학번</a>
          </footer>
        </div>
        <div class="landing-clients-review">
          <blockquote>
            Integer et metus lobortis, lacinia turpis at, consequat ante.
          </blockquote>
          <footer>
            <img src="resources/img/avatars/1.jpg">
            김준현<br>
            <a href="#">방송통신대학교 08학번</a>
          </footer>
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
	
	<!-- Landing page dependencies -->
	<script src="resources/js/jquery.waypoints.min.js"></script>
	<script src="resources/js/jquery.scrollTo.min.js"></script>
	<script src="resources/js/lazysizes.min.js"></script>
	
	<!-- Landing page JS -->
	<script src="resources/js/landing.js"></script>
	<script src="resources/js/common.js"></script>
	<script>
		$('#nav').removeClass('sticky');
	
		$('#owl-carousel-autoplay').owlCarousel({
			items:           5,
			loop:            true,
			margin:          0,
			autoplay:        true,
			autoplayTimeout: 1000,
			responsive:{
				0:    { items: 3 },
				600:  { items: 5 },
			},
			rtl: $('html').attr('dir') === 'rtl',
		});
		
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
	
	<script>
	$(document).ready(function() {

		var navListItems = $('ul.setup-panel li a'),
			allWells = $('.setup-content');

		allWells.hide();

		navListItems.click(function(e)
		{
			e.preventDefault();
			var $target = $($(this).attr('href')),
				$item = $(this).closest('li');

			if (!$item.hasClass('disabled')) {
				navListItems.closest('li').removeClass('active');
				$item.addClass('active');
				allWells.hide();
				$target.show();
			}
		});

		$('ul.setup-panel li.active a').trigger('click');

		// DEMO ONLY //
		$('#activate-step-2').on('click', function(e) {
			$('ul.setup-panel li:eq(1)').removeClass('disabled');
			$('ul.setup-panel li a[href="#step-2"]').trigger('click');
		});   

		$('#activate-step-3').on('click', function(e) {
			$('ul.setup-panel li:eq(2)').removeClass('disabled');
			$('ul.setup-panel li a[href="#step-3"]').trigger('click');
		}); 
		
		$('#activate-step-4').on('click', function(e) {
			$('ul.setup-panel li:eq(3)').removeClass('disabled');
			$('ul.setup-panel li a[href="#step-4"]').trigger('click');
		}); 
		
		$('#activate-step-2-back').on('click', function(e) {
			$('ul.setup-panel li a[href="#step-1"]').trigger('click');
		}); 	

		$('#activate-step-3-back').on('click', function(e) {
			$('ul.setup-panel li a[href="#step-2"]').trigger('click');
		}); 

	});

	function toggle(el) {
		console.log(el);
		$el = $(el);
		if($el.hashasClass('active')) {
			console.log('true');
			$el.removeClass('active');
		} else {
			$el.addClass('active');
		}

	}
	</script>
</body>
</html>
