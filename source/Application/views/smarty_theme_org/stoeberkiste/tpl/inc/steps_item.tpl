
<div class="ordersteps[{if !$oViewConf->showFinalStep() }] nofinalstep[{/if}]">

<!---------------------- STEP 01 START ---------------------->

    [{if $oxcmp_basket->getProductsCount() }]
        [{assign var=showStepLinks value=true}]
    [{/if}]

	<div class="step">
		<p[{ if $highlight == 1}] class="active"[{/if}]>
			[{if $showStepLinks}]<a id="test_Step1" rel="nofollow" href="[{ oxgetseourl ident=$oViewConf->getBasketLink() }]">[{/if}]
			 <strong>1</strong> [{ oxmultilang ident="INC_STEPS_ITEM_BASKET" }]
			[{if $showStepLinks}]</a>[{/if}]        
			[{if $showStepLinks}]<a id="test_Step1_Text" rel="nofollow" href="[{ oxgetseourl ident=$oViewConf->getBasketLink() }]">[{/if}][{ oxmultilang ident="INC_STEPS_ITEM_CHANGEITEMS" }][{if $showStepLinks}]</a>[{/if}]        
		</p>
	</div><!--step-->

<!------------------------ STEP 01 END ------------------------>	

<!------------------------ STEP 02 START ---------------------->
	
    [{assign var=showStepLinks value=false}]
    [{if !$oView->isLowOrderPrice() && $oxcmp_basket->getProductsCount() }]
        [{assign var=showStepLinks value=true}]
    [{/if}]
	
	<div class="step">
    <p[{ if $highlight == 2}] class="active"[{/if}]>
        [{if $showStepLinks}]<a id="test_Step2" rel="nofollow" href="[{ oxgetseourl ident=$oViewConf->getOrderLink() }]">[{/if}]
         <strong>2</strong> [{ oxmultilang ident="INC_STEPS_ITEM_SEND" }]
        [{if $showStepLinks}]</a>[{/if}]
        [{if $showStepLinks}]<a id="test_Step2_Text" rel="nofollow" href="[{ oxgetseourl ident=$oViewConf->getOrderLink() }]">[{/if}][{ oxmultilang ident="INC_STEPS_ITEM_LOGINSELECTBILLINGINFO" }][{if $showStepLinks}]</a>[{/if}]
	</div><!--step-->
	
<!------------------------ STEP 02 END ------------------------>	

<!------------------------ STEP 03 START ---------------------->
	
    [{assign var=showStepLinks value=false}]
    [{if $highlight != 1 && $oxcmp_user && !$oView->isLowOrderPrice() && $oxcmp_basket->getProductsCount() }]
        [{assign var=showStepLinks value=true}]
    [{/if}]

	<div class="step">
    <p[{ if $highlight == 3}] class="active"[{/if}]>
        [{if $showStepLinks}]<a id="test_Step3" rel="nofollow" href="[{ if $oViewConf->getActiveClassName() == "user"}]javascript:document.getElementById('test_UserNextStepTop').click();[{else}][{ oxgetseourl ident=$oViewConf->getPaymentLink() }][{/if}]">[{/if}]
        <strong>3</strong> [{ oxmultilang ident="INC_STEPS_ITEM_PAY" }][{if $showStepLinks}]</a>[{/if}]            
        [{if $showStepLinks}]<a id="test_Step3_Text" rel="nofollow" href="[{ if $oViewConf->getActiveClassName() == "user"}]javascript:document.getElementById('test_UserNextStepTop').click();[{else}][{ oxgetseourl ident=$oViewConf->getPaymentLink() }][{/if}]">[{/if}][{ oxmultilang ident="INC_STEPS_ITEM_SELECTSHIPPINGANDPAYMENT" }][{if $showStepLinks}]</a>[{/if}]
	</div><!--step-->
	
<!------------------------ STEP 03 END ------------------------>	

<!------------------------ STEP 04 START ---------------------->	

    [{assign var=showStepLinks value=false}]
    [{if $highlight != 1 && $oxcmp_user && $oxcmp_basket->getProductsCount() && $oView->getPaymentList() && !$oView->isLowOrderPrice()}]
        [{assign var=showStepLinks value=true}]
    [{/if}]
	<div class="step">
    <p class="[{ if $highlight == 4}]active[{/if}][{if !$oViewConf->showFinalStep() }] lastinrow[{/if}]">
            [{if $showStepLinks}]<a id="test_Step4" rel="nofollow" href="[{ if $oViewConf->getActiveClassName() == "payment"}]javascript:document.forms.order.submit();[{else}][{ oxgetseourl ident=$oViewConf->getOrderConfirmLink() }][{/if}]">[{/if}]
            <strong>4</strong> [{ oxmultilang ident="INC_STEPS_ITEM_ORDER" }]
            [{if $showStepLinks}]</a>[{/if}]
            [{if $showStepLinks}]<a id="test_Step4_Text" rel="nofollow" href="[{ if $oViewConf->getActiveClassName() == "payment"}]javascript:document.forms.order.submit();[{else}][{ oxgetseourl ident=$oViewConf->getOrderConfirmLink() }][{/if}]">[{/if}][{ oxmultilang ident="INC_STEPS_ITEM_SUBMITORDER" }][{if $showStepLinks}]</a>[{/if}]
    </p>
	</div><!--step-->

<!------------------------ STEP 04 END ------------------------>	

<!------------------------ STEP 05 START ---------------------->	
	
    [{if $oViewConf->showFinalStep() }]
    <div class="step">
	<p class="lastinrow[{ if $highlight == 5}] active[{/if}]">
         <strong>5</strong> [{ oxmultilang ident="INC_STEPS_ITEM_LASTSTEP1" }]
        [{ oxmultilang ident="INC_STEPS_ITEM_LASTSTEP2" }]
		[{/if}]
	</div><!--step-->
	
<!------------------------ STEP 05 END ------------------------>	

</div><!--order-steps-->