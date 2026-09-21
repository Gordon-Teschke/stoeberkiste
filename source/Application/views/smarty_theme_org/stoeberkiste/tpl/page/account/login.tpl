[{assign var="template_title" value="ACCOUNT_LOGIN_LOGIN"|oxmultilangassign }]
[{include file="_header.tpl" title=$template_title location=$template_title}]
[{include file="page/account/inc/account_header.tpl" show_dashboard="no"}]

  <section class="story with-border" data-id="user-settings">
      <h1>Mein Account</h1>
      <h2>[{ oxmultilang ident="INC_CMP_LOGIN_LOGIN2" }]</h2>
      
      [{*
      <small class="with-alert"><span class="icon-alert"></span>Die Mindestlänge des Passwortes beträgt 6 Zeichen.</small>
      <div class="error-msg">
        <p>Fehler-Nachricht erscheint hier</p>
      </div><!--error-msg-->
        <div class="success-msg">
          <p>Erfolgs-Nachricht erscheint hier</p>
        </div><!--success-msg-->
      *}]

    <div class="with-inputs">
      <form name="login" action="[{ $oViewConf->getSslSelfLink() }]" method="post">
        [{ $oViewConf->getHiddenSid() }]
        [{ $oViewConf->getNavFormParams() }]
        <input type="hidden" name="fnc" value="login_noredirect">
        <input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
        <input type="hidden" name="tpl" value="[{$oViewConf->getActTplName()}]">
        [{if $oView->getArticleId()}]
          <input type="hidden" name="aid" value="[{$oView->getArticleId()}]">
        [{/if}]
        [{if $oView->getProduct()}]
        [{assign var="product" value=$oView->getProduct() }]
          <input type="hidden" name="anid" value="[{ $product->oxarticles__oxnid->value }]">
        [{/if}]

        <label>[{ oxmultilang ident="INC_CMP_LOGIN_EMAIL" }]:</label>
        <input type="text" name="lgn_usr" value="" />
        <label>[{ oxmultilang ident="INC_CMP_LOGIN_PWD" }]:</label>
        <input type="password" name="lgn_pwd" value="" />

        [{if $oView->showRememberMe()}]
        <label>[{ oxmultilang ident="INC_CMP_LOGIN_KEEPLOGGEDIN" }]:</label>
        <input class="chbox" type="checkbox" name="lgn_cook" value="1">
        [{/if}]

        <input type="submit" name="send" value="[{ oxmultilang ident="INC_CMP_LOGIN_LOGIN" }]" class="btn is-submit" />
      </form>

      <div class="clearfix"></div>
      <a id="test_LoginRegister" href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=register" }]" class="link" rel="nofollow">[{ oxmultilang ident="INC_CMP_LOGIN_OPENACCOUNT" }]</a><br />
      <a id="test_LoginLostPwd" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=forgotpwd" }]" class="link" rel="nofollow">[{ oxmultilang ident="INC_CMP_LOGIN_FORGOTPWD" }]</a>
    </div><!--with-inputs-->
  </section>


[{include file="page/account/inc/account_footer.tpl"}]
[{insert name="oxid_tracker" title=$template_title }]
[{include file="_footer.tpl" }]