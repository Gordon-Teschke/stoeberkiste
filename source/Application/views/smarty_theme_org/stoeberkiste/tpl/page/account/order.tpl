[{assign var="template_title" value="ACCOUNT_ORDER_TITLE"|oxmultilangassign }]
[{include file="_header.tpl" title=$template_title location=$template_title}]
[{include file="page/account/inc/account_header.tpl"}]

  <section class="story with-border" data-id="order-history">
    <h2>Bestellhistorie</h2>

  [{if count($oView->getOrderList()) > 0 }]
    [{assign var=oArticleList value=$oView->getOrderArticleList()}]

      <div class="is-history">
      [{foreach from=$oView->getOrderList() item=order }]
        <ul>
          <li>Bestellung vom:<p>[{ $order->oxorder__oxorderdate->value }]</p></li>

          [{foreach from=$order->getOrderArticles(true) item=orderitem name=testOrderItem}]
            [{assign var=sArticleId value=$orderitem->oxorderarticles__oxartid->value }]
            [{assign var=oArticle value=$oArticleList[$sArticleId] }]
              <li>Artikel:<p>[{ if $oArticle->oxarticles__oxid->value && $oArticle->isVisible() }]<a id="test_accOrderLink_[{$order->oxorder__oxordernr->value}]_[{$smarty.foreach.testOrderItem.iteration}]" href="[{ $oArticle->getLink() }]" class="artlink">[{/if }]
            [{ $orderitem->oxorderarticles__oxtitle->value }] [{ $orderitem->oxorderarticles__oxselvariant->value }]
            [{ if $oArticle->oxarticles__oxid->value && $oArticle->isVisible() }]</a>[{/if }]</p></li>
          [{/foreach }]
          
[{*
          [{if $order->oxorder__oxstorno->value}]
            <li>Status:<p>[{ oxmultilang ident="ACCOUNT_ORDER_STORNO" }]</p></li>
          [{elseif $order->oxorder__oxsenddate->value !="-" }]
            <li>Status:<p>[{ oxmultilang ident="ACCOUNT_ORDER_SHIPPED" }]</p></li>
          [{else}]
            <li>Status:<p>[{ oxmultilang ident="ACCOUNT_ORDER_NOTSHIPPED" }]</p></li>
          [{/if}]
*}]
          <li>Empfänger:<p>[{if $order->oxorder__oxdellname->value }]
                  [{ $order->oxorder__oxdelfname->value }]
                  [{ $order->oxorder__oxdellname->value }]
                [{else }]
                  [{ $order->oxorder__oxbillfname->value }]
                  [{ $order->oxorder__oxbilllname->value }]
                [{/if }]</p></li>
        </ul>
      [{/foreach}]
      </div><!--is-history-->

  [{/if}]
  
  </section>

[{include file="page/account/inc/account_footer.tpl"}]
[{insert name="oxid_tracker" title=$template_title }]
[{include file="_footer.tpl" }]