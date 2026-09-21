[{* BRUCHMANN MEDIA SEO CONTROLLER *}]

[{* Auswahl des Seitentyps *}]
[{assign var="seopage" value=$oView->getClassName() }]

[{* TITLE *}]
[{assign var="_titlesuffix" value=$_titlesuffix|default:$oView->getTitleSuffix()}]
[{assign var="_titleprefix" value=$_titleprefix|default:$oView->getTitlePrefix() }]
[{assign var="title" value=$title|default:$oView->getTitle() }]
[{if $seopage == "start"}]
<title>St&ouml;berkiste | Design Mode Kunsthandwerk aus Skandinavien</title>
[{else}]
<title>[{ $_titleprefix }][{if $title&& $_titleprefix }] | [{/if}][{$title|strip_tags}][{if $_titlesuffix}] | [{$_titlesuffix}][{/if}][{if $titlepagesuffix}] | [{$titlepagesuffix}][{/if}]</title>
[{/if}]

[{if $seopage}]
<meta name="bmseo" value="[{$seopage}]">
[{/if}]

[{* META DESCRIPTION *}]
	[{if $oView->getMetaDescription()}]
		[{if $oView->getClassName() == 'details'}]
			[{assign var="product" value=$oView->getProduct() }]
			[{assign var="oManufacturer" value=$product->getManufacturer()}]
			<meta name="description" content="[{ $oManufacturer->oxmanufacturers__oxtitle->value }] &middot; [{$oView->getMetaDescription()}]">
		[{else}]
			<meta name="description" content="[{$oView->getMetaDescription()}]">
		[{/if}]
	[{/if}]

[{* META KEYWORDS *}]
	[{if $oView->getMetaKeywords()}]<meta name="keywords" content="[{$oView->getMetaKeywords()}]">[{/if}]

[{* META ROBOTS *}]
[{*if $oView->noIndex() == 1 }]
<meta name="ROBOTS" content="NOINDEX, NOFOLLOW">
[{elseif $oView->noIndex() == 2 }]
<meta name="ROBOTS" content="NOINDEX, FOLLOW">
[{/if*}]
<meta name="ROBOTS" content="INDEX, FOLLOW">

[{* CANONICAL URL *}]
	[{assign var="canonical_url" value=$oView->getCanonicalUrl()}]
	[{if $canonical_url }]<link rel="canonical" href="[{ $canonical_url }]">[{/if}]

[{* REL LINKS *}]
