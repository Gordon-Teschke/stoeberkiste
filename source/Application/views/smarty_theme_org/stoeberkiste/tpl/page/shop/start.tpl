[{include file="_header.frontpage.tpl" title=$template_title location="START_TITLE"|oxmultilangassign isStart=true seopage="start"}]

  <div data-role="panel" data-position="left" id="panel-left" class="menu-hauptnavigation-container" data-display="push" data-position="absolute" style="height:100%;">
	<div class="top-bar">
		<a href=""><img src="/out/stoeberkiste/img/logo-top.png" alt="" title="" /></a>
			<form method="get" name="search" action="[{ $oViewConf->getSelfActionLink() }]">
        [{ $oViewConf->getHiddenSid() }]
        <input type="hidden" name="cl" value="search">
				<input type="submit" name="" value="" id="search-submit" />
				<input type="text" name="searchparam" value="[{$oView->getSearchParamForHtml()}]" id="search-bar-top" placeholder="St&ouml;bern..." />
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
			<p class="close-contact">Schließen</p>
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
			<a href="" class="btn to-contact open-contact">Kontakt</a>
		</div><!--cart-fixed-->
	</div><!--panel-right-->
</aside>
<!--sidebar and mobile panel right END-->  

<!--only mobile header START-->
<div data-role="header" class="mobile-header">
	<h1 class="mobile-title">Stöberkiste Wuppertal</h1>
		<a href="#panel-left" class="trigger trigger-left"></a>
		<a href="#panel-right" class="trigger trigger-right"></a>
</div><!--header-->
<!--only mobile header END-->
  
<div data-role="main" class="ui-content content">

<div id="top"></div><!--#top-->
<div class="cart-fixed">
	<div class="count-output"><p>[{$oxcmp_basket->getItemsCount()}]&nbsp;Artikel</p></div><!--count-output-->
	<a href="/warenkorb/" class="btn to-checkout">Meine&nbsp;Einkäufe</a>
	<a href="/Warm/" class="btn to-shop">Zum Shop</a>
	<a href="" class="btn to-contact open-contact">Kontakt</a>
</div><!--cart-fixed-->
	<section class="welcome-top">
		<div class="hello">
      [{oxifcontent ident="frontpage_top" object="oCont"}]
        [{$oCont->oxcontents__oxcontent->value}]
      [{/oxifcontent}]
			</div><!--hello-->
				<div class="teaser-top">
					<strong></strong>
					<!--<a href="/God-Jul/" class="ribbon">  God Jul!</a>-->

<a href="/Nach-Hersteller/Pia-Malmros/" class="ribbon">  Pia Malmros</a>
					<!--  <a href="/Nach-Hersteller/Kortkartellet/" class="ribbon">Kortkartellet</a> -->
                    
                    <!--   BOF: Teaser für Änderung der Öffnungszeiten nur IMG auf sichtbar geschaltet-->
                      
						<div class="teaser-top-title-bg">
						</div><!--teaser-top-title-bg-->
					  		<span>
                              [{oxifcontent ident="frontpage_teaser" object="oCont"}]
                                [{$oCont->oxcontents__oxcontent->value}]
                              [{/oxifcontent}]
							</span>	                            
                            
                     	
                      <!--   EOF: Teaser für Änderung der Öffnungszeiten nur IMG auf sichtbar geschaltet-->
                            
                            		
								<img src="/out/stoeberkiste/img/teaser-top-default.jpg" alt="" title="" />
				</div><!--teaser-top-->
				<div class="clearfix"></div><!--clearfix-->
	</section><!--welome-top-->
	
	<section class="all-tiles">
		<div class="tile">
			<strong></strong>
            <a href="/Warm/" class="ribbon red">Warm...</a>
            <img src="/out/stoeberkiste/img/cat-warm.jpg" title="Warm" alt="Warm" />
		</div><!--tile-->
        <div class="tile black">
            <strong></strong>
            <a href="/Weich/" class="ribbon">Weich...</a>
            <img src="/out/stoeberkiste/img/cat-weich2.jpg" title="Weich" alt="Weich" />
        </div><!--tile-->
        <div class="tile blue last-tile">
            <strong></strong>
            <a href="/Klar/" class="ribbon">Klar...</a>
            <img src="/out/stoeberkiste/img/cat-klar.jpg" title="Klar" alt="Klar" />
        </div><!--tile-->
        <div class="tile orange">
            <strong></strong>
            <a href="/Tierisch/" class="ribbon">Tierisch...</a>
            <img src="/out/stoeberkiste/img/cat-tierisch.jpg" title="Tierisch" alt="Tierisch" />
        </div><!--tile-->
        <div class="tile pink">
            <strong></strong>
            <a href="/Kunstvoll/" class="ribbon">Kunstvoll...</a>
            <img src="/out/stoeberkiste/img/cat-kunstvoll.jpg" title="Kunstvoll" alt="Kunstvoll" />
        </div><!--tile-->
        <div class="tile dark-red last-tile">
            <strong></strong>
            <a href="/Nach-Hersteller/Pia-Malmros/" class="ribbon">Pia Malmros...</a>
            <img src="/out/stoeberkiste/img/cat-mia.jpg" title="Pia Malmros" alt="Pia Malmros" />
        </div><!--tile-->
	</section><!--all-tiles-->
				
	<section class="roros">
    [{*
		<div class="roros-flag">
			<span></span>
				<img src="/out/stoeberkiste/img/roros-round.png" class="roros-logo" alt="" title="" />
					<h3>Wir machen aus Ihrer Decke ein Kissen!</h3>
						<p>Einfach Ihre neue Decke von Roros aus unserem <a href="/Nach-Hersteller/R-ros-Tweed/" class="btn">Shop > Roros Tweed</a> auswählen, und bei der Bestellung die Kissen-Variante angeben. Fertig!</p>
		</div><!--roros-flag-->
    *}]
		<div class="cloud-text">
			<img src="/out/stoeberkiste/img/cloud.png" alt="" title="" />
      [{oxifcontent ident="frontpage_bottom" object="oCont"}]
        [{$oCont->oxcontents__oxcontent->value}]
      [{/oxifcontent}]
		</div><!--cloud-text-->
	</section><!--roros-->
	
	<section class="brands">
		<h3>Einige der Marken, die wir in unserem Shop f&uuml;hren</h3>
			<div class="all-brands">
				<a href="/Nach-Hersteller/R-ros-Tweed/"><img src="/out/stoeberkiste/img/brand-roros.jpg" alt="" title="" id="roros-image" /></a>
				<a href="/Nach-Hersteller/Marimekko/"><img src="/out/stoeberkiste/img/brand-marimekko.jpg" alt="" title="" /></a>
				<a href="/Nach-Hersteller/Faerg-Form/"><img src="/out/stoeberkiste/img/brand-forg.jpg" alt="" title="" /></a>
				<a href="/Nach-Hersteller/Holmegaard/"><img src="/out/stoeberkiste/img/brand-holme.jpg" alt="" title="" /></a>
				<a href="/Nach-Hersteller/Livingly/"><img src="/out/stoeberkiste/img/brand-livingly.jpg" alt="" title="" /></a>
			</div><!--all-brands-->
	</section><!--brands-->
	
	<div class="background"></div><!--background-->

[{include file="_footer.frontpage.tpl" }]