[{*<ul class="all-brands">
  <li>Nach Marken</li>
  <li><a href="#">Roros Tweed</a></li>
  <li><a href="#">Marimekko</a></li>
  <li><a href="#">Forg from Sweden</a></li>
  <li><a href="#">Holme Gaard</a></li>
  <li><a href="#">Livingly</a></li>
</ul>*}]

<ul>
  [{foreach from=$tree item=oman key=mankey name=test_manufacturer }]
  	[{if $oman->oxmanufacturers__oxtitle->value != "Stöber"
    and $oman->oxmanufacturers__oxtitle->value != "Bergerlind"}]
		<li><a id="test_BoxLeft_SubVend_[{$smarty.foreach.test_manufacturer.iteration}]" href="[{$oman->getLink()}]" class="[{if $oView->getManufacturerId()==$oman->getId()}]act[{/if}]">[{ $oman->oxmanufacturers__oxtitle->value }][{ if $oman->getNrOfArticles() > 0 }] ([{$oman->getNrOfArticles()}])[{/if}]</a></li>
		[{/if}]
  [{/foreach}]
</ul>
