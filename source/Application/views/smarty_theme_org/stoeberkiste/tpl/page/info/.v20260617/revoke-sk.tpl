[{include file="_header.tpl" title="Widerrufsformular"}]

<div id="content" class="all-items page">

    [{if $sent}]
        <div class="status success">
            Ihr Widerruf wurde uebermittelt.
        </div>
    [{/if}]

    <h1 id="test_contentHeader" class="boxhead">Widerrufsformular</h1>

    [{if $preview}]
        <h2>Bitte pruefen Sie Ihre Angaben.</h2>

        <table class="table">
            <tr><th>Bestellung</th><td>[{$formdata.article|escape}]</td></tr>
            <tr><th>Bestellt am / Erhalten am</th><td>[{$formdata.ordered|escape}]</td></tr>
            <tr><th>Bestellnummer / Rechnungsnummer</th><td>[{$formdata.ordernr|escape}]</td></tr>
            <tr><th>Name</th><td>[{$formdata.name|escape}]</td></tr>
            <tr><th>E-Mail</th><td>[{$formdata.email|escape}]</td></tr>
            <tr><th>Adresse</th><td>[{$formdata.address|escape}]</td></tr>
            <tr><th>Anmerkungen</th><td>[{$formdata.message|escape}]</td></tr>
        </table>

        <form action="[{$revokeFormAction}]" method="post">
            [{$oViewConf->getHiddenSid()}]
            <input type="hidden" name="cl" value="revoke">

            <input type="hidden" name="article" value="[{$formdata.article|escape}]">
            <input type="hidden" name="ordered" value="[{$formdata.ordered|escape}]">
            <input type="hidden" name="ordernr" value="[{$formdata.ordernr|escape}]">
            <input type="hidden" name="name" value="[{$formdata.name|escape}]">
            <input type="hidden" name="email" value="[{$formdata.email|escape}]">
            <input type="hidden" name="address" value="[{$formdata.address|escape}]">
            <input type="hidden" name="message" value="[{$formdata.message|escape}]">

            <button type="submit" class="submitButton largeButton" name="fnc" value="submit">
                Widerruf bestaetigen
            </button>

            <button type="submit" class="submitButton" name="fnc" value="repeat">
                Daten korrigieren
            </button>
        </form>

    [{elseif !$sent}]

        <form action="[{$revokeFormAction}]" method="post">
            [{$oViewConf->getHiddenSid()}]
            <input type="hidden" name="cl" value="revoke">
            <input type="hidden" name="fnc" value="preview">

            <ul class="form clear">
                <li>
                    <label>Hiermit widerrufe(n) ich/wir den Vertrag ueber folgende Waren</label>
                    <textarea rows="5" cols="70" name="article" class="areabox">[{$formdata.article|escape}]</textarea>
                </li>

                <li>
                    <label>Bestellt am / Erhalten am</label>
                    <input type="text" name="ordered" size="70" maxlength="255" value="[{$formdata.ordered|escape}]">
                </li>

                <li>
                    <label>Bestellnummer / Rechnungsnummer</label>
                    <input type="text" name="ordernr" size="70" maxlength="64" value="[{$formdata.ordernr|escape}]">
                </li>

                <li>
                    <label>Name *</label>
                    <input type="text" name="name" size="70" maxlength="255" value="[{$formdata.name|escape}]">
                </li>

                <li>
                    <label>E-Mail *</label>
                    <input type="text" name="email" size="70" maxlength="255" value="[{$formdata.email|escape}]">
                </li>

                <li>
                    <label>Adresse</label>
                    <textarea rows="6" cols="70" name="address" class="areabox">[{$formdata.address|escape}]</textarea>
                </li>

                <li>
                    <label>Anmerkungen</label>
                    <textarea rows="6" cols="70" name="message" class="areabox">[{$formdata.message|escape}]</textarea>
                </li>

                <li class="formNote">
                    Bitte pruefen Sie Ihre Angaben im naechsten Schritt.
                </li>

                <li>
                    <button class="submitButton largeButton" type="submit">
                        Weiter zur Bestaetigung
                    </button>
                </li>
            </ul>
        </form>

    [{/if}]

</div>

[{insert name="oxid_tracker" title="Widerrufsformular"}]

[{include file="_footer.tpl"}]