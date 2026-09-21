[{assign var="template_title" value="REGISTER_SUCCESS_MYACCOUNT"|oxmultilangassign}]
[{include file="_header.tpl" title=$template_title location=$template_title}]
[{include file="page/account/inc/account_header.tpl" show_dashboard="no"}]

  <section class="story with-border" data-id="user-settings">
    <h1>Mein Account</h1>
    <h2>[{ oxmultilang ident="REGISTER_SUCCESS_WELCOME" }]</h2>

    [{if $oView->getRegistrationStatus() == 1}]
      <p>[{ oxmultilang ident="REGISTER_SUCCESS_EMAILCONFIRMATION" }]</p>
    [{elseif $oView->getRegistrationStatus() == 2}]
      <p>[{ oxmultilang ident="REGISTER_SUCCESS_ACTIVATIONEMAIL" }]</p>
    [{/if}]
    
    [{if $oView->getRegistrationError() == 4}]
    <div class="error-msg">
      <p>[{ oxmultilang ident="REGISTER_SUCCESS_NOTABLETOSENDEMAIL" }]</p>
    </div>
    [{/if}]

  </section>


[{include file="page/account/inc/account_footer.tpl"}]
[{insert name="oxid_tracker" title=$template_title }]
[{include file="_footer.tpl" }]