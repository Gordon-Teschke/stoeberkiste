[{*<ul class="all-brands">
  <li>Nach Marken</li>
  <li><a href="#">Roros Tweed</a></li>
  <li><a href="#">Marimekko</a></li>
  <li><a href="#">Forg from Sweden</a></li>
  <li><a href="#">Holme Gaard</a></li>
  <li><a href="#">Livingly</a></li>
</ul>*}]

<ul class="all-brands">
  <li>Nach Marken</li>
  [{foreach from=$tree item=oman key=mankey name=test_manufacturer }]
  	[{if $oman->oxmanufacturers__oxtitle->value != "Stöber"
    and $oman->oxmanufacturers__oxtitle->value != "Bergerlind"}]
		<li><a id="test_BoxLeft_SubVend_[{$smarty.foreach.test_manufacturer.iteration}]" href="[{$oman->getLink()}]" class="[{if $oView->getManufacturerId()==$oman->getId()}]act[{/if}]">[{ $oman->oxmanufacturers__oxtitle->value }][{ if $oman->getNrOfArticles() > 0 }] ([{$oman->getNrOfArticles()}])[{/if}]</a></li>
		[{/if}]
  [{/foreach}]
</ul>

[{*
[{strip}]
<ul [{if $class}]class="[{$class}]"[{/if}]>
    <li>
        [{assign var="_rootManufacturer" value=$oView->getRootManufacturer() }]
        <a id="test_leftRootManufacturer" href="[{if $_rootManufacturer}][{ $_rootManufacturer->getLink() }][{/if}]" class="root[{if $oView->getManufacturerId()}] exp[{/if}] [{if $oView->getManufacturerId()==$_rootManufacturer->getId()}]act[{/if}]">[{ $_rootManufacturer->oxmanufacturers__oxtitle->value }]</a>
        [{if $oView->getManufacturerId() }]
            <ul>
            [{foreach from=$tree item=oman key=mankey name=test_manufacturer }]
                <li><a id="test_BoxLeft_SubVend_[{$smarty.foreach.test_manufacturer.iteration}]" href="[{$oman->getLink()}]" class="[{if $oView->getManufacturerId()==$oman->getId()}]act[{/if}]">[{ $oman->oxmanufacturers__oxtitle->value }][{ if $oman->getNrOfArticles() > 0 }] ([{$oman->getNrOfArticles()}])[{/if}]</a></li>
            [{/foreach}]
            </ul>
        [{/if}]
    </li>
</ul>
[{/strip}]
*}]