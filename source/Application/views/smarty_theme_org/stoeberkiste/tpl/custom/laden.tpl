<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Unser Laden | St&ouml;berkiste Wuppertal</title>
    <meta name="viewport" content="width=device-width; initial-scale=1.0; minimum-scale=1; maximum-scale=1.0; user-scalable=0;">
	<link rel="shortcut icon" href="/out/stoeberkiste/img/favicon.png" type="image/png" />
    <link rel="stylesheet" href="/out/stoeberkiste/css/normalize.css">
    <link rel="stylesheet" href="/out/stoeberkiste/css/mobile.css">
    <link rel="stylesheet" href="/out/stoeberkiste/css/style.css">
    <style>
    .cms p{
	float:none!important;
}
    </style>
    <link href='https://fonts.googleapis.com/css?family=Lato:300' rel='stylesheet' type='text/css'>
    <meta name="description" content="Stöberkiste Wuppertal &middot; Bekleidung - Wohnen - Schenken.">
</head>

<body>

<header>
</header>

<div data-role="page" class="wrapper">
  <div data-role="panel" data-position="left" id="panel-left" class="menu-hauptnavigation-container" data-display="push" data-position="absolute" style="height:100%";>
	<div class="top-bar">
		<a href="/"><img src="/out/stoeberkiste/img/logo-top.png" alt="" title="" /></a>
			<form method="" action="">
				<input type="submit" name="" value="" id="search-submit" />
				<input type="text" name="" value="" id="search-bar-top" placeholder="St&ouml;bern..." autofocus />
			</form>
			<ul id="topnav">
				<li><a href="/Laden/">Unser Laden</a></li>
				<li><a href="/Warm/">Shop</a></li>
				<!--<li><a href="/Blog/">Blog</a></li>-->
			</ul><!--topnav-->
	</div><!--top-bar-->
  </div><!--panel-->
  
  <div class="contact-all-overlay" style="display:none;">
	<div class="contact-all-inner">
		<a href=""><img src="/out/stoeberkiste/img/logo-top.png" alt="" title="" /></a>
			<p class="close-contact">Schlie&szlig;en</p>
				<h4>Kontakt</h4>
					<p class="contact-all-text">Märkische Str.114<br> 42281 Wuppertal<br> Telefon: (02 02) 52 40 28<br> Fax: (02 02) 52 69 24<br> E-Mail: <a href="mailto:info@stoeberkiste-wuppertal.de" data-mce-href="mailto:info@stoeberkiste-wuppertal.de">info@stoeberkiste-wuppertal.de</a><br><br> <br></p>
						<form id="contact-ajax" method="post" action="/">
            	<input type="hidden" name="action" value="contact" />
							<input type="text" name="name" value="" placeholder="Name" />
							<input type="text" name="email" value="" placeholder="E-Mail Adresse" />
								<textarea name="message" placeholder="Ihre Nachricht an uns..."></textarea>
									<input type="submit" value="Nachricht senden" name="" id="contact-all-submit" class="btn" />
						</form>
						
	</div><!--contact-all-inner-->
	
</div><!--contact-all-overlay-->  

<!--sidebar and mobile panel right START-->
<aside>
	<div data-role="panel" id="panel-right" class="sidebar" data-position="right" data-display="push">
		<div class="shopping-cart">
			<div class="count-output"><p>[{$oxcmp_basket->getItemsCount()}]&nbsp;Artikel</p></div><!--count-output-->
			<a href="/warenkorb/" class="btn to-checkout">Meine&nbsp;Einkäufe</a>
			<a href="/Warm/" class="btn to-shop">Zum Shop</a>
			<a href="#" class="btn to-contact">Kontakt</a>
		</div><!--cart-fixed-->
	</div><!--panel-right-->
</aside>
<!--sidebar and mobile panel right END-->  

<!--only mobile header START-->
<div data-role="header" class="mobile-header">
	<h1 class="mobile-title">St&ouml;berkiste Wuppertal</h1>
		<a href="#panel-left" class="trigger trigger-left"></a>
		<a href="#panel-right" class="trigger trigger-right"></a>
</div><!--header-->
<!--only mobile header END-->
  
<div class="image-top">
	<img src="/out/stoeberkiste/img/header-laden.jpg" alt="" title="" />
</div><!--image-top-->  
  
<div data-role="main" class="ui-content content">
<div id="top"></div><!--#top-->
<div class="cart-fixed">
			<div class="count-output"><p>[{$oxcmp_basket->getItemsCount()}]&nbsp;Artikel</p></div><!--count-output-->
			<a href="/warenkorb/" class="btn to-checkout">Meine&nbsp;Einkäufe</a>
			<a href="/Warm/" class="btn to-shop">Zum Shop</a>
			<a href="#" class="btn to-contact">Kontakt</a>
