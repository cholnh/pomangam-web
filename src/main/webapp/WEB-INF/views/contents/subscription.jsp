<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">

  <title>Mr. Porter</title>

  <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,600,700,300&subset=latin" rel="stylesheet" type="text/css">
  <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <link href="http://cdn.linearicons.com/free/1.0.0/icon-font.min.css" rel="stylesheet" type="text/css">

  <!-- Core stylesheets -->
  <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="resources/css/pixeladmin.min.css" rel="stylesheet" type="text/css">
  <link href="resources/css/widgets.min.css" rel="stylesheet" type="text/css">

  <!-- Theme -->
  <link href="resources/css/themes/candy-orange.min.css" rel="stylesheet" type="text/css">

  <!-- Landing page CSS -->
  <link href="resources/css/landing.css" rel="stylesheet" type="text/css">
  <link href="resources/css/custom.css" rel="stylesheet" type="text/css">
	
</head>
<body>

  <!-- Navbar -->

  <nav class="navbar px-navbar sticky">
    <div class="container">
      <div class="navbar-header">
        <a href="index.html" class="scroll-to navbar-brand"><b>Mr. Porter</b></a>
      </div>

      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse" aria-expanded="false"><i class="navbar-toggle-icon"></i></button>

      <div class="collapse navbar-collapse">
        <ul class="nav navbar-nav navbar-right">
          <li><a href="index.html" class="scroll-to">주문하기</a></li>
          <li><a href="index.html" class="scroll-to">고객센터</a></li>
          <li><a href="index.html" class="scroll-to">로그인</a></li>
        </ul>
      </div>
    </div>
  </nav>

	<div class="container" style="margin-top:150px">

	</div>
	
  <!-- Footer -->

  <div class="px-footer" style="position: fixed;bottom: 0; width: 100%">
    <span class="text-muted">Copyright © 2017 Your Company. All rights reserved.</span>
  </div>

  <!-- ==============================================================================
  |
  |  SCRIPTS
  |
  =============================================================================== -->

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
	
  <script src="js/bootstrap-datepicker.min.js"></script>
  <script src="js/bootstrap-datepicker.ko.min.js"></script>
	
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
	
	$('#activate-step-2-back').on('click', function(e) {
        $('ul.setup-panel li a[href="#step-1"]').trigger('click');
    }); 	
	
	$('#activate-step-3-back').on('click', function(e) {
        $('ul.setup-panel li a[href="#step-2"]').trigger('click');
    }); 
	
	// tag
	$(function() {
    var $el = $('#bs-tagsinput-1');

    $el.tagsinput({
      itemValue: 'value',
      itemText:  'text',
	  tagClass: 'label label-default'
    });
	
    $el.tagsinput('add', { value: 1,  text: '문제풀이',  continent: 'Europe' });
    $el.tagsinput('add', { value: 4,  text: '보고서', continent: 'America' });
    $el.tagsinput('add', { value: 7,  text: '자소서',     continent: 'Australia' });
    $el.tagsinput('add', { value: 10, text: 'PPT',    continent: 'Asia' });
    $el.tagsinput('add', { value: 13, text: '논문',      continent: 'Africa' });
	
		
	// note
	$(function() {
      $('#summernote-base').summernote({
        height: 200,
        toolbar: [
          ['parastyle', ['style']],
          ['fontstyle', ['fontname', 'fontsize']],
          ['style', ['bold', 'italic', 'underline', 'clear']],
          ['font', ['strikethrough', 'superscript', 'subscript']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['height', ['height']],
          ['insert', ['picture', 'link', 'video', 'table', 'hr']],
          ['history', ['undo', 'redo']],
          ['misc', ['codeview', 'fullscreen']],
          ['help', ['help']]
        ],
      });
    });
  });
	
  $("#expdate").datepicker({
		autoclose : true,
		startDate : "+1d",
		language : "ko",
		todayHighlight : true
  });	
  $("#enddate").datepicker({
		autoclose : true,
		startDate : "+1d",
		language : "ko",
		todayHighlight : true
  });
  $('#expdate').datepicker();
  $('#enddate').datepicker();
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
