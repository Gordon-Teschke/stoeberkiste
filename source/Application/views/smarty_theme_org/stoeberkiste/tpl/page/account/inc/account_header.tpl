<div class="all-user-settings">
[{* Dashboard-Links nur anzeigen wenn $show_dashboard nicht gesetzt ist *}]
[{if !isset($show_dashboard)}]
	<section class="story on-top">
		<h1>Mein Konto</h1>
			<h2>&Auml;ndern Sie hier die pers&ouml;nlichen Einstellungen Ihres Kontos</h2>
				<div class="left">
					<a href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_password" }]" class="btn" data-id="user-settings">Persönliche Einstellungen</a><p class="with-arrow"><span class="icon-arrow-right"></span>Ändern Sie ihr Kontopasswort</p>
					[{*
                    <a href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_newsletter" }]" class="btn" data-id="newsletter-settings">Newslettereinstellungen</a><p class="with-arrow"><span class="icon-arrow-right"></span>Newsletter abonnieren/abbestellen</p>
                    *}]
					<a href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_user" }]" class="btn" data-id="shipping-settings" >Rechnungs- und Liefereinstellungen</a><p class="with-arrow"><span class="icon-arrow-right"></span>Rechnungs- und Lieferadressen bearbeiten</p>
				</div><!--left-->
					<div class="right">
						<a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_order" }]" class="btn">Bestellhistorie</a><p class="with-arrow"><span class="icon-arrow-right"></span>Bestellungen 6</p>
						<a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_noticelist" }]" class="btn">Mein Merkzettel</a><p class="with-arrow"><span class="icon-arrow-right"></span>Artikel auf Merkliste 0</p>
						<a href="[{ $oViewConf->getLogoutLink() }]" class="btn">Logout</a><p class="with-arrow"><span class="icon-arrow-right"></span>Vom Shop abmelden</p>
					</div><!--right-->
	</section><!--story-->
[{/if}]
[{* div wird im account_footer geschlossen *}]