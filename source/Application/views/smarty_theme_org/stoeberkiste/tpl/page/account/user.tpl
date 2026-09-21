[{assign var="template_title" value="ACCOUNT_USERTITLE"|oxmultilangassign }]
[{include file="_header.tpl" title=$template_title location=$template_title}]
[{include file="page/account/inc/account_header.tpl"}]

[{assign var="invadr" value=$oView->getInvoiceAddress()}]
  <section class="story with-border" data-id="shipping-settings">
  <h2>Rechnungs- und Liefereinstellungen<span class="icon-arrow-right"></span>Rechnungsadresse</h2>
  <small class="with-alert"><span class="icon-alert"></span>Felder mit einem <b>*</b> müssen ausgefüllt werden.</small>
  
  [{include file="page/account/inc/error.tpl" Errorlist=$Errors.user errdisplay="inbox"}]

  [{*<div class="success-msg">
  <p>Erfolgs-Nachricht erscheint hier</p>
  </div><!--success-msg-->*}]

  <form action="[{ $oViewConf->getSelfActionLink() }]" name="order" method="post">
  [{ $oViewConf->getHiddenSid() }]
  [{ $oViewConf->getNavFormParams() }]
  <input type="hidden" name="fnc" value="changeuser_testvalues">
  <input type="hidden" name="cl" value="account_user">
  <input type="hidden" name="CustomError" value='user'>
  <input type="hidden" id="reloadAddress" name="reloadaddress" value="">

    <div class="with-inputs">
      <label>E-Mail Adresse:</label>
      <input type="text" name="invadr[oxuser__oxusername]" value="[{if isset( $invadr.oxuser__oxusername ) }][{ $invadr.oxuser__oxusername }][{else }][{ $oxcmp_user->oxuser__oxusername->value }][{/if }]" /><span class="required">*</span>
      <label>Anrede:</label>
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
  </div><!--with-inputs-->


  [{assign var="delivadr" value=$oxcmp_user->getSelectedAddress()}]
  [{assign var="deladr" value=$oView->getDeliveryAddress()}]

  <h2 class="is-subheadline">Rechnungs- und Liefereinstellungen<span class="icon-arrow-right"></span>Lieferadresse</h2>
  <div class="with-inputs">
  
  [{* Auswahl der Lieferadressen *}]
  <label>Adresse:</label>
  <select name="oxaddressid" />
    <option value="-1">[{ oxmultilang ident="ACCOUNT_USER_NEWADDRESS" }]</option>
    [{foreach from=$oxcmp_user->getUserAddresses() item=address }]
      <option value="[{ $address->oxaddress__oxid->value }]" [{if $address->isSelected()}]SELECTED[{/if }]>[{$address}]</option>
    [{/foreach }]
  </select><span class="required"></span>
  <input type="submit" name="reloadaddress" value="[{ oxmultilang ident="ACCOUNT_USER_ADDRESSES_SELECT" }]" class="btn is-submit loads-address" />

  [{* Beareitung einer Lieferadresse *}]
  <label>Anrede:</label>
  <select name="deladr[oxaddress__oxsal]" />
    <option value="MR"  [{if $oxcmp_user->oxuser__oxsal->value|lower  == "mr"}]SELECTED[{/if}]>Herr</option>
    <option value="MRS" [{if $oxcmp_user->oxuser__oxsal->value|lower  == "mrs"}]SELECTED[{/if}]>Frau</option>
  </select><span class="required">[{if $oView->isFieldRequired(oxuser__oxsal) }]*[{/if }]</span>

  <label>Vorname:</label>
  <input type="text" name="deladr[oxaddress__oxfname]" value="[{if isset( $deladr.oxaddress__oxfname ) }][{ $deladr.oxaddress__oxfname }][{else}][{ $delivadr->oxaddress__oxfname->value }][{/if }]" /><span class="required">[{if $oView->isFieldRequired(oxuser__oxsal) }]*[{/if }]</span>
  <label>Nachname:</label>
  <input type="text" name="deladr[oxaddress__oxlname]" value="[{if isset( $deladr.oxaddress__oxlname ) }][{ $deladr.oxaddress__oxlname }][{else}][{ $delivadr->oxaddress__oxlname->value }][{/if }]" /><span class="required">[{if $oView->isFieldRequired(oxuser__oxsal) }]*[{/if }]</span>
  <label>Firma:</label>
  <input type="text" name="deladr[oxaddress__oxcompany]" value="[{if isset( $deladr.oxaddress__oxcompany ) }][{ $deladr.oxaddress__oxcompany }][{else}][{ $delivadr->oxaddress__oxcompany->value }][{/if }]" /><span class="required"></span>
  <div class="is-absolute">
  <label>Straße, Hausnummer:</label>
  <input type="text" name="deladr[oxaddress__oxstreet]" value="[{if isset( $deladr.oxaddress__oxstreet ) }][{ $deladr.oxaddress__oxstreet }][{else}][{ $delivadr->oxaddress__oxstreet->value }][{/if }]" class="input-medium-left" /><input type="text" name="deladr[oxaddress__oxstreetnr]" value="[{if isset( $deladr.oxaddress__oxstreetnr ) }][{ $deladr.oxaddress__oxstreetnr }][{else}][{ $delivadr->oxaddress__oxstreetnr->value }][{/if }]" class="input-short-right" /><span class="required">[{if $oView->isFieldRequired(oxuser__oxsal) }]*[{/if }]</span>
  </div><!--is-absolute-->
  <div class="is-absolute">
  <label>PLZ, Ort:</label>
  <input type="text" name="deladr[oxaddress__oxzip]" value="[{if isset( $deladr.oxaddress__oxzip ) }][{ $deladr.oxaddress__oxzip }][{else}][{ $delivadr->oxaddress__oxzip->value }][{/if }]" class="input-short-left" /><input type="text" name="deladr[oxaddress__oxcity]" value="[{if isset( $deladr.oxaddress__oxcity ) }][{ $deladr.oxaddress__oxcity }][{else}][{ $delivadr->oxaddress__oxcity->value }][{/if }]" class="input-medium-right" /><span class="required">[{if $oView->isFieldRequired(oxuser__oxsal) }]*[{/if }]</span>
  </div><!--is-absolute-->  
  <label>Zusatz-Info:</label>
  <input type="text" name="deladr[oxaddress__oxaddinfo]" value="[{if isset( $deladr.oxaddress__oxaddinfo ) }][{ $deladr.oxaddress__oxaddinfo }][{else}][{ $delivadr->oxaddress__oxaddinfo->value }][{/if }]" /><span class="required">[{if $oView->isFieldRequired(oxuser__oxsal) }]*[{/if }]</span>
  <label>Land:</label>
  <select name="deladr[oxaddress__oxcountryid]" />
    <option value="">-</option>
    [{assign var="blCountrySelected" value=false}]
    [{foreach from=$oViewConf->getCountryList() item=country key=country_id }]
        [{assign var="sCountrySelect" value=""}]
        [{if !$blCountrySelected}]
            [{if (isset($deladr.oxaddress__oxcountryid) && $deladr.oxaddress__oxcountryid == $country->oxcountry__oxid->value) ||
                 (!isset($deladr.oxaddress__oxcountryid) && ($delivadr->oxaddress__oxcountry->value == $country->oxcountry__oxtitle->value or
                  $delivadr->oxaddress__oxcountry->value == $country->oxcountry__oxid->value or
                  $delivadr->oxaddress__oxcountryid->value == $country->oxcountry__oxid->value)) }]
                [{assign var="blCountrySelected" value=true}]
                [{assign var="sCountrySelect" value="selected"}]
            [{/if}]
        [{/if}]
        <option value="[{ $country->oxcountry__oxid->value }]" [{$sCountrySelect}]>[{ $country->oxcountry__oxtitle->value }]</option>
    [{/foreach }]
  </select><span class="required">[{if $oView->isFieldRequired(oxuser__oxsal) }]*[{/if }]</span>
  <label>Telefon:</label>
  <input type="text" name="deladr[oxaddress__oxfon]" value="[{if isset( $deladr.oxaddress__oxfon ) }][{ $deladr.oxaddress__oxfon }][{else}][{ $delivadr->oxaddress__oxfon->value }][{/if }]" /><span class="required">[{if $oView->isFieldRequired(oxuser__oxsal) }]*[{/if }]</span>
  <label>Telefax:</label>
  <input type="text" name="deladr[oxaddress__oxfax]" value="[{if isset( $deladr.oxaddress__oxfax ) }][{ $deladr.oxaddress__oxfax }][{else}][{ $delivadr->oxaddress__oxfax->value }][{/if }]" /><span class="required"></span>
  <input type="hidden" name="blshowshipaddress" value="1">

  <input type="submit" name="" value="Speichern" class="btn is-submit" />
  </div><!--with-inputs-->
  </form>
  </section>


[{include file="page/account/inc/account_footer.tpl"}]
[{insert name="oxid_tracker" title=$template_title }]
[{include file="_footer.tpl" }]