[{include file="headitem.tpl" title="Widerrufe"}]
	<style>
		td button {
			padding: 1px 6px;
			border: 1px solid #4f4f4f;
			border-radius: 3px;
			cursor:pointer;
		}
		td.td_active, td.td_active_1, td.td_active_0, td.td_submit, td.td_print {
			text-align:center;
		}
		td.td_active_0 button {
			background-color: green;
		}
		td.td_active_1 button {
			background-color: red;
		}
		span.act_0 {
			color:green;
		}
		span.act_1 {
			color:red;
		}
	</style>
	
	<div id="liste">
	
	<h1>Online-Widerrufe</h1>
	<table id="" class="edittext" cellspacing="0" cellpadding="4" border="1">
		<tr>
			<td>Datum</td>
			<td>Bestellung</td>
			<td>Bestellnr.</td>
			<td>Bestellt am</td>
			<td>Name</td>
			<td>E-Mail</td>
			<td>Adresse</td>
			<td>Nachricht</td>
			<td class="td_active" style="color:green"><span class="act_1">Offen</span><br/><span class="act_o">Erledigt</span></td>
			<td class="td_submit" style="color:red">Löschen</td>
			<td class="td_print" style="color:red">Drucken</td>
		</tr>
		[{foreach from=$revokes item=w}]
			<tr>
				<td>[{$w.OXINSERT}]</td>
				<td>[{$w.CODE_ARTICLE|escape|nl2br}]</td>
				<td>[{$w.CODE_ORDERNR}]</td>
				<td>[{$w.CODE_ORDERED}]</td>
				<td>[{$w.CODE_NAME}]</td>
				<td>[{$w.CODE_EMAIL}]</td>
				<td>[{$w.CODE_ADDRESS|escape|nl2br}]</td>
				<td>[{$w.CODE_MESSAGE|escape|nl2br}]</td>
				<td class="td_active_[{$w.CODE_ACTIVE}]">
					<form method="post" action="[{$oViewConf->getSelfLink()}]&cl=revokeadmin&fnc=changeRevoke">
						<button type="submit" name="oxid" value="[{$w.OXID}]">&nbsp;</button>
					</form>
				</td>			
				<td class="td_submit">
					<form method="post" action="[{$oViewConf->getSelfLink()}]&cl=revokeadmin&fnc=deleteRevoke">
						<button type="submit" name="oxid" value="[{$w.OXID}]"><b style="color:red">X</b></button>
					</form>
				</td>
				<td class="td_print">
					<form method="post" action="[{$oViewConf->getSelfLink()}]&cl=revokeadmin&fnc=printRevoke" style="display:inline;">
						<button type="submit" name="oxid" value="[{$w.OXID}]"><b style="color:red">PDF</b></button>
					</form>	
				</td>				
			</tr>
		[{/foreach}]
	</table>
	</div>
	
	<div class="tabs"></div>

[{include file="bottomitem.tpl"}]
