[{assign var="search_title" value="SEARCH_TITLE"|oxmultilangassign}]
[{assign var="searchparamforhtml" value=$oView->getSearchParamForHtml() }]
[{assign var="template_title" value="$search_title - $searchparamforhtml"}]

[{include file="_header.tpl" title=$template_title location="SEARCH_LOCATION"|oxmultilangassign seopage="search"}]

<div class="all-items">
	<div class="content-menu">
		<ul>
			<li><a href="/konto-eroeffnen/">Registrieren</a></li>
			<li><a href="/?cl=account">Anmelden</a></li>
			<li><a href="/mein-merkzettel/">Merkliste</a></li>
		</ul>
	</div><!--content-menu-->
  <div class="clearfix"></div>


  <!-- page locator -->
  [{if $oView->getArticleCount() }]
    [{*include file="inc/list_locator.tpl" PageLoc="Top"*}]
  [{else}]
    <div class="msg">[{ oxmultilang ident="SEARCH_NOITEMSFOUND" }]</div>
  [{/if}]

  [{if $oView->getArticleList() }]
    [{assign var="search_head" value="SEARCH_HITSFOR"|oxmultilangassign}]
    [{assign var="search_head" value=$oView->getArticleCount()|cat:" "|cat:$search_head|cat:" &quot;"|cat:$oView->getSearchParamForHtml()|cat:"&quot;"}]

	<h1>Suchergebnisse: [{$search_head}]</h1>


    [{foreach from=$oView->getArticleList() name=search item=product}]

      [{if $smarty.foreach.search.first && !$smarty.foreach.search.last}]
        [{assign var="search_class" value="firstinlist"}]
      [{elseif $smarty.foreach.search.last}]
        [{assign var="search_class" value="lastinlist"}]
      [{else}]
        [{assign var="search_class" value="inlist"}]
      [{/if}]

      [{include file="inc/product.tpl" product=$product size="thin" head=$search_head class=$search_class testid="Search_"|cat:$product->oxarticles__oxid->value test_Cntr=$smarty.foreach.search.iteration}]

      [{assign var="search_head" value=""}]
      [{if !$smarty.foreach.search.last }]
        <div class="separator"></div>
      [{/if}]

    [{/foreach}]
  [{/if}]

    [{include file="inc/pagination.tpl"}]
  <!-- page locator -->
  [{if $oView->getArticleCount() }]
    [{*include file="inc/list_locator.tpl" PageLoc="Bottom"*}]
  [{/if}]

</div><!--all-items-->
[{ insert name="oxid_tracker" title=$template_title }]
[{include file="_footer.tpl"}]
