[{if $show == "preview"}]
	<div class="card-item">
		<div class="card" data-id="pia_[{ $product->oxarticles__oxartnum->value }]">
			<img src="/out/pictures/master/product/1/[{$product->oxarticles__oxpic1->value}]" style="width:100%;height:100%;" >
		</div><!--card-->
			<p>[{ $product->oxarticles__oxartnum->value }]</p>
			<small>[{$product->oxarticles__oxtitle->value}]</small>
	</div><!--card-item-->
    
[{else}][{* Detailansicht *}]


    <form action="[{ $oViewConf->getSelfActionLink() }]" id="productform" name="productform_pia_[{ $product->oxarticles__oxartnum->value }]" method="post">
    [{ $oViewConf->getHiddenSid() }]
    [{ $oViewConf->getNavFormParams() }]
    <input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
    <input type="hidden" name="fnc" value="tobasket">
    <input type="hidden" name="aid" value="[{ $product->oxarticles__oxid->value }]">
    <input type="hidden" name="anid" value="[{ $product->oxarticles__oxnid->value }]">
	<input type="hidden" value="1" name="am" id="count-item" />
    
	<div class="card-view" data-id="pia_[{ $product->oxarticles__oxartnum->value }]">
		<span class="close-details">Schlie&szlig;en</span>
        	<div class="pia_shop_options">
                <p>Karte [{ $product->oxarticles__oxartnum->value }]</p>
                <small>[{$product->oxarticles__oxtitle->value}]</small>
                <p class="card-price">[{ $product->getFPrice() }] &euro;</p>
                <p class="shipping-label">Zzgl. <a class="pia-link" href="/Versand-Kosten/">Versandkosten</a><br />Lieferzeit: 1-7 Tage</p>
                    [{if $product->isBuyable() }]<a href="#" onclick="document.productform_pia_[{ $product->oxarticles__oxartnum->value }].submit();" class="card-btn">In den Warenkorb</a>[{/if}]
            </div><!--pia_shop_options-->
            <section class="card-holder">
                <div id="uc_container_pia_[{ $product->oxarticles__oxartnum->value }]" class="uc-container">
                    <div class="uc-initial-content">
                        <img src="/out/pictures/master/product/1/[{$product->oxarticles__oxpic1->value}]" />
                        [{*<img src="/out/pictures/generated/product/1/360_360_75/[{ $product->oxarticles__oxartnum->value|lower }]-1.jpg" />*}][{*<img src="/out/stoeberkiste/img/card-view-default.jpg" />*}]
                        <span class="clickme">Karte &ouml;ffnen</span>
                    </div>
                    <div class="uc-final-content">
                        <div class="scrollwrap">
                            <img src="/out/pictures/master/product/2/[{$product->oxarticles__oxpic2->value}]" />
                        </div>
                         <span class="clickme close">Karte schlie&szlig;en</span>
                    </div>
                </div>
            </section><!--card-holder-->
	</div><!--card-view-->
    </form>
[{/if}]