</div><!--cart-fixed-->

<div class="on-page-navi">
	<a href="#first" class="ui-link">Start</a>
	<a href="#second" class="ui-link">Aktionen</a>
	<a href="#third" class="ui-link">Anfahrt</a>
	<a href="#fourth" class="ui-link">Kontakt</a>
</div>

<section class="story about-us" id="first">
	<h1>&Uuml;ber uns</h1>
  [{oxifcontent ident="laden_einleitung" object="oCont"}]
    [{$oCont->oxcontents__oxcontent->value}]
  [{/oxifcontent}]
</section>

<section class="cms story aktionen-laden2" id="second">
	<h1>Aktionen im Laden</h1>
  [{oxifcontent ident="laden_aktion" object="oCont"}]
    [{$oCont->oxcontents__oxcontent->value}]
  [{/oxifcontent}]
</section>

<section class="story anfahrt-laden" id="third">
	<h1>Anfahrt - Ihr Weg zur M&auml;rkischen Str. 114, Wuppertal</h1>
		<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d19962.271039751573!2d7.208757888548667!3d51.28749974248787!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47b928059130366d%3A0xe74be420e2816fd5!2sM%C3%A4rkische+Str.+114%2C+42281+Wuppertal!5e0!3m2!1sde!2sde!4v1415093804239" width="100%" height="350" frameborder="0" style="border:0"></iframe>
			<div class="left">
			<h1>...mit dem Auto:</h1>
			<p>Sie erreichen uns am einfachsten &uuml;ber die Autobahn A 46, 
			Ausfahrt "Wichlinghausen", dann geradeaus. Die Stra&szlig;e geht 
			&uuml;ber in die M&auml;rkische Stra&szlig;e. Nach der gro&szlig;en Kurve auf der 
			linken Seite. Parkpl&auml;tze vor dem Gesch&auml;ft und auf der 
			gegen&uuml;berliegenden Stra&szlig;enseite.</p>
			</div><!--left-->
				<div class="right">
				<h1>...mit &ouml;ffentlichen Verkehrsmitteln:</h1>
				<p>Autobuslinie 332.<br />
				Die Haltestelle "Vockendahl" befindet sich unmittelbar vor 
				dem Gesch&auml;ft, wenn man aus Richtung Stadtmitte kommt. 
				Die Busline f&auml;hrt ab "Barmer Bahnhof" bzw. "Alter Markt".</p>
				</div><!--right-->
</section>

<section class="story last-story kontakt-laden" id="fourth">
	<h1>Kontakt</h1>
		<div class="left">
  [{oxifcontent ident="laden_kontakt" object="oCont"}]
    [{$oCont->oxcontents__oxcontent->value}]
  [{/oxifcontent}]
		</div><!--left-->
			<div class="right">
				<form method="" action="">
							<input type="text" name="" value="" placeholder="Name" />
							<input type="text" name="" value="" placeholder="E-Mail Adresse" />
								<textarea placeholder="Ihre Nachricht an uns..."></textarea>
									<input type="submit" value="Nachricht senden" name="" id="contact-all-submit" class="btn" />
						</form>
			</div><!--right-->
</section>


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
    </ul>
    <div class="help">
      <p>Bei Fragen helfen wir Ihnen gerne weiter: (02 02) 52 40 28</p>
      <small>Montags - Freitags von 10 - 18.30 Uhr, Samstags von 10 - 14.00 Uhr</small>
    </div><!--help-->
      <div class="logo-bottom">
        <a href="/"><img src="/out/stoeberkiste/img/logo-top.png" alt="" title="" /></a>
        <a href="https://www.facebook.com/stoeberkiste.wuppertal" target="_blank"><img src="/out/stoeberkiste/img/fb.png" alt="Facebook" class="fb-bottom" /></a>
          <p>Besuchen Sie uns auch auf Facebook!</p>
      </div><!--logo-bottom-->
	</div><!--fooInner-->
</footer>

</div><!--page / wrapper END-->


<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="/out/stoeberkiste/js/modernizr.js"></script>
<script src="/out/stoeberkiste/js/jquery.nicescroll.min.js"></script>
<script src="/out/stoeberkiste/js/retina.min.js"></script>
<script src="/out/stoeberkiste/js/script.js"></script>
<script src="https://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.js"></script>


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

 </body>
</html>