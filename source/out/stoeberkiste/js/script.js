$( document ).ready(function(){

	$(".trigger-left").click(function(e){
		e.preventDefault();
		$("body").removeClass("sk-panel-right-open").toggleClass("sk-panel-left-open");
	});

	$(".trigger-right").click(function(e){
		e.preventDefault();
		$("body").removeClass("sk-panel-left-open").toggleClass("sk-panel-right-open");
	});

	$(document).on("click", function(e){
		if (!$(e.target).closest(".sk-mobile-panel, .trigger-left, .trigger-right").length) {
			$("body").removeClass("sk-panel-left-open sk-panel-right-open");
		}
	});

	$(document).keyup(function(e){
		if (e.key === "Escape") {
			$("body").removeClass("sk-panel-left-open sk-panel-right-open");
		}
	});

// Cookie Hinweis
$("#bm_cookie_close").click(function(){
	$('#bm_cookie_notice').hide();
	return false;
});



/*=============================================================================================*/
/* get the niceScroll																		   */
/*=============================================================================================*/

//	$("html").niceScroll();
//	$("body").niceScroll();

	function restoreTopContactForm($overlay) {
		var originalForm = $overlay.data('skOriginalContactForm');
		if (originalForm && $overlay.find('#contact-ajax').length === 0) {
			$overlay.find('.sk-contact-submit-message').replaceWith(originalForm);
		}
		var restoredForm = $overlay.find('#contact-ajax')[0];
		if (restoredForm) {
			restoredForm.reset();
			$(restoredForm).find(':submit').prop('disabled', false).each(function(){
				var $submit = $(this);
				if ($submit.is('input')) {
					$submit.val('Nachricht senden');
				} else {
					$submit.text('Nachricht senden');
				}
			});
		}
	}

	$(".to-contact, .open-contact").click(function(e){
		e.preventDefault();
		restoreTopContactForm($(".contact-all-overlay"));
		$('body,html').stop().animate({scrollTop: 0}, 300);
		$(".contact-all-overlay").delay(300).slideDown('fast');
	});

	$(".close-contact").click(function(){
		$(".contact-all-overlay").slideUp('fast', function(){
			restoreTopContactForm($(this));
		});
	});

/*=============================================================================================*/
/* Slide to Top        																		   */
/*=============================================================================================*/

	$(function(){
		$(window).scroll(function(){
		if ($(this).scrollTop() > 260){
		$('#top').fadeIn();
			} else{
			$('#top').fadeOut();
			}
		});

		$('#top').click(function(){
			$('body,html').animate({
			scrollTop: 0
			}, 700);
				return false;
		});
	});

/*=============================================================================================*/
/* Animated Blur on 'Brand-Images'
/*=============================================================================================*/

	$( ".brands .all-brands img" ).hover(
	function() {
		$(".brands .all-brands img").addClass("blur");
		$(this).removeClass("blur");
		$(this)
			}, function() {
			$(".brands .all-brands img").removeClass("blur");
			}
	);

/*=============================================================================================*/
/* Document Ready END					    												   */
/*=============================================================================================*/
});


/*=============================================================================================*/
/* DELETE AJAX LOADER FROM JQUERY MOBILE													   */
/*=============================================================================================*/

$(document).bind("mobileinit", function(){
		$.mobile.ajaxEnabled = false;
	//	$.mobile.autoInitializePage = false;
});

$(".background").delay(800).fadeIn(1200);



/*=============================================================================================*/
/* Navigation ScrollTo and set the current Menu-Item 'active' */
/*=============================================================================================*/

// Cache selectors
var lastId,
    topMenu = $(".on-page-navi, .about-us"),
    topMenuHeight = topMenu.outerHeight()+15,
    // All list items
    menuItems = topMenu.find("a"),
    // Anchors corresponding to menu items
    scrollItems = menuItems.map(function(){
      var item = $($(this).attr("href"));
      if (item.length) { return item; }
    });

menuItems.click(function(e){
  var href = $(this).attr("href");

  if (!href || href.charAt(0) !== "#") {
      return;
  }

  var target = href === "#" ? $() : $(href);

  if (href !== "#" && !target.length) {
      return;
  }

  var offsetTop = href === "#" ? 0 : target.offset().top-topMenuHeight+1;
  $('html, body').stop().animate({
      scrollTop: offsetTop
  }, 600);
  e.preventDefault();
});


/*=============================================================================================*/
/* Gone wild with some Data-ID's */
/*=============================================================================================*/

$(".card").click(function() {
	if (!$('#all-cards-top').length || !$(".card-detail").length) {
		return;
	}
	$('html, body').animate({ scrollTop:$('#all-cards-top').offset().top - 50 },'slow');
	$(".card-detail").fadeIn(240);
	$('.card-view[data-id!="'+$(this).data('id')+'"]').stop().css({'display':'none'});
	$('.card-view[data-id="'+$(this).data('id')+'"]').stop().css({'display':'block'});
});

$(".close-details").click(function(){
	$(".card-detail").fadeOut(240);
});

