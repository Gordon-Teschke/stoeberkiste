[{assign var="template_title" value="ACCOUNT_PASSWORD_TITLE"|oxmultilangassign }]
[{include file="_header.tpl" title=$template_title location=$template_title}]
[{include file="page/account/inc/account_header.tpl"}]

<section class="story with-border" data-id="user-settings">
  <h2>Persönliche Einstellungen<span class="icon-arrow-right"></span>Ändern Sie Ihr Kontopasswort</h2>
  <small class="with-alert"><span class="icon-alert"></span>[{ oxmultilang ident="ACCOUNT_PASSWORD_PASSWORDMINLENGTH" }]</small>

  [{include file="page/account/inc/error.tpl" Errorlist=$Errors.user errdisplay="inbox"}]

  [{if $oView->isPasswordChanged() }]
    <div class="success-msg">
    <p>[{ oxmultilang ident="ACCOUNT_PASSWORD_PASSWORDCHANGED" }]</p>
    </div><!--success-msg-->
  [{else}]

    <div class="with-inputs">
      <form action="[{ $oViewConf->getSelfActionLink() }]" name="changepassword" method="post">
        [{ $oViewConf->getHiddenSid() }]
        [{ $oViewConf->getNavFormParams() }]
        <input type="hidden" name="fnc" value="changePassword">
        <input type="hidden" name="cl" value="account_password">
        <input type="hidden" name="CustomError" value='user'>

        <label>Altes Passwort:</label>
        <input type="password" name="password_old" value="" />
        <label>Neues Passwort:</label>
        <input type="password" name="password_new" value="" />
        <label>Neues Passwort wiederholen:</label>
        <input type="password" name="password_new_confirm" value="" />
        <input type="submit" name="" value="Speichern" class="btn is-submit" />
      </form>
    </div><!--with-inputs-->
  [{/if}]

</section>

[{include file="page/account/inc/account_footer.tpl"}]
[{insert name="oxid_tracker" title=$template_title }]
[{include file="_footer.tpl" }]