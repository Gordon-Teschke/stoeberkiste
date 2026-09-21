[{assign var="template_title" value="REGISTER_MYACCOUNT"|oxmultilangassign}]
[{include file="_header.tpl" title=$template_title location=$template_title}]
[{include file="page/account/inc/account_header.tpl" show_dashboard="no"}]

  <section class="story with-border" data-id="user-settings">
    <h1>Mein Account</h1>
    <h2>[{ oxmultilang ident="REGISTER_OPENACCOUNT" }]</h2>

    [{include file="page/account/inc/error.tpl" Errorlist=$Errors.default}]

    <div class="with-inputs">
    <form action="[{ $oViewConf->getSslSelfLink() }]" name="order" method="post">
        [{ $oViewConf->getHiddenSid() }]
        [{ $oViewConf->getNavFormParams() }]
        <input type="hidden" name="fnc" value="registeruser">
        <input type="hidden" name="cl" value="register">
        <input type="hidden" name="lgn_cook" value="0">
        <input type="hidden" id="reloadAddress" name="reloadaddress" value="">
        <input type="hidden" name="option" value="3">

        <label>[{ oxmultilang ident="REGISTER_EMAIL" }]</label>
        <input type="text" name="lgn_usr" value="[{ $oView->getActiveUsername() }]" >
        <span class="required">*</span>

        <label>[{ oxmultilang ident="REGISTER_PWD" }]</label>
        <input type="password" name="lgn_pwd" value="[{$lgn_pwd}]" >
        <span class="required">*</span>

        <label>[{ oxmultilang ident="REGISTER_CONFIRMPWD" }]</label>
        <input type="password" name="lgn_pwd2" value="[{$lgn_pwd2}]" >
        <span class="required">*</span>

        <div class="clearfix"></div>
        <hr />

        <label>[{ oxmultilang ident="REGISTER_TITLE" }]</label>
        <select name="invadr[oxuser__oxsal]" />
            <option value="MR"  [{if $oxcmp_user->oxuser__oxsal->value|lower  == "mr"}]SELECTED[{/if}]>Herr</option>
            <option value="MRS" [{if $oxcmp_user->oxuser__oxsal->value|lower  == "mrs"}]SELECTED[{/if}]>Frau</option>
        </select><span class="required">[{if $oView->isFieldRequired(oxuser__oxsal) }]*[{/if }]</span>

      <label>Vorname:</label>
      <input type="text" name="invadr[oxuser__oxfname]" value="[{if isset( $invadr.oxuser__oxfname ) }][{ $invadr.oxuser__oxfname }][{else }][{ $oxcmp_user->oxuser__oxfname->value }][{/if }]" /><span class="required">[{if $oView->isFieldRequired(oxuser__oxfname) }]*[{/if }]</span>
      <label>Nachname:</label>
      <input type="text" name="invadr[oxuser__oxlname]" value="[{if isset( $invadr.oxuser__oxlname ) }][{ $invadr.oxuser__oxlname }][{else }][{ $oxcmp_user->oxuser__oxlname->value }][{/if }]" /><span class="required">[{if $oView->isFieldRequired(oxuser__oxlname) }]*[{/if }]</span>
      <label>Firma:</label>
      <input type="text" name="invadr[oxuser__oxcompany]" value="[{if isset( $invadr.oxuser__oxcompany ) }][{ $invadr.oxuser__oxcompany }][{else }][{ $oxcmp_user->oxuser__oxcompany->value }][{/if }]" /><span class="required">[{if $oView->isFieldRequired(oxuser__oxcompany) }]*[{/if }]</span>
      <div class="is-absolute">
      <label>Straße, Hausnummer:</label>
      <input type="text" name="invadr[oxuser__oxstreet]" value="[{if isset( $invadr.oxuser__oxstreet ) }][{ $invadr.oxuser__oxstreet }][{else }][{ $oxcmp_user->oxuser__oxstreet->value }][{/if }]" class="input-medium-left" /><input type="text" name="invadr[oxuser__oxstreetnr]" value="[{if isset( $invadr.oxuser__oxstreetnr ) }][{ $invadr.oxuser__oxstreetnr }][{else }][{ $oxcmp_user->oxuser__oxstreetnr->value }][{/if }]" class="input-short-right" /><span class="required">[{if $oView->isFieldRequired(oxuser__oxstreet) || $oView->isFieldRequired(oxuser__oxstreetnr) }]*[{/if }]</span>
      </div><!--is-absolute-->
      <div class="is-absolute">
      <label>PLZ, Ort:</label>
      <input type="text" name="invadr[oxuser__oxzip]" value="[{if isset( $invadr.oxuser__oxzip ) }][{ $invadr.oxuser__oxzip }][{else }][{ $oxcmp_user->oxuser__oxzip->value }][{/if }]" class="input-short-left" /><input type="text" name="invadr[oxuser__oxcity]" value="[{if isset( $invadr.oxuser__oxcity ) }][{ $invadr.oxuser__oxcity }][{else }][{ $oxcmp_user->oxuser__oxcity->value }][{/if }]" class="input-medium-right" /><span class="required">[{if $oView->isFieldRequired(oxuser__oxzip) || $oView->isFieldRequired(oxuser__oxcity) }]*[{/if }]</span>
      </div><!--is-absolute-->  
      <label>USt-ID:</label>
      <input type="text" name="invadr[oxuser__oxustid]" value="[{if isset( $invadr.oxuser__oxustid ) }][{ $invadr.oxuser__oxustid }][{else}][{ $oxcmp_user->oxuser__oxustid->value }][{/if }]" /><span class="required">[{if $oView->isFieldRequired(oxuser__oxustid) }]*[{/if }]</span>
      <label>Zusatz-Info:</label>
      <input type="text" name="invadr[oxuser__oxaddinfo]" value="[{if isset( $invadr.oxuser__oxaddinfo ) }][{ $invadr.oxuser__oxaddinfo }][{else }][{ $oxcmp_user->oxuser__oxaddinfo->value }][{/if }]" /><span class="required">[{if $oView->isFieldRequired(oxuser__oxaddinfo) }]*[{/if }]</span>

      <label>Land:</label>
      <select name="invadr[oxuser__oxcountryid]" />
      [{foreach from=$oViewConf->getCountryList() item=country key=country_id }]
        <option value="[{ $country->oxcountry__oxid->value }]"  [{if $oxcmp_user->oxuser__oxcountryid->value == $country->oxcountry__oxid->value }]selected[{/if }]>[{ $country->oxcountry__oxtitle->value }]</option>
      [{/foreach }]
      </select><span class="required">[{if $oView->isFieldRequired(oxuser__oxcountryid) }]*[{/if }]</span>
      
      <label>Telefon:</label>
      <input type="text" name="invadr[oxuser__oxfon]" value="[{if isset( $invadr.oxuser__oxfon ) }][{ $invadr.oxuser__oxfon }][{else }][{ $oxcmp_user->oxuser__oxfon->value }][{/if }]" /><span class="required">[{if $oView->isFieldRequired(oxuser__oxfon) }]*[{/if }]</span>
      <label>Telefax:</label>
      <input type="text" name="invadr[oxuser__oxfax]" value="[{if isset( $invadr.oxuser__oxfax ) }][{ $invadr.oxuser__oxfax }][{else }][{ $oxcmp_user->oxuser__oxfax->value }][{/if }]" /><span class="required">[{if $oView->isFieldRequired(oxuser__oxfax) }]*[{/if }]</span>
      <label>Mobiltelefon:</label>
      <input type="text" name="invadr[oxuser__oxmobfon]" value="[{if isset( $invadr.oxuser__oxmobfon ) }][{$invadr.oxuser__oxmobfon }][{else}][{$oxcmp_user->oxuser__oxmobfon->value }][{/if}]" /><span class="required">[{if $oView->isFieldRequired(oxuser__oxmobfon) }]*[{/if }]</span>
      <label>Telefon (Privat):</label>
      <input type="text" name="invadr[oxuser__oxprivfon]" value="[{if isset( $invadr.oxuser__oxprivfon ) }][{$invadr.oxuser__oxprivfon }][{else}][{$oxcmp_user->oxuser__oxprivfon->value }][{/if}]" /><span class="required">[{if $oView->isFieldRequired(oxuser__oxprivfon) }]*[{/if }]</span>
      <input type="submit" name="" value="Speichern" class="btn is-submit" />
    <div class="clearfix"></div>


    </form>
    </div>

  </section>


[{include file="page/account/inc/account_footer.tpl"}]
[{insert name="oxid_tracker" title=$template_title }]
[{include file="_footer.tpl" }]