// Produktdetail-Galerie
$(document).ready(function(){
	function initDetailZoom($figure) {
		var $link = $figure.find('.jqzoom');
		if (!$link.length || typeof $.fn.jqzoom !== 'function') {
			return;
		}

		$link.removeData('jqzoom');
		$figure.find('.zoomPad').each(function(){
			var $pad = $(this);
			var $img = $pad.find('> img').first();
			if ($img.length) {
				$pad.replaceWith($img);
			}
		});

		$link.jqzoom({
			zoomType: 'innerzoom',
			preloadImages: true,
			alwaysOn: false
		});
	}

	function getDetailFigures($gallery) {
		var $figures = $gallery.find('.zoom-container');
		if (!$figures.length) {
			$figures = $gallery.find('.wrap > figure');
		}
		return $figures;
	}

	function setDetailGalleryImage($gallery, index) {
		var $figures = getDetailFigures($gallery);
		var $thumbs = $gallery.find('.thumbnails .thumb');
		var $helpers = $gallery.find('.gallery-helper');

		$figures.removeClass('sk-active-picture').attr('hidden', true).eq(index).addClass('sk-active-picture').removeAttr('hidden');
		$thumbs.removeClass('sk-active-thumb').eq(index).addClass('sk-active-thumb');
		$helpers.prop('checked', false).eq(index).prop('checked', true);
		if ($figures.eq(index).length) {
			initDetailZoom($figures.eq(index));
		}
	}

	function initDetailGalleries(root) {
		$(root).find('.gallery').addBack('.gallery').each(function(){
			var $gallery = $(this);
			if (!$gallery.data('skGalleryReady')) {
				$gallery.data('skGalleryReady', true);
				setDetailGalleryImage($gallery, 0);
			}
		});
	}

	initDetailGalleries(document);

	if (window.MutationObserver) {
		var detailObserver = new MutationObserver(function(mutations){
			$.each(mutations, function(_, mutation){
				$.each(mutation.addedNodes || [], function(_, node){
					if (node.nodeType === 1 && ($(node).is('#details_container, .gallery') || $(node).find('.gallery').length)) {
						initDetailGalleries(node);
					}
				});
			});
		});
		detailObserver.observe(document.body, {childList: true, subtree: true});
	}

	$(document).on('click', '.gallery .thumbnails .thumb', function(e){
		e.preventDefault();
		var $thumb = $(this);
		var $gallery = $thumb.closest('.gallery');
		setDetailGalleryImage($gallery, $thumb.index());
	});

	$(document).on('click', '.gallery .jqzoom img', function(e){
		var modal = document.getElementById('zoomModal');
		if (modal && window.bootstrap && window.bootstrap.Modal) {
			e.preventDefault();
			window.bootstrap.Modal.getOrCreateInstance(modal).show();
		}
	});
});


// Variantenselektor
function goto_variant(){
//	var url = $("#select_variant").val;
	url = $('#select_variant').val();
	//alert(url);
	window.location= url;

}


// Kontaktformular
$(document).ready(function(){
	function submitContactFormAjax(form) {
		var $form = $(form);
		var $holder = $form.parent();
		var $status = $form.find('.sk-product-question-response').first();

		if ($form.is('#contact-ajax') && !$holder.closest('.contact-all-overlay').data('skOriginalContactForm')) {
			$holder.closest('.contact-all-overlay').data('skOriginalContactForm', $form.prop('outerHTML'));
		}

		if (form.checkValidity && !form.checkValidity()) {
			form.reportValidity();
			return;
		}

		var $submit = $form.find(':submit').first();
		var submitText = $submit.val() || $submit.text();
		var action = $form.attr('action') || window.location.href;
		var restoreSubmit = function() {
			$submit.prop('disabled', false);
			if ($submit.is('input')) {
				$submit.val(submitText);
			} else {
				$submit.text(submitText);
			}
		};
		var showContactError = function(message) {
			if (!$status.length) {
				$status = $('<div class="sk-product-question-response" role="alert"></div>').insertBefore($submit);
			}
			$status.removeClass('is-success').addClass('is-error').text(message);
			restoreSubmit();
		};

		$status.removeClass('is-error is-success').empty();
		$submit.prop('disabled', true);
		if ($submit.is('input')) {
			$submit.val('Wird gesendet...');
		} else {
			$submit.text('Wird gesendet...');
		}

		$.ajax({
			type: ($form.attr('method') || 'post').toUpperCase(),
			url: action,
			data: $form.serialize(),
			success: function(msg) {
				var $response = $('<div></div>').html(msg);
				var ok = /Vielen Dank|Danke|alert-success/i.test(msg);
				if (!ok) {
					var errorText = $.trim($response.find('.alert-danger, .errorbox').first().text());
					showContactError(errorText || 'Die Nachricht konnte nicht verarbeitet werden. Bitte pruefen Sie Ihre Angaben.');
					return;
				}

				var $overlay = $form.closest('.contact-all-overlay');
				if ($overlay.length && !$overlay.is(':visible')) {
					if (form.reset) {
						form.reset();
					}
					restoreSubmit();
					return;
				}

				$form.replaceWith('<div class="sk-contact-submit-message">Vielen Dank f\u00fcr Ihre Nachricht an St\u00f6berkiste.</div>');
			},
			error: function() {
				showContactError('Die Nachricht konnte nicht gesendet werden. Bitte versuchen Sie es noch einmal.');
			}
		});
	}

	$(document).on('submit', '#contact-ajax, #contact-ajax-detail, .kontakt-laden form', function(e){
		e.preventDefault();
		submitContactFormAjax(this);
	});
});


//MSG Artikel in den Warenkorb gelegt
$(".msg").delay(3500).fadeOut(1000);

$('.elch').delay(500).animate({marginRight:'0px'},500, function(){
	$('.elch').delay(2500).animate({marginRight:'-158px'},500);
});






//Zoom-Funktion für Produkt Detail

//  $('.zoom').parent().zoom();



	$('.jqzoom').not('.gallery .jqzoom').jqzoom({
            zoomType: 'innerzoom',
            preloadImages: true,
            alwaysOn:false
        });

// Sidebar einblenden
$(document).ready(function(){
	show_panels();
});

function show_panels(){
	//var ww = document.body.clientWidth;
	$('.top-bar').show();

	//if (ww < 1200) {
	//$('#panel-left, #panel-right, .top-bar').hide();
	//$('#panel-left, #panel-right, .top-bar').show();
	//}
}
