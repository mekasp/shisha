$(document).ready(function() {
	/* Search */
	addSearch();
	
	/* Ajax Cart */
	$('#cart > .heading a').live('click', function() {
		$('#cart').addClass('active');
		$('#cart').load('index.php?route=module/cart #cart > *');
		$('#cart').live('mouseleave', function() {
			$(this).removeClass('active');
		});
	});
	
	/* Mega Menu */
	$('#menu ul > li > a + div').each(function(index, element) {
		// IE6 & IE7 Fixes
		if ($.browser.msie && ($.browser.version == 7 || $.browser.version == 6)) {
			var category = $(element).find('a');
			var columns = $(element).find('ul').length;
			$(element).css('width', (columns * 143) + 'px');
			$(element).find('ul').css('float', 'left');
		}
		var menu = $('#menu').offset();
		var dropdown = $(this).parent().offset();
		i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());
		if (i > 0) {
			$(this).css('margin-left', '-' + (i + 5) + 'px');
		}
	});

	// IE6 & IE7 Fixes
	if ($.browser.msie) {
		if ($.browser.version <= 6) {
			$('#column-left + #column-right + #content, #column-left + #content').css('margin-left', '195px');
			$('#column-right + #content').css('margin-right', '195px');
			$('.box-category ul li a.active + ul').css('display', 'block');	
		}
		if ($.browser.version <= 7) {
			$('#menu > ul > li').bind('mouseover', function() {
				$(this).addClass('active');
			});
			$('#menu > ul > li').bind('mouseout', function() {
				$(this).removeClass('active');
			});	
		}
	}
	
	$('.success img, .warning img, .attention img, .information img').live('click', function() {
		$(this).parent().fadeOut('slow', function() {
			$(this).remove();
		});
	});

	//Slider
	if(window.innerWidth > 819) {
		$(".slider").slick({
			dots: false,
			infinite: true,
			centerMode: true,
			draggable: true,
			slidesToShow: 5,
			slidesToScroll: 3
		});
	} else if(window.innerWidth < 820 && window.innerWidth > 550) {
		$(".slider").slick({
			dots: false,
			infinite: true,
			centerMode: true,
			slidesToShow: 3,
			slidesToScroll: 1
		});
	} else {
		$(".slider").slick({
			dots: false,
			infinite: true,
			centerMode: true,
			slidesToShow: 2,
			slidesToScroll: 1
		});
	}
});
$(window).resize(function () {
	if(window.innerWidth > 819) {
		$('.slider').slick('destroy');
		$(".slider").slick({
			dots: false,
			infinite: true,
			centerMode: true,
			draggable: true,
			slidesToShow: 5,
			slidesToScroll: 3
		});
	} else if(window.innerWidth < 820 && window.innerWidth > 550) {
		$('.slider').slick('destroy');
		$(".slider").slick({
			dots: false,
			infinite: true,
			centerMode: true,
			slidesToShow: 3,
			slidesToScroll: 1
		});
	} else {
		$('.slider').slick('destroy');
		$(".slider").slick({
			dots: false,
			infinite: true,
			centerMode: true,
			slidesToShow: 2,
			slidesToScroll: 1
		});
	}
	addSearch();
});

function getURLVar(urlVarName) {
	var urlHalves = String(document.location).toLowerCase().split('?');
	var urlVarValue = '';
	
	if (urlHalves[1]) {
		var urlVars = urlHalves[1].split('&');

		for (var i = 0; i <= (urlVars.length); i++) {
			if (urlVars[i]) {
				var urlVarPair = urlVars[i].split('=');
				
				if (urlVarPair[0] && urlVarPair[0] == urlVarName.toLowerCase()) {
					urlVarValue = urlVarPair[1];
				}
			}
		}
	}
	
	return urlVarValue;
} 

