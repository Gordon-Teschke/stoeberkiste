
[{if $tree || $oView->getContentCategory() }]
[{assign var="oContentCat" value=$oView->getContentCategory() }]

[{defun name="category_tree_mobile" tree=$tree act=$act class=$class testSubCat=''}]
[{strip}]
    
    [{foreach from=$tree item=ocat key=catkey name=$test_catName}]
        [{if ( !$ocat->isTopCategory() || !$oViewConf->getViewThemeParam('blTopNaviLayout') ) && $ocat->getContentCats() }]
            [{foreach from=$ocat->getContentCats() item=ocont key=contkey name=cont}]
            [{/foreach}]
        [{/if}]
        [{if $ocat->getIsVisible() }]
        <li>
            <a href="[{$ocat->getLink()}]" class="[{if $class != "sub"}]is-cat[{/if}]">[{$ocat->oxcategories__oxtitle->value}] [{if $oView->showCategoryArticlesCount() && $ocat->getNrOfArticles() > 0}] ([{$ocat->getNrOfArticles()}])[{/if}]</a>
            [{if $ocat->getSubCats() && $ocat->expanded}]
                [{fun name="category_tree_mobile" tree=$ocat->getSubCats() act=$act class="sub" testSubCat=$ocat->oxcategories__oxid->value }]
            [{/if}]
        </li>
        [{/if}]
    [{foreachelse}]
    [{/foreach}]
    
[{/strip}]
[{/defun}]

[{/if}]
