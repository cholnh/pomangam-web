
// Smooth scroll
//

/*
$(function() {
  var BASIC_OFFSET  = $('a[name="home"]')[0].offsetTop;
  var SCROLL_OFFSET = -50;

  $('body').on('click', '.scroll-to', function(e) {
    e.preventDefault();

    var anchorName = this.getAttribute('href').replace('#', '');
    var $anchor    = $('a[name="' + anchorName + '"]');

    var scrollTo     = $anchor[0].offsetTop - BASIC_OFFSET + (anchorName === 'home' ? 0 : SCROLL_OFFSET);
    var winScrollTop = $(window).scrollTop();
    var scrollSize   = Math.abs(scrollTo - winScrollTop);

    if (scrollTo === winScrollTop) { return; }

    var duration = scrollSize >= 1500 ?
      Math.floor(scrollSize / 1500) * 250 :
      Math.floor(scrollSize / 3);

    $(window).animate({ scrollTop: scrollTo }, duration);

    return false;
  });
});
*/

// Navbar
//

$(function() {
  var $navbar = $('.px-navbar');
  //var $brand = $('#brand');
  $navbar.pxNavbar();

  $('#landing-hero')
    .waypoint({
      handler: function(direction) {
        if (direction === 'up') {
          $navbar.removeClass('sticky');
		  //$brand.css('color', '#eb613e');
        } else {
          $navbar.addClass('sticky');
		  //$brand.css('color', 'white');
        }
      },
      offset: '-70%'
    });
});


// Hero block
//

$(function() {
  $('#landing-hero').pxResponsiveBg({
    backgroundImage:    'resources/img/main/hero.jpg',
    backgroundPosition: 'center bottom',			//background:#000;opacity:.74;
    overlay:            '<div class=""><div style="background:#fff;position:absolute;top:0;right:0;bottom:0;left:0;"></div></div>',
    overlayOpacity:     1,
  });
});


// Clients block
//
/*
$(function() {
  $('.landing-clients').pxResponsiveBg({
    backgroundImage:    'resources/img/main/sicksin.jpg',
    backgroundPosition: 'center bottom',
    overlay:            '<div class="bg-primary darken"><div style="background:#000;opacity:.74;position:absolute;top:0;right:0;bottom:0;left:0;"></div></div>',
    overlayOpacity:     0.65,
  });

  $('.landing-clients .owl-carousel')
    .owlCarousel({
      margin: 125,
      responsive:{
        0:    { items: 1 },
        600:  { items: 2 },
        1000: { items: 3 },
      },
      rtl: $('html').attr('dir') === 'rtl',
    })
    .on('resized.owl.carousel', function() {
      $(window).trigger('resize');
    });
});
*/