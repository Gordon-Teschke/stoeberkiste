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
.revokeForm input[type=text],
.revokeForm textarea {
    width: 100%;
    box-sizing: border-box;
    margin: 0 0 12px 0;
    padding: 8px 10px;
    border: 1px solid #1f4e79;
    background: #fff;
    color: #555;
    font-size: 16px;
    font-family: Arial, Helvetica, sans-serif;
    line-height: 1.35;
}

.revokeForm input.revokeError,
.revokeForm textarea.revokeError {
    border-color: #900001;
    background: #fff6f6;
}

.revokeRequiredInfo {
    margin: 0 0 10px 0;
    font-size: 12px;
    color: #666;
}

.revokeButton:disabled,
.revokeButtonDisabled {
    background: #999;
    cursor: default;
    opacity: 0.65;
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

	<form action="[{$revokeFormAction}]" method="post" class="revokeForm" id="revokeForm">
		<input type="hidden" name="cl" value="revoke">
		<input type="hidden" name="fnc" value="preview">

		<textarea name="article" id="revoke_article" rows="2" class="requiredField" placeholder="Hiermit widerrufe ich den Kauf folgender Waren... *">[{$formdata.article|escape}]</textarea>

		<input type="text" name="ordered" id="revoke_ordered" class="requiredField" placeholder="Bestellt am / Erhalten am *" value="[{$formdata.ordered|escape}]">

		<input type="text" name="ordernr" id="revoke_ordernr" class="requiredField" placeholder="Bestellnummer / Rechnungsnummer *" value="[{$formdata.ordernr|escape}]">

		<input type="text" name="name" id="revoke_name" class="requiredField" placeholder="Name *" value="[{$formdata.name|escape}]">

		<input type="text" name="email" id="revoke_email" class="requiredField emailField" placeholder="E-Mail Adresse *" value="[{$formdata.email|escape}]">

		<textarea name="address" id="revoke_address" rows="2" placeholder="Adresse">[{$formdata.address|escape}]</textarea>

		<textarea name="message" id="revoke_message" rows="2" placeholder="Ihre Nachricht an uns...">[{$formdata.message|escape}]</textarea>

		<p class="revokeRequiredInfo">
			* Pflichtfelder. Bitte füllen Sie alle mit Stern gekennzeichneten Felder aus. Die E-Mail-Adresse muss gültig sein.
		</p>

		<div class="revokeButtonRow">
			<button class="revokeButton" id="revokeSubmitButton" type="submit" disabled="disabled">
				Weiter zur Bestätigung
			</button>
		</div>
	</form>

	<script type="text/javascript">
	(function () {
		var form = document.getElementById('revokeForm');
		var button = document.getElementById('revokeSubmitButton');

		if (!form || !button) {
			return;
		}

		var requiredFields = [
			document.getElementById('revoke_article'),
			document.getElementById('revoke_ordered'),
			document.getElementById('revoke_ordernr'),
			document.getElementById('revoke_name'),
			document.getElementById('revoke_email')
		];

		function trimValue(value) {
			return value.replace(/^\s+|\s+$/g, '');
		}

		function isValidEmail(value) {
			return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
		}

		function validateForm() {
			var isValid = true;

			for (var i = 0; i < requiredFields.length; i++) {
				var field = requiredFields[i];

				if (!field) {
					continue;
				}

				var value = trimValue(field.value);
				var fieldValid = value.length > 0;

				if (field.id === 'revoke_email') {
					fieldValid = fieldValid && isValidEmail(value);
				}

				if (value.length > 0 && !fieldValid) {
					field.className = field.className.replace(/\brevokeError\b/g, '') + ' revokeError';
				} else {
					field.className = field.className.replace(/\brevokeError\b/g, '');
				}

				if (!fieldValid) {
					isValid = false;
				}
			}

			button.disabled = !isValid;

			if (isValid) {
				button.className = 'revokeButton';
			} else {
				button.className = 'revokeButton revokeButtonDisabled';
			}
		}

		for (var i = 0; i < requiredFields.length; i++) {
			if (requiredFields[i]) {
				requiredFields[i].onkeyup = validateForm;
				requiredFields[i].onchange = validateForm;
				requiredFields[i].onblur = validateForm;
			}
		}

		validateForm();
	})();
	</script>


    [{/if}]

</div>

[{include file="_footer.tpl"}]
