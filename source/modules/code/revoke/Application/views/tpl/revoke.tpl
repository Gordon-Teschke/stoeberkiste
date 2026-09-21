[{capture append="oxidBlock_content"}]

[{if !$sent}]
	<h1 class="page-header">[{oxmultilang ident="REVOKE_HEADER"}]</h1>
	<link rel="stylesheet" href="[{$oViewConf->getModuleUrl('coderevoke', 'out/src/css/revoke.css')}]">
[{if !$preview}]

	<form class="form-horizontal" action="[{oxgetseourl ident=$oViewConf->getSelfLink()}]" method="post">
		<input type="hidden" name="fnc" value="preview">
		<input type="hidden" name="cl" value="revoke">

		<div class="form-group">
			<label class="control-label col-lg-5 req" for="article">[{oxmultilang ident="REVOKE_ARTICLE_LABEL"}]</label>
			<textarea class="form-control col-lg-7" name="article" id="article" rows="3" required>[{$formdata.article}]</textarea>
		</div>

		<div class="form-group">
			<label class="control-label col-lg-5 req" for="ordered">[{oxmultilang ident="REVOKE_ORDERED_LABEL"}]</label>
			<input class="form-control col-lg-7" type="text" name="ordered" id="ordered" value="[{$formdata.ordered}]" required>
		</div>

		<div class="form-group">
			<label class="control-label col-lg-5 req" for="ordernr">[{oxmultilang ident="REVOKE_ORDERNR_LABEL"}]</label>
			<input class="form-control col-lg-7" type="text" name="ordernr" id="ordernr" value="[{$formdata.ordernr}]">
		</div>

		<div class="form-group">
			<label class="control-label col-lg-5 req" for="name">[{oxmultilang ident="REVOKE_NAME_LABEL"}]</label>
			<input class="form-control col-lg-7" type="text" name="name" id="name" value="[{$formdata.name}]" required>
		</div>

		<div class="form-group">
			<label class="control-label col-lg-5 req" for="email">[{oxmultilang ident="REVOKE_EMAIL_LABEL"}]</label>
			<input class="form-control col-lg-7" type="email" name="email" id="email" value="[{$formdata.email}]" required>
		</div>

		<div class="form-group">
			<label class="control-label col-lg-5" for="address">[{oxmultilang ident="REVOKE_ADDRESS_LABEL"}]</label>
			<textarea class="form-control col-lg-7" name="address" id="address" rows="6">[{$formdata.address}]</textarea>
		</div>

		<div class="form-group">
			<label class="control-label col-lg-5" for="message">[{oxmultilang ident="REVOKE_MESSAGE_LABEL"}]</label>
			<textarea class="form-control col-lg-7" name="message" id="message" rows="6">[{$formdata.message}]</textarea>
		</div>
		
		<div class="form-group">
			<label class="control-label col-lg-5" for="submit"></label>
			<button type="submit" class="btn btn-primary">[{oxmultilang ident="REVOKE_SUBMIT_BUTTON"}]</button>
		</div>		

		
	</form>	
[{else}]
    <h2>[{oxmultilang ident="REVOKE_CONFIRM_TEXT"}]</h2>
	<div id="revoke_wrap">
		<table class="table table-striped">
			<tr><th>[{oxmultilang ident="REVOKE_ARTICLE_LABEL"}]</th><td>[{$formdata.article|nl2br}]</td></tr>
			<tr><th>[{oxmultilang ident="REVOKE_ORDERED_LABEL"}]</th><td>[{$formdata.ordered|nl2br}]</td></tr>
			<tr><th>[{oxmultilang ident="REVOKE_ORDERNR_LABEL"}]</th><td>[{$formdata.ordernr|nl2br}]</td></tr>
			<tr><th>[{oxmultilang ident="REVOKE_NAME_LABEL"}]</th><td>[{$formdata.name|nl2br}]</td></tr>
			<tr><th>[{oxmultilang ident="REVOKE_EMAIL_LABEL"}]</th><td>[{$formdata.email|nl2br}]</td></tr>
			<tr><th>[{oxmultilang ident="REVOKE_ADDRESS_LABEL"}]</th><td>[{$formdata.address|nl2br}]</td></tr>
			<tr><th>[{oxmultilang ident="REVOKE_MESSAGE_LABEL"}]</th><td>[{$formdata.message|nl2br}]</td></tr>
		</table>

		<form action="[{oxgetseourl ident=$oViewConf->getSelfLink()}]" method="post" style="margin-top:10px;">
			<input type="hidden" name="cl" value="revoke">
			
			<input type="hidden" name="article" value="[{$formdata.article}]">
			<input type="hidden" name="ordered" value="[{$formdata.ordered}]">
			<input type="hidden" name="ordernr" value="[{$formdata.ordernr}]">
			<input type="hidden" name="name" value="[{$formdata.name}]">
			<input type="hidden" name="email" value="[{$formdata.email}]">
			<input type="hidden" name="address" value="[{$formdata.address}]">
			<input type="hidden" name="message" value="[{$formdata.message}]">

			<div class="form-group">
				<label class="control-label col-lg-5" for="submit"></label>
				[{*include file=$oViewConf->getModulePath('codefrcaptcha')|cat:"/Application/views/blocks/code_frcaptcha.tpl"*}]
				<button type="submit" onclick="document.getElementById('revoke_overlay').style.display='block'" class="btn btn-primary" name="fnc" value="submit">[{oxmultilang ident="REVOKE_CONFIRM_BUTTON"}]</button>
			</div>		
			<div class="form-group">
				<label class="control-label col-lg-5" for="return"></label>
				<button type="submit" class="btn btn-secondary" name="fnc" value="repeat">[{oxmultilang ident="REVOKE_CORRECT_BUTTON"}]</button>
			</div>		
		</form>
		
		<div id="revoke_overlay"><div class="loader"></div></div>
	</div>

[{/if}]
[{/if}]
[{/capture}]

[{include file="layout/page.tpl"}]

