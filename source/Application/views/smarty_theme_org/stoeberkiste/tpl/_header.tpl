<!DOCTYPE html>
<html>
<head>
<!-- [{$oView->getClassName()}] -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width; initial-scale=1.0; minimum-scale=1; maximum-scale=1.0; user-scalable=0;">
	[{include file="inc/seo.tpl" seopage=$seopage}]
	<link rel="shortcut icon" href="/out/stoeberkiste/img/favicon.png" type="image/png" />
	<link rel="stylesheet" href="/out/stoeberkiste/css/normalize.css">
	<link rel="stylesheet" href="/out/stoeberkiste/css/mobile.css">
	<link rel="stylesheet" href="/out/stoeberkiste/css/fonts.css">
	<link rel="stylesheet" href="/out/stoeberkiste/css/style.css">
	<link rel="stylesheet" href="/out/stoeberkiste/css/ext.css">
[{if isset($pia)}]
<link rel="stylesheet" type="text/css" href="/out/stoeberkiste/css/pfold.css" />
	<script type="text/javascript" src="/out/stoeberkiste/js/modernizr.custom.79639.js"></script> 
[{/if}]

</head>

<body>
<div data-role="page" class="wrapper">
  <div data-role="panel" data-position="left" id="panel-left" class="menu-hauptnavigation-container" data-display="push" data-position="absolute" style="height:100%;">
	<div class="top-bar">
		<a href="/"><img src="/out/stoeberkiste/img/logo-top.png" alt="Stöberkiste Logo" /></a>
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
			

[{if $oView->getClassName() != 'basket' and $oView->getClassName() != 'user' and $oView->getClassName() != 'order' and $oView->getClassName() != 'payment' and $oView->getClassName() != 'thankyou' and $oView->getClassName() != 'wrapping'}]

	<div class="side-menu-complete-mobile">
		<ul>
		[{include file="inc/category_tree_mobile.tpl" tree=$oxcmp_categories act=$oxcmp_categories->getClickCat() class="all-cats"}]
		</ul>

		  [{* Nach Marken *}]
		  [{if $oView->getManufacturerlist()}]
		      [{include file="inc/manufacturer_tree_mobile.tpl" tree=$oView->getManufacturerlist() class="tree"}]
		  [{/if}]
					
			<ul class="shop-info">
				<li><a href="/Versand-Kosten/">Versand und Kosten</a></li>
				<li><a href="/Widerrufsrecht/">Widerrufsrecht</a></li>
				<li><a href="/Impressum/">Impressum</a></li>
				<li><a href="/Datenschutz/">Datenschutz</a></li>
				<li><a href="/Kontakt/">Kontakt</a></li>
			</ul>
	</div><!--side-menu-complete-mobile-->
[{/if}]
			
	</div><!--top-bar-->
  </div><!--panel-->

<div class="contact-all-overlay">
	<div class="contact-all-inner">
		<a href=""><img src="/out/stoeberkiste/img/logo-top.png" alt="Stöberkiste Logo" /></a>
			<p class="close-contact">Schließen</p>
				<div class="h4">Kontakt</div>
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
	<div class="mobile-title" style="text-align:center;margin-top:8px;">St&ouml;berkiste Wuppertal</div>
		<a href="#panel-left" class="trigger trigger-left"></a>
		<a href="#panel-right" class="trigger trigger-right"></a>
</div><!--header-->
<!--only mobile header END-->

<div class="image-top">
[{* Kategorie oder Detail *}]
[{if $oView->getClassName() == 'alist' or $oView->getClassName() == 'details'}]
	[{assign var="actCategory" value=$oView->getActiveCategory()}]
    
    [{php}]
    // Funktion prüft ob das Produkt über den Marken-Weg aufgerufen wurde (URL: /Nach-Hersteller/...)
    $url = $_SERVER['REQUEST_URI'];	# string(28) "/Nach-Hersteller/Faerg-Form/"
    $urls = explode('/', $url);
    $is_brand = $urls[1];
    $brand = $urls[2];
	$brand = mysql_real_escape_string($brand);
    
    if ($is_brand == "Nach-Hersteller") {
        $sql = "SELECT	oxmanufacturers.OXICON
                FROM	oxmanufacturers, oxseo
                WHERE	oxseo.OXSEOURL LIKE 'Nach-Hersteller/".$brand."%/'
                AND		oxseo.OXOBJECTID = oxmanufacturers.OXID
                LIMIT	1";
                
                /*
                SELECT	oxmanufacturers.OXICON
                FROM	oxmanufacturers, oxseo
                WHERE	oxseo.OXSEOURL LIKE 'Nach-Hersteller/Maika/'
                AND		oxseo.OXOBJECTID = oxmanufacturers.OXID
                LIMIT	1
                */
        $res = mysql_query($sql);
        $data = mysql_fetch_array($res);
        if (isset($data['OXICON']) and $data['OXICON'] != "") {
            $brand_banner = '/out/pictures/master/manufacturer/icon/'.$data['OXICON'];
        } else {
            $brand_banner = '/out/stoeberkiste/img/header-shop.jpg';
        }
        
        echo '<img src="'.$brand_banner.'" alt="'.$brand.'" />';
    } else {
    [{/php}]
        [{if $actCategory->oxcategories__oxthumb->value != ""}]
            <img src="/out/pictures/generated/category/thumb/2000_260_75/[{$actCategory->oxcategories__oxthumb->value}]" alt="[{$oView->getTitle()}]" />
        [{else}]
            <img src="/out/stoeberkiste/img/header-shop.jpg" alt="[{$oView->getTitle()}]" />
        [{/if}]
    [{php}]
    }
    [{/php}]

