<?php

namespace code\revoke\Application\Controller;

use OxidEsales\Eshop\Application\Controller\FrontendController;
use OxidEsales\Eshop\Core\Registry;
use code\revoke\Application\Model\Revoke;

class RevokeController extends FrontendController
{
    protected $_sThisTemplate = '@coderevoke/revoke.html.twig';
	
    protected array $_fields = ['Bestellung' => 'article', 'Bestellt am / Erhalten am' => 'ordered', 'Bestellnummer / Rechnungsnummer' => 'ordernr', 'Name' => 'name', 'E-Mail' => 'email', 'Adresse' => 'address', 'Anmerkungen' => 'message'];
	
    protected function getRevokeRequestData(string $prefix = ''): array
    {
        $request = Registry::getRequest();

        $data = [];
        foreach ($this->_fields as $field) {
            $data[$prefix . $field] = trim((string) $request->getRequestParameter($field));
        }
        return $data;
    }
	

    public function render()
    {
        $ret = parent::render();
        return $ret;
    }

    public function submit()
    {
        $assignRevoke = $this->getRevokeRequestData('code_');

        if (!$assignRevoke['code_name'] || !$assignRevoke['code_email']) {
            Registry::getUtilsView()->addErrorToDisplay('Bitte Name und E-Mail angeben.');
            return;
        }
		
        $revoke = oxNew(Revoke::class);
		$assignRevoke['code_active'] = 1;
		$assignRevoke['oxinsert'] = date('Y-m-d H:i:s');
        $revoke->assign($assignRevoke);
        $revoke->save();

        $this->sendMail($revoke);

        Registry::getUtilsView()->addErrorToDisplay(Registry::getLang()->translateString('REVOKE_SUCCESS'), false);
    }
	

	public function preview()
	{
		$this->_aViewData['formdata'] = $this->getRevokeRequestData();
		$this->_aViewData['preview'] = true;
		
		// Führt zu Fehler !!!!!!!
		/*
        $ret = parent::render();
        return $ret;
		*/
	}


	public function repeat()
	{
		$this->_aViewData['formdata'] = $this->getRevokeRequestData();
		$this->_aViewData['preview'] = false;
	}

	
	protected function sendMail(Revoke $revoke)
	{
		$activeShop = Registry::getConfig()->getActiveShop();
		$infoEmail = $activeShop->oxshops__oxinfoemail->value;
		$ownerEmail = $activeShop->oxshops__oxowneremail->value;
		$shopname = $activeShop->oxshops__oxname->value;
		
		$lang = Registry::getLang();
		$langId = $lang->getBaseLanguage();
        $datetime = [
            date('d.m.Y H:i:s'),
            date('d F Y H:i:s'),
            date('d \d\e F \d\e Y H:i:s'),
        ];


		// Mail an Admin{
		$oEmailAdmin = oxNew(\OxidEsales\Eshop\Core\Email::class);
		$oEmailAdmin->setFrom($ownerEmail, $shopname);
		$oEmailAdmin->setSubject("Widerruf von ".$revoke->code_revoke__code_name->value." (".$revoke->code_revoke__code_email->value.") ".$datetime[0]);
		$oEmailAdmin->setRecipient($infoEmail);

		$bodyAdmin = "Widerruf:\n\n";	
		foreach ($this->_fields as $key => $field) {
			$bodyAdmin .= $key.': '. $revoke->{"code_revoke__code_$field"}->value."\n";
		}

		$oEmailAdmin->setBody(nl2br($bodyAdmin));
		$oEmailAdmin->setAltBody($bodyAdmin);
		$adminSent = $oEmailAdmin->send();

		// Mail an Kunden
		$oEmailUser = oxNew(\OxidEsales\Eshop\Core\Email::class);
		$oEmailUser->setFrom($ownerEmail, $shopname);
		$oEmailUser->setRecipient($revoke->code_revoke__code_email->value, $revoke->code_revoke__code_name->value);

		if ($adminSent) {
			$headerUser = $lang->translateString('REVOKEMAIL_CONFIRMHEADER');
			$text = $lang->translateString('REVOKEMAIL_CONFIRM');
			$bodyUser = sprintf($text, $revoke->code_revoke__code_name->value, $revoke->code_revoke__code_ordernr->value).$datetime[$langId];
		} else {
			$headerUser = $lang->translateString('REVOKEMAIL_ERRORHEADER');
			$text = $lang->translateString('REVOKEMAIL_ERROR');
			$bodyUser = sprintf($text, $revoke->code_revoke__code_name->value).$datetime[$langId];
		}
		$oEmailUser->setSubject($headerUser);
		$oEmailUser->setBody(nl2br($bodyUser));
		$oEmailUser->setAltBody($bodyUser);
		$oEmailUser->send();
		
		$this->_aViewData['sent'] = true;
	}
	
	
    public function getBreadCrumb()
    {
		
        $title = Registry::getLang()->translateString(
            'REVOKE_HEADER',
            Registry::getLang()->getBaseLanguage(),
            false
        );

        return [
            [
                'title' => $title,
                'link'  => $this->getLink(),
            ]
        ];
    }

}
