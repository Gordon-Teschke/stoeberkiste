[{* Pagination *}]
[{assign var="pageNavigation" value=$oView->getPageNavigation()}]
[{if $pageNavigation->NrOfPages > 1}]
	<div class="all-pages">
  [{foreach key=iPage from=$pageNavigation->changePage item=page}]
    [{if $iPage > ($pageNavigation->actPage - 10) && $iPage < ($pageNavigation->actPage + 10)}]
	    <a id="test_PageNr[{$PageLoc}]_[{$iPage}]" href="[{$page->url}]" class="btn [{if $iPage != $pageNavigation->actPage }] not-active[{/if}]">[{$iPage}]</a>
    [{/if}]
  [{/foreach}]
	</div><!--all-pages-->
[{/if}]
