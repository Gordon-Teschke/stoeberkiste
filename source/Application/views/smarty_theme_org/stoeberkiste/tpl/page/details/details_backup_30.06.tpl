[{include file="_header.tpl" title=$template_title}]
<div class="item-detail">
[{include file="inc/user_meta_navigation.tpl"}]
<div class="clearfix"></div>  
[{oxid_include_dynamic file="dyn/newbasketitem_message.tpl"}]
[{include file="inc/error.tpl" Errorlist=$Errors.default}]

[{assign var="currency" value=$oView->getActCurrency() }]
[{assign var="product" value=$oView->getProduct() }]
[{assign var="oManufacturer" value=$product->getManufacturer()}]
[{assign var="oPictureProduct" value=$oView->getPicturesProduct()}]
[{assign var="oAccessoires" value=$oView->getAccessoires()}] [{*error*}]
[{oxid_include_widget cl="oxwArticleDetails" _parent=$oView->getClassName() nocookie=0 force_sid=$force_sid _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
[{assign var="actCategory" value=$oView->getActiveCategory()}]

<hr>
		<h1>[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]</h1>
				<small>[{if $oManufacturer}]<a href="[{ $oManufacturer->getLink() }]">[{ $oManufacturer->oxmanufacturers__oxtitle->value}]</a> &middot; [{/if}]Art.-Nr. [{ $product->oxarticles__oxartnum->value }]</small>
					<a href="/out/pictures/master/product/1/[{$product->oxarticles__oxpic1->value}]" class="jqzoom" rel='gal1'  title="triumph" >
						<img src="/out/pictures/master/product/1/[{$product->oxarticles__oxpic1->value}]"  title="triumph"  style="width:50%;">
					</a>       
						<ul id="thumblist">
                        [{if $oPictureProduct->getMasterZoomPictureUrl(2)}]
                        [{* Wenn kein 2. Produktbild vorhanden ist, Thumbnails ausschalten *}]

						[{if $oPictureProduct->getMasterZoomPictureUrl(1)}]
							<li><a href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: '[{$oPictureProduct->getMasterZoomPictureUrl(1)}]',largeimage: '[{$oPictureProduct->getMasterZoomPictureUrl(1)}]'}"><img src='[{$oPictureProduct->getMasterZoomPictureUrl(1)}]' ></a></li>
						[{/if}]

						[{if $oPictureProduct->getMasterZoomPictureUrl(2)}]
							<li><a href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: '[{$oPictureProduct->getMasterZoomPictureUrl(2)}]',largeimage: '[{$oPictureProduct->getMasterZoomPictureUrl(2)}]'}"><img src='[{$oPictureProduct->getMasterZoomPictureUrl(2)}]' ></a></li>
						[{/if}]

						[{if $oPictureProduct->getMasterZoomPictureUrl(3)}]
							<li><a href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: '[{$oPictureProduct->getMasterZoomPictureUrl(3)}]',largeimage: '[{$oPictureProduct->getMasterZoomPictureUrl(3)}]'}"><img src='[{$oPictureProduct->getMasterZoomPictureUrl(3)}]' ></a></li>
						[{/if}]

						[{if $oPictureProduct->getMasterZoomPictureUrl(4)}]
							<li><a href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: '[{$oPictureProduct->getMasterZoomPictureUrl(4)}]',largeimage: '[{$oPictureProduct->getMasterZoomPictureUrl(4)}]'}"><img src='[{$oPictureProduct->getMasterZoomPictureUrl(4)}]' ></a></li>
						[{/if}]

						[{if $oPictureProduct->getMasterZoomPictureUrl(5)}]
							<li><a href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: '[{$oPictureProduct->getMasterZoomPictureUrl(5)}]',largeimage: '[{$oPictureProduct->getMasterZoomPictureUrl(5)}]'}"><img src='[{$oPictureProduct->getMasterZoomPictureUrl(5)}]' ></a></li>
						[{/if}]
						[{/if}]
						</ul>

            [{if $oView->showZoomPics() }]
	            [{*assign var="iZoomPic" value=$oView->getActZoomPic() *}]
              [{*assign var="aZoomPics" value=$oView->getZoomPics() *}]
            [{/if}]
			
			
			
         <!-- </div>-->
			


          <div class="pic_more">
          	[{*
            [{foreach from=$oView->getIcons() key=picnr item=ArtIcon name=MorePics}]
            <a id="test_MorePics_[{$smarty.foreach.MorePics.iteration}]" rel="nofollow" href="[{ $product->getLink()|oxaddparams:"actpicid=`$picnr`" }]" onclick="oxid.image('product_img','[{$product->getPictureUrl($picnr)}]');return false;"><img src="[{$product->getIconUrl($picnr)}]" alt=""></a>
    [{/foreach}]
    				*}]
          </div>
		  
		   
					<!--<img src="img/item-detail-rectangle.jpg" alt="" title="" /> image with rectangle dimensions-->
						<div class="all-details">	
						<!--<div class="all-details with-rectangle"> added class on DIV for images with rectangle dimensions-->
							<p class="detail-description">[{oxeval var=$product->getLongDescription()}]</p>
							
    <form action="[{ $oViewConf->getSelfActionLink() }]" id="productform" name="productform" method="post">
    [{ $oViewConf->getHiddenSid() }]
    [{ $oViewConf->getNavFormParams() }]
    <input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
    <input type="hidden" name="fnc" value="tobasket">
    <input type="hidden" name="aid" value="[{ $product->oxarticles__oxid->value }]">
    <input type="hidden" name="anid" value="[{ $product->oxarticles__oxnid->value }]">

