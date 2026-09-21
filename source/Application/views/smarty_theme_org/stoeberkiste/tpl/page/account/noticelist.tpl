[{assign var="template_title" value="ACCOUNT_NOTICELIST_TITLE"|oxmultilangassign }]
[{include file="_header.tpl" title=$template_title location=$template_title}]
[{include file="page/account/inc/account_header.tpl"}]

<section class="story on-top">
[{if $oView->getNoticeProductList()}]
  [{foreach from=$oView->getNoticeProductList() name=noticelist item=product}]
    [{include file="inc/product.tpl" product=$product size="thin" head=$noticelist_head class=$noticelist_class removeFunction="tonoticelist" owishid=$oxcmp_user->oxuser__oxid->value testid="NoticeList_`$smarty.foreach.noticelist.iteration`"}]
  [{/foreach}]
[{else}]
      <div class="error-msg">
        <p>Die Merkliste ist leer.</p>
      </div><!--error-msg-->
[{/if}]
</section>

[{include file="page/account/inc/account_footer.tpl"}]
[{insert name="oxid_tracker" title=$template_title }]
[{include file="_footer.tpl" }]