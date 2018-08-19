
function goTop() {
	$("html, body").animate({ scrollTop: 0 }, "slow");
}

function mobilecheck() {
    var check = false;
    (function(a){if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4))) check = true;})(navigator.userAgent||navigator.vendor||window.opera);
    return check;
}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function getTimeStamp() {
	var d = new Date();
	var s =
		leadingZeros(d.getFullYear(), 4) + '-' +
		leadingZeros(d.getMonth() + 1, 2) + '-' +
		leadingZeros(d.getDate(), 2) + ' ' +

		leadingZeros(d.getHours(), 2) + ':' +
		leadingZeros(d.getMinutes(), 2) + ':' +
		leadingZeros(d.getSeconds(), 2);

	return s;
}

function leadingZeros(n, digits) {
	var zero = '';
	n = n.toString();

	if (n.length < digits) {
		for (i = 0; i < digits - n.length; i++)
			zero += '0';
	}
	return zero + n;
}

function getRemainTime() {
	var cur = new Date();
	var makeHours = 60 * 60 * 1000;
	var makeMinutes = 60 * 1000;
	var makeSeconds = 1000;
	
	for(var i=0; i<=ordertime.length; i++) {
		if(i==ordertime.length) {
			var next = new Date();
			next.setDate(next.getDate()+1);
			next.setHours(ordertime[0].hour);
			next.setMinutes(ordertime[0].minute);
			next.setSeconds(0);
			
			var diff = next - cur;
			var h = parseInt(diff/makeHours);
			var diff2 = diff - (makeHours*h);
			var m = parseInt(diff2/makeMinutes);
			var s = parseInt((diff2 - (makeMinutes*m))/makeSeconds);
			
			return (h>0?h+'시간 ':'')+(m>0?m+'분 ':'')+s+'초';
		}
		
		var o = new Date();
		o.setHours(ordertime[i].hour);
		o.setMinutes(ordertime[i].minute);
		o.setSeconds(0);
		if(cur > o) {
			continue;
		} else {
			var diff = o - cur;
			var h = parseInt(diff/makeHours);
			var diff2 = diff - (makeHours*h);
			var m = parseInt(diff2/makeMinutes);
			var s = parseInt((diff2 - (makeMinutes*m))/makeSeconds);
			
			return (h>0?h+'시간 ':'')+(m>0?m+'분 ':'')+s+'초';
		}
	}
}

function realtimeClock() {
	$('#ob-time').text(getRemainTime());
	setTimeout("realtimeClock()", 1000);
}

function ajax(url, data, async, success, error) {
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	if(!token || !header) {
		alert('csrf token을 찾을 수 없습니다.');
		return;
	}
	$.ajax({
		type : "POST",
		beforeSend : function(request) {
			request.setRequestHeader(header, token);
		},
		url : url,
		data : data,
		async: async,
		success : success ? success : 
			function(status) {
				if (status.code / 100 == 2) {
					location = location.origin + location.pathname;
				} else { // fail
					alert(status.message);
				}
			},
		error : error ? error : 
			function() {
				alert('ajax error');
			}
	});
};

function insertCartProduct() {
	ajax('./cart/insert.do', 
		{
			idx_target : curTarget,
			idx_restaurant : curRestaurant,
			idx_product : curProduct,
			amount : $('#ob-amount').val()
		},
		true,
		function(status) {
			if (status.code / 100 == 2) {
				alert('추가되었습니다.');
				location.href='./restaurant.do?idx='+curRestaurant;
			} else {
				alert(status.message);
			}
		},
		function() {
			alert('네트워크 오류');
		}
	);
}

function updateCartProduct(idx, amount) {
	ajax('./cart/update.do', 
			{
				idx : idx,
				amount : amount
			},
			true,
			function(status) {
				if (status.code / 100 == 2) {
					location.reload();
				} else {
					alert(status.message);
				}
			},
			function() {
				alert('네트워크 오류');
			}
		);
}

function removeCartProduct(idx, totalPrice) {
	ajax('./cart/delete.do', 
			{
				idx : idx
			},
			true,
			function(status) {
				if (status.code / 100 == 2) {
					$('#cart-'+idx).fadeOut("slow", function(){
						$('#cart-'+idx).remove();
					});
					if($('#cart2-'+idx).length > 0) {
						$('#cart2-'+idx).fadeOut("slow", function(){
							$('#cart2-'+idx).remove();
						});
					}
					
					var size = $('#ob-cartSize').text() - 1;
					$('#ob-cartSize').text(size<0?0:size);
					$('#ob-cartSize2').text(size<0?0:size);
					
					var pre = parseInt($('#ob-sumPrice').text().replace(',',''));
					var cur = numberWithCommas(pre-totalPrice);
					$('#ob-sumPrice').text(cur);
					$('#ob-sumPrice2').text(cur);
					
				} else {
					alert(status.message);
				}
			},
			function() {
				alert('네트워크 오류');
			}
		);
}

function removeAllCartProduct() {
	ajax('./cart/alldelete.do', 
			{
			},
			true,
			function(status) {
				if (status.code / 100 == 2) {
					$('#cartTable').find("tr").each(function() {
						$(this).fadeOut("slow", function(){
							$(this).remove();
						});
					});
					$('#cartTable2').find("tr").each(function() {
						$(this).fadeOut("slow", function(){
							$(this).remove();
						});
					});
					$('#ob-sumPrice').text('0');
					$('#ob-sumPrice2').text('0');
					$('#ob-cartSize').text('0');
					$('#ob-cartSize2').text('0');
				} else {
					alert(status.message);
				}
			},
			function() {
				alert('네트워크 오류');
			}
		);
}
