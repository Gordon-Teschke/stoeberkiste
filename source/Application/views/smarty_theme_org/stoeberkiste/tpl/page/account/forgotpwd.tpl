[{if $oView->showUpdateScreen() }]
  [{assign var="template_title" value="FORGOTPWD_UPDATETITLE"|oxmultilangassign}]
[{elseif $oView->updateSuccess() }]
  [{assign var="template_title" value="FORGOTPWD_UPDATESUCCESSTITLE"|oxmultilangassign}]
[{else}]
  [{assign var="template_title" value="FORGOTPWD_TITLE"|oxmultilangassign}]
[{/if}]
[{include file="_header.tpl" title=$template_title location=$template_title}]
[{include file="page/account/inc/account_header.tpl" show_dashboard="no"}]

  <section class="story with-border" data-id="user-settings">
      <h1>Mein Account</h1>
      <h2>[{$template_title}]</h2>

      [{if $oView->isExpiredLink() }] [{* Link abgelaufen *}]
        <div class="error-msg">
          <p>[{ oxmultilang ident="FORGOTPWD_ERRLINKEXPIRED" }]</p>
        </div><!--error-msg-->

      [{elseif $oView->showUpdateScreen() }] [{* Eingabe neues Kennwort *}]
        <p>[{ oxmultilang ident="FORGOTPWD_ENTERNEWPASSWORD" }]</p>
        <div class="with-inputs">
          <form action="[{ $oViewConf->getSelfActionLink() }]" name="order" method="post">
            [{ $oViewConf->getHiddenSid() }]
            [{ $oViewConf->getNavFormParams() }]
            <input type="hidden" name="fnc" value="updatePassword">
            <input type="hidden" name="uid" value="[{ $oView->getUpdateId() }]">
            <input type="hidden" name="cl" value="forgotpwd">

            <label>[{ oxmultilang ident="FORGOTPWD_NEWPASSWORD" }]</label>
            <input type="password" name="password_new" >

            <label>[{ oxmultilang ident="FORGOTPWD_CONFIRMPASSWORD" }]</label>
            <input type="password" name="password_new_confirm" >

            <input type="submit" name="save" value="[{ oxmultilang ident="FORGOTPWD_UPDATEPASSWORD" }]" class="btn is-submit">

          </form>
        </div>



      [{elseif $oView->updateSuccess() }] [{* Kennwortänderung erfolgreich *}]
        <p>[{ oxmultilang ident="FORGOTPWD_UPDATE_SUCCESS" }]</p>


      [{else}] [{* E-Mail Adresse eingeben *}]

        [{ if $oView->getForgotEmail()}]
          <p>[{ oxmultilang ident="FORGOTPWD_PWDWASSEND" }] [{$oView->getForgotEmail()}]</p>

        [{else}]
          <p>[{ oxmultilang ident="FORGOTPWD_FORGOTPWD" }]<br />
          [{ oxmultilang ident="FORGOTPWD_WEWILLSENDITTOYOU" }]<br /><br /></p>
          <div class="with-inputs">
            <form action="[{ $oViewConf->getSelfActionLink() }]" name="order" method="post">
              [{ $oViewConf->getHiddenSid() }]
              [{ $oViewConf->getNavFormParams() }]
              <input type="hidden" name="fnc" value="forgotpassword">
              <input type="hidden" name="cl" value="forgotpwd">

              <label>[{ oxmultilang ident="FORGOTPWD_YOUREMAIL" }]</label>
              <input type="text" name="lgn_usr" value="[{$oView->getActiveUsername()}]" >

              <input type="submit" name="save" value="[{ oxmultilang ident="FORGOTPWD_REQUESTPWD" }]" class="btn is-submit">

            </form>
            <div class="clearfix"></div>
          </div>

          <p>[{ oxmultilang ident="FORGOTPWD_AFTERCLICK" }]<br /><br />
          [{ oxcontent ident="oxforgotpwd" }]</p>

        [{ /if}]


      [{/if}]
      

  </section>

[{include file="page/account/inc/account_footer.tpl"}]
[{insert name="oxid_tracker" title=$template_title }]
[{include file="_footer.tpl" }]