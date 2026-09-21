[{assign var="template_title" value="ACCOUNT_NEWSLETTER_TITLE"|oxmultilangassign }]
[{include file="_header.tpl" title=$template_title location=$template_title}]
[{include file="page/account/inc/account_header.tpl"}]

<section class="story with-border" data-id="newsletter-settings">
  <h2>Newslettereinstellungen<span class="icon-arrow-right"></span>Newsletter abonnieren / abbestellen</h2>

  [{if $oView->getSubscriptionStatus() != 0 }]
    [{if $oView->getSubscriptionStatus() == 1 }]
      <div class="success-msg">
        <p>[{ oxmultilang ident="ACCOUNT_NEWSLETTER_SUBSCRIPTIONSUCCESS" }]</p>
      </div><!--success-msg-->
    [{else }]
      <div class="success-msg">
        <p>[{ oxmultilang ident="ACCOUNT_NEWSLETTER_SUBSCRIPTIONREJECT" }]</p>
      </div><!--success-msg-->
    [{/if }]
  [{else }]
  
    <div class="with-inputs">
      <form action="[{ $oViewConf->getSelfActionLink() }]" name="newsletter" method="post" class="for-newsletter">
        [{ $oViewConf->getHiddenSid() }]
        [{ $oViewConf->getNavFormParams() }]
        <input type="hidden" name="fnc" value="subscribe">
        <input type="hidden" name="cl" value="account_newsletter">

        <label>Newsletter abonnieren:</label>
        <input type="radio" name="status" value="1" class="rdo-btn" [{if $oView->isNewsletter() }]checked[{/if }] />
        <label>Newsletter abbestellen:</label>
        <input type="radio" name="status" value="0" class="rdo-btn" [{if !$oView->isNewsletter() }]checked[{/if }] />
        <input type="submit" name="" value="Speichern" class="btn is-submit" />
      </form>
    </div><!--with-inputs-->
  [{/if }]

</section>

[{include file="page/account/inc/account_footer.tpl"}]
[{insert name="oxid_tracker" title=$template_title }]
[{include file="_footer.tpl" }]