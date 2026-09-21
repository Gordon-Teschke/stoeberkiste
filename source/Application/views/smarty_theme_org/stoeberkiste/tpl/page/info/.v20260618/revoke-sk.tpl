[{include file="_header.tpl" title="Widerrufsformular"}]

<style type="text/css">

.revokeFormWrapper {
    max-width: 760px;
    color: #333;
    font-size: 15px;
	float: right;
    width: 724px;
    margin-top: 286px;
    color: #285479;	
}

.revokeFormWrapper h1,
.revokeFormWrapper .h1 {
    font-size: 26px;
    margin: 14px 0px;
    float: left;
    color: #900001;
    display: block;
    width: 100%;
}

.revokeForm input[type=text],
.revokeForm textarea {
    width: 100%;
    box-sizing: border-box;
    border: 1px solid #244f78;
    border-radius: 2px;
    padding: 8px 10px;
    margin-bottom: 12px;
    font-size: 15px;
    color: #555;
    background: #fff;
}

.revokeForm input[type=text]:focus,
.revokeForm textarea:focus {
    outline: none;
    border-color: #163a5d;
}

.revokeButtonRow {
    text-align: right;
}

.revokeForm button,
.revokePreviewButton {
    background: #244f78;
    color: #fff;
    border: 0;
    border-radius: 3px;
    padding: 8px 15px;
    font-size: 15px;
    cursor: pointer;
}

.revokeForm button:hover,
.revokePreviewButton:hover {
    background: #163a5d;
}

.revokePreviewTable {
    width: 100%;
    border-collapse: collapse;
    margin: 15px 0 20px 0;
}

.revokePreviewTable th,
.revokePreviewTable td {
    border: 1px solid #ddd;
    padding: 8px;
    vertical-align: top;
}

.revokePreviewTable th {
    width: 35%;
    background: #f5f5f5;
    font-weight: normal;
    color: #333;
	text-align: right;
}

.revokeSuccess {
    border: 1px solid #ddd;
    background: #f7f7f7;
    padding: 15px;
    color: #333;
}
</style>

<div class="revokeFormWrapper">

    <h1>Widerrufsformular</h1>

    [{if $sent}]

        <div class="revokeSuccess">
            Ihr Widerruf wurde erfolgreich übermittelt.
        </div>

    [{elseif $preview}]

        <div class="revokeInfo">
            Bitte prüfen Sie Ihre Angaben.
        </div>

        <table class="revokePreviewTable">
            <tr>
                <th>Bestellung</th>
                <td>[{$formdata.article|escape|nl2br}]</td>
            </tr>
            <tr>
                <th>Bestellt am / Erhalten am</th>
                <td>[{$formdata.ordered|escape}]</td>
            </tr>
            <tr>
                <th>Bestellnummer / Rechnungsnummer</th>
                <td>[{$formdata.ordernr|escape}]</td>
            </tr>
            <tr>
                <th>Name</th>
                <td>[{$formdata.name|escape}]</td>
            </tr>
            <tr>
                <th>E-Mail</th>
                <td>[{$formdata.email|escape}]</td>
            </tr>
            <tr>
                <th>Adresse</th>
                <td>[{$formdata.address|escape|nl2br}]</td>
            </tr>
            <tr>
                <th>Anmerkungen</th>
                <td>[{$formdata.message|escape|nl2br}]</td>
            </tr>
        </table>

        <form action="[{$revokeFormAction}]" method="post">

            <input type="hidden" name="cl" value="revoke">

            <input type="hidden" name="article" value="[{$formdata.article|escape}]">
            <input type="hidden" name="ordered" value="[{$formdata.ordered|escape}]">
            <input type="hidden" name="ordernr" value="[{$formdata.ordernr|escape}]">
            <input type="hidden" name="name" value="[{$formdata.name|escape}]">
            <input type="hidden" name="email" value="[{$formdata.email|escape}]">
            <input type="hidden" name="address" value="[{$formdata.address|escape}]">
            <input type="hidden" name="message" value="[{$formdata.message|escape}]">

            <div class="revokeButtonRow">
				<button type="submit" class="revokePreviewButton" name="fnc" value="repeat">
					Daten korrigieren
				</button>

				<button type="submit" class="revokePreviewButton" name="fnc" value="submit">
					Widerruf bestätigen
				</button>
            </div>
        </form>

    [{else}]

        <form action="[{$revokeFormAction}]" method="post" class="revokeForm">

            <input type="hidden" name="cl" value="revoke">
            <input type="hidden" name="fnc" value="preview">

            <textarea name="article" rows="4" placeholder="Hiermit widerrufe ich den Kauf folgender Waren...">[{$formdata.article}]</textarea>

            <input type="text" name="ordered" placeholder="Bestellt am / Erhalten am" value="[{$formdata.ordered}]">

            <input type="text" name="ordernr" placeholder="Bestellnummer / Rechnungsnummer" value="[{$formdata.ordernr}]">

            <input type="text" name="name" placeholder="Name *" value="[{$formdata.name}]">

            <input type="text" name="email" placeholder="E-Mail Adresse *" value="[{$formdata.email}]">

            <textarea name="address" rows="4" placeholder="Adresse">[{$formdata.address}]</textarea>

            <textarea name="message" rows="7" placeholder="Ihre Nachricht an uns...">[{$formdata.message}]</textarea>

            <div class="revokeButtonRow">
                <button type="submit">
                    Weiter zur Bestätigung
                </button>
            </div>

        </form>

    [{/if}]

</div>

[{include file="_footer.tpl"}]
