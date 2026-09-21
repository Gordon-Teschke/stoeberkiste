[{assign var="currency" value=$oView->getActCurrency()}]
    [{if $showMainLink}]
        [{assign var='_productLink' value=$product->getMainLink()}]
    [{else}]
        [{assign var='_productLink' value=$product->getLink()}]
    [{/if}]

	<div class="item">
		<a href="[{ $_productLink }]"><img src="[{ $product->getThumbnailUrl() }]" alt="[{ $product->oxarticles__oxtitle->value|strip_tags }] [{ $product->oxarticles__oxvarselect->value|default:'' }]" /></a>
			<div class="item-description">
				<p><a href="[{ $_productLink }]">[{$product->oxarticles__oxtitle->value}]</a><p class="item-price">[{if $product->getFTPrice() }]<span style="line-height:9px;text-decoration:line-through;">[{ $product->getFTPrice() }] &euro;</span>&nbsp;&middot; [{/if}][{ $product->getFPrice() }] &euro;</p></p>
				<small>&nbsp;<small class="nineteen">inkl. 19 % Mwst. [{if $product->getFPrice() < 50}]zzgl. <a href="/Versand-Kosten/">Versandkosten</a>[{else}]&middot; Versandkostenfrei[{/if}]</small></small>
					<a href="[{ $_productLink }]" class="btn">Details</a>
			</div><!--item-description-->
	</div><!--item-->