[{* Zugeordnete Decke/Kissen laden *}]
[{ if $oView->getAccessoires() }]
    
    [{php}]
    $pfad = $_SERVER['REQUEST_URI'];
    #echo $pfad;
    if (stripos($pfad, 'Kissen') !== false) {
    	$acc_title = 'Wolldecke';
    } else {
    	$acc_title = 'Kissen';
    }
    [{/php}]
	
	[{foreach from=$oView->getAccessoires() item=oAcc}]
	<a href="[{$oAcc->getMainLink()}]" class="is-pillow">Auch als [{php}]echo $acc_title;[{/php}] erh&auml;ltlich</a>
	[{/foreach}]
[{else}]
	<div class="is-no-pillow"></div>
[{ /if }]
									<p class="menge">Menge:</p><input type="text" value="1" name="am" id="count-item" />

[{* Neue Variantenfunktion *}]
[{if $product->hasMdVariants() }]
[{else}]
	[{* Einfache Varianten *}]
[{ if !$product->isParentNotBuyable() && $product->getFPrice() }]
[{* Untervariante wird angezeigt *}]



<!-- Ausgabe gewählter Variante -->
    [{if $product->getVariants() || $oView->drawParentUrl()}]
	<div class="my-variant">
	<p class="choose-variant">Gew&auml;hlte Variante:<i> [{ $product->oxarticles__oxvarselect->value }]</i></p>
    	[{* zurück zum Vaterartikel *}]
	<a id="test_backToParent" class="btn back-top-parent" href="[{$oView->getParentUrl()}]">Variante ändern</a>
    </div><!--my-variant-->
	[{/if}]


[{/if}]

[{if $product->getVariants() }]
<select class="varianten" id="select_variant" onchange="goto_variant();">
	<option value="">Variante w&auml;hlen</option>
  [{foreach from=$product->getVariants() item=variant}]
	<option value="[{$variant->getLink()}]">[{ $variant->oxarticles__oxvarselect->value }]</option>
  [{*&middot; <a href="[{$variant->getLink()}]">[{ $variant->oxarticles__oxvarselect->value }]</a>*}]
  [{/foreach}]
</select>
[{/if}]
  
[{/if}]
[{*$oDetailsProduct->getPrice()*}]
[{* / Neue Testfunktion *}]

											<p class="price-detail">[{if $product->getFPrice() }]
	                      [{if $product->getFTPrice() }]<span style="line-height:9px;text-decoration:line-through;">[{ $product->getFTPrice() }] &euro;</span>&nbsp;&middot; [{/if}][{ $product->getFPrice() }] [{ $currency->sign}]
                      [{/if}]</p>
												<small style="width:auto;">inkl. 19 % Mwst. [{if $product->getFPrice() < 50}]zzgl. <a href="/Versand-Kosten/">Versandkosten</a>[{else}]&middot; Versandkostenfrei[{/if}]</small>
