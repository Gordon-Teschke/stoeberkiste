[{include file="_header.tpl" title=$template_title pia="true" location="START_TITLE"|oxmultilangassign seopage="list"}]

<div class="all-cards-top" id="all-cards-top">			
<div class="ext_cards">
	<a href="/Kunstvoll/" class="sk_button">Kunstvoll</a>
	<a href="/Kunstvoll/Karten/" class="sk_button">Karten</a>
</div>
	<h1>[{$oView->getTitle()}]</h1>
    [{assign var="actCategory" value=$oView->getActiveCategory()}]

   
	[{assign var="brand" value="brand_pia_malmros"}]
    [{oxifcontent ident=$brand object="oCont"}]
    [{$oCont->oxcontents__oxcontent->value}]
    [{/oxifcontent}]
</div><!--all-cards-top-->

<div class="all-cards">
    [{foreach from=$oView->getArticleList() item=actionproduct name=test_articleList}]
	    [{include file="inc/pia.tpl" show="preview" product=$actionproduct testid="action_"|cat:$actionproduct->oxarticles__oxid->value test_Cntr=$smarty.foreach.test_articleList.iteration}]
    [{/foreach}]
</div><!--all-cards-->
[{include file="inc/pagination.tpl"}]

[{include file="_footer.tpl" pia="true" }]