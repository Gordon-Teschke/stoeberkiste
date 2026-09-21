[{* Content Links *}]
	<div class="content-menu">
	[{if $oxcmp_user->oxuser__oxusername->value}]
	[{* Eingeloggt *}]
		<ul>
			<li><a href="/mein-konto/">Mein Account</a></li>
			<li><a href="/mein-merkzettel/">Merkliste</a></li>
			<li><a href="/index.php?cl=account&fnc=logout&redirect=1">Logout</a></li>
		</ul>
	[{else}]
	[{* Ausgeloogt *}]
		<ul>
			<li><a href="/konto-eroeffnen/">Registrieren</a></li>
			<li><a href="/mein-konto/">Anmelden</a></li>
			<li><a href="/mein-merkzettel/">Merkliste</a></li>
		</ul>
	[{/if}]
	</div><!--content-menu-->