[{elseif $oView->getClassName() == 'manufacturerlist'}]
[{*hersteller-banner*}]

	[{php}]
    // Funktion holt das Hersteller-Bild aus der Datenbank, da über OXID direkt nicht verfügbar
    
    $url = $_SERVER['REQUEST_URI'];	# string(28) "/Nach-Hersteller/Faerg-Form/"
    $urls = explode('/', $url);
    $brand = $urls[2];
	$brand = mysql_real_escape_string($brand);
    
    $sql = "SELECT	oxmanufacturers.OXICON
            FROM	oxmanufacturers, oxseo
            WHERE	oxseo.OXSEOURL LIKE 'Nach-Hersteller/".$brand."/'
            AND		oxseo.OXOBJECTID = oxmanufacturers.OXID
            LIMIT	1";
    $res = mysql_query($sql);
    $data = mysql_fetch_array($res);
    if (isset($data['OXICON']) and $data['OXICON'] != "") {
	    $brand_banner = '/out/pictures/master/manufacturer/icon/'.$data['OXICON'];
    } else {
	    $brand_banner = '/out/stoeberkiste/img/header-shop.jpg';
    }
    
	echo '<img src="'.$brand_banner.'" alt="'.$brand.'" />';
    
	[{/php}]

[{*
	[{if $oView->getTitle() == "Färg &amp; Form"}]
	<img src="/out/stoeberkiste/img/header/cat-tierisch.jpg" alt="[{$oView->getTitle()}]" />
	[{elseif $oView->getTitle() == "Holmegaard"}]
	<img src="/out/stoeberkiste/img/header/cat-klar.jpg" alt="[{$oView->getTitle()}]" />
	[{elseif $oView->getTitle() == "Livingly"}]
	<img src="/out/stoeberkiste/img/header/cat-kunstvoll.jpg" alt="[{$oView->getTitle()}]" />
	[{elseif $oView->getTitle() == "Marimekko"}]
	<img src="/out/stoeberkiste/img/header-shop.jpg" alt="[{$oView->getTitle()}]" />
	[{elseif $oView->getTitle() == "Pia Malmros"}]
	<img src="/out/stoeberkiste/img/header/page-karten.jpg" alt="[{$oView->getTitle()}]" />
	[{elseif $oView->getTitle() == "Pluto Produkter"}]
	<img src="/out/stoeberkiste/img/header/cat-tierisch.jpg" alt="[{$oView->getTitle()}]" />
	[{elseif $oView->getTitle() == "Røros-Tweed"}]
	<img src="/out/stoeberkiste/img/header/cat-warm.jpg" alt="[{$oView->getTitle()}]" />
	[{else}]
	<img src="/out/stoeberkiste/img/header-shop.jpg" alt="[{$oView->getTitle()}]" />
	[{/if}]
*}]


[{else}]
	<img src="/out/stoeberkiste/img/header-shop.jpg" alt="[{$oView->getTitle()}]" />
[{/if}]
</div><!--image-top-->

[{* PIA Karten *}]
[{if isset($pia)}]
<div class="card-detail">
    [{foreach from=$oView->getArticleList() item=actionproduct name=test_articleList}]
	    [{include file="inc/pia.tpl" show="full" product=$actionproduct testid="action_"|cat:$actionproduct->oxarticles__oxid->value test_Cntr=$smarty.foreach.test_articleList.iteration}]
    [{/foreach}]
</div><!--card-detail-->
[{/if}]
[{* /PIA Karten *}]


<div data-role="main" class="ui-content content">
<div id="top"></div><!--#top-->
<div class="cart-fixed">
	<div class="count-output"><p>[{$oxcmp_basket->getItemsCount()}]&nbsp;Artikel</p></div><!--count-output-->
	<a href="/warenkorb/" class="btn to-checkout">Meine&nbsp;Einkäufe</a>
	<a href="/Warm/" class="btn to-shop">Zum Shop</a>
	<a href="#" class="btn to-contact">Kontakt</a>
</div><!--cart-fixed-->

[{if !isset($pia)}]
[{if $oView->getClassName() != 'basket' and $oView->getClassName() != 'user' and $oView->getClassName() != 'order' and $oView->getClassName() != 'payment' and $oView->getClassName() != 'thankyou' and $oView->getClassName() != 'wrapping'}]
<div class="side-menu-complete">
	<div class="shop-menu">

	[{include file="inc/category_tree.tpl" tree=$oxcmp_categories act=$oxcmp_categories->getClickCat() class="all-cats"}]

  [{* Nach Marken *}]
  [{if $oView->getManufacturerlist()}]
      [{include file="inc/manufacturer_tree.tpl" tree=$oView->getManufacturerlist() class="tree"}]
  [{/if}]
	</div><!--shop-menu-->

	<div class="shop-info-menu">
		<ul class="shop-info">
			<li><a href="/Versand-Kosten/">Versand und Kosten</a></li>
			<li><a href="/Widerrufsrecht/">Widerrufsrecht</a></li>
			<li><a href="/Impressum/">Impressum</a></li>
			<li><a href="/Datenschutz/">Datenschutz</a></li>
			<li class="open-contact"><a href="#">Kontakt</a></li>
		</ul>
	</div><!--shop-info-menu-->

</div><!--side-menu-complete-->

[{else}]
	[{* Checkout Steps *}]
  
[{/if}]

[{/if}]
