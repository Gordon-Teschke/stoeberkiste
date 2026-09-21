</div><!--main content-->

<footer>
	<div class="fooInner">
		<ul>
			<li>Unser Laden</li>
			<li><a href="/Laden/#second">Aktionen</a></li>
			<li><a href="/Laden/#third">Anfahrt</a></li>
<!--			<li><a href="/Blog/">Blog</a></li>-->
			<li><a href="#" class="open-contact">Kontakt</a></li>
			<li><a href="/Impressum/">Impressum</a></li>
			<li><a href="/Datenschutz/">Datenschutz</a></li>
		</ul>
    <ul>
      <li>Online-Shop</li>
      <li><a href="/Warm/">Warm...</a></li>
      <li><a href="/Weich/">Weich...</a></li>
      <li><a href="/Klar/">Klar...</a></li>
      <li><a href="/Tierisch/">Tierisch...</a></li>
      <li><a href="/Kunstvoll/">Kunstvoll...</a></li>
    </ul>
    <ul>
      <li>Service</li>
      <li><a href="/Gutscheine/">Gutscheine</a></li>
      <li><a href="/Versand-Kosten">Versand und Kosten</a></li>
      <li><a href="/Geschenkverpackung/">Geschenkverpackung</a></li>
      <li><a href="/AGB/">AGB</a></li>
      <li><a href="/Widerrufsrecht/">Widerrufsrecht</a></li>
      <li style="margin-top:5px;"><a class="btn" style="color:white;" href="/Widerrufsformular/">Widerrufsformular</a></li>
    </ul>
    <div class="help">
      <p>Bei Fragen helfen wir Ihnen gerne weiter: (02 02) 52 40 28</p>
      <small>Montags - Freitags von 10 - 13 Uhr,<br />Montags - Freitags von 15 - 18.30 Uhr,<br />Samstags von 10 - 14.00 Uhr</small>
    </div><!--help-->
      <div class="logo-bottom">
        <a href="/"><img src="/out/stoeberkiste/img/logo-top.png" alt="" title="" /></a>
        <a href="https://www.facebook.com/stoeberkiste.wuppertal" target="_blank"><img src="/out/stoeberkiste/img/fb.png" alt="Facebook" class="fb-bottom" /></a>
          <p>Besuchen Sie uns auch auf Facebook!</p>
      </div><!--logo-bottom-->
	</div><!--fooInner-->
</footer>

</div><!--page / wrapper END-->

<div class="no-selling" id="bm_cookie_notice" >
	<div class="no-selling-inner">
	<p>Um unsere Webseite für Sie optimal zu gestalten und fortlaufend verbessern zu können, verwenden wir Cookies. Durch die weitere Nutzung der Webseite stimmen Sie der Verwendung von Cookies zu. 
Weitere Informationen zu Cookies erhalten Sie in unserer Datenschutzerklärung. <a href="#" id="bm_cookie_close" class="btn-note">Ok</a></p>
	</div><!--no-selling-inner-->
</div><!--no-selling-->


<script src="/out/stoeberkiste/js/jquery-1.12.4.min.js"></script>
<script src="/out/stoeberkiste/js/jquery-migrate-1.2.1.js"></script>
<script type="text/javascript">
$(document).bind("mobileinit", function(){
		$.mobile.ajaxEnabled = false;
	//	$.mobile.autoInitializePage = false;
});
	

</script>  
<!-- MG<script src="https://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.js"></script>-->
<script src="/out/stoeberkiste/js/jquery.mobile-1.4.5.min.js"></script>
[{if isset($pia)}]
[{*  http://tympanus.net/codrops/2012/10/17/pfold-paper-like-unfolding-effect/  *}]
<script type="text/javascript" src="/out/stoeberkiste/js/jquery.pfold.js"></script>
<script type="text/javascript">
$(function() {
var opened = false;
$('.uc-container').each( function( i ) {
	var $item = $( this ), direction;

	var pfold = $item.pfold( {
		easing : 'ease-in-out',
		folddirection : ['left'],
		folds : 1,
		speed : 250
	} );

	$item.find( 'span.clickme' ).on( 'click', function() {
		pfold.unfold();
	} ).end().find( 'span.close' ).on( 'click', function() {
		pfold.fold();
	} );

});
});
</script>
[{/if}]

<script src="/out/stoeberkiste/js/modernizr.js"></script>
<script src="/out/stoeberkiste/js/jquery.nicescroll.min.js"></script>
<script src="/out/stoeberkiste/js/jquery.jqzoom-core.js" type="text/javascript"></script>
<script src="/out/stoeberkiste/js/script.js"></script>

[{* Analytics *}]
<!-- Piwik -->
<script type="text/javascript">
  var _paq = _paq || [];
  _paq.push(["setCookieDomain", "*.stoeberkiste-wuppertal.de"]);
  _paq.push(["setDoNotTrack", true]);
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u="//analytics.bruchmann-media.de/";
    _paq.push(['setTrackerUrl', u+'piwik.php']);
    _paq.push(['setSiteId', 98]);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
<noscript><p><img src="//analytics.bruchmann-media.de/piwik.php?idsite=98" style="border:0;" alt="" /></p></noscript>
<!-- End Piwik Code -->
[{*debug*}]

<style>
@media only screen and (max-width: 1024px){  
  #panel-left, #panel-right, .ui-panel-inner{
		display:block;
	}
}	
</style>

</body>
</html>