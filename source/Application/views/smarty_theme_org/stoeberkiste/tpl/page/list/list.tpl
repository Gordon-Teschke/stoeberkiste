[{* Theme-Switch *}][{if $oView->getClassName() == 'manufacturerlist' and $oView->getTitle() == "Pia Malmros"}][{include file="pia.tpl"}][{else}][{* Theme-Switch *}]
[{include file="_header.tpl" title=$template_title location="START_TITLE"|oxmultilangassign seopage="list"}]
<div class="all-items">
[{include file="inc/user_meta_navigation.tpl"}]
  <div class="clearfix"></div>
    <h1>[{$oView->getTitle()}]</h1>
    <div class="clearfix"></div>
    <div class="cat_description">
    [{assign var="actCategory" value=$oView->getActiveCategory()}]

    [{if $actCategory->oxcategories__oxlongdesc->value}]
    [{oxeval var=$actCategory->oxcategories__oxlongdesc}]
    [{else}]
        [{* Nach Marke, Markentext aus CMS laden *}]
        [{if $oView->getClassName() == 'manufacturerlist'}]
            [{if $oView->getTitle() == "Färg &amp; Form"}]
                [{assign var="brand" value="brand_faerg_form"}]
            [{elseif $oView->getTitle() == "Holmegaard"}]
                [{assign var="brand" value="brand_holmegaard"}]
            [{elseif $oView->getTitle() == "Bergerlind"}]
                [{assign var="brand" value="brand_bergerlind"}]
            [{elseif $oView->getTitle() == "Livingly"}]
                [{assign var="brand" value="brand_livingly"}]
            [{elseif $oView->getTitle() == "Marimekko"}]
                [{assign var="brand" value="brand_marimekko"}]
            [{elseif $oView->getTitle() == "Pia Malmros"}]
                [{assign var="brand" value="brand_pia_malmros"}]
            [{elseif $oView->getTitle() == "Pluto Produkter"}]
                [{assign var="brand" value="brand_pluto_produkter"}]
            [{elseif $oView->getTitle() == "Røros-Tweed"}]
                [{assign var="brand" value="brand_roros_tweed"}]
            [{elseif $oView->getTitle() == "Kay Bojesen"}]
                [{assign var="brand" value="brand_kay_bojesen"}]
            [{elseif $oView->getTitle() == "Maika Taschen"}]
                [{assign var="brand" value="brand_maika"}]
            [{elseif $oView->getTitle() == "Kortkartellet"}]
                [{assign var="brand" value="brand_kortkartellet"}]
            [{else}]
                [{assign var="brand" value=""}]
            [{/if}]

            [{oxifcontent ident=$brand object="oCont"}]
            [{$oCont->oxcontents__oxcontent->value}]
            [{/oxifcontent}]

        [{else}]
            <p>&nbsp;</p>
        [{/if}]
    [{/if}]
    </div>
    <div class="clearfix"></div>

    [{foreach from=$oView->getArticleList() item=actionproduct name=test_articleList}]
	    [{include file="inc/product.tpl" product=$actionproduct testid="action_"|cat:$actionproduct->oxarticles__oxid->value test_Cntr=$smarty.foreach.test_articleList.iteration}]
    [{/foreach}]
    
    [{include file="inc/pagination.tpl"}]
			
</div><!--all-items-->

[{include file="_footer.tpl"}][{/if}][{* Theme-Switch *}]