function addToCart(product_id, quantity) {
	quantity = typeof(quantity) != 'undefined' ? quantity : 1;
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: 'product_id=' + product_id + '&quantity=' + quantity,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information, .error').remove();
			if (json['redirect']) {
				location = json['redirect'];
			}
			
			if (json['success']) {
				var html = '<img src="image/data/basket.png"/>' + (json['total'] > 0 ? '<span>' + json['total'] + '</span>' : '');
				$('#cart_header').html(html);
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				$('.success').fadeIn('slow');
				$('#cart-total').html(json['total']);
				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cartModal').modal("show");
				setTimeout(function () {
					$('#cartModal').modal("hide");
				}, 1000);
			}
		},
		error: function (json) {
			alert(json);
			console.log(json);
		}
	});
}
function addToWishList(product_id) {
	$.ajax({
		url: 'index.php?route=account/wishlist/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
						
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				
				$('.success').fadeIn('slow');
				
				$('#wishlist-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow');
			}	
		}
	});
}

function addToCompare(product_id) { 
	$.ajax({
		url: 'index.php?route=product/compare/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
						
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				
				$('.success').fadeIn('slow');
				
				$('#compare-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			}	
		}
	});
}

function addSearch() {
	if(window.innerWidth > 899){
		$('.head_search').children('.button-search').unbind('click');
		$('.head_search').children('.button-search').bind('click', function () {
			var url = $('base').attr('href') + 'index.php?route=product/search';
			var filter_name = $('input[name=\'search\']').attr('value');
			if (filter_name) {
				url += '&filter_name=' + encodeURIComponent(filter_name);
			}
			location = url;
		});
		$('#form_search input[name=\'search\']').bind('keydown', function (e) {
			if (e.keyCode == 13) {
				$('.button-search').trigger('click');
			}
		});
	} else {
		$('.head_search').children('.button-search').unbind('click');
		$('.head_search').children('.button-search').bind('click', function () {
			$('#searchModal').fadeIn();
		});
		$('#searchModal').find('.button-search').bind('click', function () {
			var url = $('base').attr('href') + 'index.php?route=product/search';
			var filter_name = $('input[name=\'mobile_search\']').attr('value');
			if (filter_name) {
				url += '&filter_name=' + encodeURIComponent(filter_name);
			}
			location = url;
		});
	}
}

function confirm() {
	var data = $('#formConfirm').serialize();
	$.ajax({
		url:'index.php?route=checkout/confirm/validateJson&' + data,
		type: 'get',
		dataType:'json',
		success: function (json) {
			if (json['error']){
				if(json['error']['fio']) $('input[name="fio"').parent().addClass('error-field');
				if(json['error']['email']) $('input[name="email"').parent().addClass('error-field');
				if(json['error']['phone']) $('input[name="phone"').parent().addClass('error-field');
				if(json['error']['city']) $('input[name="city"').parent().addClass('error-field');
			} else {
				$.ajax({
					url:'index.php?route=checkout/confirm&' + data,
					type:'get',
					dataType:'json',
					beforeSend: function () {
						$('#formConfirm').find('.button-confirm').remove();
						$('#formConfirm').after('<img src="catalog/view/theme/default/image/ajax-loader.gif" />');
					},
					success: function (json) {
						location.href = json['redirect'];
					},
					error: function (json) {
						location.href = 'index.php?route=checkout/cart';
					}
				});
			}
		},
		error: function (json) {
			console.log(json);
			alert('err');
		}
	});
}

function countQuantity(product_key, quantity) {
	$.ajax({
		url:'index.php?route=checkout/cart/update',
		type:'post',
		dataType:'json',
		data: {product_key:product_key, quantity:quantity},
		success: function (json) {
			console.log(json);
			alert('ok');
		},
		error: function (json) {
			console.log(json);
			alert('err');
		}
	});
}

function readMore(elem) {
	var height = 100;
	if($(elem).hasClass('active')){
		$(elem).removeClass('active');
		$(elem).siblings('.viewport').height(height);
		$(elem).siblings('.white-shadow').show();
	} else {
		$(elem).addClass('active');
		height = $(elem).siblings('.viewport').children('div').height();
		$(elem).siblings('.viewport').height(height);
		$(elem).siblings('.white-shadow').hide();
	}
}