[{* *}]
[{if $product->oxarticles__oxnostocktext->value }]
<small style="width:auto;">[{$product->oxarticles__oxnostocktext->value }]</small>
[{else}]
<small style="width:auto;">Lieferzeit: [{$product->oxarticles__oxmindeltime->value}] - [{$product->oxarticles__oxmaxdeltime->value}] [{if $product->oxarticles__oxdeltimeunit->value == "DAY"}]Tage[{elseif $product->oxarticles__oxdeltimeunit->value == "WEEK"}]Wochen[{else}]Monate[{/if}]</small>
[{/if}]

[{*if $oView->isPersParam()*}]
[{*if $product->isPersParam()*}]
[{*assign var="text" value=$oView->isPersParam() *}]
<input type="hidden" name="persparam[details]" value="[{ $product->aPersistParam.text }]" size="35">
[{*/if*}]
[{*													<p class="wrapped-as-present">Als Geschenk verpacken</p><input type="checkbox" name="" value="" id="as-present" checked="" />
														<p class="make-a-pillow"><img src="/out/stoeberkiste/img/pillow.png" alt="" title="" />Als Kissen umarbeiten</p><input type="checkbox" name="" value="" id="as-pillow" />
*}]

															[{if $product->isBuyable() }]<a href="#" onclick="document.productform.submit();" class="btn into-cart" style="margin-left:12px;">In den Warenkorb</a>[{else}]<a href="#" class="choose-btn">Bitte zuerst Variante auswählen</a>[{/if}]
[{if $oxcmp_user }]
<a class="btn reminder-list" id="linkToNoticeList" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getActiveClassName() params="aid=`$product->oxarticles__oxnid->value`&amp;anid=`$product->oxarticles__oxnid->value`&amp;fnc=tonoticelist&amp;am=1"|cat:$oViewConf->getNavUrlParams() }]" rel="nofollow">Auf die Merkliste</a>
[{else}]
<a class="btn reminder-list" id="test_LoginToNotice" class="reqlogin" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" params="anid=`$product->oxarticles__oxnid->value`"|cat:"&amp;sourcecl="|cat:$oViewConf->getActiveClassName()|cat:$oViewConf->getNavUrlParams() }]" rel="nofollow">[{ oxmultilang ident="DETAILS_LOGGINTOACCESSNOTICELIST" }]</a>
[{/if}]
								</form>
								
								
								
						</div><!--all-details-->
						
						 
						
						<form id="contact-ajax-detail" method="post" action="#" class="product-mail">
            				<input type="hidden" name="action" value="contact" />
								<p>Haben Sie Fragen zu diesem Artikel? Schreiben Sie uns:</p>
									<input type="hidden" name="ArtikelName" value="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]" />
									<input type="hidden" name="ArtikelNr" value="[{ $product->oxarticles__oxartnum->value }]" />
									<input type="text" name="name" value="" placeholder="Ihr Name" class="small-input" />
									<input type="text" name="email" value="" placeholder="Ihre E-Mail Adresse" class="small-input right-input" />
										<textarea name="message" placeholder="Ihre Nachricht an uns..."></textarea>
							<input type="checkbox" name="dsgvo1" id="dsgvo" style="width:50px;margin-right:10px;">
							<div class="clearfix"></div>
							<label for="dsgvo" style="color:#000;font-size:13px;"><br />Ich habe die <a href="/datenschutz">Datenschutzerklärung</a> gelesen und erkläre mich mit der Speicherung und Verarbeitung meiner Daten durch diese Website zum Zweck der Kontaktaufnahme durch den Webseitenbetreiber einverstanden.</label><br />
											<input type="submit" name="" value="Nachricht senden" class="btn" id="submit-product-detail" />
							<br />
			
							</form>

			
</div><!--item-detail-->



[{include file="_footer.tpl"}]