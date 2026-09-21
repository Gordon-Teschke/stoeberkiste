[{if count($Errorlist)>0 }]
<div class="error-msg">
    [{foreach from=$Errorlist item=oEr key=key }]
        <p>[{ $oEr->getOxMessage()}]</p>
    [{/foreach}]
</div>
[{/if}]