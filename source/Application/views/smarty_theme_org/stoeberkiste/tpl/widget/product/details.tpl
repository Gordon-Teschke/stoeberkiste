[{*
_WIDGET details.tpl_
            [{if $oView->morePics()}]
                [{foreach from=$oView->getIcons() key=iPicNr item=oArtIcon name=sMorePics}]
                	[{$oPictureProduct->getMasterZoomPictureUrl($iPicNr)}]
                [{/foreach}]
            [{/if}]
<hr>
[{ if $oView->getAccessoires() }]
YES
[{else}]
NO
[{ /if }]

[{ if $oView->getSimilarProducts() }]
YES2
[{else}]
NO2
[{ /if }]

[{ if $oView->getCrossSelling()}]
YES3
[{else}]
NO3
[{ /if }]

[{ if $oView->getAlsoBoughtTheseProducts() }]
YES4
[{else}]
NO4
[{ /if }]

[{if count($oView->getBargainArticleList()) > 0 }]
YES5
[{else}]
NO5
[{ /if }]

[{ if $oView->getAccessoires()|count}]
YES6
[{else}]
NO6
[{/if }]

[{if $oView->getAttributes()}]
YES7
[{else}]
NO7
[{ /if }]
*}]